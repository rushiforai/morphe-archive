package dev.jason.gboardpatches.patches.gboard.features.textexpander

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardTextExpanderFeatureMarkerPatch = resourcePatch(
    description = "標記 Text Expander feature 已被打入 target APK，共用 settings UI 過濾。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(TEXT_EXPANDER_FEATURE_MARKER_NAME)
    }
}

private const val TEXT_EXPANDER_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.text_expander"
