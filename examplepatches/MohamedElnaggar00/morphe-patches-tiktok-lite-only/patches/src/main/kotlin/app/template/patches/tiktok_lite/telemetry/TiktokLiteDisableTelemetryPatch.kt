package app.template.patches.tiktok_lite.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.returnEarly
import app.template.patches.tiktok_lite.TIKTOK_LITE_4683_COMPATIBILITY

@Suppress("unused")
val tiktokLiteDisableTelemetryPatch = bytecodePatch(
    name = "Disable Telemetry",
    description = "Disables TikTok Lite analytics at the event wrapper and network client layers.",
    default = true,
) {
    compatibleWith(TIKTOK_LITE_4683_COMPATIBILITY)

    execute {
        ApplogOnEventFingerprint.method.returnEarly()
        ApplogInitStatisticLoggerFingerprint.method.returnEarly()
        ApplogStatisticLoggerInitFingerprint.method.returnEarly()
        ApplogReportPendingFingerprint.method.returnEarly()
        ApplogConfigFingerprint.method.returnEarly()
        ApplogBeforeInitFingerprint.method.returnEarly()

        NetClientSendBatchFingerprint.method.returnEarly("")
        NetClientSendListFingerprint.method.returnEarly("")
        NetClientSendBytesRawFingerprint.method.returnEarly("")
        NetClientSendBytesFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                new-array v0, v0, [B
                return-object v0
            """,
        )
    }
}
