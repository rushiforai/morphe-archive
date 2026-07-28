package app.template.patches.pairip

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ROOST

@Suppress("unused")
val bypassPlayLicenseCheckPatch = bytecodePatch(
    name = "Bypass Play Store license check",
    description = "Disables the PairIP Play-license check so a non-Play (e.g. patched/sideloaded) " +
        "install no longer redirects to the \"get it on Google Play\" wall on launch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ROOST)

    execute {
        // Neutralize LicenseClient.initializeLicenseCheck() -- the single entry point that
        // drives the license check and, on failure, launches the paywall/error wall activity.
        // Returning immediately leaves the rest of the method as harmless dead code.
        PairipLicenseCheckFingerprint.method.addInstruction(0, "return-void")
    }
}
