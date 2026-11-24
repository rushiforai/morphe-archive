package patches.cronometer

import app.morphe.patcher.patch.bytecodePatch
import patches.cronometer.ads.disableAds
import patches.cronometer.premium.premiumVisual
import patches.cronometer.tracking.disableAdjust
import patches.cronometer.tracking.disableAmplitude
import patches.cronometer.tracking.disableBraze
import patches.cronometer.tracking.disableDatadog
import patches.cronometer.tracking.disableFirebaseAnalytics
import patches.cronometer.tracking.trackingResources

/**
 * One user-facing control for the full Cronometer policy. The individual
 * controls remain selectable; this aggregate is the recommended build.
 */
@Suppress("unused")
val disableAdsTrackingAndUpsells = bytecodePatch(
    name = "Disable ads, tracking and Gold upsells",
    description = "Disables selected advertising and telemetry paths, unlocks local Gold controls, " +
        "and hides Gold promotions, food suggestions, referrals and the persistent first-food tip. " +
        "Server-backed features still require their native services.",
) {
    compatibleWith(cronometer)
    dependsOn(
        originalInput,
        disableAds,
        disableAdjust,
        disableAmplitude,
        disableBraze,
        disableDatadog,
        disableFirebaseAnalytics,
        trackingResources,
        premiumVisual,
    )
}
