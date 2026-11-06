package semicoloncolonel.mobilestream.patches.newsnation.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.newsnation.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// NewsNation, phone (510.3.0) and Android TV (4.71). The apps' trackers send
// over HttpURLConnection and OkHttp, which the shared layer checks against the
// host blocklist, plus the SDKs' manifest kill switches. Covered on the phone:
// comScore, Nielsen, Segment, Adjust, and Firebase/Google Analytics. On
// Android TV: Kochava (including its rotating failover domains),
// Firebase/Google Analytics, and Intercom's event endpoint. Intercom's own
// chat and push are left working.
//
// Not touched: live TV, the article feed, sign-in, or Google Play Billing.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the apps' analytics, attribution, and audience-measurement services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY, Constants.TV_COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
