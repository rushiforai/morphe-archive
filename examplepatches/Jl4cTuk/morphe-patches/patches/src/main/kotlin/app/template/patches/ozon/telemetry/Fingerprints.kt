package app.template.patches.ozon.telemetry

import app.morphe.patcher.Fingerprint

object OzonTrackerEnabledFingerprint : Fingerprint(
    definingClass = "Lru/ozon/app/android/analytics/tracker/OzonTrackerSettings;",
    name = "isEnabled",
    returnType = "Z",
    parameters = emptyList(),
)

object OzonTrackerWorkerFingerprint : Fingerprint(
    definingClass = "Lru/ozon/tracker/worker/EventsSenderWorker;",
    returnType = "Ljava/lang/Object;",
    custom = { method, _ ->
        method.implementation != null &&
            method.parameterTypes.size == 1 &&
            method.parameterTypes.single().toString().startsWith("Lkotlin/coroutines/")
    },
)

object AppsFlyerInitializerFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/initializers/appsflyer/AppsFlyerActionInitializer;",
    name = "init",
    returnType = "V",
    parameters = emptyList(),
)

object CrashReporterInitializerFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/initializers/sentry/CrashReporterInitializer;",
    name = "init",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

object SentryPostInitializerFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/initializers/sentry/SentryPostInitializer;",
    name = "init",
    returnType = "V",
    parameters = emptyList(),
)

object OzonLoggerInitializerFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/initializers/logger/OzonLoggerInitializer;",
    name = "init",
    returnType = "V",
    parameters = listOf("L"),
)

object OzonLoggerUploaderConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("https://xapi.ozon.ru/api/logs-shredder/log"),
)

object FintechGraylogWorkerFingerprint : Fingerprint(
    definingClass = "Lru/ozon/fintech/analytic/worker/GraylogSendWorker;",
    returnType = "Ljava/lang/Object;",
    custom = { method, _ ->
        method.implementation != null &&
            method.parameterTypes.size == 1 &&
            method.parameterTypes.single().toString().startsWith("Lkotlin/coroutines/")
    },
)

object FintechGraylogEnqueueFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
    strings = listOf("message"),
)

object VkIdAnalyticsAddTrackerFingerprint : Fingerprint(
    definingClass = "Lcom/vk/id/analytics/VKIDAnalytics\$Trackers;",
    name = "addTracker",
    returnType = "V",
    parameters = listOf("Lcom/vk/id/analytics/VKIDAnalytics\$Tracker;"),
)

object VkIdAnalyticsTrackEventFingerprint : Fingerprint(
    definingClass = "Lcom/vk/id/analytics/VKIDAnalytics\$Trackers;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "[Lcom/vk/id/analytics/VKIDAnalytics\$EventParam;",
    ),
)

object VkIdStatTrackerProviderFingerprint : Fingerprint(
    definingClass = "Lcom/vk/id/internal/di/VKIDDepsProd;",
    name = "getStatTracker",
    returnType = "Lcom/vk/id/analytics/VKIDAnalytics\$Tracker;",
    parameters = emptyList(),
)

object VkIdTrackingTrackerProviderFingerprint : Fingerprint(
    definingClass = "Lcom/vk/id/internal/di/VKIDDepsProd;",
    name = "getTrackingTracker",
    returnType = "Lcom/vk/id/analytics/VKIDAnalytics\$Tracker;",
    parameters = emptyList(),
)

object VkIdTrackingDepsConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/vk/id/tracking/tracer/TrackingDeps;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
    ),
)
