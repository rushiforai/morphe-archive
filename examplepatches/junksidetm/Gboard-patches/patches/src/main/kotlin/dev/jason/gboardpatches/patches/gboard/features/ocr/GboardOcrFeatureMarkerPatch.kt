package dev.jason.gboardpatches.patches.gboard.features.ocr

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardOcrFeatureMarkerPatch = resourcePatch(
    description = "標記 OCR / Scan Text feature 已被打入 target APK。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(OCR_FEATURE_MARKER)
    }
}

internal const val OCR_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.ocr_scan_text"
