package patches.gboard.features.zhuyinbottomrow

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardZhuyinBottomRowWeightFeatureMarkerPatch = resourcePatch(
    description = "Mark the Zhuyin bottom row weight feature as present in the target APK, sharing the settings UI filter."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ZHUYIN_BOTTOM_ROW_WEIGHT_FEATURE_MARKER_NAME)
    }
}

private const val ZHUYIN_BOTTOM_ROW_WEIGHT_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.zhuyin_bottom_row_weight"
