package io.github.forsigh.waze

import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Car trip screen text (opt-in, default off).
 *
 * The car trip panel is built in `com.waze.app_nav.hub.c.i`, which reads two booleans straight off
 * the Java getters:
 *
 *   CONFIG_VALUE_AAOS_ETA_IN_TRIP_TEXT_ENABLED              -> arrival time in the trip text
 *   CONFIG_VALUE_AAOS_TIME_TO_DESTINATION_IN_TRIP_TEXT_ENABLED -> time left in the trip text
 *
 * Both are plain Boolean configs, so this row just forces them on. Nothing else in the car UI is
 * touched; if the head unit's template has no room for the extra line the text is simply not drawn.
 */
@Suppress("unused")
val carTripTextPatch = bytecodePatch(
    name = "Car trip screen text",
    description = "Adds arrival time and time left to the car trip bar.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Experimental")

    dependsOn(configOverridesPatch)

    execute {
        recordBoolean(
            "ctt", true,
            "CONFIG_VALUE_AAOS_ETA_IN_TRIP_TEXT_ENABLED",
        )
        recordBoolean(
            "ctt", true,
            "CONFIG_VALUE_AAOS_TIME_TO_DESTINATION_IN_TRIP_TEXT_ENABLED",
        )
    }
}
