package dev.jason.gboardpatches.patches.gboard

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.ocr.gboardOcrFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.ocr.gboardOcrFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.ocr.gboardOcrModelAssetsPatch
import dev.jason.gboardpatches.patches.gboard.features.ocr.gboardOcrBundledRecognizerPatch
import dev.jason.gboardpatches.patches.gboard.features.ocr.gboardOcrRuntimePatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingTools1863AutoFixAcceptancePatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesSettingsPatch

/**
 * Gboard's Scan Text (OCR).
 *
 * Gboard can recognise text from the camera, but a re-signed build is refused the
 * Play Services recognition modules. This forces the stock entry point and the
 * language gates open, then repairs the module request and the non-Latin thin
 * recogniser init so the modules can come down normally.
 */
@Suppress("unused")
val gboardOcrScanTextPatch = resourcePatch(
    name = "Enable OCR / Scan Text",
    description = "Enables Gboard's Scan Text camera entry point and runs it with an OCR " +
        "engine bundled in the patch, so it works without Play Services. Latin text only.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardOcrFeatureMarkerPatch,
        gboardOcrFlagValuePatch,
        gboardOcrRuntimePatch,
        gboardOcrBundledRecognizerPatch,
        gboardOcrModelAssetsPatch,
    )
}

/**
 * Gboard's AI Writing Tools.
 *
 * The client ships inside Gboard but is gated behind signature-scoped flags plus a
 * v2 intent routing table a re-signed build never receives. This forces the flag
 * tuple, adds INTENT_AUTO_FIX to the routing set, and repairs the three init points
 * that otherwise throw on a client type the assistant never learns.
 */
@Suppress("unused")
val gboardAiWritingToolsPatch = resourcePatch(
    name = "AI Writing Tools",
    description = "Enables Gboard's Writing tools: proofread, rewrite and tone changes on " +
        "selected text, in every language and keyboard.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAiWritingToolsFeatureMarkerPatch,
        gboardAiWritingToolsFlagValuePatch,
        gboardAiWritingTools1863AutoFixAcceptancePatch,
    )
}
