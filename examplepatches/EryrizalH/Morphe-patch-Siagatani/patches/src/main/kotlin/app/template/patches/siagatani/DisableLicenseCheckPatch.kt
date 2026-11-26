package app.template.patches.siagatani

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.siagatani.Constants.SIAGA_TANI

@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable license check",
    description = "Bypasses PairIP license verification so the app works after re-signing.",
    default = true
) {
    compatibleWith(SIAGA_TANI)

    execute {
        LicenseCheckFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        LocalInstallerCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
