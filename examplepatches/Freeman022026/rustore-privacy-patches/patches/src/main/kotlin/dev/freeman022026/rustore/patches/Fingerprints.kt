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
    "Lu41/l0;",
    "a",
    "Ljava/lang/Object;",
    listOf(
        "Ljava/util/List;",
        "Lp41/c;",
        "Ljava/util/List;",
        "Lm41/c;",
        "Ljava/util/Set;",
        "Ljava/util/UUID;",
        "Z",
        "Z",
        "Lnq0/c;"
    )
)

internal val altCraftSendFingerprint = methodFingerprint(
    "Lek2/b;",
    "b",
    "V",
    listOf(
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Ljava/lang/String;",
        "Z",
        "Lyj2/f;"
    )
)

internal val altCraftScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/altcraft/presentation/AltCraftFlushEventsWorker\$a;",
    "a",
    "V",
    listOf("Lmb/k0;", "J"),
    listOf("AltCraftFlushEventsWorker")
)

internal val altCraftWorkerFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/altcraft/presentation/AltCraftFlushEventsWorker;",
    "b",
    "Ljava/lang/Object;",
    listOf("Llq0/e;")
)

internal val radarScheduleFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/radar/presentation/RadarFlushSnapshotWorker\$a;",
    "a",
    "V",
    listOf("Lmb/k0;", "J"),
    listOf("RadarFlushSnapshotsWorker")
)

internal val radarWorkerFingerprint = methodFingerprint(
    "Lru/vk/store/lib/analytics/system/radar/presentation/RadarFlushSnapshotWorker;",
    "b",
    "Ljava/lang/Object;",
    listOf("Llq0/e;")
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
    listOf("Lmb/k0;", "Lnq0/c;"),
    listOf("PeriodicKasperskyScanner")
)

internal val kasperskyWorkerFingerprint = methodFingerprint(
    "Lru/vk/store/feature/kaspersky/impl/presentation/KasperskyScannerWorker;",
    "b",
    "Ljava/lang/Object;",
    listOf("Llq0/e;")
)

internal val mineViewModelOpenGameCenterFingerprint = methodFingerprint(
    "Ltj1/j8;",
    "v0",
    "V",
    strings = listOf("gameProfile.click")
)

internal val gameCenterV2ButtonFingerprint = methodFingerprint(
    "Ltc1/r0;",
    "d",
    "V",
    listOf(
        "Lkotlin/jvm/functions/Function0;",
        "Lh2/j;",
        "Ltc1/w;",
        "Landroidx/compose/runtime/a;",
        "I"
    ),
    listOf("GAME_CENTER_BUTTON_V2_KEY")
)

internal val gameCenterV1ButtonFingerprint = methodFingerprint(
    "Ltc1/u;",
    "e",
    "V",
    listOf(
        "Lkotlin/jvm/functions/Function0;",
        "Lh2/j;",
        "Ltc1/w;",
        "Landroidx/compose/runtime/a;",
        "I"
    ),
    listOf("GAME_CENTER_BUTTON_KEY")
)

internal val updateAuthSuggestFingerprint = methodFingerprint(
    "Lm61/e;",
    "a",
    "Ljava/lang/Object;",
    listOf("Lnq0/c;")
)

internal const val REPORT_APP_OPEN_REFERENCE =
    "Lio/appmetrica/analytics/AppMetrica;->reportAppOpen(Ljava/lang/String;)V"
