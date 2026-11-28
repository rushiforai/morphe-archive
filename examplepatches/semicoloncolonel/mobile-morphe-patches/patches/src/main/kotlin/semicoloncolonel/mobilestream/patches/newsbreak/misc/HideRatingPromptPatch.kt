package semicoloncolonel.mobilestream.patches.newsbreak.misc

import semicoloncolonel.mobilestream.patches.shared.misc.blockPlayReviewSheet
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// NewsBreak 26.44.1. The home screen shows a "How are we doing?" dialog that
// leads to a Play Store rating, ten days after install and again every 60
// days. The check that decides it is due now always says no, and the request
// for Google Play's in-app review sheet is not made.

internal object ShouldShowRatingFingerprint : Fingerprint(
    definingClass = "Lcom/particlemedia/feature/home/rating/FeedbackAndRatingManager;",
    name = "shouldShowRating",
    returnType = "Z",
)

internal object PlayReviewRequestFingerprint : Fingerprint(
    definingClass = "Lcom/particlemedia/feature/home/rating/AppRatingManager;",
    name = "request",
    returnType = "V",
    parameters = listOf(),
)

// Part of hidePromptsAndPopupsPatch: runs only when its "rating" option is on.
internal val hideRatingPromptPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    // Also stops Google Play's review sheet, where the app calls it by name.

    execute {
        if (!isOptionOn(hidePromptsAndPopupsPatch, "rating")) return@execute
        blockPlayReviewSheet()
        ShouldShowRatingFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        PlayReviewRequestFingerprint.method.addInstructions(0, "return-void")
    }
}
