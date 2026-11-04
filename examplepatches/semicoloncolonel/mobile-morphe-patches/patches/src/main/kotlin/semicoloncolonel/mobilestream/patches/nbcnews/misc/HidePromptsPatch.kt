package semicoloncolonel.mobilestream.patches.nbcnews.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nbcnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// NBC News 15.0.1 shows Iterate surveys whenever a survey ID is set, and a
// Play Store rating prompt after a number of sessions or articles. Both
// gates now answer false.

internal object SurveyIdFingerprint : Fingerprint(
    definingClass = "Lcom/nbc/analytics/SurveyManager;",
    name = "hasValidSurveyId",
    returnType = "Z",
    parameters = listOf(),
)

internal object RatingPromptFingerprint : Fingerprint(
    definingClass = "Lcom/nbc/utils/InAppRatingManager;",
    name = "getCanShowRating",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val hidePromptsPatch = bytecodePatch(
    name = "Hide surveys and rating prompt",
    description = "Stops the Iterate surveys and the prompt to rate the app.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        listOf(SurveyIdFingerprint, RatingPromptFingerprint).forEach {
            it.method.returnEarly("const/4 v0, 0x0\nreturn v0")
        }
    }
}
