package patches.gboard.features.symbolfooter

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardSymbolFooterOrderFeatureMarkerPatch = resourcePatch(
    description = "Mark the expression footer tab order feature as present in the target APK, sharing the settings UI filter."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(SYMBOL_FOOTER_ORDER_FEATURE_MARKER_NAME)
    }
}

private const val SYMBOL_FOOTER_ORDER_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.symbol_footer_order"
