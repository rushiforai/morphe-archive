package app.template.patches.all.analytics

import app.morphe.patcher.Fingerprint

object AppMetricaActivateFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/AppMetrica;",
    name = "activate",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lio/appmetrica/analytics/AppMetricaConfig;",
    ),
)

object AppMetricaPublicApiFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        (classDef.type == "Lcom/yandex/metrica/YandexMetrica;" ||
            classDef.type == "Lcom/yandex/metrica/AppMetricaJsInterface;" ||
            classDef.type == "Lcom/yandex/metrica/AppMetricaInitializerJsInterface;") &&
            method.name != "<init>" &&
            method.implementation != null
    },
)

object AppMetricaInternalReportFingerprint : Fingerprint(
    definingClass = "Lcom/yandex/metrica/impl/ob/U1;",
    returnType = "V",
    custom = { method, _ ->
        method.name in setOf("reportData", "sendCrash") &&
            method.implementation != null
    },
)

object AppMetricaInternalQueueFingerprint : Fingerprint(
    definingClass = "Lcom/yandex/metrica/impl/ob/U1;",
    returnType = "Ljava/util/concurrent/Future;",
    custom = { method, _ ->
        method.name in setOf("queuePauseUserSession", "queueReport", "queueResumeUserSession") &&
            method.implementation != null
    },
)

object AppMetricaInternalCallbackFingerprint : Fingerprint(
    definingClass = "Lcom/yandex/metrica/impl/ob/U1\$g;",
    name = "call",
    returnType = "Ljava/lang/Void;",
    custom = { method, _ -> method.implementation != null },
)

object MyTrackerInitFingerprint : Fingerprint(
    definingClass = "Lcom/my/tracker/MyTracker;",
    name = "initTracker",
    returnType = "V",
    custom = { method, _ -> method.implementation != null },
)

object FirebaseCrashlyticsCollectionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "setCrashlyticsCollectionEnabled",
    returnType = "V",
    parameters = listOf("Z"),
)

object FirebasePerformanceCollectionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/perf/FirebasePerformance;",
    name = "setPerformanceCollectionEnabled",
    returnType = "V",
    parameters = listOf("Z"),
)
