package app.template.patches.apksigner

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants
import app.template.patches.apksigner.IsProAccountFingerprint
import app.template.patches.shared.clearBody

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "APK Signer Unlock Pro",
    description = "Unlocks Pro and remove ads from APK Signer.",
    default = true
) {
    compatibleWith(Constants.APK_SIGNER_COMPATIBILITY)

    // Business logic to unlock premium features.
    execute {
        IsProAccountFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
