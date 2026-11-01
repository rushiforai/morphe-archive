package dev.jason.gboardpatches.patches.gboard.features.spacebarlogo

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardSpacebarLogoFeatureMarkerPatch = resourcePatch(
    description = "標記 Spacebar Logo feature 已被打入 target APK，共用 settings UI 過濾",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(SPACEBAR_LOGO_FEATURE_MARKER_NAME)
    }
}

private const val SPACEBAR_LOGO_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.spacebar_logo"
