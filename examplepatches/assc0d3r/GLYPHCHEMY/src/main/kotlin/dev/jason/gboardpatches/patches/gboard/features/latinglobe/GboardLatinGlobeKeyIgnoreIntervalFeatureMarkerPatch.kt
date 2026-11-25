package dev.jason.gboardpatches.patches.gboard.features.latinglobe

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardLatinGlobeKeyIgnoreIntervalFeatureMarkerPatch = resourcePatch(
    description = "標記 Latin globe key ignore interval feature 已被打入 target APK，共用 settings UI 過濾"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(LATIN_GLOBE_KEY_IGNORE_INTERVAL_FEATURE_MARKER_NAME)
    }
}

private const val LATIN_GLOBE_KEY_IGNORE_INTERVAL_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.latin_globe_key_ignore_interval"
