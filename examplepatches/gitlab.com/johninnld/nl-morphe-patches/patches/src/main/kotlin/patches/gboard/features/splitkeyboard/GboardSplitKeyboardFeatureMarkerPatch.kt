package patches.gboard.features.splitkeyboard

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardSplitKeyboardFeatureMarkerPatch = resourcePatch(
    description = "Mark the Split keyboard feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(SPLIT_KEYBOARD_FEATURE_MARKER)
    }
}

internal const val SPLIT_KEYBOARD_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.split_keyboard"
