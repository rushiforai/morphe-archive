package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsFeatureMarkerPatch = resourcePatch(
    description = "Mark the AI Writing Tools feature as present in the target APK, sharing the settings UI filter."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(AI_WRITING_TOOLS_FEATURE_MARKER_NAME)
    }
}
