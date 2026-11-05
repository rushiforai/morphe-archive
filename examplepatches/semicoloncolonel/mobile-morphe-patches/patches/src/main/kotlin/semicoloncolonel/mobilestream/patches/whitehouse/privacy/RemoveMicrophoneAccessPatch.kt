package semicoloncolonel.mobilestream.patches.whitehouse.privacy

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.whitehouse.shared.Constants

// White House 47.7.8 declares microphone access and a recording service,
// both from the audio library's defaults. No feature in the app records
// audio: clips use the stream's own sound. The permission is removed.

@Suppress("unused")
val removeMicrophoneAccessPatch = resourcePatch(
    name = "Remove microphone access",
    description = "Removes the app's microphone permission, which no feature uses.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element
            val permissions = document.getElementsByTagName("uses-permission")
            (0 until permissions.length)
                .map { permissions.item(it) as Element }
                .filter { it.getAttribute("android:name") == "android.permission.RECORD_AUDIO" }
                .forEach { manifest.removeChild(it) }
        }
    }
}
