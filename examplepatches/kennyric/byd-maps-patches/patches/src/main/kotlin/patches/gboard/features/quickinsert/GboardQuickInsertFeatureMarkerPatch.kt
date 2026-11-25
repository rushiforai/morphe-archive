package patches.gboard.features.quickinsert

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardQuickInsertFeatureMarkerPatch = resourcePatch(
    description = "Mark the Quick Insert feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(QUICK_INSERT_FEATURE_MARKER)
    }
}

internal const val QUICK_INSERT_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.quick_insert"
