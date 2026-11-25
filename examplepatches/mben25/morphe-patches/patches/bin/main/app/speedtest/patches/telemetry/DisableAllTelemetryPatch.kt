package app.speedtest.patches.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.speedtest.patches.shared.Constants.COMPATIBILITY_SPEEDTEST

@Suppress("unused")
val disableAllTelemetryPatch = bytecodePatch(
    name = "Disable All Telemetry",
    description = "Comprehensive privacy patch: silences the Ookla DevMetrics dispatcher so " +
        "no event reaches Firebase Analytics, Crashlytics or Logcat. Does not affect " +
        "speed-test functionality.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPEEDTEST)

    dependsOn(noAnalyticsPatch)

    execute {
        // Orchestrator only; the real work is in the dependency patch.
    }
}
