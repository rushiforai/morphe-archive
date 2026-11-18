package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.stringOption
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE

// Feature selection inspired by Forsigh/waze-patches (GPLv3). Configurations and their
// consumers were checked against 5.26.90.901 / 1030746; use this project's sync/locking
// mechanism so the controls remain editable in Customization after patching.

/** Combines the compass and on-tap preferences into the compass-only visibility flow. */
private object CompassVisibilityFingerprint : Fingerprint(
    definingClass = "Lcom/waze/main_screen/c/a/c;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
)

@Suppress("unused")
val wazeAutoZoomPatch = bytecodePatch(
    name = "Auto zoom",
    description = "Keeps your auto-zoom choice after settings sync. Choose off, on or by speed.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeConfigOverridesPatch)

    val mode by stringOption(
        key = "mode", default = "speed",
        values = mapOf("Off" to "no", "On" to "yes", "By speed" to "speed"),
        title = "Auto-zoom mode",
        description = "Also editable in Customization after patching.",
        required = true,
    )

    execute {
        val chosen = mode ?: throw PatchException("Choose an auto-zoom mode")
        if (chosen !in setOf("no", "yes", "speed")) throw PatchException("Unknown auto-zoom mode: $chosen")
        keepWazeConfig("autoZoom", "CONFIG_VALUE_ROUTING_AUTO_ZOOM", chosen)
    }
}

@Suppress("unused")
val wazeLaneGuidancePatch = bytecodePatch(
    name = "Lane guidance",
    description = "Enables lane guidance and optional straight-ahead hints. Keeps your Waze lane-guidance preference.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeConfigOverridesPatch)

    val straightAhead by booleanOption(
        key = "straightAhead", default = true,
        title = "Straight-ahead hints",
        description = "Adds a separate switch in Customization. Lane data must be available for the road.",
    )

    execute {
        keepWazeConfig("laneGuidance", "CONFIG_VALUE_LANE_GUIDANCE_ENABLED", true)
        if (straightAhead == true) {
            keepWazeConfig("straightAheadLanes", "CONFIG_VALUE_LANE_GUIDANCE_CONTINUE_STRAIGHT_ENABLED", true)
        }
        // CONFIG_VALUE_LANE_GUIDANCE_USER_ENABLED remains Waze's own setting.
    }
}

@Suppress("unused")
val wazeExtraMapInfoPatch = bytecodePatch(
    name = "Extra map info",
    description = "Separate switches for an always-visible compass and available toll prices.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeConfigOverridesPatch)

    val compass by booleanOption(
        key = "compass", default = true, title = "Always show compass",
        description = "Adds a compass switch in Customization.",
    )
    val tolls by booleanOption(
        key = "tolls", default = true, title = "Toll prices",
        description = "Shows prices when supplied with route data. Adds a separate switch in Customization.",
    )

    execute {
        if (compass != true && tolls != true) throw PatchException("Choose compass, toll prices or both")
        if (compass == true) {
            keepWazeConfig("alwaysCompass", "CONFIG_VALUE_MAP_ICONS_SHOW_COMPASS", true)
            // SHOW_ON_SCREEN_ON_TAP also gates the compass. Override only its final visibility,
            // not that shared preference, which controls other map buttons too.
            CompassVisibilityFingerprint.method.filterWazeObjectReturns(
                "$WAZE_CUSTOMIZATION->compassVisibility(Ljava/lang/Object;)Ljava/lang/Object;",
            )
        }
        if (tolls == true) keepWazeConfig("tollPrices", "CONFIG_VALUE_ROUTING_SHOW_TOLL_PRICE", true)
    }
}

@Suppress("unused")
val wazeSpeedLimitControlsPatch = bytecodePatch(
    name = "Speed limit controls",
    description = "Keeps the speed limit visible and enables limit-drop warnings with an editable distance.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeConfigOverridesPatch)

    val alwaysShow by booleanOption(
        key = "alwaysShow", default = true, title = "Always show speed limit",
        description = "Adds a separate visibility switch. Reporting and sign style stay independent.",
    )
    val limitDrops by booleanOption(
        key = "limitDrops", default = true, title = "Limit-drop warnings",
        description = "Adds a separate warning switch in Customization.",
    )
    val distance by intOption(
        key = "distance", default = 1000, title = "Limit-drop warning distance (m)",
        description = "0 to 20000 metres. Also editable in Customization after patching.",
        required = true,
    )

    execute {
        if (alwaysShow != true && limitDrops != true) throw PatchException("Choose limit display, warnings or both")
        val metres = distance ?: throw PatchException("Choose a limit-drop warning distance")
        if (metres !in 0..20_000) throw PatchException("Limit-drop warning distance must be 0 to 20000 metres")
        if (alwaysShow == true) {
            keepWazeConfig("alwaysSpeedLimit", "CONFIG_VALUE_MAP_SPEEDOMETER_SPEED_LIMIT_ENABLED", true)
            keepWazeConfig("alwaysSpeedLimit", "CONFIG_VALUE_MAP_SPEEDOMETER_SPEED_LIMIT_USER_ENABLED", "always")
        }
        if (limitDrops == true) {
            keepWazeConfig("speedLimitDrop", "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_SPEED_LIMIT_DECREASE", true)
            keepWazeConfig("speedLimitDrop", "CONFIG_VALUE_ALERTS_SPEED_LIMIT_DECREASE_ALERT_DISTANCE_METERS", metres)
        }
    }
}

@Suppress("unused")
val wazeCarAlertsNotificationsPatch = bytecodePatch(
    name = "Car alerts as notifications",
    description = "Uses car notifications for supported Waze alerts. Availability depends on the car host.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeConfigOverridesPatch)

    execute {
        keepWazeConfig("carAlertNotifications", "CONFIG_VALUE_CAR_LIB_ALERTS_USING_NOTIFICATION", true)
    }
}

@Suppress("unused")
val wazeCarTrafficMeterPatch = bytecodePatch(
    name = "Car traffic meter",
    description = "Enables the traffic meter on supported car navigation screens.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeConfigOverridesPatch)

    execute {
        keepWazeConfig("carTrafficMeter", "CONFIG_VALUE_CAR_LIB_TRAFFIC_METER_FEATURE_ENABLED", true)
    }
}
