package app.morphe.patches.gradle

open class SettingsExtension {
    /**
     * The path to the patches project.
     */
    var patchesProjectPath = "patches"

    // Need to rename, otherwise it will conflict with the `getExtensions` property from ExtensionAware.
    @get:JvmName("getExtensionsExtension")
    val extensions = ExtensionsExtension()

    fun extensions(block: ExtensionsExtension.() -> Unit) {
        extensions.apply(block)
    }

    class ExtensionsExtension {
        /**
         * The path containing the extension projects.
         */
        var projectsPath: String? = "extensions"

        /**
         * The default namespace for the extension projects.
         */
        var defaultNamespace: String? = null

        internal val proguardFiles = mutableSetOf<String>()

        /**
         * Add proguard files to the extension projects relative to the project root.
         * Minification will be enabled if at least one file is provided.
         *
         * @param files The proguard files to add.
         */
        fun proguardFiles(vararg files: String) {
            proguardFiles += files
        }
    }
}
