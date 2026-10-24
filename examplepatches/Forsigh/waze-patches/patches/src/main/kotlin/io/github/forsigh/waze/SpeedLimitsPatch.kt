package io.github.forsigh.waze

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Speed limits — one row, four gears.
 *
 *   alwaysOn   - the sign stays on screen instead of only while over the limit
 *   decrease   - warns when the limit drops, 1000 m ahead
 *   report     - lets you report the limit yourself
 *   style      - forces the sign design; "stock" leaves Waze's country choice alone
 *
 * Each gear keeps the default of the row it replaces, so nothing changes for existing users.
 */
@Suppress("unused")
val speedLimitsPatch = bytecodePatch(
    name = "Speed limits",
    description = "Sign always shown, limit-drop warnings, reporting and sign style.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    dependsOn(configOverridesPatch)

    val alwaysOn by booleanOption(
        "alwaysOn", true,
        title = "Sign always shown",
        description = "Keeps the limit sign on screen when you are under the limit. Stock: hides.",
    )

    val decrease by booleanOption(
        "decrease", true,
        title = "Limit-drop warnings",
        description = "Warns when the limit falls, 1000 m ahead. Stock: on.",
    )

    val report by booleanOption(
        "report", false,
        title = "Report the speed limit",
        description = "Adds the report-limit option. Stock: off.",
    )

    val style by stringOption(
        "style", "stock",
        mapOf(
            "Stock (by country)" to "stock",
            "US (white rectangle)" to "us",
            "World (red circle)" to "world",
        ),
        title = "Sign style",
        description = "Waze picks one by country; this forces it.",
    )

    execute {
        if (alwaysOn == true) {
            recordBoolean("slm", true, "CONFIG_VALUE_MAP_SPEEDOMETER_SPEED_LIMIT_ENABLED")
            // The Boolean only turns the feature on. WHEN the sign is drawn comes from this String
            // key: "no", "yes" (only when over the limit) or "always".
            recordString("slm", "CONFIG_VALUE_MAP_SPEEDOMETER_SPEED_LIMIT_USER_ENABLED" to "always")
        }
        if (decrease == true) {
            recordBoolean("slm", true, "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_SPEED_LIMIT_DECREASE")
            recordLong("slm", "CONFIG_VALUE_ALERTS_SPEED_LIMIT_DECREASE_ALERT_DISTANCE_METERS" to 1000L)
        }
        if (report == true) recordBoolean("slm", true, "CONFIG_VALUE_MAP_SPEEDOMETER_SPEED_LIMIT_OVERRIDE_ENABLED")
        val chosen = style ?: "stock"
        if (chosen != "stock") recordString("slm", "CONFIG_VALUE_MAP_SPEEDOMETER_STYLE" to chosen)
        println("speedLimitsPatch: alwaysOn = ${alwaysOn == true}, decrease = ${decrease == true}, report = ${report == true}, style = $chosen")
    }
}
