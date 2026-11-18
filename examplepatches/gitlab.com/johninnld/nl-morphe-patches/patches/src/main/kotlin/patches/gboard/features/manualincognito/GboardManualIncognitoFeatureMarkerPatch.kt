package patches.gboard.features.manualincognito

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardManualIncognitoFeatureMarkerPatch = resourcePatch(
    description = "Mark the Incognito Mode Toggle feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(MANUAL_INCOGNITO_FEATURE_MARKER)
    }
}

internal const val MANUAL_INCOGNITO_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.manual_incognito"
