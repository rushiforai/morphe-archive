package app.template.patches.boxbox.misc.telemetry

import app.morphe.patcher.Fingerprint

object AppsFlyerLogEventFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/appsflyer/") && method.name == "logEvent"
    }
)

object FirebaseAnalyticsLogEventFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.contains("FirebaseAnalytics") && method.name == "logEvent"
    }
)

object FirebaseCrashlyticsLogExceptionFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.contains("crashlytics") && (method.name == "logException" || method.name == "recordException")
    }
)
