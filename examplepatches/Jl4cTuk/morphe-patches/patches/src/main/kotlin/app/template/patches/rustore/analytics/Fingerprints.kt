package app.template.patches.rustore.analytics

import app.morphe.patcher.Fingerprint

/**
 * Matches `AltCraftAnalyticsImpl.send(String, Map, String, boolean, li2.f)`,
 * the central entry point used for AltCraft events.
 */
object AltCraftSendFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Ljava/lang/String;",
        "Z",
        "L",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "AltCraftAnalyticsImpl.kt" &&
            method.implementation != null
    },
)

/** Matches the coroutine implementation of `RadarFlushSnapshotWorker.doWork()`. */
object RadarDoWorkFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/lib/analytics/system/radar/presentation/RadarFlushSnapshotWorker;",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, _ ->
        method.implementation != null
    },
)
