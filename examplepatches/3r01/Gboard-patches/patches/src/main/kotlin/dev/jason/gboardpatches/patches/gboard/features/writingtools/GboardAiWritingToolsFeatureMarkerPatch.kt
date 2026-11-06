package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsFeatureMarkerPatch = resourcePatch(
    description = "標記 AI Writing Tools feature 已被打入 target APK，共用 settings UI 過濾。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(AI_WRITING_TOOLS_FEATURE_MARKER_NAME)
    }
}
