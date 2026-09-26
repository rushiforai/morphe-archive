package app.plyrs1.patches.com_pertaminiku

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_PERTAMINIKU

/**
 * PairIP License Patch - Bypasses Google Play Integrity / licensing verification.
 * 
 * This patch neutralizes the PairIP license check library that shows:
 * "Something went wrong" → "Check that Google Play is enabled on your device..."
 * 
 * The app requires a valid Google Play licensing handshake during startup.
 * If it fails (no Play Store, emulator, or billing disabled), PairIP triggers
 * LicenseActivity.showErrorDialog() which blocks usage until user closes it.
 * 
 * Our solution:
 * 1. Skip LicenseContentProvider.onCreate() entirely (return true immediately)
 * 2. Disable LicenseClient.initializeLicenseCheck() (void return before any calls)
 */
val pairiPLicensePatch = bytecodePatch(
    name = "Disable Licensing",
    description = "Bypasses PairIP license verification to prevent 'Something went wrong' errors on emulators and devices without Google Play.",
    default = false
) {
    compatibleWith(COMPATIBILITY_PERTAMINIKU)

    execute {
        // 1. Neutralize LicenseContentProvider.onCreate() - skip LicenseClient initialization
        // Method signature: onCreate()Z
        // Original flow: initializeLicenseCheck() then return true
        // Patch: return true at instruction index 0
        LicenseContentProviderOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 2. Prevent LicenseClient.initializeLicenseCheck() from executing any checks
        // This method contains the full licensing handshake with Google Play
        // Patch: void return at instruction index 0
        LicenseClientInitializeLicenseCheckFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        println("✓ PairIP License patch applied: licensing will be silently skipped")
    }
}
