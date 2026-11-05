package dev.freeman022026.rustore.patches

import app.morphe.patcher.Fingerprint

internal fun methodFingerprint(
    definingClass: String,
    name: String,
    returnType: String,
    parameters: List<String> = emptyList(),
    strings: List<String> = emptyList()
) = Fingerprint(
    definingClass = definingClass,
    name = name,
    returnType = returnType,
    parameters = parameters,
    // An empty list would reject methods that contain no string constants at all.
    strings = strings.ifEmpty { null }
)

internal val appMetricaActivateFingerprint = Fingerprint(
    definingClass = "Lio/appmetrica/analytics/AppMetrica;",
    name = "activate",
    returnType = "V",
    custom = { method, _ -> method.implementation != null }
)

internal val myTrackerInitializeFingerprint = Fingerprint(
    definingClass = "Lcom/my/tracker/MyTracker;",
    name = "initTracker",
    returnType = "V",
    custom = { method, _ -> method.implementation != null }
)

private val settingClassFingerprint = Fingerprint(
    strings = listOf("Setting(settingId=", ", iconUrl=", ", value=")
)

private val agreementSettingClassFingerprint = Fingerprint(
    strings = listOf("AgreementSetting(id=", ", value=")
)

internal val settingConstructorFingerprint = Fingerprint(
    classFingerprint = settingClassFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "J",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z"
    )
)

internal val agreementSettingConstructorFingerprint = Fingerprint(
    classFingerprint = agreementSettingClassFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf("J", "Z")
)

internal val rawAdvertisementRepositoryGetFingerprint = methodFingerprint(
    "Lj91/u0;",
    "a",
    "Ljava/lang/Object;",
    listOf(
        "Ljava/util/List;",
        "Le91/c;",
        "Ljava/util/List;",
        "Lb91/d;",
        "Ljava/util/Set;",
        "Ljava/util/UUID;",
        "Z",
        "Z",
        "Lyu0/d;"
    )
)

private val advertisementIdsClassFingerprint = Fingerprint(
    strings = listOf("AdvertisementIds(gaid=", ", hoaid=", ", androidId=")
)

internal val advertisementIdsConstructorFingerprint = Fingerprint(
    classFingerprint = advertisementIdsClassFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = List(6) { "Ljava/lang/String;" }
)

internal val appVersionInfoListFingerprint = methodFingerprint(
    "Lwg2/p;",
    "c",
    "Ljava/io/Serializable;",
    listOf("Lwg2/p;", "Ljava/lang/String;", "Lyu0/d;")
)

internal val requestDeviceIdFingerprint = methodFingerprint(
    "Lty2/g;",
    "a",
    "Ljava/lang/String;",
    strings = listOf("android_id")
)

internal val altCraftSendFingerprint = methodFingerprint(
    "Lzw2/b;",
    "b",
    "V",
    listOf(
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Ljava/lang/String;",
        "Z",
        "Ltw2/h;"
    )
)

internal val altCraftScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/altcraft/presentation/AltCraftFlushEventsWorker\$a;",
    "a",
    "V",
    listOf("Lub/i0;", "J"),
    listOf("AltCraftFlushEventsWorker")
)

internal val altCraftWorkerFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/altcraft/presentation/AltCraftFlushEventsWorker;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lwu0/e;")
)

internal val radarScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/radar/presentation/RadarFlushSnapshotWorker\$a;",
    "a",
    "V",
    listOf("Lub/i0;", "J"),
    listOf("RadarFlushSnapshotsWorker")
)

internal val radarWorkerFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/radar/presentation/RadarFlushSnapshotWorker;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lwu0/e;")
)

private val kasperskyScannerDtoClassFingerprint = Fingerprint(
    strings = listOf("KasperskyScannerDto(isScanResultViewed=")
)

internal val kasperskyPeriodicEnabledFingerprint = Fingerprint(
    classFingerprint = kasperskyScannerDtoClassFingerprint,
    name = "isPeriodicScanEnabled",
    returnType = "Z",
    parameters = emptyList()
)

internal val kasperskyWorkerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/kaspersky/impl/presentation/KasperskyScannerWorker;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lwu0/e;")
)

internal val mineViewModelOpenGameCenterFingerprint = methodFingerprint(
    "Lyq1/b5;",
    "K0",
    "V",
    strings = listOf("gameProfile.click")
)

internal val gameCenterV2ButtonFingerprint = methodFingerprint(
    "Lbj1/j;",
    "d",
    "V",
    listOf(
        "Lkotlin/jvm/functions/Function0;",
        "Lk2/j;",
        "Lbj1/m;",
        "Landroidx/compose/runtime/a;",
        "I"
    ),
    listOf("GAME_CENTER_BUTTON_V2_KEY")
)

