package app.template.patches.maps.ui.navzoom

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.maps.microg.activityContextHookPatch
import app.template.patches.maps.microg.markPatched
import app.template.patches.maps.microg.sharedExtensionPatch
import app.template.patches.shared.Constants.COMPATIBILITY_GOOGLE_MAPS

@Suppress("unused")
val navigationZoomControlsPatch = bytecodePatch(
    name = "Zoom controls in navigation",
    description = "Adds +, − and reset tiles during turn-by-turn that change the navigation zoom " +
        "while the camera keeps following the car.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MAPS)
    dependsOn(sharedExtensionPatch, activityContextHookPatch, navigationCameraHookPatch)

    execute {
        // The tiles and the zoom hold are the extension's (Shapes); the camera hooks
        // they run on are navigationCameraHookPatch's.
        markPatched("navZoomPatched")
    }
}
