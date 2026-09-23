package app.template.patches.universal.hideicon

import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val hideIconPatch = resourcePatch(
    name = "Hide launcher icon",
    description = "Hides the app's launcher icon.",
    default = false
) {
    execute {
        val manifestFile = this["AndroidManifest.xml"]
        val content = manifestFile.readText()
        
        // Replace every occurrence of LAUNCHER category with DEFAULT
        val newContent = content.replace("android.intent.category.LAUNCHER", "android.intent.category.DEFAULT")
        
        if (content != newContent) {
            manifestFile.writeText(newContent)
        }
    }
}
