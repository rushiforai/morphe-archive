package patches.gboard.features.swipedismiss

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardSwipeDismissFeatureMarkerPatch = resourcePatch(
    description = "Mark the Swipe Down to Dismiss Keyboard feature as present in the target APK, sharing the settings UI filter.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(SWIPE_DISMISS_FEATURE_MARKER_NAME)
    }
}

private const val SWIPE_DISMISS_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.swipe_dismiss"