internal val updateAuthSuggestFingerprint = methodFingerprint(
    "Leb1/g;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lyu0/d;")
)

internal val metricsEventCollectionFingerprint = methodFingerprint(
    "Lz51/p0;", "invoke", "Ljava/lang/Object;",
    strings = listOf("metrics_event_table", "job_config_version")
)

internal val metricsEventSendFingerprint = methodFingerprint(
    "Lz51/w0;", "a", "V", listOf("Ljava/util/List;"),
    listOf("X-Metrics-Request-Time")
)

internal val mediaScopeTrackFingerprint = methodFingerprint(
    "Lip1/d;", "a", "Ljava/lang/Object;", listOf("Lyu0/d;"),
    listOf("mediaScopeCustomLaunch")
)

internal val inAppStoryInitializeFingerprint = methodFingerprint(
    "Lnt2/j;", "b", "Ljava/lang/Object;", listOf("Lyu0/d;"),
    listOf("story.initilized", "story_user_id")
)

internal val networkPolicyLoadFingerprint = methodFingerprint(
    "Lzp0/k;",
    "a",
    "Ljava/lang/String;",
    listOf("Landroid/content/Context;"),
    strings = listOf("[Network Policy]: load remote config")
)

internal val networkPolicyConstructorFingerprint = methodFingerprint(
    "Lzp0/l;",
    "<init>",
    "V",
    listOf("Landroid/content/Context;", "Lzp0/c;", "Z"),
    strings = listOf("superappkit_network_policy", "payload", "api_endpoint")
)

internal val applicationOnCreateFingerprint = methodFingerprint(
    "Lru/vk/store/App;", "onCreate", "V",
    strings = listOf("App process started: version=")
)

internal val googleAdvertisingIdFingerprint = methodFingerprint(
    "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;",
    "getAdvertisingIdInfo",
    "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
    listOf("Landroid/content/Context;"),
    listOf("Creating AdvertisingIdClient")
)

internal val rustoreSdkDeviceIdFingerprint = methodFingerprint(
    "Lb61/r1;",
    "a",
    "Ljava/lang/String;",
    strings = listOf("android_id", "value")
)

internal val vkSdkDeviceIdFingerprint = methodFingerprint(
    "Ly20/b;",
    "a",
    "Ljava/lang/String;",
    listOf("Landroid/content/Context;"),
    listOf("__vk_device_id__", "next_device_id is null or empty: ")
)

internal val autoUpdateForegroundRestrictionFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lwl1/l;" &&
            method.name == "b" &&
            method.returnType == "Z" &&
            method.parameterTypes.map(CharSequence::toString) == listOf("Lvl1/c;")
    }
)

internal val blockedCoroutineWorkerClasses = listOf(
    "Lcom/vk/push/pushsdk/work/CheckThatDeletedAppIsHostWorker;",
    "Lcom/vk/push/pushsdk/work/InitiateMasterElectionsWorker;",
    "Lcom/vk/push/pushsdk/work/NotifyOldMasterWorker;",
    "Lcom/vk/push/pushsdk/work/OneTimePushReceiveWorker;",
    "Lcom/vk/push/pushsdk/work/scheduler/DeleteTokensFromServerWorker;",
    "Lcom/vk/push/pushsdk/work/StopDeliverToRemovedAppWorker;",
    "Lcom/vk/push/pushsdk/work/StopDeliverToUninstalledWork;",
    "Lcom/vk/push/pushsdk/work/TokensHealthCheckWorker;",
    "Lru/mail/omicron/MultiAccountWorkManagerExecutor\$MultiAccountOmicronSyncWorker;",
    "Lru/rustore/sdk/pushclient/internal/work/ArbiterUpdateFallbackWorker;",
    "Lru/rustore/sdk/pushclient/internal/work/DeletePushTokenIfNoHostsWorker;",
    "Lru/vk/store/feature/connect/session/impl/presentation/ConnectDownloadWorker;",
    "Lru/vk/store/feature/install/identifier/impl/presentation/InstallIdentifierSyncWorker;",
    "Lru/vk/store/feature/launchericon/impl/presentation/LauncherIconUpdateWorker;",
    "Lru/vk/store/feature/payments/subscription/update/impl/presentation/CancelSubscriptionSyncWorker;",
    "Lru/vk/store/feature/showcase/startDestination/impl/presentation/UpdateStartDestinationWorker;",
    "Lru/vk/store/feature/showcase/tabsOrder/impl/presentation/ShowcaseTabsOrderUpdateWorker;",
    "Lru/vk/store/feature/storeapp/analytics/remote/impl/presentation/SendAnalyticsEventWorker;",
    "Lru/vk/store/feature/storeapp/install/notice/impl/presentation/InstallNotificationReminderWorker;",
    "Lru/vk/store/feature/storeapp/recommendation/start/trackingUrl/impl/data/PublisherTrackingWorker;",
    "Lru/vk/store/feature/storeapp/review/remote/impl/presentation/AddAppReviewWorker;",
    "Lru/vk/store/feature/usagestats/impl/presentation/UsageStatsCollectorWorker;"
)

