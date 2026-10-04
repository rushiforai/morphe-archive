package app.template.patches.tiktok_lite.telemetry

/*
 * TikTok Lite 47.0.3 telemetry targets.
 *
 * Verified against the supplied TikTok Lite 47.0.3 APK:
 * the analytics wrapper is MiniLiteApplogServiceImpl, not
 * LiteApplogServiceImpl used by the previous compatibility target.
 *
 * The 47.0.3 APK also does not expose the previous AppLogNetworkClient
 * and startup-task classes under the same names, so this revision
 * intentionally limits the patch to the wrapper methods confirmed
 * present in 47.0.3 rather than keeping fingerprints that would fail.
 */

import app.morphe.patcher.Fingerprint

private const val LITE_APPLOG = "LMiniLiteApplogServiceImpl;"

internal object ApplogOnEventFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "onEvent",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/Long;",
        "Ljava/lang/Long;",
        "Ljava/lang/Boolean;",
        "Lorg/json/JSONObject;",
    ),
)

internal object ApplogInitStatisticLoggerFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "initStatisticLogger",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

internal object ApplogStatisticLoggerInitFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "statisticLoggerInit",
    returnType = "V",
    parameters = emptyList(),
)

internal object ApplogReportPendingFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "reportPending",
    returnType = "V",
    parameters = emptyList(),
)

internal object ApplogConfigFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "config",
    returnType = "V",
    parameters = emptyList(),
)

internal object ApplogBeforeInitFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "beforeInit",
    returnType = "V",
    parameters = emptyList(),
)
