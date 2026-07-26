package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAdvancedVoiceFeatureMarkerPatch = resourcePatch(
    description = "標記 Advanced Voice Typing feature 已被打入 target APK",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ADVANCED_VOICE_FEATURE_MARKER)
    }
}

internal const val ADVANCED_VOICE_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.advanced_voice_typing"

