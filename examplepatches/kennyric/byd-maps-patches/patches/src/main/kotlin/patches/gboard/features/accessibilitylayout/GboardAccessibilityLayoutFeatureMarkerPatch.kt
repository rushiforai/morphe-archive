package patches.gboard.features.accessibilitylayout

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardAccessibilityLayoutFeatureMarkerPatch = resourcePatch(
    description = "Mark the accessibility layout feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ACCESSIBILITY_LAYOUT_FEATURE_MARKER)
    }
}

internal const val ACCESSIBILITY_LAYOUT_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.accessibility_layout"
