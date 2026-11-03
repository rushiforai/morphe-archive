package semicoloncolonel.mobilestream.patches.dealseek.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.dealseek.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// DealSeek 1.64.0 ships AppsFlyer, the Meta SDK (auto-logged events and ad-ID
// collection switched on), Firebase Analytics, the TikTok Business SDK and
// PostHog. The native SDKs send through URL.openConnection(), which the shared
// layer covers. OkHttp is renamed in this build, so the shared OkHttp layer
// does not apply. PostHog runs in JavaScript, and the app's JavaScript sends
// through Expo's expo/fetch module, so each request URL is checked there
// against the same blocklist. React Native's own NetworkingModule (fetch and
// XMLHttpRequest) gets the same check. PostHog feature flags (/flags/) are
// left alone, since the app reads them.
//
// Not touched: sign-in (Supabase, Google, Apple, Meta), Sentry crash
// reporting, Crisp support chat, push, deals and images.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops analytics and tracking in the DealSeek app: AppsFlyer, Meta app " +
        "events, Firebase, TikTok and PostHog. Blocking happens on the device, inside the app. " +
        "Sign-in and deals are left alone. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        filterJsRequests(TRACKER_BLOCKER)

        blockTrackers()
    }
}
