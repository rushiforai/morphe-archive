package dev.jason.gboardpatches.patches.gboard.features.accesspointcount

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAccessPointCountFeatureMarkerPatch = resourcePatch(
    description = "標記 Top Toolbar Item Count feature 已被打入 target APK。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ACCESS_POINT_COUNT_FEATURE_MARKER)
    }
}

internal const val ACCESS_POINT_COUNT_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.access_point_count"
