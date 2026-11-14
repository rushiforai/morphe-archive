package semicoloncolonel.mobilestream.patches.truthsocial.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants
import semicoloncolonel.mobilestream.patches.truthsocial.shared.turnOffTruthFeatures

// Truth Social 1.28.3. The server's switches for the Play Store update
// prompt and the "rate this app" prompt are turned off. A patched app
// cannot be updated from the Play Store, so the update prompt has no use.
@Suppress("unused")
val disableUpdatePromptsPatch = bytecodePatch(
    name = "Disable update and review prompts",
    description = "Stops the Play Store update and rating prompts.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        turnOffTruthFeatures("in_app_update", "in_app_review")
    }
}
