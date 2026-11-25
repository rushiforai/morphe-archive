package patches.gboard.features.addsymbols

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardCustomSymbolsFeatureMarkerPatch = resourcePatch(
    description = "Mark the custom symbols feature as present in the target APK, sharing the settings UI filter."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(CUSTOM_SYMBOLS_FEATURE_MARKER_NAME)
    }
}

private const val CUSTOM_SYMBOLS_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.custom_symbols"
