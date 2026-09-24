package app.goodnight.patches.license

import app.goodnight.patches.shared.Constants.COMPATIBILITY_GOODNIGHT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// A patched APK is re-signed and not installed from Play, so without this the
// app dies in Application.attachBaseContext: SignatureCheck.verifyIntegrity
// throws, then LicenseClient.checkLicense opens LicenseActivity (Play Store
// paywall) and exits. Both checks are skipped with return-early edits; the
// app then starts normally. Required for any patched install to run.
@Suppress("unused")
val licenseBypassPatch = bytecodePatch(
    name = "Play license bypass",
    description = "Skip the Play Store install and signature checks so the " +
        "patched app launches instead of redirecting to the Play Store.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOODNIGHT)

    execute {
        SignatureCheckFingerprint.method.addInstructions(
            0,
            "return-void"
        )
        LicenseCheckFingerprint.method.addInstructions(
            0,
            "return-void"
        )
    }
}
