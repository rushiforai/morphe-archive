package semicoloncolonel.mobilestream.patches.truthsocial.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants

// Truth Social 1.28.3. Mixpanel and Adjust send over HttpURLConnection, which
// the shared layer checks against the host blocklist. Firebase/Google
// Analytics is turned off with its manifest kill switches. The app's own
// OkHttp is renamed, so its requests to truthsocial.com are not touched.
//
// Not touched: the feeds, sign-in, push notifications, or video.
@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Mixpanel, Adjust, and Firebase/Google Analytics.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
    }
}
