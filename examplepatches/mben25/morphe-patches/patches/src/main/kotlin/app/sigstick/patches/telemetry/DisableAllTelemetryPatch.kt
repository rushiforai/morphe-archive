package app.sigstick.patches.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.sigstick.patches.shared.Constants.COMPATIBILITY_SIGSTICK
import app.sigstick.patches.shared.resource.androidManifest
import app.sigstick.patches.shared.resource.metaData
import app.sigstick.patches.shared.resource.removeReceiver
import app.sigstick.patches.shared.resource.removeService
import app.sigstick.patches.shared.resource.removeUsesPermission

// ── What SigStick reports (5.25.0) ───────────────────────────────────────────
//
// Firebase Auth (anonymous account), Remote Config and Messaging are real
// app dependencies, so ComponentDiscoveryService and the shared registrars stay. Crashlytics
// also stays registered: the app calls `FirebaseCrashlytics.getInstance()` in 10 places and
// its registrar requires Sessions, so removing either would crash at startup. Instead:
//   - Analytics: 112 app call sites all go through `FirebaseAnalytics.logEvent`; stubbing it
//     (plus user id/properties) covers both the Kotlin UI and the Flutter editor, and the
//     manifest flags plus the AppMeasurement receivers/services stop the SDK on its own.
//   - Crashlytics: the manifest ships `firebase_crashlytics_collection_enabled=true` and the
//     Flutter plugin can re-enable it at runtime, so the flag goes false and
//     `setCrashlyticsCollectionEnabled` is forced false (null = "use the manifest" = false).
//   - Sessions, In-App Messaging, FCM delivery metrics: their manifest kill switches.
//   - Advertising ID / AdServices attribution permissions are dropped.

private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val FIREBASE_CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"

private class SdkMethodFingerprint(definingClass: String, name: String, parameters: List<String>) :
    Fingerprint(definingClass = definingClass, name = name, returnType = "V", parameters = parameters)

private val disableTelemetryManifestPatch = resourcePatch {
    execute {
        androidManifest {
            metaData(
                "firebase_analytics_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_ssaid_collection_enabled" to "false",
                "google_analytics_default_allow_ad_personalization_signals" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_sessions_enabled" to "false",
                "firebase_inapp_messaging_auto_data_collection_enabled" to "false",
                "delivery_metrics_exported_to_big_query_enabled" to "false",
            )
            removeReceiver("""com\.google\.android\.gms\.measurement\..+Receiver""")
            removeService("""com\.google\.android\.gms\.measurement\..+Service""")
            removeUsesPermission(
                """com\.google\.android\.gms\.permission\.AD_ID""",
                """android\.permission\.ACCESS_ADSERVICES_.+""",
            )
        }
    }
}

@Suppress("unused")
val disableAllTelemetryPatch = bytecodePatch(
    name = "Disable All Telemetry",
    description = "Blocks Firebase / Google Analytics events, Crashlytics, Sessions, In-App " +
        "Messaging and FCM delivery metrics, and removes the Advertising ID and AdServices " +
        "attribution permissions. Sign-in, Remote Config and push keep working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SIGSTICK)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        listOf(
            SdkMethodFingerprint(FIREBASE_ANALYTICS, "logEvent", listOf("Ljava/lang/String;", "Landroid/os/Bundle;")),
            SdkMethodFingerprint(FIREBASE_ANALYTICS, "setUserId", listOf("Ljava/lang/String;")),
            SdkMethodFingerprint(FIREBASE_ANALYTICS, "setUserProperty", listOf("Ljava/lang/String;", "Ljava/lang/String;")),
            SdkMethodFingerprint(FIREBASE_ANALYTICS, "setDefaultEventParameters", listOf("Landroid/os/Bundle;")),
        ).forEach { it.method.addInstruction(0, "return-void") }

        listOf("Z", "Ljava/lang/Boolean;").forEach {
            SdkMethodFingerprint(FIREBASE_CRASHLYTICS, "setCrashlyticsCollectionEnabled", listOf(it))
                .method.addInstruction(0, "const/4 p1, 0x0")
        }
    }
}
