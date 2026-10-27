package app.morphe.patches.word

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.Constants.COMPATIBILITY_WORD
import org.w3c.dom.Element

@Suppress("unused")
val wordRemoveSharedUserIdPatch = resourcePatch(
    name = "Remove Shared User ID",
    description = "Removes the sharedUserId attribute from the manifest to prevent installation conflicts.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WORD)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.getElementsByTagName("manifest").item(0) as? Element ?: run {
                println("[Remove Shared User ID] Skipped: manifest root element not found.")
                return@execute
            }
            manifest.removeAttribute("android:sharedUserId")
            manifest.removeAttribute("android:sharedUserLabel")
            println("[Remove Shared User ID] Stripped sharedUserId and sharedUserLabel attributes from manifest.")
        }
    }
}
