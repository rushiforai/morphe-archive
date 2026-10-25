package app.template.patches.sofascore.misc.rating

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.sofascore.shared.forceCallResult
import app.template.patches.sofascore.shared.modalPredicate

// The rating dialog's name in the modal queue, and the "still ask for a review" preference its
// eligibility predicate reads (default true; the dialog clears it once the user answers).
internal const val RATING_MODAL = "Rating Info"
internal const val ASK_REVIEW_KEY = "ask_review_v3"

@Suppress("unused")
val disableRatingPromptsPatch = bytecodePatch(
    name = "Disable rating prompts",
    description = "Disables the rating prompt.",
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // The predicate shows the dialog when the open counter passes 40, the install is old
        // enough and "ask_review_v3" is still true. Reading that preference as false (as if the
        // user had answered) keeps the dialog out of the modal queue, so nothing waits for its
        // dismiss. The lambda class loads the key once, right before its getBoolean call.
        modalPredicate(RATING_MODAL, ASK_REVIEW_KEY).forceCallResult(
            "SharedPreferences.getBoolean(\"$ASK_REVIEW_KEY\")",
            value = false,
            afterString = ASK_REVIEW_KEY,
        ) {
            it.definingClass == "Landroid/content/SharedPreferences;" && it.name == "getBoolean"
        }
    }
}