internal val blockedBackgroundCoroutineWorkerFingerprints =
    blockedCoroutineWorkerClasses.map { definingClass ->
        Fingerprint(
            custom = { method, classDef ->
                classDef.type == definingClass &&
                    method.name == (if (definingClass.startsWith("Lcom/vk/push/pushsdk/work/")) "c" else "b") &&
                    method.returnType == "Ljava/lang/Object;"
            }
        )
    }

internal val blockedWorkerClasses = listOf(
    "Lru/mail/omicron/DefaultWorkManagerExecutor\$PeriodicWorker;",
    "Lru/ok/tracer/disk/usage/DiskUsageWorker;",
    "Lru/ok/tracer/heap/dumps/exceptions/ShrinkDumpWorker;",
    "Lru/ok/tracer/upload/SampleUploadWorker;"
)

internal val blockedBackgroundWorkerFingerprints = blockedWorkerClasses.map { definingClass ->
    Fingerprint(
        custom = { method, classDef ->
            classDef.type == definingClass &&
                method.name == "doWork" &&
                method.returnType == "Landroidx/work/c\$a;"
        }
    )
}

internal val tracerDiskUsageInitializerFingerprint = methodFingerprint(
    "Lru/ok/tracer/disk/usage/DiskUsage;",
    "initialize\$tracer_disk_usage_release",
    "V",
    listOf("Landroid/content/Context;")
)

internal val tracerSampleUploadFingerprint = methodFingerprint(
    "Lru/ok/tracer/upload/SampleUploader;",
    "upload",
    "V",
    listOf(
        "Landroid/content/Context;",
        "Lru/ok/tracer/TracerFeature;",
        "Ljava/io/File;",
        "J",
        "Ljava/lang/String;",
        "Z",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/Long;",
        "Ljava/lang/Long;",
        "Ljava/util/Map;",
        "Lru/ok/tracer/opentelemetry/util/TraceParent;"
    )
)

internal val omicronNetworkRequestFingerprint = methodFingerprint(
    "Lt41/b;",
    "b",
    "Lt41/e;",
    listOf("Lj41/c;", "Lt41/a;", "Ll41/d;")
)

internal val omicronDefaultScheduleFingerprint = methodFingerprint(
    "Lru/mail/omicron/DefaultWorkManagerExecutor;",
    "b",
    "V",
    listOf("J", "Z")
)

internal val omicronMultiAccountScheduleFingerprint = methodFingerprint(
    "Lru/mail/omicron/MultiAccountWorkManagerExecutor;",
    "a",
    "V",
    listOf("J", "J", "Z")
)

internal val installIdentifierInitializerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/install/identifier/impl/presentation/a;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lyu0/d;")
)

internal val remoteAnalyticsSchedulerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/storeapp/analytics/remote/impl/presentation/b;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lyu0/d;"),
    listOf("SendAnalyticsEventWorker")
)

internal val remoteAnalyticsPeriodicSchedulerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/storeapp/analytics/remote/impl/presentation/b;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lyu0/d;"),
    listOf("SendAnalyticsEventPeriodicWorker")
)

internal val usageStatsInitializerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/usagestats/impl/presentation/a;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lyu0/d;")
)

internal val cancelSubscriptionInitializerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/payments/subscription/update/impl/presentation/a;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lyu0/d;")
)

internal val launcherIconScheduleFingerprint = methodFingerprint(
    "Lyn1/k;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lyu0/d;"),
    listOf("LauncherIconUpdate")
)

internal val startDestinationScheduleFingerprint = methodFingerprint(
    "Lj82/f;",
    "a",
    "Ljava/lang/Object;",
    listOf("J", "Lby0/c;", "Lyu0/d;"),
    listOf("PeriodicUpdateStartDestination")
)

internal val tabsOrderScheduleFingerprint = methodFingerprint(
    "Lp82/i;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lyu0/d;"),
    listOf("NavigationTabsOrderUpdate")
)

internal val publisherTrackingScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/feature/storeapp/recommendation/start/trackingUrl/impl/data/a;",
    "b",
    "Ljava/lang/Object;",
    listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lyu0/d;"),
    listOf("TRACKING_URL", "PACKAGE_NAME_KEY")
)

