package app.masareef.patches.integrity

import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val bypassLicenseCheckPatch = bytecodePatch(
    name = "Bypass License Check",
    description = "Stubs the Google Play Automatic Integrity Protection (pairip) signature and " +
        "license checks, which otherwise detect the re-signed APK on launch and send the user " +
        "to the app's Play Store page instead of opening the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    execute {
        // Both run from Application.attachBaseContext before any app code, so returning early
        // leaves the pairip VM (libpairipcore, which actually executes the app's protected
        // methods) untouched — only the tamper detection is removed.
        listOf(
            VerifyIntegrityFingerprint,
            CheckLicenseFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(0, "return-void")
        }
    }
}
