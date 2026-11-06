package dev.jason.gboardpatches.patches.gboard.features.roundedkeyboard

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardRoundedKeyboardFeatureMarkerPatch = resourcePatch(
    description = "標記 Rounded Keyboard Panel feature 已被打入 target APK。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ROUNDED_KEYBOARD_FEATURE_MARKER)
    }
}

internal const val ROUNDED_KEYBOARD_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.rounded_keyboard_panel"
