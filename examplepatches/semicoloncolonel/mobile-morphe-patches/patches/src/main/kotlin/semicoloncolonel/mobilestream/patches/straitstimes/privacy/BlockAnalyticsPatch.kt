package semicoloncolonel.mobilestream.patches.straitstimes.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.straitstimes.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// The Straits Times 8.5.20. Network calls go through OkHttp and Retrofit, which
// keep OkHttp's public API, so the shared OkHttp interceptor and the URL/DNS
// layers attach.
//
// Covered: Permutive, Segment, comScore, Firebase Analytics, and mParticle.
//
// Not touched: stories, video playback, sign-in, and push alerts (Getui).

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, audience-data, and measurement services.",
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
