package patches.spotify.misc

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import patches.spotify.COMPATIBILITY_SPOTIFY

@Suppress("unused")
val debuggablePatch = resourcePatch(
    name = "Enable debuggable",
    description = "Marks the app debuggable so diagnostic tools (for example shell-mode Frida on a " +
        "non-rooted device) can attach to the process. Does not change any app behaviour.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    finalize {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:debuggable", "true")
        }
    }
}
