package xyz.elouan.sobosuba.patches.debug

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml

@Suppress("unused")
val enableDebugModePatch = patch(
    name = "Enable debug mode (Universal)",
    description = "Makes any Android app debuggable, allowing mod installation via Shizuku without root.",
    default = false
) {
    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").first()
            application.setAttribute("android:debuggable", "true")
        }
    }
}
