package app.masareef.patches.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF
import app.masareef.patches.telemetry.resource.androidManifest
import app.masareef.patches.telemetry.resource.metaData

@Suppress("unused")
val deactivateFirebaseAnalyticsPatch = resourcePatch(
    name = "Deactivate Firebase Analytics",
    description = "Deactivates Firebase Analytics and removes its associated broadcast receivers and services.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    dependsOn(
        removeAdsServicesPatch,
        removeAdvertisingIdPatch,
        removeAppMeasurementPatch,
        removeGoogleAnalyticsPatch,
    )

    execute {
        androidManifest {
            metaData("firebase_analytics_collection_deactivated" to "true")
            metaData("google_analytics_adid_collection_enabled" to "false")
            metaData("google_analytics_ssaid_collection_enabled" to "false")
        }
    }
}
