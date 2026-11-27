package dev.jason.gboardpatches.patches.gboard.features.customstickers

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardCustomStickersFeatureMarkerPatch = resourcePatch(
    description = "標記 Custom Stickers feature 已被打入 target APK，共用 settings UI 過濾。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(CUSTOM_STICKERS_FEATURE_MARKER_NAME)
    }
}

private const val CUSTOM_STICKERS_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.custom_stickers"
