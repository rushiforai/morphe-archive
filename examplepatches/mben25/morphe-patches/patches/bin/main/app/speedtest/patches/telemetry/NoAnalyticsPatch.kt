package app.speedtest.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.speedtest.patches.shared.Constants.COMPATIBILITY_SPEEDTEST

@Suppress("unused")
val noAnalyticsPatch = bytecodePatch(
    name = "Disable Logging (Analytics)",
    description = "Stops Speedtest by Ookla's DevMetrics dispatcher (com.ookla.tools.logging) " +
        "from forwarding info/watch/alarm events to Firebase Analytics, Crashlytics and Logcat.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPEEDTEST)

    execute {
        // info() and watch() share the same signature; one fingerprint matches both.
        LoggingStringVarargsFingerprint.matchAll().forEach {
            it.method.addInstructions(0, "return-void")
        }
        LoggingAlarmFingerprint.matchAll().forEach {
            it.method.addInstructions(0, "return-void")
        }
    }
}
