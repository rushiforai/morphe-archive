package io.github.forsigh.waze

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Extra map info (opt-in).
 *
 * Two display switches that Waze hides behind plain Boolean configs with no Settings entry:
 *
 *   MAP_ICONS_SHOW_COMPASS - keeps the compass on the map instead of only while turning
 *   ROUTING_SHOW_TOLL_PRICE - shows the toll cost on route alternatives
 *
 * Both default ON when the row is selected; turning one off leaves Waze's own behaviour.
 */
@Suppress("unused")
val extraMapInfoPatch = bytecodePatch(
    name = "Extra map info",
    description = "Compass always shown and toll price on routes.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Privacy & Updates")

    dependsOn(configOverridesPatch)

    val compass by booleanOption(
        "compass", true,
        title = "Always show compass",
        description = "Keeps the compass on the map. Stock: only while turning.",
    )

    val tolls by booleanOption(
        "tolls", true,
        title = "Toll price on route",
        description = "Shows what the toll costs on each route. Stock: hidden.",
    )

    execute {
        if (compass == true) recordBoolean("emi", true, "CONFIG_VALUE_MAP_ICONS_SHOW_COMPASS")
        if (tolls == true) recordBoolean("emi", true, "CONFIG_VALUE_ROUTING_SHOW_TOLL_PRICE")
        println("extraMapInfoPatch: compass = ${if (compass == true) "on" else "stock"}, tolls = ${if (tolls == true) "on" else "stock"}")
    }
}
