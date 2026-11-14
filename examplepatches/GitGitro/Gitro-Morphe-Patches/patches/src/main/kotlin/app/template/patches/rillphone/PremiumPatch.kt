package app.template.patches.rillphone

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_RILLPHONE

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks premium features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_RILLPHONE)

    execute {
        CheckProStatusFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Lf13;->o()V
                return-void
            """
        )
    }
}