package patches.gboard.features.ocr

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardOcrFeatureMarkerPatch = resourcePatch(
    description = "Mark the OCR / Scan Text feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(OCR_FEATURE_MARKER)
    }
}

internal const val OCR_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.ocr_scan_text"
