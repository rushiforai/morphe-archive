package app.masareef.patches.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF
import app.masareef.patches.telemetry.resource.androidManifest
import app.masareef.patches.telemetry.resource.metaData

@Suppress("unused")
val deactivateFirebasePerfPatch = resourcePatch(
    name = "Deactivate Firebase Performance Monitoring",
    description = "Deactivates the collection of performance data on app startup time, network requests, and other related metrics.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    execute {
        androidManifest {
            metaData("firebase_performance_collection_deactivated" to "true")
            metaData("firebase_performance_logcat_enabled" to "false")
        }
    }
}
