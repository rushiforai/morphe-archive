package semicoloncolonel.mobilestream.patches.kanopy.misc

import semicoloncolonel.mobilestream.patches.shared.misc.blockPlayReviewSheet
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
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

// Part of hidePromptsAndPopupsPatch: runs only when its "rating" option is on.
internal val hideRatingPromptPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")


    execute {
        if (!isOptionOn(hidePromptsAndPopupsPatch, "rating")) return@execute
        blockPlayReviewSheet()
        ShouldShowRatingFingerprint.method.returnEarly("const/4 v0, 0x0\nreturn v0")
    }
}
