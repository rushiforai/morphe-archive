package app.jackblk.patches.sleepa

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jackblk.patches.shared.Constants.SLEEPA_COMPATIBILITY

@Suppress("unused")
val sleepaPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Sleepa premium: removes ads and unlocks all premium sounds " +
        "and features by forcing the app's premium check to always report purchased.",
    default = true,
) {
    compatibleWith(SLEEPA_COMPATIBILITY)

    execute {
        // si.h0.n() is the single premium gate; force it to return true.
        IsPremiumFingerprint.method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }
    }
}
