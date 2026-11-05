package app.template.patches.sofascore.misc.rating

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.hasModal
import app.template.patches.sofascore.controls.modalQueueHookPatch
import app.template.patches.sofascore.controls.sofascoreControls

// The rating dialog's name in the modal queue (SofascoreControls.modalFeature maps it to the
// feature below).
internal const val RATING_MODAL = "Rating Info"

internal val DISABLE_RATING_PROMPTS = HevalFeature(
    id = "sofascore.disable_rating_prompts",
    name = "Disable rating prompts",
    description = "Disables the rating prompt.",
    category = SofascoreControlsCategory.POPUPS,
)

// A Heval Controls feature: on by default, like the always-on patch it replaced.
@Suppress("unused")
val disableRatingPromptsPatch = sofascoreControls.featurePatch(
    DISABLE_RATING_PROMPTS,
    dependencies = setOf(modalQueueHookPatch),
) {
    // The rating dialog is a startup modal: the queue's evaluator answers "not eligible" for
    // "Rating Info" while the feature is on, so the dialog is never queued and the queue never
    // waits for its dismiss. Off, the stock predicate (open counter, install age, "ask_review_v3")
    // decides as before.
    if (!hasModal(RATING_MODAL)) throw PatchException("No modal named \"$RATING_MODAL\"")
}
