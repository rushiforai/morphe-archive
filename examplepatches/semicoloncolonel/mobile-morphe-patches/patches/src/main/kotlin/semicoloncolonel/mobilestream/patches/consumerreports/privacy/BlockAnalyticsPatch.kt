package semicoloncolonel.mobilestream.patches.consumerreports.privacy

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.consumerreports.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.shared.misc.requireNativeLibsPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Consumer Reports 5.25.0 — Block analytics & tracking (OPT-IN, default OFF).
//
// Consumer Reports is a React Native app that ships Firebase Analytics, Google
// Analytics, Braze (marketing and in-app campaigns), and FullStory session
// replay. The manifest kill switch deactivates Firebase Analytics, and the
// shared host blocklist stops Firebase (app-measurement.com), Google Analytics,
// Braze (braze.com, appboy.com), and FullStory (fullstory.com) at every
// URL.openConnection() call and OkHttp client. FullStory sends through
// URLConnection, which that layer covers. The app's JavaScript sends through
// React Native's NetworkingModule, where the same blocklist is applied to each
// request URL.
//
// Not touched: the paid membership (Stripe, in-app purchases), sign-in,
// Firebase Crashlytics crash reports, push, reviews, and images.
// ─────────────────────────────────────────────────────────────────────────────

private val requireNativeLibs = requireNativeLibsPatch("Consumer Reports", "libreactnative.so")

@Suppress("unused")
val blockAnalyticsPatch: BytecodePatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(requireNativeLibs, analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        filterJsRequests(TRACKER_BLOCKER)

        blockTrackers()
    }
}
