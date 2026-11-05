package app.template.patches.fotmob.misc.rating

import app.morphe.patcher.patch.PatchException
import app.template.patches.fotmob.controls.FotMobControlsCategory
import app.template.patches.fotmob.controls.fotMobControls
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.hevalReturnNull

internal val DISABLE_RATING_PROMPTS = HevalFeature(
    id = "fotmob.disable_rating_prompts",
    name = "Disable rating prompts",
    description = "Disables the rating prompt.",
    category = FotMobControlsCategory.POPUPS,
)

// A Patch settings feature (2026-11-03): on by default, like the always-on patch it replaced; off,
// the producer runs its stock code.
@Suppress("unused")
val disableRatingPromptsPatch = fotMobControls.featurePatch(DISABLE_RATING_PROMPTS) {
    // The rating message producer answers null, which its caller already handles as "no message",
    // so the prompt is never queued.
    val producer = RatingAppMessageFingerprint.method
    if (producer.implementation == null) {
        throw PatchException("FotMob RatingAppMessage producer has no implementation")
    }
    producer.hevalReturnNull(DISABLE_RATING_PROMPTS.id)
}
