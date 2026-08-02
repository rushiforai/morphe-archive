package software.zarko.patches.sunrisealarm

import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import software.zarko.patches.sunrisealarm.Constants.COMPATIBILITY_SUNRISE_ALARM

@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable license check",
    description = "Removes the PairIP LicenseClient.checkLicense() call, which otherwise " +
        "force-closes a re-signed/sideloaded patched APK a short while after launch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SUNRISE_ALARM)

    execute {
        val checkLicenseCall = LicenseCheckFingerprint.instructionMatches[0]
        LicenseCheckFingerprint.method.removeInstruction(checkLicenseCall.index)
    }
}
