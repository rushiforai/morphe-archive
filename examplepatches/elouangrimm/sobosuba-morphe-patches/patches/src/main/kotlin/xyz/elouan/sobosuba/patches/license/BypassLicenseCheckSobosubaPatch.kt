package xyz.elouan.sobosuba.patches.license

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import xyz.elouan.sobosuba.patches.shared.SOBOSUBA

object CheckLicenseSobosubaFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("Cannot check license with null context.")
)

@Suppress("unused")
val bypassLicenseCheckSobosubaPatch = patch(
    name = "Bypass license check (Sobosuba)",
    description = "Skips the PairIP license check in Sobosuba so the re-signed, moddable APK can boot after Morphe patches the manifest. Without this patch, the re-signed APK exits on launch with a license failure.",
    default = true
) {
    compatibleWith(SOBOSUBA)

    execute {
        CheckLicenseSobosubaFingerprint.method.returnEarly()
    }
}
