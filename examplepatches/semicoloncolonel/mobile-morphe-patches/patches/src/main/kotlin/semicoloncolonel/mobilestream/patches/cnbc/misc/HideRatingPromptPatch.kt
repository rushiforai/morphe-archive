package semicoloncolonel.mobilestream.patches.cnbc.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cnbc.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.blockPlayReviewSheetPatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// CNBC 8.8.2. InAppRatingManager opens Google Play's review sheet at launch
// and after articles, when getCanShowRating says the session and date rules
// allow it. It now always says no. The shared blocker also stops any other
// call to Google Play's review sheet.

internal object CanShowRatingFingerprint : Fingerprint(
    definingClass = "Lcom/cnbc/client/utilities/InAppRatingManager;",
    name = "getCanShowRating",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val hideRatingPromptPatch = bytecodePatch(
    name = "Hide rating prompt",
    description = "Stops the Google Play rating prompt.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(blockPlayReviewSheetPatch)

    execute {
        CanShowRatingFingerprint.method.returnEarly("const/4 v0, 0x0\nreturn v0")
    }
}
