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
    name = "Receive alerts from a third-party application",
    description = "Receives road alerts, current speed, speed limits and average-speed zones from a third-party " +
        "application through an extendable provider interface, and shows them as map pins, car pills, chimes and voice. " +
        "Today it supports the patched Waze (De-Waze) and Flitsmeister from Dutch App Patches " +
        "(gitlab.com/johninnld/nl-morphe-patches), plus bearinmind's Waze Share alerts with Maps feed; further providers " +
        "can be added. Choose a provider in Waze & external data source; " +
        "external data is off by default. Updated patched providers start silently and are monitored while Maps is in use. Complete provider setup and location permissions once.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    // The settings are read at every Activity (Shapes.wrap), which also registers the receiver; guidance
    // start and end come from the navigation camera hook. The pins are drawn as Maps' personal places
    // (mapMarkersPatch), and during navigation as Google's own incident callouts (incidentCalloutsPatch).
    dependsOn(sharedExtensionPatch, activityContextHookPatch, navigationCameraHookPatch, wazeFeaturesRowPatch, mapMarkersPatch, incidentCalloutsPatch, speedingChimePatch, externalTelemetryVisibilityPatch)

    execute {
        markPatched("wazeAlertsPatched")
        bindMapsWarningVoice()
    }
}
