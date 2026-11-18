package patches.gboard.features.accesspointcount

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardAccessPointCountFeatureMarkerPatch = resourcePatch(
    description = "Mark the top toolbar item count feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ACCESS_POINT_COUNT_FEATURE_MARKER)
    }
}

internal const val ACCESS_POINT_COUNT_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.access_point_count"
