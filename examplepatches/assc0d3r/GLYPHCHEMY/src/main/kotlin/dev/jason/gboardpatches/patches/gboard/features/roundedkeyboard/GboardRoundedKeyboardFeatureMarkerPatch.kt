package dev.jason.gboardpatches.patches.gboard.features.roundedkeyboard

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

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
