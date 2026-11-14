package semicoloncolonel.mobilestream.patches.truthsocial.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants
import semicoloncolonel.mobilestream.patches.truthsocial.shared.turnOffTruthFeatures

// Truth Social 1.28.3. Truth Predict is a prediction market inside the app,
// run with Crypto.com's US derivatives exchange, where users buy contracts
// on elections, economic data, and sports. Gems are rewards that can be
// converted to Crypto.com's CRO token. The patch turns off the server's
// switches for both, so the app hides them.
@Suppress("unused")
val hideCryptoPatch = bytecodePatch(
    name = "Hide crypto and prediction markets",
    description = "Hides Truth Predict and Gems.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        turnOffTruthFeatures("predictions", "gems_enabled", "gems_visible")
    }
}
