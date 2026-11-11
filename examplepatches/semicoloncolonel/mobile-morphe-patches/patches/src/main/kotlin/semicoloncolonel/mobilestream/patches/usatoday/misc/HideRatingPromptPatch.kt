package semicoloncolonel.mobilestream.patches.usatoday.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.usatoday.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.blockPlayReviewSheetPatch

// USA TODAY 8.15.0 asks for a Play Store rating after a number of uses, when
// the config's appReviewPrompt is enabled. AppReviewConfig.isEnabled() now
// reports it off.

internal object AppReviewEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/gannett/android/configuration/impl/AppReviewConfigImpl;",
    name = "isEnabled",
    parameters = listOf(),
    returnType = "Z",
)

@Suppress("unused")
val hideRatingPromptPatch = bytecodePatch(
    name = "Hide rating prompt",
    description = "Stops the Play Store rating request.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    // Also stops Google Play's review sheet, where the app calls it by name.
    dependsOn(blockPlayReviewSheetPatch)

    execute {
        AppReviewEnabledFingerprint.method.returnEarly(
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
