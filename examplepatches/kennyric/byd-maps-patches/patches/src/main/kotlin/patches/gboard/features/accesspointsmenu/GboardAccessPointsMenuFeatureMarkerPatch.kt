package patches.gboard.features.accesspointsmenu

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardAccessPointsMenuFeatureMarkerPatch = resourcePatch(
    description = "Mark the Access Points menu style feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ACCESS_POINTS_MENU_FEATURE_MARKER)
    }
}

internal const val ACCESS_POINTS_MENU_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.access_points_menu_style"
