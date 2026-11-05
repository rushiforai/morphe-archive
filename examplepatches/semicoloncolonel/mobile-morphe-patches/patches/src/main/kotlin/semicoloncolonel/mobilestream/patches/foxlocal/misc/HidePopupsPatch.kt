package semicoloncolonel.mobilestream.patches.foxlocal.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxlocal.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// FOX LOCAL 7.22.0 asks for a Play Store review from MainActivity, shows a
// rating card in its feeds, and shows Braze in-app messages, its marketing
// pop-ups. Breaking-news push alerts also come through Braze and still work.

internal object InAppReviewFingerprint : Fingerprint(
    definingClass = "Lcom/fox/fts/mobile/android/MainActivity;",
    name = "launchInAppReviewFlow",
    returnType = "V",
)

internal object RatingCardFingerprint : Fingerprint(
    definingClass = "Lcom/fox/fts/mobile/android/ui/common/widgets/AppRatingPromptWidgetKt;",
    name = "AppRatingPromptWidget",
    returnType = "V",
)

internal object BrazeInAppMessageFingerprint : Fingerprint(
    definingClass = "Lcom/braze/ui/inappmessage/BrazeInAppMessageManager;",
    name = "requestDisplayInAppMessage",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val hidePopupsPatch = bytecodePatch(
    name = "Hide pop-ups and rating prompts",
    description = "Stops the rating prompt, the rating card in the feeds, and marketing pop-ups.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        InAppReviewFingerprint.method.returnEarly("return-void")
        RatingCardFingerprint.method.returnEarly("return-void")
        BrazeInAppMessageFingerprint.method.returnEarly("const/4 v0, 0x0\nreturn v0")
    }
}
