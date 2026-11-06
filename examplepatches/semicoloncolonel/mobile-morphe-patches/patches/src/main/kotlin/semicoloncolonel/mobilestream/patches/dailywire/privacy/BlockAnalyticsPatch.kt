package semicoloncolonel.mobilestream.patches.dailywire.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.dailywire.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// The Daily Wire 3.5.21. The app's trackers send over HttpURLConnection and
// OkHttp, which the shared layer checks against the host blocklist, plus the
// SDKs' manifest kill switches. Covered: Segment, comScore, Adjust, the
// Facebook SDK's Graph calls, and Firebase/Google Analytics.
//
// Not touched: sign-in, Google Play Billing, video playback, or the app's own
// content API. The app reports to Segment when it sees an ad blocker; with
// this on, that report has nowhere to go.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Segment, comScore, Adjust, the Facebook SDK, and Firebase/Google Analytics.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
