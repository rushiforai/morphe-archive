package app.template.patches.mvideo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MVIDEO_COMPATIBILITY
import app.template.patches.mvideo.PremiumFingerprint
import app.template.patches.shared.clearBody

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Mvideo VIP",
    description = "All VIP features are unlocked.",
    default = true
) {
    compatibleWith(MVIDEO_COMPATIBILITY)

    // Business logic to unlock premium features.
    execute {
        PremiumFingerprint.method.apply {
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
