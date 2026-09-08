package com.morphe.friendsturner.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.morphe.friendsturner.patches.Constants.COMPATIBILITY_FRIENDSTURNER

/**
 * Disable the Google Play license check.
 *
 * Without this, a patched build starts and is immediately replaced by Play's
 * "Get this app from Play" screen, because PairIP sees the app was not installed by Play.
 *
 * Returning immediately from LicenseClient.checkLicense neutralises both entry points
 * (the LicenseContentProvider and the Application shim). The rest of the method becomes
 * unreachable; nothing else in the app calls into licensecheck.
 */
@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable license check",
    description = "Stops Google Play's integrity check from replacing the patched app with the \"Get this app from Play\" screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FRIENDSTURNER)

    execute {
        PairipLicenseCheckFingerprint.method.addInstruction(0, "return-void")
    }
}
