package patches.gboard.features.roundedkeyboard

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardRoundedKeyboardFeatureMarkerPatch = resourcePatch(
    description = "Mark the Rounded Keyboard Panel feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ROUNDED_KEYBOARD_FEATURE_MARKER)
    }
}

internal const val ROUNDED_KEYBOARD_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.rounded_keyboard_panel"
