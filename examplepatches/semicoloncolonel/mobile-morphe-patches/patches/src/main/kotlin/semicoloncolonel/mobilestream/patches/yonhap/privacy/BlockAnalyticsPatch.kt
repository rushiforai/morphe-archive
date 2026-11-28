package semicoloncolonel.mobilestream.patches.yonhap.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.yonhap.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// Yonhap News English 1.1.01. The app is a small native build whose network
// calls go through OkHttp and Retrofit, both of which keep OkHttp's public API,
// so the shared OkHttp interceptor and the URL/DNS layers all attach.
//
// Covered: Segment, Amplitude, and Firebase Analytics.
//
// Not touched: stories, sign-in, push alerts, and crash reporting.

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
