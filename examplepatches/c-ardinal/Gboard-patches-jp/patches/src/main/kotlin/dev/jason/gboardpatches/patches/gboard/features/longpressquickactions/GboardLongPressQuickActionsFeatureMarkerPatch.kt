package dev.jason.gboardpatches.patches.gboard.features.longpressquickactions

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardLongPressQuickActionsFeatureMarkerPatch = resourcePatch(
    description = "標記 Long-Press Editing Shortcuts feature 已被打入 target APK",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(LONG_PRESS_QUICK_ACTIONS_FEATURE_MARKER)
    }
}

internal const val LONG_PRESS_QUICK_ACTIONS_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.long_press_quick_actions"
