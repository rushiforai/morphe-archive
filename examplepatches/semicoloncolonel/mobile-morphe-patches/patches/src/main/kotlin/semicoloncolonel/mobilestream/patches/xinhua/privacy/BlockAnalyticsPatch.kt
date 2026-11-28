package semicoloncolonel.mobilestream.patches.xinhua.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.xinhua.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// Xinhua News 5.4.2. The app bundles many SDKs, but its network calls go
// through OkHttp and Retrofit, which keep OkHttp's public API, so the shared
// OkHttp interceptor and the URL/DNS layers attach.
//
// Covered: AppsFlyer, Firebase Analytics, Segment, Amplitude, and mParticle.
//
// Not touched: stories, media playback, sign-in, push alerts (Getui), and
// crash reporting (Bugly).

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, attribution, and audience-measurement services.",
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
