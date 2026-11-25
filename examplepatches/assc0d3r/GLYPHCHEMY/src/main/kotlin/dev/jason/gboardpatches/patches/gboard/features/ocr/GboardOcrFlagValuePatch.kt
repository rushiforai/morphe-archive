package dev.jason.gboardpatches.patches.gboard.features.ocr

import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

internal val gboardOcrFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Force the stock OCR entry point and every language gate on.",
    feature = GboardFlagFamilyFeature.ENABLE_OCR_SCAN_TEXT,
)

internal val OCR_RUNTIME_CLASS =
    RuntimeAbiCatalog.abi(RuntimeCallId.OCR_RUNTIME_APPLY_FLAG_VALUE).owner