/** Unique WorkManager names cancelled once per process start after dependency injection. */
internal val cancelledUniqueWorkNames = listOf(
    "InstallIdentifierSyncWorker",
    "tracer.disk.usage.worker",
    "UsageStatsCollectorWorker",
    "CancelSubscriptionSyncWorker",
    "SendAnalyticsEventPeriodicWorker",
    "SendAnalyticsEventWorker",
    "LauncherIconUpdate",
    "PeriodicUpdateStartDestination",
    "NavigationTabsOrderUpdate"
)

internal const val WORK_MANAGER_GET_INSTANCE =
    "Lvb/u0;->l(Landroid/content/Context;)Lvb/u0;"

internal const val WORK_MANAGER_CANCEL_UNIQUE =
    "Lub/i0;->a(Ljava/lang/String;)Lub/z;"

internal const val APPLICATION_SUPER_ON_CREATE = "Lz71/n;->onCreate()V"

/** JobScheduler job used by the VK Push metrics sender. */
internal const val PUSH_METRICS_JOB_ID = 88517301

internal val analyticsDispatchFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Luw2/d;" && method.name == "d" && method.returnType == "V"
    }
)

internal val analyticsUserIdFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Luw2/d;" && method.name == "b" && method.returnType == "V"
    }
)

internal val pushProviderOnInitializedFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lzd0/e;" &&
            method.name == "invokeSuspend" &&
            method.returnType == "Ljava/lang/Object;"
    }
)

internal val pushAuthOnInitializedFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lib0/k;" &&
            method.name == "invokeSuspend" &&
            method.returnType == "Ljava/lang/Object;"
    }
)

internal val pushLifecycleMethods = mapOf(
    "onActivityCreated" to listOf("Landroid/app/Activity;", "Landroid/os/Bundle;"),
    "onActivityDestroyed" to listOf("Landroid/app/Activity;"),
    "onActivityPaused" to listOf("Landroid/app/Activity;"),
    "onActivityResumed" to listOf("Landroid/app/Activity;"),
    "onActivitySaveInstanceState" to listOf("Landroid/app/Activity;", "Landroid/os/Bundle;"),
    "onActivityStarted" to listOf("Landroid/app/Activity;"),
    "onActivityStopped" to listOf("Landroid/app/Activity;")
)

internal val pushLifecycleFingerprints = pushLifecycleMethods.map { (name, parameters) ->
    Fingerprint(
        custom = { method, classDef ->
            classDef.type == "Lfc0/a;" &&
                method.name == name &&
                method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) == parameters
        }
    )
}

internal val altCraftFrequentScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/altcraft/presentation/AltCraftFlushEventsWorker\$a;",
    "b",
    "V",
    listOf("Lub/i0;"),
    listOf("AltCraftFlushEventsWorker")
)

// VK Push SDK analytics: every host, auth-host and client sender inherits this final method.
internal val pushMetricsEventFingerprint = methodFingerprint(
    "Lyb0/g;",
    "a",
    "V",
    listOf("Lsb0/c;")
)

internal val pushMetricsBatchSendFingerprint = methodFingerprint(
    "Lyc0/b;",
    "a",
    "V",
    listOf("Ljava/util/List;")
)

internal val reviewPromptPlacementsFingerprint = methodFingerprint(
    "Lru/vk/store/feature/storeapp/review/prompt/impl/domain/ReviewPromptRemoteConfig;",
    "placements",
    "Ljava/lang/Object;",
    listOf("Lwu0/e;"),
    listOf("featureReviewPromptPlacements")
)

internal val promoTrackingUrlFingerprint = methodFingerprint(
    "Lw12/i;",
    "a",
    "Ljava/lang/Object;",
    listOf("Ljava/lang/String;", "Lyu0/d;")
)

internal val directAutoInstallEnabledFingerprint = methodFingerprint(
    "Lru/vk/store/feature/storeapp/details/direct/impl/domain/StoreAppDetailsDirectRemoteConfig;",
    "isAutoInstallEnabled",
    "Ljava/lang/Object;",
    listOf("Lwu0/e;"),
    listOf("featureStoreAppDetailsDirectAutoInstallEnabled")
)

internal val remoteTvInstallEnabledFingerprint = methodFingerprint(
    "Lru/vk/store/feature/rustore/tv/install/impl/domain/RemoteTvInstallConfig;",
    "featureEnabled",
    "Ljava/lang/Object;",
    listOf("Lwu0/e;"),
    listOf("featureRustoreTvInstallEnabled")
)

internal val remoteTvInstallDiscoveryFingerprint = methodFingerprint(
    "Lh52/j;",
    "P7",
    "V"
)
