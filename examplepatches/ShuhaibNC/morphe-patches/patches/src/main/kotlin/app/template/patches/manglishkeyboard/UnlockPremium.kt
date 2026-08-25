package app.template.patches.manglishkeyboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MALAYALAM_KEYBOARD_COMPATIBILITY
import app.template.patches.manglishkeyboard.IsPremiumFingerprint

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Premium features are unlocked and ads are disabled.",
    default = true
) {
    compatibleWith(MALAYALAM_KEYBOARD_COMPATIBILITY)

    // Business logic to unlock premium features.
    execute {
        IsPremiumFingerprint.method.apply {
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
