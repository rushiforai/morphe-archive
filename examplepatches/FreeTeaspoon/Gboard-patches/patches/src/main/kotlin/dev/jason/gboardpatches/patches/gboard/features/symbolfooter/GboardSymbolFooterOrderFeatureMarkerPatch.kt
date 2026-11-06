package dev.jason.gboardpatches.patches.gboard.features.symbolfooter

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardSymbolFooterOrderFeatureMarkerPatch = resourcePatch(
    description = "標記 expression footer tab order feature 已被打入 target APK，共用 settings UI 過濾"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(SYMBOL_FOOTER_ORDER_FEATURE_MARKER_NAME)
    }
}

private const val SYMBOL_FOOTER_ORDER_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.symbol_footer_order"
