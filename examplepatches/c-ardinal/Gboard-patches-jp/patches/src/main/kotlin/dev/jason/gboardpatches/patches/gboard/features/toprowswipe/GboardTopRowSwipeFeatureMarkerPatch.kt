package dev.jason.gboardpatches.patches.gboard.features.toprowswipe

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardTopRowSwipeFeatureMarkerPatch = resourcePatch(
    description = "標記 top row swipe feature 已被打入 target APK，共用 settings UI 過濾"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(TOP_ROW_SWIPE_FEATURE_MARKER_NAME)
    }
}

private const val TOP_ROW_SWIPE_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.top_row_swipe"
