package app.morphe.patches.gradle

open class PatchesExtension {
    /**
     * The path to the extensions project relative to the root project.
     *
     * Used by the patches plugin to consume the extension artifacts.
     *
     * Defaults to `:extensions`.
     */
    var extensionsProjectPath: String? = ":extensions"

    /**
     * About information for the project.
     */
    val about = About()

    fun about(block: About.() -> Unit) {
        about.block()
    }

    /**
     * About information for the project.
     *
     * Used by the patches plugin to create the manifest file and set up the publication of the patches project.
     */
    class About {
        var name: String? = null
        var description: String? = null
        var source: String? = null
        var author: String? = null
        var contact: String? = null
        var website: String? = null
        var license: String? = null
    }
}
