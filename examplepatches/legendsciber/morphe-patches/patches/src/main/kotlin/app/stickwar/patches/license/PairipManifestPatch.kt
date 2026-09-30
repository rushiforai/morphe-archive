package app.stickwar.patches.license

import app.morphe.patcher.patch.resourcePatch

/**
 * Removes the PairIP gate from the manifest.
 *
 * - `com.pairip.application.Application` is the registered application class; its
 *   `attachBaseContext` runs `verifyIntegrity` + `checkLicense` before any app
 *   code. The stub is neutered in code, so the class is kept (the manifest still
 *   needs *an* application class and the app's own base class is reached through
 *   it) but its `CHECK_LICENSE` provider and paywall activity are removed.
 * - `LicenseActivity` is the Play Store redirect wall — removing it makes the
 *   redirect impossible even if a path survives.
 * - `com.android.vending.CHECK_LICENSE` is the Play licensing permission; it is
 *   dropped so the OS refuses the bind outright.
 */
@Suppress("unused")
val stickWarPairipManifestPatch = resourcePatch(
    name = "Stick War PairIP manifest bypass",
    description = "Removes the PairIP LicenseActivity paywall and the CHECK_LICENSE permission.",
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val activities = doc.getElementsByTagName("activity")
            for (i in activities.length - 1 downTo 0) {
                val el = activities.item(i) as? org.w3c.dom.Element ?: continue
                if (el.getAttribute("android:name").contains("LicenseActivity")) {
                    el.parentNode.removeChild(el)
                }
            }
            val permissions = doc.getElementsByTagName("uses-permission")
            for (i in permissions.length - 1 downTo 0) {
                val el = permissions.item(i) as? org.w3c.dom.Element ?: continue
                if (el.getAttribute("android:name").contains("CHECK_LICENSE")) {
                    el.parentNode.removeChild(el)
                }
            }
        }
    }
}
