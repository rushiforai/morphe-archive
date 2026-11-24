package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * No usage stats (opt-in, default off) - the background-cost half of telemetry.
 *
 * Waze ships a stats subsystem that keeps a local database of events and ships them in batches,
 * and two monitoring loops that sample the main thread and the native threads for stalls. None of
 * that is needed to drive, and it is what keeps working while the app sits in the background.
 *
 * Two layers, on purpose:
 *
 *  1. **Config switches** (`ConfigValues` booleans, all confirmed present on 5.28.4.900):
 *     `STATS_MODULE_IS_ON`, `NETWORK_FIREBASE_REPORTING_ENABLED`,
 *     `ANALYTICS_FIREBASE_PERFORMANCE_ENABLED`, `ANALYTICS_PRIMES_PERFORMANCE_ENABLED`,
 *     `GENERAL_ANDROID_CRASHLYTICS_ENABLED`, `GENERAL_CRASHLYTICS_LOG_ENABLED`,
 *     `METRIC_KIT_CRASHLYTICS_HANGS_ENABLED`, the two thread-responsiveness monitors
 *     (`ANALYTICS_ANDROID_MAIN_THREAD_RESPONSIVENESS_MONITORING`,
 *     `ANALYTICS_ANDROID_CPP_THREAD_RESPONSIVENESS_MONITORING`) and the Android Auto
 *     screen-push latency report (`ANDROID_AUTO_LOG_ON_GET_TEMPLATE_DELAY_TO_FIREBASE`, folded in
 *     from the old `No Android Auto telemetry` row).
 *     Turning the monitors off removes the periodic sampling loops; turning the module off stops
 *     the events being built at all.
 *  2. **The dispatcher** (`com.waze.stats.az.d`) returns at entry, so even an event that slipped
 *     past the module switch is never written to the stats database or handed to the uploader.
 *
 * Scope: usage analytics and app-performance telemetry only. Map data, routing, alerts, reports
 * and Waze's own traffic sampling come from the native core and are untouched - this is about the
 * app's own bookkeeping, not about driving.
 *
 * PROVENANCE: the dispatcher anchor was identified in bearinmindcat/morphe-patches (GPLv3) -
 * see `CREDITS.md`.
 */
private const val STATS_ANCHOR = "Not reporting the following stat because user is not authenticated: "

/** The stats dispatcher: void, string-tagged, one per build. */
private object StatsDispatchFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string(STATS_ANCHOR)),
)

@Suppress("unused")
val noUsageStatsPatch = bytecodePatch(
    name = "No usage stats",
    description = "Stops Waze building, storing and uploading usage statistics, and turns off its " +
        "background thread-responsiveness monitors. Driving, reports and alerts are unaffected.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Privacy & Updates")

    // The emitter patch is what writes the overrides; ticking this row alone must still carry them.
    dependsOn(configOverridesPatch)

    execute {
        recordBoolean(
            "nus", false,
            "CONFIG_VALUE_STATS_MODULE_IS_ON",
            "CONFIG_VALUE_NETWORK_FIREBASE_REPORTING_ENABLED",
            "CONFIG_VALUE_ANALYTICS_FIREBASE_PERFORMANCE_ENABLED",
            "CONFIG_VALUE_ANALYTICS_PRIMES_PERFORMANCE_ENABLED",
            "CONFIG_VALUE_GENERAL_ANDROID_CRASHLYTICS_ENABLED",
            "CONFIG_VALUE_GENERAL_CRASHLYTICS_LOG_ENABLED",
            "CONFIG_VALUE_METRIC_KIT_CRASHLYTICS_HANGS_ENABLED",
            "CONFIG_VALUE_ANALYTICS_ANDROID_MAIN_THREAD_RESPONSIVENESS_MONITORING",
            "CONFIG_VALUE_ANALYTICS_ANDROID_CPP_THREAD_RESPONSIVENESS_MONITORING",
            // Was its own row ("No Android Auto telemetry"): the car screen-push latency timing
            // Waze ships to Firebase once a push is slower than the threshold. Same family, same
            // mechanism - one toggle instead of two.
            "CONFIG_VALUE_ANDROID_AUTO_LOG_ON_GET_TEMPLATE_DELAY_TO_FIREBASE",
        )

        StatsDispatchFingerprint.method.addInstruction(0, "return-void")
        println("noUsageStatsPatch: stats module off, background monitors off, dispatcher silenced")
    }
}
