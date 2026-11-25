package app.salaat.patches.telemetry

import app.salaat.patches.shared.Constants.COMPATIBILITY_SALAAT
import app.salaat.patches.telemetry.resource.androidManifest
import app.salaat.patches.telemetry.resource.metaData
import app.salaat.patches.telemetry.resource.removeReceiver
import app.salaat.patches.telemetry.resource.removeService
import app.salaat.patches.telemetry.resource.removeUsesPermission
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val deactivateFirebaseTelemetryPatch = resourcePatch(
    name = "Deactivate Firebase Telemetry",
    description = "Disables Firebase/Google Analytics collection, Crashlytics crash reporting and " +
        "session tracking via manifest flags, strips the App Measurement services and receiver, " +
        "and removes the advertising-ID permission. App functionality (prayer times, push " +
        "notifications) is unaffected.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SALAAT)

    execute {
        androidManifest {
            // Deactivation flags consumed by the Firebase/GA SDKs at runtime.
            metaData(
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_ssaid_collection_enabled" to "false",
            )

            // App Measurement (GA/Firebase analytics transport) background components.
            removeReceiver("""com\.google\.android\.gms\.measurement\.AppMeasurementReceiver""")
            removeService("""com\.google\.android\.gms\.measurement\.AppMeasurement.*""")

            // Firebase Sessions lifecycle tracking.
            removeService("""com\.google\.firebase\.sessions\.SessionLifecycleService""")

            // Advertising-ID permission.
            removeUsesPermission("""com\.google\.android\.gms\.permission\.AD_ID""")
        }
    }
}
