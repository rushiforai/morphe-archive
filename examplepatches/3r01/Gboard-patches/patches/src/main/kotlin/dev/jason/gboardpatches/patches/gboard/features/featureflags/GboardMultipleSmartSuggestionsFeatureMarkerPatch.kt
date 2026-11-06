package dev.jason.gboardpatches.patches.gboard.features.featureflags

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardMultipleSmartSuggestionsFeatureMarkerPatch = resourcePatch(
    description = "標記 multiple smart suggestions rollout flag patch 已打入 target APK"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(MULTIPLE_SMART_SUGGESTIONS_FEATURE_MARKER_NAME)
    }
}

private const val MULTIPLE_SMART_SUGGESTIONS_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.multiple_smart_suggestions"
