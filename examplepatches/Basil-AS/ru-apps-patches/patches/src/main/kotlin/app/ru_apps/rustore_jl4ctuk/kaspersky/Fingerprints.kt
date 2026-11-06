// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/kaspersky/Fingerprints.kt.
package app.ru_apps.rustore_jl4ctuk.kaspersky

import app.morphe.patcher.Fingerprint

/**
 * Matches `KasperskyScannerDto.isPeriodicScanEnabled()`, the persisted flag
 * used by the initializer and security settings to control automatic scans.
 */
object KasperskyScannerDtoIsPeriodicScanEnabledFingerprint : Fingerprint(
    definingClass = "Lru/vk/store/feature/kaspersky/impl/data/KasperskyScannerDto;",
    name = "isPeriodicScanEnabled",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Matches the app-initializer coroutine step that schedules the daily
 * `PeriodicKasperskyScanner` task.
 *
 * `KasperskyScannerWorker.Companion.enqueuePeriodic()` no longer exists - a
 * live decompile (2026-10) confirmed its companion object (`KasperskyScannerWorker$a`)
 * is now empty, and scheduling moved into a generated `AppInitializers.kt`
 * coroutine continuation that resolves a scheduler instance and calls
 * `scheduler.a("PeriodicKasperskyScanner")` - the same in-process
 * coroutine-scheduler architecture migration already seen for AltCraft, Radar,
 * install-identifier sync, remote analytics, and usage-stats collection (see
 * analytics/DisableAnalyticsPatch.kt). The generated class name/numeric suffix
 * (`AppInitializers$initOnIoThreads$N`) shifts whenever initializers are
 * reordered, so match on the source file plus the literal task-name string
 * instead, which is more stable.
 */
object KasperskyScannerWorkerEnqueuePeriodicFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    strings = listOf("PeriodicKasperskyScanner"),
    custom = { _, classDef -> classDef.sourceFile == "AppInitializers.kt" },
)

/** Matches the coroutine implementation of the already-enqueued Kaspersky scan worker. */
object KasperskyScannerWorkerDoWorkFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/kaspersky/impl/presentation/KasperskyScannerWorker;",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, _ -> method.implementation != null },
)

/** Matches Kaspersky SDK's process-level background service startup. */
object KasperskySdkStartFingerprint : Fingerprint(
    definingClass = "Lcom/kavsdk/SdkService;",
    name = "start",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/** Matches Kaspersky SDK's JobScheduler execution entry point. */
object KasperskyJobStartFingerprint : Fingerprint(
    definingClass = "Lcom/kavsdk/JobSchedulerService;",
    name = "onStartJob",
    returnType = "Z",
    parameters = listOf("Landroid/app/job/JobParameters;"),
)

/** Matches Kaspersky SDK's boot and explicit-start receiver. */
object KasperskyStartReceiverFingerprint : Fingerprint(
    definingClass = "Lcom/kavsdk/StartReceiver;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/content/Intent;",
    ),
)

/** Matches Kaspersky SDK's recurring alarm receiver. */
object KasperskyAlarmReceiverFingerprint : Fingerprint(
    definingClass = "Lcom/kavsdk/AlarmReceiver;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/content/Intent;",
    ),
)
