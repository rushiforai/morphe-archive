package dev.jason.gboardpatches.patches.gboard.features.quickinsert

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardQuickInsertFeatureMarkerPatch = resourcePatch(
    description = "標記 Quick Insert feature 已被打入 target APK。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(QUICK_INSERT_FEATURE_MARKER)
    }
}

internal const val QUICK_INSERT_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.quick_insert"
