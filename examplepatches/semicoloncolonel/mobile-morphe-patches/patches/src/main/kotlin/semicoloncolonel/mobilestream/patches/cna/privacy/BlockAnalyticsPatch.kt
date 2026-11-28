package semicoloncolonel.mobilestream.patches.cna.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cna.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// CNA (Channel NewsAsia) 2.0.6. Network calls go through OkHttp and Retrofit,
// which keep OkHttp's public API, so the shared OkHttp interceptor and the
// URL/DNS layers attach.
//
// Covered: Segment and comScore.
//
// Not touched: stories, video playback, sign-in, and push alerts (Getui).

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics and audience-measurement services.",
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
