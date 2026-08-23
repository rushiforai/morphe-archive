package dev.jason.gboardpatches.patches.gboard.features.accessibilitylayout

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAccessibilityLayoutFeatureMarkerPatch = resourcePatch(
    description = "標記 Show accessibility layout feature 已被打入 target APK",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ACCESSIBILITY_LAYOUT_FEATURE_MARKER)
    }
}

internal const val ACCESSIBILITY_LAYOUT_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.accessibility_layout"
