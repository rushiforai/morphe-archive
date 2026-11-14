package app.template.patches.reversocontext

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_REVERSO

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Reverso Context Premium",
    description = "Unlocks premium features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_REVERSO)

    execute {
        PremiumFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 p1, 0x1
                """
            )
        }
    }
}