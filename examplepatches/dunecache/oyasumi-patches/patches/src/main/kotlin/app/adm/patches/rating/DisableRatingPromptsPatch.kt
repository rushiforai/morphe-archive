package app.adm.patches.rating

import app.adm.patches.shared.Constants.COMPATIBILITY_ADM
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableRatingPromptsPatch = bytecodePatch(
    name = "Disable rating prompts",
    description = "Skip ADM's rating dialog without changing service teardown.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ADM)

    execute {
        RatingPromptFingerprint.method.addInstructions(0, "return-void")
    }
}
