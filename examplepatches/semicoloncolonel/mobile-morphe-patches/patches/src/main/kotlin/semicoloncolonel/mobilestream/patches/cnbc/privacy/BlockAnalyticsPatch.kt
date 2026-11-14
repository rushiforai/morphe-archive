package semicoloncolonel.mobilestream.patches.cnbc.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cnbc.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// CNBC 8.8.2. Third-party services and the hosts they send to: Adobe
// Analytics (demdex.net, omtrdc.net), Amplitude, AppsFlyer, CleverTap,
// comScore (scorecardresearch.com), Kochava, Nielsen (imrworldwide.com), and
// Airship events. Firebase Analytics is turned off with its manifest kill
// switches. CNBC keeps OkHttp's public API, so the interceptor attaches, and
// hosts are also blocked at URLConnection and at DNS.
//
// Not touched: sign-in, quotes, articles, video, and Airship push alerts.
@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Adobe, Amplitude, AppsFlyer, CleverTap, comScore, Kochava, Nielsen, and Firebase Analytics.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
        blockTrackersAtDns()
    }
}
