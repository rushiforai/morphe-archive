package app.template.patches.apksigner

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants
import app.template.patches.apksigner.IsProAccountFingerprint
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters

@Suppress("unused")
val disableFgWarningPatch = bytecodePatch(
    name = "Disable Forground Services Warning",
    description = "Turns off annoying forground service warning at startup",
    default = true
) {
    compatibleWith(Constants.APK_SIGNER_COMPATIBILITY)
    execute {
        ShouldShowFgServicesWarningFingerprint.method.apply {
            clearBody()
            ensureRegisters(1)
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }
    }
}
