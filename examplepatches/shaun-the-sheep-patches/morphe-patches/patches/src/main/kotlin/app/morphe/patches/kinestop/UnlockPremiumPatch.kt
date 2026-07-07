package app.morphe.patches.kinestop

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.kinestop.Fingerprints.IsTrialFingerprint
import app.morphe.patches.shared.Constants.COMPATIBILITY_KINESTOP

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium features by forcing KineService.Companion.isTrial() to return false (pro state).",
    default = true
) {
    compatibleWith(COMPATIBILITY_KINESTOP)

    execute {
        // Replace the entire isTrial(Context) body with `const/4 v0, 0x0` + `return v0`.
        // Method keeps .locals 1, so v0 is available; params (this, context) are unused.
        IsTrialFingerprint.method.apply {
            val instructionCount = implementation?.instructions?.count() ?: 0
            removeInstructions(instructionCount)
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
    }
}