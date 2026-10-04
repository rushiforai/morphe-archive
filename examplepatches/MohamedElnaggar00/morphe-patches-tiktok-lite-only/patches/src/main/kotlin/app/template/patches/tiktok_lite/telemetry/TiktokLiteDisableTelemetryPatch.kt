package app.template.patches.tiktok_lite.telemetry

/*
 * Disables TikTok Lite analytics for the 47.0.3 compatibility target.
 *
 * The supplied 47.0.3 APK uses MiniLiteApplogServiceImpl for the analytics
 * wrapper. The older LiteApplogServiceImpl/network/startup fingerprints
 * are intentionally not invoked here because their classes are not present
 * under the expected names in 47.0.3.
 */

import app.template.patches.shared.Constants.TIKTOK_LITE_COMPATIBILITY
import app.template.patches.shared.returnEarly
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val tiktokLiteDisableTelemetryPatch = bytecodePatch(
    name = "Disable Telemetry",
    description = "Disables ByteDance analytics by blocking the MiniLiteApplogServiceImpl wrapper.",
    default = true,
) {
    compatibleWith(TIKTOK_LITE_COMPATIBILITY)

    execute {
        ApplogOnEventFingerprint.method.returnEarly()
        ApplogInitStatisticLoggerFingerprint.method.returnEarly()
        ApplogStatisticLoggerInitFingerprint.method.returnEarly()
        ApplogReportPendingFingerprint.method.returnEarly()
        ApplogConfigFingerprint.method.returnEarly()
        ApplogBeforeInitFingerprint.method.returnEarly()
    }
}
