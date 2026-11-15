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
    "Lj91/v0;",
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
        "Ljava/lang/Boolean;",
        "Lxu0/c;"
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
    "Lbh2/q;",
    "c",
    "Ljava/io/Serializable;",
    listOf("Lbh2/q;", "Ljava/lang/String;", "Lxu0/c;")
)

internal val requestDeviceIdFingerprint = methodFingerprint(
    "Lfz2/o;",
    "a",
    "Ljava/lang/String;",
    strings = listOf("android_id")
)

internal val altCraftSendFingerprint = methodFingerprint(
    "Llx2/a;",
    "b",
    "V",
    listOf(
        "Z",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/util/Map;"
    )
)

internal val altCraftScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/altcraft/presentation/AltCraftFlushEventsWorker\$a;",
    "a",
    "V",
    listOf("Ltb/k0;", "J"),
    listOf("AltCraftFlushEventsWorker")
)

internal val altCraftWorkerFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/altcraft/presentation/AltCraftFlushEventsWorker;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lvu0/e;")
)

internal val radarScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/radar/presentation/RadarFlushSnapshotWorker\$a;",
    "a",
    "V",
    listOf("Ltb/k0;", "J"),
    listOf("RadarFlushSnapshotsWorker")
)

internal val radarWorkerFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/radar/presentation/RadarFlushSnapshotWorker;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lvu0/e;")
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
    listOf("Lvu0/e;")
)

internal val mineViewModelOpenGameCenterFingerprint = methodFingerprint(
    "Lar1/a6;",
    "Z0",
    "V",
    strings = listOf("gameProfile.click")
)

internal val gameCenterV2ButtonFingerprint = methodFingerprint(
    "Lui1/k;",
    "d",
    "V",
    listOf(
        "Lkotlin/jvm/functions/Function0;",
        "Lk2/j;",
        "Lui1/n;",
        "Landroidx/compose/runtime/a;",
        "I"
    ),
    listOf("GAME_CENTER_BUTTON_V2_KEY")
)

internal val updateAuthSuggestFingerprint = methodFingerprint(
    "Leb1/g;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lxu0/c;")
)

internal val metricsEventCollectionFingerprint = methodFingerprint(
    "Ly51/z0;", "invoke", "Ljava/lang/Object;",
    strings = listOf("metrics_event_table", "job_config_version")
)

internal val metricsEventSendFingerprint = methodFingerprint(
    "Ly51/g1;", "a", "V", listOf("Ljava/util/List;"),
    listOf("X-Metrics-Request-Time")
)

internal val mediaScopeTrackFingerprint = methodFingerprint(
    "Lfp1/d;", "a", "Ljava/lang/Object;", listOf("Lxu0/c;"),
    listOf("mediaScopeCustomLaunch")
)

internal val inAppStoryInitializeFingerprint = methodFingerprint(
    "Lzt2/j;", "b", "Ljava/lang/Object;", listOf("Lxu0/c;"),
    listOf("story.initilized", "story_user_id")
)

internal val networkPolicyLoadFingerprint = methodFingerprint(
    "Lyp0/j;",
    "a",
    "Ljava/lang/String;",
    listOf("Landroid/content/Context;"),
    strings = listOf("[Network Policy]: load remote config")
)

internal val networkPolicyConstructorFingerprint = methodFingerprint(
    "Lyp0/l;",
    "<init>",
    "V",
    listOf("Landroid/content/Context;", "Lyp0/c;", "Z"),
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
    "La61/r1;",
    "a",
    "Ljava/lang/String;",
    strings = listOf("android_id", "value")
)

internal val vkSdkDeviceIdFingerprint = methodFingerprint(
    "Lx20/c;",
    "a",
    "Ljava/lang/String;",
    listOf("Landroid/content/Context;"),
    listOf("__vk_device_id__", "next_device_id is null or empty: ")
)

internal val autoUpdateForegroundRestrictionFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lru/vk/store/feature/installedapp/update/mobile/impl/presentation/l;" &&
            method.name == "b" &&
            method.returnType == "Z" &&
            method.parameterTypes.map(CharSequence::toString) == listOf("Lrl1/c;")
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
    "Ls41/b;",
    "b",
    "Ls41/e;",
    listOf("Li41/d;", "Ls41/a;", "Lk41/c;")
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
    "Lru/vk/store/feature/install/identifier/impl/presentation/b;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lxu0/c;")
)

internal val remoteAnalyticsSchedulerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/storeapp/analytics/remote/impl/presentation/b;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lxu0/c;"),
    listOf("SendAnalyticsEventWorker")
)

internal val remoteAnalyticsPeriodicSchedulerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/storeapp/analytics/remote/impl/presentation/b;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lxu0/c;"),
    listOf("SendAnalyticsEventPeriodicWorker")
)

internal val usageStatsInitializerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/usagestats/impl/presentation/a;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lxu0/c;")
)

internal val cancelSubscriptionInitializerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/payments/subscription/update/impl/presentation/a;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lxu0/c;")
)

internal val launcherIconScheduleFingerprint = methodFingerprint(
    "Lvn1/k;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lxu0/c;"),
    listOf("LauncherIconUpdate")
)

internal val startDestinationScheduleFingerprint = methodFingerprint(
    "Ls82/f;",
    "a",
    "Ljava/lang/Object;",
    listOf("J", "Lay0/c;", "Lxu0/c;"),
    listOf("PeriodicUpdateStartDestination")
)

