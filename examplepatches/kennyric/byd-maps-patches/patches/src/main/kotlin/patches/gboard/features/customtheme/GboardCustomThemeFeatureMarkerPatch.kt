package patches.gboard.features.customtheme

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardCustomThemeFeatureMarkerPatch = resourcePatch(
    description = "Mark the Custom Theme feature as present in the target APK."
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    finalize { applyFeatureMarker(CUSTOM_THEME_FEATURE_MARKER) }
}

internal const val CUSTOM_THEME_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.custom_theme"
