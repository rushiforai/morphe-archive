package dev.jason.gboardpatches.patches.gboard.features.customtheme

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardCustomThemeFeatureMarkerPatch = resourcePatch(
    description = "標記 Custom Theme feature 已被打入 target APK。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    finalize { applyFeatureMarker(CUSTOM_THEME_FEATURE_MARKER) }
}

internal const val CUSTOM_THEME_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.custom_theme"
