package app.masareef.patches.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF

@Suppress("unused")
val disableAllTelemetryPatch = bytecodePatch(
    name = "Disable All Telemetry",
    description = "Disables all analytics and telemetry including Firebase, Google Analytics, Facebook, and Google Ads tracking. This is a comprehensive privacy patch that removes all data collection.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    dependsOn(
        // Firebase patches
        deactivateFirebaseAnalyticsPatch,
        deactivateFirebasePerfPatch,
        deactivateFirebaseCrashlyticsPatch,
        disableFirebaseMessagingAnalyticsPatch,
        disableFirebaseSessionsPatch,
        
        // Facebook patches
        disableFacebookAnalyticsPatch,
        disableFacebookAdsPatch,
        removeFacebookServicesPatch,
        
        // Google Ads patches
        disableGoogleAdsTrackingPatch,
    )

    execute {
        // This patch orchestrates all telemetry removal patches
        // Individual patches handle the actual implementation
    }
}
