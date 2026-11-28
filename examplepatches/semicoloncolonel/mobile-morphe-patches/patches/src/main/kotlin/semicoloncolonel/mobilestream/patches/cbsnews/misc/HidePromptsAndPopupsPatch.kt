package semicoloncolonel.mobilestream.patches.cbsnews.misc

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
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
    dependsOn(hideSurveysPatch)
    extendWith("extensions/extension.mpe")

    booleanOption(
        key = "rating",
        default = true,
        title = "Rating prompt",
        description = "Stops Google Play's rate-this-app sheet.",
    )
    booleanOption(
        key = "surveys",
        default = true,
        title = "Surveys",
        description = "Stops the Qualtrics surveys and the rating prompt they can lead to.",
    )

    execute {
        if (isOptionOn(hidePromptsAndPopupsPatch, "rating")) blockPlayReviewSheet()
    }
}
