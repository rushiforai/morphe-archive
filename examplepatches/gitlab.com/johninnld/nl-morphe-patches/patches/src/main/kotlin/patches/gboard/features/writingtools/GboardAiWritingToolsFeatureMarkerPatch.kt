package patches.gboard.features.writingtools

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsFeatureMarkerPatch = resourcePatch(
    description = "Mark the AI Writing Tools feature as present in the target APK, sharing the settings UI filter."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(AI_WRITING_TOOLS_FEATURE_MARKER_NAME)
    }
}
