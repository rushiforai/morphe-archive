package app.template.patches.tiktok_lite.telemetry

import app.morphe.patcher.Fingerprint

private const val LITE_APPLOG = "LMiniLiteApplogServiceImpl;"
private const val NET_CLIENT = "LAppLogNetworkClient;"

// TikTok Lite 46.8.3 keeps these method names stable, but the exact parameter
// descriptors are fragile across the APK's R8/language bridge. Each target
// class contains a single method for these names, so class + name is sufficient.
internal object ApplogOnEventFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "onEvent",
)

internal object ApplogInitStatisticLoggerFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "initStatisticLogger",
)

internal object ApplogStatisticLoggerInitFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "statisticLoggerInit",
)

internal object ApplogReportPendingFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "reportPending",
)

internal object ApplogConfigFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "config",
)

internal object ApplogBeforeInitFingerprint : Fingerprint(
    definingClass = LITE_APPLOG,
    name = "beforeInit",
)

internal object NetClientSendBatchFingerprint : Fingerprint(
    definingClass = NET_CLIENT,
    name = "LB",
)

internal object NetClientSendListFingerprint : Fingerprint(
    definingClass = NET_CLIENT,
    name = "LC",
)

internal object NetClientSendBytesRawFingerprint : Fingerprint(
    definingClass = NET_CLIENT,
    name = "LCCII",
)

internal object NetClientSendBytesFingerprint : Fingerprint(
    definingClass = NET_CLIENT,
    name = "LCI",
)
