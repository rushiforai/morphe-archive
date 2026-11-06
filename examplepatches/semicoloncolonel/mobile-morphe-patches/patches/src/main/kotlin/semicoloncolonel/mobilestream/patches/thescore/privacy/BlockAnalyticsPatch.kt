package semicoloncolonel.mobilestream.patches.thescore.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.thescore.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// theScore 26.16.0 — Block analytics & tracking (OPT-IN, default OFF).
//
// theScore keeps OkHttp's public API, so both shared layers apply: the
// blocking OkHttp interceptor and the host blocklist at every
// URL.openConnection() call site, plus the SDKs' manifest kill switches
// (Firebase Analytics off, no ad-ID or SSAID collection).
//
// The blocklist covers theScore's own event collector
// (analytics-tracker.thescore.com), Amplitude, AppsFlyer, Branch, Comscore,
// Datadog, Segment, Airship's analytics, and LiveRamp's identity service.
//
// Not touched: scores, news, social, Airship push notifications, Amplitude
// feature flags (the app reads them), and the ad networks, which belong to an
// ad-blocking patch.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, attribution, and identity tracking services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
    }
}
