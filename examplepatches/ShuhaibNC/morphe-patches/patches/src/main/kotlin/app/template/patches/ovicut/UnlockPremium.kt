package app.template.patches.ovicut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants
import app.template.patches.shared.clearBody

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock OviCut Pro",
    description = "Enables premium features and functionality in the OviCut application.",
    default = true
) {
    compatibleWith(Constants.OVICUT_COMPATIBILITY)

    // Business logic to unlock premium features.
    execute {
        IsProOneFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        IsProTwoFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        IsProThreeFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        IsProFourFingerprint.method.apply {
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
