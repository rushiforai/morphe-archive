package dev.jason.gboardpatches.patches.gboard.features.flowmode

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardFlowModeFeatureMarkerPatch = resourcePatch(
    description = "標記 Hyperspeed Typing Animation feature 已被打入 target APK。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(FLOW_MODE_FEATURE_MARKER)
    }
}

internal const val FLOW_MODE_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.flow_mode_animation"
