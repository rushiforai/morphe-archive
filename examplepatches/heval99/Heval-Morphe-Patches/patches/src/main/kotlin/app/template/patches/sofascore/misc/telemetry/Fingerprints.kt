package app.template.patches.sofascore.misc.telemetry

import app.morphe.patcher.Fingerprint

// AppsFlyer event tracking
object AppsFlyerLogEventFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.startsWith("Lcom/appsflyer/") && method.name == "logEvent" }
)

// Firebase Analytics event logging
object FirebaseAnalyticsLogEventFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.contains("FirebaseAnalytics") && method.name == "logEvent" }
)

// Firebase Crashlytics exception logging
object CrashlyticsLogExceptionFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.contains("crashlytics") && (method.name == "logException" || method.name == "recordException") }
)

// Adjust event tracking
object AdjustTrackEventFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.startsWith("Lcom/adjust/sdk/Adjust") && method.name == "trackEvent" }
)

// Generic analytics dispatch / send
object AnalyticsDispatchFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.contains("Analytics") && method.name == "dispatch" }
)
