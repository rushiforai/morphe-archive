package patches.gboard.features.featureflags

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardDeviceIntelligenceFeatureMarkerPatch = resourcePatch(
    description = "Mark the device intelligence rollout flag patch as present in the target APK."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(DEVICE_INTELLIGENCE_FEATURE_MARKER_NAME)
    }
}

private const val DEVICE_INTELLIGENCE_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.device_intelligence"
