package patches.waze

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE

// Adapted from the camera/hazard and speed-bump controls in Forsigh/waze-patches
// (GPLv3), with notification/sound gates verified separately on 5.26.90.901.
@Suppress("unused")
val wazeNativeAlertsPatch = bytecodePatch(
    name = "Native camera and hazard controls",
    description = "Keeps selected Waze camera and crosswalk alerts enabled, including map and notification gates. Needs Waze data.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeConfigOverridesPatch)

    val phone by booleanOption(key = "phone", default = true, title = "Phone-use cameras", description = "Adds a separate Customization switch.")
    val bus by booleanOption(key = "bus", default = true, title = "Bus-lane cameras", description = "Adds a separate Customization switch.")
    val carpool by booleanOption(key = "carpool", default = true, title = "Carpool-lane cameras", description = "Adds a separate Customization switch.")
    val hov by booleanOption(key = "hov", default = true, title = "HOV-lane cameras", description = "Adds a separate Customization switch.")
    val noise by booleanOption(key = "noise", default = true, title = "Noise cameras", description = "Adds a separate Customization switch.")
    val raised by booleanOption(key = "raisedCrosswalks", default = true, title = "Raised crosswalks", description = "Adds a separate Customization switch.")
    val highway by booleanOption(key = "highwayCrosswalks", default = true, title = "Highway crosswalks", description = "Adds a separate Customization switch.")

    execute {
        val cameras = listOf(
            Triple("phoneCameraAlerts", "MOBILE_PHONE", phone),
            Triple("busCameraAlerts", "BUS_LANE", bus),
            Triple("carpoolCameraAlerts", "CARPOOL_LANE", carpool),
            Triple("hovCameraAlerts", "HOV_LANE", hov),
            Triple("noiseCameraAlerts", "NOISE", noise),
        )
        val crosswalks = listOf(
            Triple("raisedCrosswalkAlerts", "RAISED_CROSSWALK", raised),
            Triple("highwayCrosswalkAlerts", "HIGHWAY_CROSSWALK", highway),
        )
        if ((cameras + crosswalks).none { it.third == true }) throw PatchException("Choose at least one camera or hazard type")
        for ((feature, type, selected) in cameras) {
            if (selected != true) continue
            keepWazeConfig(feature, "CONFIG_VALUE_MAP_SHOW_${type}_CAMERAS", true)
            keepWazeConfig(feature, "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_${type}_CAMERAS", true)
            keepWazeConfig(feature, "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_${type}_CAMERAS_SOUND_ENABLED", true)
        }
        for ((feature, type, selected) in crosswalks) {
            if (selected != true) continue
            keepWazeConfig(feature, "CONFIG_VALUE_MAP_SHOW_${type}_PERMANENT_HAZARD", true)
            keepWazeConfig(feature, "CONFIG_VALUE_ALERTS_PERMANENT_HAZARD_${type}_SETTING_ENABLED", true)
            keepWazeConfig(feature, "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_PERMANENT_HAZARD_${type}", true)
        }
    }
}

@Suppress("unused")
val wazeSpeedBumpControlsPatch = bytecodePatch(
    name = "Speed bump controls",
    description = "Independent controls to show speed bumps on the map and silence their on-route warnings.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeConfigOverridesPatch)

    val map by booleanOption(key = "map", default = true, title = "Map markers", description = "Adds Show speed bumps on map in Customization.")
    val silence by booleanOption(key = "silence", default = true, title = "Silence warnings", description = "Adds a separate suppression switch; does not hide map markers.")

    execute {
        if (map != true && silence != true) throw PatchException("Choose map markers, warning suppression or both")
        if (map == true) keepWazeConfig("speedBumpMap", "CONFIG_VALUE_MAP_SHOW_SPEED_BUMPS_PERMANENT_HAZARD", true)
        if (silence == true) keepWazeConfig("silenceSpeedBumps", "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_PERMANENT_HAZARD_SPEED_BUMP", false)
    }
}
