package dev.jason.gboardpatches.patches.gboard.features.swipedismiss

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardSwipeDismissFeatureMarkerPatch = resourcePatch(
    description = "標記 Swipe Down to Dismiss Keyboard feature 已被打入 target APK，共用 settings UI 過濾。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(SWIPE_DISMISS_FEATURE_MARKER_NAME)
    }
}

private const val SWIPE_DISMISS_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.swipe_dismiss"
