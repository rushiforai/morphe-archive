package semicoloncolonel.mobilestream.patches.cgtn.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cgtn.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// CGTN 6.7.0 (com.imib.cctv). Network calls run through OkHttp, which keeps its
// public API, so the shared OkHttp interceptor and the URL/DNS layers attach.
//
// Covered: AppsFlyer, Firebase Analytics, Segment, and mParticle.
//
// Not touched: stories, video playback (Agora), sign-in, push alerts
// (Getui), and crash reporting.

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
