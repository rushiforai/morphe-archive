package semicoloncolonel.mobilestream.patches.newsbreak.misc

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.newsbreak.shared.Constants

// The app's prompts and pop-ups, one option each. Each part is a dependency
// that runs only when its option is on.

@Suppress("unused")
val hidePromptsAndPopupsPatch: BytecodePatch = bytecodePatch(
    name = "Hide prompts and pop-ups",
    description = "Hides the prompts and pop-ups you choose in the patch options.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(hideRatingPromptPatch)

    booleanOption(
        key = "rating",
        default = true,
        title = "Rating prompt",
        description = "Removes the \"How are we doing?\" pop-up and the Play Store rating request.",
    )
}
