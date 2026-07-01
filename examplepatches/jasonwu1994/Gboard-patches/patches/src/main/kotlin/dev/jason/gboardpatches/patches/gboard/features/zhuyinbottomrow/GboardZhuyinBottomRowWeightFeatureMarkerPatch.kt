package dev.jason.gboardpatches.patches.gboard.features.zhuyinbottomrow

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardZhuyinBottomRowWeightFeatureMarkerPatch = resourcePatch(
    description = "標記 Zhuyin bottom row weight feature 已被打入 target APK，共用 settings UI 過濾"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(ZHUYIN_BOTTOM_ROW_WEIGHT_FEATURE_MARKER_NAME)
    }
}

private const val ZHUYIN_BOTTOM_ROW_WEIGHT_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.zhuyin_bottom_row_weight"