internal val tabsOrderScheduleFingerprint = methodFingerprint(
    "Ly82/i;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lxu0/c;"),
    listOf("NavigationTabsOrderUpdate")
)

internal val publisherTrackingScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/feature/storeapp/recommendation/start/trackingUrl/impl/data/a;",
    "b",
    "Ljava/lang/Object;",
    listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lxu0/c;"),
    listOf("TRACKING_URL", "PACKAGE_NAME_KEY")
)

/** Unique WorkManager names cancelled once per process start after dependency injection. */
internal val cancelledUniqueWorkNames = listOf(
    "InstallIdentifierSyncWorker",
    "InstallIdentifierSyncWorkerImmediate",
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
    "Lub/r0;->l(Landroid/content/Context;)Lub/r0;"

internal const val WORK_MANAGER_CANCEL_UNIQUE =
    "Ltb/k0;->a(Ljava/lang/String;)Ltb/b0;"

internal const val APPLICATION_SUPER_ON_CREATE = "Ly71/m;->onCreate()V"

/** JobScheduler job used by the VK Push metrics sender. */
internal const val PUSH_METRICS_JOB_ID = 88517301

internal val analyticsDispatchFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lgx2/e;" && method.name == "d" && method.returnType == "V"
    }
)

internal val analyticsUserIdFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lgx2/e;" && method.name == "b" && method.returnType == "V"
    }
)

internal val pushProviderOnInitializedFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lyd0/f;" &&
            method.name == "invokeSuspend" &&
            method.returnType == "Ljava/lang/Object;"
    }
)

internal val pushAuthOnInitializedFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lhb0/k;" &&
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
            classDef.type == "Lec0/a;" &&
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
    listOf("Ltb/k0;"),
    listOf("AltCraftFlushEventsWorker")
)

// VK Push SDK analytics: every host, auth-host and client sender inherits this final method.
internal val pushMetricsEventFingerprint = methodFingerprint(
    "Lxb0/h;",
    "a",
    "V",
    listOf("Lrb0/c;")
)

internal val pushMetricsBatchSendFingerprint = methodFingerprint(
    "Lxc0/b;",
    "a",
    "V",
    listOf("Ljava/util/List;")
)

internal val reviewPromptPlacementsFingerprint = methodFingerprint(
    "Lru/vk/store/feature/storeapp/review/prompt/impl/domain/ReviewPromptRemoteConfig;",
    "placements",
    "Ljava/lang/Object;",
    listOf("Lvu0/e;"),
    listOf("featureReviewPromptPlacements")
)

internal val promoTrackingUrlFingerprint = methodFingerprint(
    "Lh22/j;",
    "a",
    "Ljava/lang/Object;",
    listOf("Ljava/lang/String;", "Lxu0/c;")
)

internal val directAutoInstallEnabledFingerprint = methodFingerprint(
    "Lru/vk/store/feature/storeapp/details/direct/impl/domain/StoreAppDetailsDirectRemoteConfig;",
    "isAutoInstallEnabled",
    "Ljava/lang/Object;",
    listOf("Lvu0/e;"),
    listOf("featureStoreAppDetailsDirectAutoInstallEnabled")
)

internal val remoteTvInstallEnabledFingerprint = methodFingerprint(
    "Lru/vk/store/feature/rustore/tv/install/api/RemoteTvInstallRemoteConfig;",
    "featureEnabled",
    "Ljava/lang/Object;",
    listOf("Lvu0/e;"),
    listOf("featureRustoreTvInstallEnabled")
)

internal val remoteTvInstallDiscoveryFingerprint = methodFingerprint(
    "Lq52/o;",
    "U8",
    "V"
)

/** Post-view ad request that loads the ad config and ads, sending the installed-app list and device IDs. */
internal val postViewAdActionFingerprint = methodFingerprint(
    "Lv91/f;",
    "a",
    "Ljava/io/Serializable;",
    listOf("Ljava/lang/String;", "Ljava/util/UUID;", "Lxu0/c;")
)

/** The VKR variant of the post-view ad request. */
internal val postViewAdActionVkrFingerprint = methodFingerprint(
    "Lv91/m;",
    "a",
    "Ljava/io/Serializable;",
    listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/UUID;", "Lxu0/c;")
)

internal val adTunnelStateSendingEnabledFingerprint = methodFingerprint(
    "Lru/vk/store/feature/advertisement/api/domain/AdvertisementRemoteConfig;",
    "isTunnelStateSendingEnabled",
    "Ljava/lang/Object;",
    listOf("Lvu0/e;"),
    listOf("featureAdvertisementTunnelStateSendingEnabled")
)

internal val webGameEnabledFingerprint = methodFingerprint(
    "Lru/vk/store/feature/games/webgame/api/domain/WebGameRemoteConfig;",
    "isEnabled",
    "Ljava/lang/Object;",
    listOf("Lvu0/e;"),
    listOf("featureWebGameEnabled")
)

internal val webGameBannerEnabledFingerprint = methodFingerprint(
    "Lru/vk/store/feature/games/webgame/api/domain/WebGameRemoteConfig;",
    "isWebGameBannerEnabled",
    "Ljava/lang/Object;",
    listOf("Lvu0/e;"),
    listOf("featureMineWebGameBannerEnabled")
)

/** The only caller of the `v1/showcase/games/user/installed-apps` upload. */
internal val webGameInstalledAppsSenderFingerprint = methodFingerprint(
    "Ldj1/f;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lxu0/c;")
)
