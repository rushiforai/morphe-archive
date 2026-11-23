package patches.gboard.features.hiddenflags

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardHiddenFlagsFeatureMarkerPatch = resourcePatch(
    description = "Mark the hidden-flag override screen as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(HIDDEN_FLAGS_FEATURE_MARKER)
    }
}

internal const val HIDDEN_FLAGS_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.hidden_flags"
