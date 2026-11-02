package org.ungoogled.patches.maps.ui.speed

import app.morphe.patcher.patch.bytecodePatch
import org.ungoogled.patches.maps.saved.mapMarkersPatch
import org.ungoogled.patches.maps.ui.activityContextHookPatch
import org.ungoogled.patches.maps.ui.markPatched
import org.ungoogled.patches.maps.ui.navzoom.navigationCameraHookPatch
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS

@Suppress("unused")
val wazeAlertsPatch = bytecodePatch(
    name = "Waze alerts",
    description = "Shows nearby Waze and Flitsmeister alerts as map pins with ahead-of-you chimes and notes. " +
        "Supports our navigation broadcasts for current speed, speed limits and average-speed zones, " +
        "plus bearinmind's Waze Share alerts with Maps feed. Choose a provider in Waze & external data source; " +
        "external data is off by default. The selected source must be patched, enabled and running.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    // The settings are read at every Activity (Shapes.wrap), which also registers the receiver; guidance
    // start and end come from the navigation camera hook. The pins are drawn as Maps' personal places
    // (mapMarkersPatch).
    dependsOn(sharedExtensionPatch, activityContextHookPatch, navigationCameraHookPatch, wazeFeaturesRowPatch, mapMarkersPatch, speedingChimePatch, externalTelemetryVisibilityPatch)

    execute {
        markPatched("wazeAlertsPatched")
    }
}
