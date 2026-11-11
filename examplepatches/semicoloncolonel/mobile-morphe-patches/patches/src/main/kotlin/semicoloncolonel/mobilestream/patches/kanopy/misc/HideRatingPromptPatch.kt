package semicoloncolonel.mobilestream.patches.kanopy.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.kanopy.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.blockPlayReviewSheetPatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Kanopy 6.32.0. After three plays, and again every 120 days, the home shelf
// asks Google Play for its review sheet and the app opens its own "Enjoying
// Kanopy?" dialog (AppRatingFragment). Both ask one check, which reads the
// APP_RATING_PLAY_COUNT and APP_RATING_PROMPT_TIME preferences. It now always
// says no. The shared blocker also stops any other call to Google Play's
// review sheet.

internal object ShouldShowRatingFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    strings = listOf("APP_RATING_PLAY_COUNT", "APP_RATING_PROMPT_TIME"),
)

@Suppress("unused")
val hideRatingPromptPatch = bytecodePatch(
    name = "Hide rating prompt",
    description = "Stops the app's rating dialog and the Google Play rating prompt.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(blockPlayReviewSheetPatch)

    execute {
        ShouldShowRatingFingerprint.method.returnEarly("const/4 v0, 0x0\nreturn v0")
    }
}
