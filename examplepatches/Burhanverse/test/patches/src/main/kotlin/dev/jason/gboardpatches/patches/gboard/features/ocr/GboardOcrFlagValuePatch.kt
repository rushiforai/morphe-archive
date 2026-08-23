package dev.jason.gboardpatches.patches.gboard.features.ocr

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import dev.jason.gboardpatches.patches.gboard.features.featureflags.FEATURE_FLAG_OVERRIDE_SHAPE_SHARED
import dev.jason.gboardpatches.patches.gboard.features.featureflags.FEATURE_FLAG_RECEIVER_REGISTER
import dev.jason.gboardpatches.patches.gboard.features.featureflags.RESULT_REGISTER_TOKEN
import dev.jason.gboardpatches.patches.gboard.features.featureflags.injectFeatureFlagReturnOverrides
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.mutableFieldOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardOcrFlagValuePatch = bytecodePatch(
    description = "強制啟用 stock OCR 入口與所有語言 gate。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        mutableFieldOrThrow(GboardVersionBindings.flagNameField)
        findMutableMethodOrThrow(GboardVersionBindings.flagBoolGetter)
            .applyOcrFlagValueOverride()
    }
}

internal fun MutableMethod.applyOcrFlagValueOverride() {
    injectFeatureFlagReturnOverrides(
        runtimeClass = OCR_RUNTIME_CLASS,
        overrideShape = FEATURE_FLAG_OVERRIDE_SHAPE_SHARED,
        unsafeResultRegisters = setOf(0, FEATURE_FLAG_RECEIVER_REGISTER),
        delegateTemplate = OCR_FLAG_VALUE_DELEGATE,
    )
}

private val OCR_FLAG_VALUE_DELEGATE = """
    iget-object v0, v1, ${GboardVersionBindings.flagNameField.reference}

    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.OCR_RUNTIME_APPLY_FLAG_VALUE,
        "v0, v$RESULT_REGISTER_TOKEN",
    )}

    move-result-object v$RESULT_REGISTER_TOKEN
""".trimIndent()

internal const val OCR_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/ocr/GboardOcrRuntime;"
