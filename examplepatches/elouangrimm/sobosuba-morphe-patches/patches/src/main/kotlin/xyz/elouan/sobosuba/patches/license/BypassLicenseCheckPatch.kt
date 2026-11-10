package xyz.elouan.sobosuba.patches.license

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly

object CheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("Cannot check license with null context.")
)

@Suppress("unused")
val bypassLicenseCheckPatch = patch(
    name = "Bypass license check (Universal)",
    description = "Universal license-check patch for compatible apps.",
    default = false
) {
    execute {
        CheckLicenseFingerprint.method.returnEarly()
    }
}
