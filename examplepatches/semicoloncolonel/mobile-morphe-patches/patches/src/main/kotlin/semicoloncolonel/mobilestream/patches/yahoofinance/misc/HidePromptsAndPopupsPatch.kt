package semicoloncolonel.mobilestream.patches.yahoofinance.misc

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.Constants

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
        key = "popUps",
        default = true,
        title = "Pop-ups",
        description = "Removes the rating and feedback requests, announcements, tours, coach marks, and tooltips. " +
        "Privacy and consent screens still show.",
    )
}
