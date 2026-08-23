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
    strings = strings
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

internal val mainActivityOnNewIntentFingerprint = methodFingerprint(
    "Lru/vk/store/app/MainActivity;",
    "onNewIntent",
    "V",
    listOf("Landroid/content/Intent;")
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
    "Li81/u0;",
    "a",
    "Ljava/lang/Object;",
    listOf(
        "Ljava/util/List;",
        "Ld81/c;",
        "Ljava/util/List;",
        "La81/d;",
        "Ljava/util/Set;",
        "Ljava/util/UUID;",
        "Z",
        "Z",
        "Lau0/d;"
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
    "Lfb2/l;",
    "c",
    "Ljava/io/Serializable;",
    listOf("Lfb2/l;", "Ljava/lang/String;", "Lau0/d;")
)

internal val requestDeviceIdFingerprint = methodFingerprint(
    "Liq2/l;",
    "a",
    "Ljava/lang/String;",
    strings = listOf("android_id")
)

internal val altCraftSendFingerprint = methodFingerprint(
    "Lxo2/b;",
    "b",
    "V",
    listOf(
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Ljava/lang/String;",
        "Z",
        "Lro2/f;"
    )
)

internal val altCraftScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/altcraft/presentation/AltCraftFlushEventsWorker\$a;",
    "a",
    "V",
    listOf("Ltb/j0;", "J"),
    listOf("AltCraftFlushEventsWorker")
)

internal val altCraftWorkerFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/altcraft/presentation/AltCraftFlushEventsWorker;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lyt0/e;")
)

internal val radarScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/radar/presentation/RadarFlushSnapshotWorker\$a;",
    "a",
    "V",
    listOf("Ltb/j0;", "J"),
    listOf("RadarFlushSnapshotsWorker")
)

internal val radarWorkerFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/radar/presentation/RadarFlushSnapshotWorker;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lyt0/e;")
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

internal val kasperskyScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/feature/kaspersky/impl/presentation/KasperskyScannerWorker\$a;",
    "a",
    "Ljava/lang/Object;",
    listOf("Ltb/j0;", "Lau0/d;"),
    listOf("PeriodicKasperskyScanner")
)

internal val kasperskyWorkerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/kaspersky/impl/presentation/KasperskyScannerWorker;",
    "b",
    "Ljava/lang/Object;",
    listOf("Lyt0/e;")
)

internal val mineViewModelOpenGameCenterFingerprint = methodFingerprint(
    "Llo1/z8;",
    "C0",
    "V",
    strings = listOf("gameProfile.click")
)

internal val gameCenterV2ButtonFingerprint = methodFingerprint(
    "Ldh1/t0;",
    "d",
    "V",
    listOf(
        "Lkotlin/jvm/functions/Function0;",
        "Lk2/j;",
        "Ldh1/w;",
        "Landroidx/compose/runtime/a;",
        "I"
    ),
    listOf("GAME_CENTER_BUTTON_V2_KEY")
)

internal val gameCenterV1ButtonFingerprint = methodFingerprint(
    "Ldh1/u;",
    "e",
    "V",
    listOf(
        "Lkotlin/jvm/functions/Function0;",
        "Lk2/j;",
        "Ldh1/w;",
        "Landroidx/compose/runtime/a;",
        "I"
    ),
    listOf("GAME_CENTER_BUTTON_KEY")
)

internal val updateAuthSuggestFingerprint = methodFingerprint(
    "Laa1/e;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lau0/d;")
)

internal const val REPORT_APP_OPEN_REFERENCE =
    "Lio/appmetrica/analytics/AppMetrica;->reportAppOpen(Ljava/lang/String;)V"

internal val blockedCoroutineWorkerClasses = listOf(
    "Lcom/vk/push/pushsdk/work/CheckThatDeletedAppIsHostWorker;",
    "Lcom/vk/push/pushsdk/work/InitiateMasterElectionsWorker;",
    "Lcom/vk/push/pushsdk/work/multiprocess/MultiProcessWorker;",
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
    "Lru/vk/store/feature/storeapp/recommendation/start/trackingUrl/impl/data/PublisherTrackingWorker;",
    "Lru/vk/store/feature/storeapp/review/remote/impl/presentation/AddAppReviewWorker;",
    "Lru/vk/store/feature/usagestats/impl/presentation/UsageStatsCollectorWorker;"
)

internal val blockedBackgroundCoroutineWorkerFingerprints =
    blockedCoroutineWorkerClasses.map { definingClass ->
        Fingerprint(
            custom = { method, classDef ->
                classDef.type == definingClass &&
                    method.name == "b" &&
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

internal val omicronNetworkRequestFingerprint = methodFingerprint(
    "Lt31/b;",
    "a",
    "Lt31/e;",
    listOf("Lj31/d;", "Lt31/a;", "Ll31/d;")
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
    listOf("Lau0/d;")
)

internal val remoteAnalyticsInitializerFingerprint = methodFingerprint(
    "Ly32/d;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lau0/d;")
)

internal val remoteAnalyticsSchedulerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/storeapp/analytics/remote/impl/presentation/b;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lau0/d;")
)

internal val usageStatsInitializerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/usagestats/impl/presentation/a;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lau0/d;")
)

internal val cancelSubscriptionInitializerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/payments/subscription/update/impl/presentation/a;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lau0/d;")
)

internal val launcherIconScheduleFingerprint = methodFingerprint(
    "Lul1/i;",
    "a",
    "V"
)

internal val startDestinationScheduleFingerprint = methodFingerprint(
    "Lk32/e;",
    "a",
    "V",
    listOf("J", "Ldx0/c;")
)

internal val tabsOrderScheduleFingerprint = methodFingerprint(
    "Lq32/g;",
    "a",
    "V"
)

internal val publisherTrackingScheduleFingerprint = methodFingerprint(
    "Lmd2/e;",
    "a",
    "V",
    listOf("Ljava/lang/String;", "Ljava/lang/String;")
)

internal val analyticsDispatchFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lso2/e;" && method.name == "d" && method.returnType == "V"
    }
)

internal val analyticsUserIdFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lso2/e;" && method.name == "b" && method.returnType == "V"
    }
)

internal val pushProviderOnInitializedFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lmd0/f;" &&
            method.name == "invokeSuspend" &&
            method.returnType == "Ljava/lang/Object;"
    }
)

internal val pushAuthOnInitializedFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lkb0/l;" &&
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
            classDef.type == "Lgc0/a;" &&
                method.name == name &&
                method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) == parameters
        }
    )
}
