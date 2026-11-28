package semicoloncolonel.mobilestream.patches.usatoday.misc

import semicoloncolonel.mobilestream.patches.shared.misc.blockPlayReviewSheet
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// USA TODAY 8.15.0 asks for a Play Store rating after a number of uses, when
// the config's appReviewPrompt is enabled. AppReviewConfig.isEnabled() now
// reports it off.

internal object AppReviewEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/gannett/android/configuration/impl/AppReviewConfigImpl;",
    name = "isEnabled",
    parameters = listOf(),
    returnType = "Z",
)

// Part of hidePromptsAndPopupsPatch: runs only when its "rating" option is on.
internal val hideRatingPromptPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    // Also stops Google Play's review sheet, where the app calls it by name.

    execute {
        if (!isOptionOn(hidePromptsAndPopupsPatch, "rating")) return@execute
        blockPlayReviewSheet()
        AppReviewEnabledFingerprint.method.returnEarly(
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
