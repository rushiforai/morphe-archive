package app.morphe.patches.ditu.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patches.shared.compat.AppCompatibilities
import org.w3c.dom.Element

@Suppress("unused")
val removeAdIdPermissionPatch = patch(
    name = "Remove advertising ID permissions",
    description = "Removes the Google advertising ID and Android Ad Services advertising ID permissions. Other identifiers and telemetry may remain.",
    default = true,
) {
    category("Privacy")
    compatibleWith(*AppCompatibilities.ditu())
    execute {
        val expected = setOf("com.google.android.gms.permission.AD_ID", "android.permission.ACCESS_ADSERVICES_AD_ID")
        document("AndroidManifest.xml").use { xml ->
            val manifest = xml.documentElement
            val permissions = manifest.getElementsByTagName("uses-permission")
            val matches = (0 until permissions.length).mapNotNull { permissions.item(it) as? Element }
                .filter { it.getAttribute("android:name") in expected }
            val found = matches.map { it.getAttribute("android:name") }.toSet()
            if (found != expected) throw PatchException("Expected advertising ID permissions $expected; found $found")
            matches.forEach { manifest.removeChild(it) }
        }
    }
}
