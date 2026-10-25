package io.github.forsigh.waze

import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * No Android Auto telemetry (opt-in, default off).
 *
 * `com.waze.car_lib.screens.core.ScreenPresentable` times every car screen push: it stamps the
 * clock, waits for the new top screen to present, then compares the delta against a threshold.
 * When the gate below is on and the push was slower than the threshold, Waze builds a string
 * such as `push [NavigationScreen] when topScreen=[MapScreen] took 640ms` and hands it to
 * `com.waze.stats`, which ships it to Waze's analytics backend.
 *
 * The flag is `CONFIG_VALUE_ANDROID_AUTO_LOG_ON_GET_TEMPLATE_DELAY_TO_FIREBASE` (Boolean) with
 * `CONFIG_VALUE_ANDROID_AUTO_LOG_ON_GET_TEMPLATE_DELAY_TO_FIREBASE_THRESHOLD` (Long, ms) as the
 * cut-off. Recording the Boolean as false makes the whole reporting branch skip: the timing is
 * still measured, the screen still pushes, nothing is sent.
 *
 * Scope, stated plainly: this silences ONE signal - car screen-push latency. Waze's other
 * telemetry (routes, search, crash reports, ads) is untouched, and the row is not named or
 * described as a blanket telemetry switch for that reason.
 */
@Suppress("unused")
val noAaTelemetryPatch = bytecodePatch(
    name = "No Android Auto telemetry",
    description = "Stops Waze sending Android Auto screen-switch timings to its analytics.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Android Auto")

    // The emitter patch is what writes the overrides; ticking this row alone must still carry them.
    dependsOn(configOverridesPatch)

    execute {
        recordBoolean(
            "naat", false,
            "CONFIG_VALUE_ANDROID_AUTO_LOG_ON_GET_TEMPLATE_DELAY_TO_FIREBASE",
        )
        println("noAaTelemetryPatch: suppressing car screen-push timing reports")
    }
}
