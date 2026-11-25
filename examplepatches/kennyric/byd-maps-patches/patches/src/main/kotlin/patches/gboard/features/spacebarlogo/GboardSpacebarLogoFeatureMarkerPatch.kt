package patches.gboard.features.spacebarlogo

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardSpacebarLogoFeatureMarkerPatch = resourcePatch(
    description = "Mark the Spacebar Logo feature as present in the target APK, sharing the settings UI filter.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(SPACEBAR_LOGO_FEATURE_MARKER_NAME)
    }
}

private const val SPACEBAR_LOGO_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.spacebar_logo"
