package dev.jason.gboardpatches.patches.gboard.features.englishqwerty

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardEnglishUppercaseToggleFeatureMarkerPatch = resourcePatch(
    description = "標記 English uppercase toggle feature 已被打入 target APK，共用 settings UI 過濾"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ENGLISH_UPPERCASE_TOGGLE_FEATURE_MARKER_NAME)
    }
}

private const val ENGLISH_UPPERCASE_TOGGLE_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.english_uppercase_toggle"
