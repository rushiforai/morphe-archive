package semicoloncolonel.mobilestream.patches.nfl.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in 61.0.18: Kochava (install attribution), Adobe
// Experience Platform, Nielsen, Partnerize (purchase attribution), Amplitude,
// Firebase Analytics and the Bitmovin analytics connector. NFL renames
// OkHttp, so only the shared URLConnection layer applies (see
// BlockTrackers.kt). React Native's own network calls go through the renamed
// OkHttp, so analytics sent from the JavaScript side, such as Conviva, are
// not covered.
//
// Not touched: Sentry crash reporting, OneTrust consent, NFL+ sign-in and
// purchases, playback or DRM.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops third-party analytics and tracking in the NFL app: Kochava, Adobe " +
        "Analytics, Nielsen, Partnerize, Amplitude and Firebase. Blocking happens on the " +
        "device, inside the app. Analytics sent from the app's JavaScript are not covered. " +
        "Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
