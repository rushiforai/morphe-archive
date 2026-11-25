package dev.jason.gboardpatches.patches.gboard.features.cursortrackpad

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardCursorTrackpadFeatureMarkerPatch = resourcePatch(
    description = "Mark the Enable cursor trackpad mode feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(CURSOR_TRACKPAD_FEATURE_MARKER)
    }
}

internal const val CURSOR_TRACKPAD_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.cursor_trackpad"
