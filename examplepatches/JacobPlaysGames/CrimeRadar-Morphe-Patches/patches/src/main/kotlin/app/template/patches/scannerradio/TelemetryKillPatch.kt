package app.template.patches.scannerradio

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SCANNERRADIO

/**
 * Disables telemetry/analytics, ad SDKs, and ad display methods for privacy:
 *
 * 1. InMobi (InMobiSdk.init) — ad mediation + telemetry
 *    Collects: device IDs, ad interaction data, user profiles
 *
 * 2. FairBid (com.fyber.a.start) — ad mediation entry point
 *    Collects: ad impressions, click tracking, device fingerprint
 *
 * 3. AdManager.showBannerAds (j8.i) — defense-in-depth
 *    Prevents banner ad display even if SDK init somehow proceeds.
 *
 * 4. AdManager.showInterstitialAds (j8.j) — defense-in-depth
 *    Prevents interstitial ad display even if SDK init somehow proceeds.
 *
 * Note: Firebase Analytics is NOT disabled here because it's wired into
 * FirebaseInitializer.run() which also sets up Firebase Messaging (push).
 * Disabling the whole method would break push notifications.
 */
@Suppress("unused")
val telemetryKillPatch = bytecodePatch(
    name = "Telemetry Kill",
    description = "Disables InMobi, FairBid telemetry/ad SDKs and ad display for privacy.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SCANNERRADIO)

    execute {
        // Kill InMobi SDK init — no-op the entire method
        InMobiInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Kill FairBid SDK init — no-op the entry point
        FairBidInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Kill banner ad display — defense-in-depth
        ShowBannerAdsFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Kill interstitial ad display — defense-in-depth
        ShowInterstitialAdsFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
