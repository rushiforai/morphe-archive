package app.template.patches.fotmob.misc.rating

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.addInstructionsChecked

@Suppress("unused")
val disableRatingPromptsPatch = bytecodePatch(
    name = "Disable rating prompts",
    description = "Disables the rating prompt.",
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    execute {
        // The rating message producer answers null, which its caller already handles as "no
        // message", so the prompt is never queued.
        val producer = RatingAppMessageFingerprint.method
        if (producer.implementation == null) {
            throw PatchException("FotMob RatingAppMessage producer has no implementation")
        }
        producer.addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
