package patches.gboard.features.longpressquickactions

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardLongPressQuickActionsFeatureMarkerPatch = resourcePatch(
    description = "Mark the Long-Press Editing Shortcuts feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(LONG_PRESS_QUICK_ACTIONS_FEATURE_MARKER)
    }
}

internal const val LONG_PRESS_QUICK_ACTIONS_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.long_press_quick_actions"
