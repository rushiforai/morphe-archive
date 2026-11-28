package semicoloncolonel.mobilestream.patches.dealseek.misc

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.dealseek.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.blockPlayReviewSheet
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn

// The app's prompts and pop-ups, one option each. Each part is a dependency
// that runs only when its option is on.

@Suppress("unused")
val hidePromptsAndPopupsPatch: BytecodePatch = bytecodePatch(
    name = "Hide prompts and pop-ups",
    description = "Hides the prompts and pop-ups you choose in the patch options.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(hidePopupsPatch)
    extendWith("extensions/extension.mpe")

    booleanOption(
        key = "rating",
        default = true,
        title = "Rating prompt",
        description = "Stops Google Play's rate-this-app sheet.",
    )
    booleanOption(
        key = "popUps",
        default = true,
        title = "Pop-ups",
        description = "Removes the review requests, the daily spin-the-wheel pop-up, and the survey after opening a deal.",
    )
    booleanOption(
        key = "textAlerts",
        default = true,
        title = "Text-alert prompt",
        description = "Removes the card that asks for your phone number to get deal alerts by text.",
    )
    booleanOption(
        key = "emailScreen",
        default = false,
        title = "Sign-up marketing screen (experimental)",
        description = "Skips the email and text-alert opt-in screen shown right after you create an " +
            "account. Experimental: it changes the app's startup routing, so check that the app still " +
            "opens past sign-up before you rely on it.",
    )

    execute {
        if (isOptionOn(hidePromptsAndPopupsPatch, "rating")) blockPlayReviewSheet()
    }
}
