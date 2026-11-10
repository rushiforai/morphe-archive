package xyz.elouan.sobosuba.patches.debug

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import xyz.elouan.sobosuba.patches.shared.SOBOSUBA

@Suppress("unused")
val enableDebugModeSobosubaPatch = patch(
    name = "Enable debug mode (Sobosuba)",
    description = "Makes Sobosuba debuggable, allowing mod installation via Shizuku without root.",
    default = true
) {
    compatibleWith(SOBOSUBA)

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.elements("application").first()
                .setAttribute("android:debuggable", "true")
        }
    }
}
