class ActionController::Base

  # Returns the view path that contains the relative template
  def find_generic_base_path_for_with_list_filter(template_file_name, extension)
    generic_base_path = find_generic_base_path_for_without_list_filter(template_file_name, extension)
    return generic_base_path if generic_base_path
    path = File.expand_path(File.dirname(__FILE__)) + "/../../frontends/default/views" # this path references the list_filter directories, not the active scaffold directories
    # Should be able to use a rails method here to do this directory search
    file = Dir.entries(path).find {|f| f =~ /^_?#{File.basename(template_file_name)}\.?#{extension}/ }
    file ? File.join(path, file) : nil
  end
  alias_method_chain :find_generic_base_path_for, :list_filter
  
end
