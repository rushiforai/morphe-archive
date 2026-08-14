package dev.jason.gboardpatches.patches.gboard.features.accesspointsmenu

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAccessPointsMenuFeatureMarkerPatch = resourcePatch(
    description = "標記 Access Points menu style feature 已被打入 target APK",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ACCESS_POINTS_MENU_FEATURE_MARKER)
    }
}

internal const val ACCESS_POINTS_MENU_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.access_points_menu_style"
