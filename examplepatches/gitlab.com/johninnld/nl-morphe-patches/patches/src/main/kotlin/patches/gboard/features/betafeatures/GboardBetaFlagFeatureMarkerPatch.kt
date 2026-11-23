package patches.gboard.features.betafeatures

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardBetaFlagFeatureMarkerPatch = resourcePatch(
    description = "Mark the 18.8 beta feature flags as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(BETA_FLAGS_FEATURE_MARKER)
    }
}

internal const val BETA_FLAGS_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.beta_flags"
