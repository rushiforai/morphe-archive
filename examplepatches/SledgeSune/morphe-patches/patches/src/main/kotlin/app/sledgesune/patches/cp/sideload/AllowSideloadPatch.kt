package app.sledgesune.patches.cp.sideload

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import app.sledgesune.patches.shared.Constants.COMPATIBILITY_CP

/**
 * PairIP (Google Play's app-protection wrapper) checks on startup that the app was installed from Play. A patched
 * APK is signed with a different key and sideloaded, so the check fails and `LicenseActivity` sends the user to
 * the Play Store. PairIP keeps its real class names, so this is a stable anchor.
 */
private object CheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val allowSideloadPatch = patch(
    name = "Allow sideloading",
    description = "Stops the app sending you to the Play Store on startup because it wasn't installed from " +
        "Play. Needed for any patched build to open.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CP)

    execute {
        // Return before the licence service is contacted, so no result comes back to redirect to Play.
        CheckLicenseFingerprint.method.addInstruction(0, "return-void")
    }
}
