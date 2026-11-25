package patches.gboard.features.latinglobe

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardLatinGlobeKeyIgnoreIntervalFeatureMarkerPatch = resourcePatch(
    description = "Mark the Latin globe key ignore interval feature as present in the target APK, sharing the settings UI filter."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(LATIN_GLOBE_KEY_IGNORE_INTERVAL_FEATURE_MARKER_NAME)
    }
}

private const val LATIN_GLOBE_KEY_IGNORE_INTERVAL_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.latin_globe_key_ignore_interval"
