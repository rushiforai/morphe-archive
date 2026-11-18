package patches.gboard.features.toprowswipe

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardTopRowSwipeFeatureMarkerPatch = resourcePatch(
    description = "Mark the top row swipe feature as present in the target APK, sharing the settings UI filter."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(TOP_ROW_SWIPE_FEATURE_MARKER_NAME)
    }
}

private const val TOP_ROW_SWIPE_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.top_row_swipe"
