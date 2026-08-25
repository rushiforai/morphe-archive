package app.template.patches.stickermaker

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.STICKER_MAKER_COMPATIBILITY

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Premium features are unlocked and ads are disabled.",
    default = true
) {
    compatibleWith(STICKER_MAKER_COMPATIBILITY)

    // Business logic to unlock premium features.
    execute {
        IsPremiumFingerPrint.method.apply {
            removeInstructions(instructions.size)
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        PremiumDialogShownFinger.method.apply {
            removeInstructions(instructions.size)
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
