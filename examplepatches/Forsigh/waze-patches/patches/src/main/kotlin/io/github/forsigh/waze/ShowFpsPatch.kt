package io.github.forsigh.waze

import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Shows Waze's built-in frames-per-second counter (opt-in, default off).
 *
 * `CONFIG_VALUE_MAP_SHOW_FPS_ENABLED` drives the map engine's own frame-rate readout on the map
 * canvas. Its purpose here is measurement: see what the phone or car screen actually renders
 * before and after tuning, instead of guessing. The key exists in every confirmed target.
 */
@Suppress("unused")
val showFpsPatch = bytecodePatch(
    name = "Show FPS counter",
    description = "Shows the frame-rate counter.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Experimental")

    dependsOn(configOverridesPatch)

    execute {
        recordBoolean("fps", true, "CONFIG_VALUE_MAP_SHOW_FPS_ENABLED")
        println("showFpsPatch: built-in FPS counter forced on")
    }
}
