package io.github.forsigh.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

@Suppress("unused")
val showAllCamerasPatch = bytecodePatch(
    name = "Cameras & hazards",
    description = "Shows every camera and road hazard, with switches for the extra kinds.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Map & Alerts")

    // The emitter patch is what actually writes the keys recorded below. Depending on it means this
    // patch can be ticked alone and still produce a build where the override exists — without the
    // dependency the key is collected and never written, which looks exactly like a working patch.
    dependsOn(configOverridesPatch)

    val average by booleanOption(
        "average", true,
        title = "Average-speed zones",
        description = "Average-speed zone feature and recommended speed. Stock: on.",
    )

    val radarSound by booleanOption(
        "radarSound", true,
        title = "Camera chime below the limit",
        description = "Plays the camera sound even when you are under the limit. Stock: on.",
    )

    val extraTypes by booleanOption(
        "extraTypes", false,
        title = "The other camera types",
        description = "Phone, bus, carpool, HOV and noise cameras. Experimental.",
    )

    val crosswalks by booleanOption(
        "crosswalks", true,
        title = "Crosswalk hazards",
        description = "Highway and raised crosswalks drawn on the map and announced. Stock: off.",
    )

    execute {
        recordBoolean(
                "cam", true,
                "CONFIG_VALUE_MAP_SHOW_SPEED_CAMS",
                "CONFIG_VALUE_MAP_SHOW_SPEED_AND_RED_LIGHT_CAMERAS",
                "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_SPEED_CAMERAS",
                "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_SPEED_CAMERAS_SOUND_ENABLED",
            )
        if (average == true) {
            recordBoolean(
                    "cam", true,
                    "CONFIG_VALUE_AVERAGE_SPEED_CAMERA_FEATURE_ENABLED",
                    "CONFIG_VALUE_AVERAGE_SPEED_CAMERA_RECOMMENDED_SPEED_ENABLED",
                )
        }
        if (radarSound == true) recordBoolean("cam", true, "CONFIG_VALUE_ALERTS_PLAY_SPEED_CAMERA_SOUND_BELOW_SPEED_LIMIT")
        if (extraTypes == true) {
            recordBoolean(
                    "cam", true,
                    "CONFIG_VALUE_MAP_SHOW_MOBILE_PHONE_CAMERAS",
                    "CONFIG_VALUE_MAP_SHOW_BUS_LANE_CAMERAS",
                    "CONFIG_VALUE_MAP_SHOW_CARPOOL_LANE_CAMERAS",
                    "CONFIG_VALUE_MAP_SHOW_HOV_LANE_CAMERAS",
                    "CONFIG_VALUE_MAP_SHOW_NOISE_CAMERAS",
                )
        }
        if (crosswalks == true) {
            recordBoolean(
                    "cam", true,
                    "CONFIG_VALUE_MAP_SHOW_HIGHWAY_CROSSWALK_PERMANENT_HAZARD",
                    "CONFIG_VALUE_MAP_SHOW_RAISED_CROSSWALK_PERMANENT_HAZARD",
                    "CONFIG_VALUE_ALERTS_PERMANENT_HAZARD_HIGHWAY_CROSSWALK_SETTING_ENABLED",
                    "CONFIG_VALUE_ALERTS_PERMANENT_HAZARD_RAISED_CROSSWALK_SETTING_ENABLED",
                )
        }
        println(
            "showAllCamerasPatch: core on, average = ${average == true}, radarSound = ${radarSound == true}, " +
                "extraTypes = ${extraTypes == true}, crosswalks = ${crosswalks == true}",
        )
    }
}
