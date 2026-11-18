package patches.gboard.features.englishqwerty

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardEnglishUppercaseToggleFeatureMarkerPatch = resourcePatch(
    description = "Mark the English uppercase toggle feature as present in the target APK, sharing the settings UI filter."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ENGLISH_UPPERCASE_TOGGLE_FEATURE_MARKER_NAME)
    }
}

private const val ENGLISH_UPPERCASE_TOGGLE_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.english_uppercase_toggle"
