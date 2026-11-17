package semicoloncolonel.mobilestream.patches.kouponai.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.Constants
import semicoloncolonel.mobilestream.patches.kouponai.shared.requireNativeLibsPatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.enableWebFilter
import semicoloncolonel.mobilestream.patches.kouponai.shared.kouponWebFilterPatch
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 — Block analytics & tracking (OPT-IN, default OFF).
//
// Koupon ships Firebase Analytics and AppsFlyer (install attribution, in-app
// events, ad revenue, and a Play Integrity check for fraud scoring). The
// manifest kill switches turn Firebase Analytics off, and the shared host
// blocklist stops AppsFlyer and Google Analytics at every URL.openConnection()
// call and OkHttp client. The app's JavaScript sends through React Native's
// NetworkingModule, where KouponTrackingFilter applies the same list and also
// drops two of Koupon's own reports: the recommendation service's profile
// endpoint and /user/ad-linking. Deal pages are web pages in React Native's
// web view, and KouponWebFilter applies the shared list there too, along with
// Intercom's messenger metrics.
//
// Not touched: deals, search, sign-in, rewards, push, Firestore, and
// Crashlytics crash reports.
// ─────────────────────────────────────────────────────────────────────────────

private const val TRACKING_FILTER =
    "Lsemicoloncolonel/mobilestream/extension/kouponai/privacy/KouponTrackingFilter;"

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics and install attribution services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(requireNativeLibsPatch)

    dependsOn(analyticsKillSwitchesPatch, kouponWebFilterPatch)

    extendWith("extensions/extension.mpe")

    execute {
        filterJsRequests(TRACKING_FILTER)
        blockTrackers()
        enableWebFilter("blockTrackers")
    }
}
