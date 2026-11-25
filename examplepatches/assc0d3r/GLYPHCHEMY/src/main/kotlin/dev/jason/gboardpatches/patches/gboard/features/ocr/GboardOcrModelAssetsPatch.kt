package dev.jason.gboardpatches.patches.gboard.features.ocr

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

/**
 * Ships the recognition models with Gboard.
 *
 * The bundled pipeline loads them from `assets/mlkit-google-ocr-models`, and they cannot be
 * fetched from Play Services on a re-signed build, so they travel with the APK.
 */
internal val gboardOcrModelAssetsPatch = resourcePatch(
    description = "Copy the OCR recognition models into the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    finalize {
        copyModelAssets()
        copyNativePipeline()
    }
}

context(context: ResourcePatchContext)
private fun copyNativePipeline() = with(context) {
    val loader = object {}.javaClass.classLoader ?: error("No classloader for the OCR pipeline")
    for (abi in listOf("arm64-v8a", "armeabi-v7a")) {
        val bytes = loader.getResourceAsStream("$NATIVE_ROOT/$abi/$PIPELINE")
            ?.use { it.readBytes() }
            ?: error("OCR pipeline missing for $abi")
        // Ship it as an asset, not lib/<abi>: with extractNativeLibs=false the linker can
        // only map a stored, page-aligned .so, and the packager deflates what we add here.
        val target = this["assets/mlkit-ocr/$abi/$PIPELINE", false]
        target.parentFile?.mkdirs()
        target.outputStream().use { it.write(bytes) }
    }
}

context(context: ResourcePatchContext)
private fun copyModelAssets() = with(context) {
    val loader = object {}.javaClass.classLoader ?: error("No classloader for OCR models")
    val files = MODEL_ASSETS.flatMap { relative -> listOf(relative) }
    var copied = 0
    for (relative in files) {
        val bytes = loader.getResourceAsStream("$RESOURCE_ROOT/$relative")?.use { it.readBytes() }
            ?: error("OCR model asset missing: $relative")
        val target = this["assets/mlkit-google-ocr-models/$relative", false]
        target.parentFile?.mkdirs()
        target.outputStream().use { it.write(bytes) }
        copied++
    }
    check(copied == files.size) { "Copied $copied of ${files.size} OCR model assets" }
}

private const val RESOURCE_ROOT = "mlkit-ocr-models"
private const val NATIVE_ROOT = "mlkit-ocr-native"
private const val PIPELINE = "libmlkit_google_ocr_pipeline.so"

/** Every file the pipeline reads, relative to assets/mlkit-google-ocr-models. */
private val MODEL_ASSETS = listOf(
    "aksara/aksara_page_layout_analysis_rpn_gcn.binarypb",
    "aksara/aksara_page_layout_analysis_ti_rpn_gcn.binarypb",
    "gocr/gocr_models/line_recognition_legacy_mobile/Latn_ctc/optical/assets.extra/LabelMap.pb",
    "gocr/gocr_models/line_recognition_legacy_mobile/Latn_ctc/optical/conv_model.fb",
    "gocr/gocr_models/line_recognition_legacy_mobile/Latn_ctc/optical/lstm_model.fb",
    "gocr/gocr_models/line_recognition_legacy_mobile/Latn_ctc_cpu.binarypb",
    "gocr/gocr_models/line_recognition_legacy_mobile/tflite_langid.tflite",
    "gocr/layout/line_clustering_custom_ops/model.tflite",
    "gocr/layout/line_splitting_custom_ops/model.tflite",
    "taser/detector/region_proposal_text_detector_tflite_vertical_mbv2_v1.bincfg",
    "taser/detector/rpn_text_detector_mobile_space_to_depth_quantized_mbv2_v1.tflite",
    "taser/rpn_text_detection_tflite_mobile_mbv2.binarypb",
    "taser/segmenter/tflite_script_detector_0.3.bincfg",
    "taser/segmenter/tflite_script_detector_0.3.conv_model",
    "taser/segmenter/tflite_script_detector_0.3.lstm_model",
    "taser/taser_script_identification_tflite_mobile.binarypb",
    "taser_tflite_gocrlatin_mbv2_scriptid_aksara_layout_gcn_mobile_engine.binarypb",
    "taser_tflite_gocrlatin_mbv2_scriptid_aksara_layout_gcn_mobile_engine_ti.binarypb",
    "taser_tflite_gocrlatin_mbv2_scriptid_aksara_layout_gcn_mobile_recognizer.binarypb",
    "taser_tflite_gocrlatin_mbv2_scriptid_aksara_layout_gcn_mobile_runner.binarypb",
    "taser_tflite_gocrlatin_mbv2_scriptid_aksara_layout_gcn_mobile_runner_ti.binarypb",
)
