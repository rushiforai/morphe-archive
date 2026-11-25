package app.masareef.patches.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF
import app.masareef.patches.telemetry.resource.androidManifest
import app.masareef.patches.telemetry.resource.metaData

@Suppress("unused")
val deactivateFirebaseCrashlyticsPatch = resourcePatch(
    name = "Deactivate Firebase Crashlytics",
    description = "Deactivates Firebase Crashlytics crash reporting and removes associated services.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    dependsOn(removeCrashlyticsServicesPatch)

    execute {
        androidManifest {
            metaData("firebase_crashlytics_collection_enabled" to "false")
        }
    }
}
