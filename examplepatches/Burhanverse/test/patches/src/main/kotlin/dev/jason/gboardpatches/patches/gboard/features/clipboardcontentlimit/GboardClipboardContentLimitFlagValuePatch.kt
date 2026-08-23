package dev.jason.gboardpatches.patches.gboard.features.clipboardcontentlimit

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
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val CLIPBOARD_CONTENT_LIMIT_RUNTIME_ABI = RuntimeAbiCatalog.abi(
    RuntimeCallId.CLIPBOARD_CONTENT_LIMIT_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE,
)

internal val gboardClipboardContentLimitFlagValuePatch = bytecodePatch(
    description = "在 text_clip_item_char_limit 原始結果後套用使用者設定值",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        mutableFieldOrThrow(GboardVersionBindings.flagNameField)
        findMutableMethodOrThrow(GboardVersionBindings.flagBoolGetter)
            .applyClipboardContentLimitFlagValueOverride()
    }
}

internal fun MutableMethod.applyClipboardContentLimitFlagValueOverride() {
    injectFeatureFlagReturnOverrides(
        runtimeClass = CLIPBOARD_CONTENT_LIMIT_RUNTIME_ABI.owner,
        overrideShape = FEATURE_FLAG_OVERRIDE_SHAPE_SHARED,
        unsafeResultRegisters = setOf(0, FEATURE_FLAG_RECEIVER_REGISTER),
        delegateTemplate = CLIPBOARD_CONTENT_LIMIT_DELEGATE_TEMPLATE,
    )
}

private val CLIPBOARD_CONTENT_LIMIT_DELEGATE_TEMPLATE = """
    iget-object v0, v1, ${GboardVersionBindings.flagNameField.reference}

    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.CLIPBOARD_CONTENT_LIMIT_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE,
        "v0, v$RESULT_REGISTER_TOKEN",
    )}

    move-result-object v$RESULT_REGISTER_TOKEN
""".trimIndent()
