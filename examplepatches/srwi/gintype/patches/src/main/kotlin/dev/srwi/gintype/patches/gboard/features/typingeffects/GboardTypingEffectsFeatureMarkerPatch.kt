package dev.srwi.gintype.patches.gboard.features.typingeffects

import app.morphe.patcher.patch.resourcePatch
import dev.srwi.gintype.patches.gboard.shared.applyFeatureMarker
import dev.srwi.gintype.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardTypingEffectsFeatureMarkerPatch = resourcePatch(
    description = "Marks Typing Effects patch availability in AndroidManifest metadata.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(TYPING_EFFECTS_FEATURE_MARKER_NAME)
    }
}

internal const val TYPING_EFFECTS_FEATURE_MARKER_NAME =
    "dev.srwi.gintype.feature.typing_effects"
