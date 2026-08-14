package dev.jason.gboardpatches.patches.gboard.features.cursortrackpad

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

private val CURSOR_TRACKPAD_RUNTIME_ABI = RuntimeAbiCatalog.abi(
    RuntimeCallId.CURSOR_TRACKPAD_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE,
)

internal val gboardCursorTrackpadFlagValuePatch = bytecodePatch(
    description = "在 free_cursor 與 free_cursor_lock_mode 原始結果後套用使用者設定值",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        mutableFieldOrThrow(GboardVersionBindings.flagNameField)
        findMutableMethodOrThrow(GboardVersionBindings.flagBoolGetter)
            .applyCursorTrackpadFlagValueOverride()
    }
}

internal fun MutableMethod.applyCursorTrackpadFlagValueOverride() {
    injectFeatureFlagReturnOverrides(
        runtimeClass = CURSOR_TRACKPAD_RUNTIME_ABI.owner,
        overrideShape = FEATURE_FLAG_OVERRIDE_SHAPE_SHARED,
        unsafeResultRegisters = setOf(0, FEATURE_FLAG_RECEIVER_REGISTER),
        delegateTemplate = CURSOR_TRACKPAD_DELEGATE_TEMPLATE,
    )
}

private val CURSOR_TRACKPAD_DELEGATE_TEMPLATE = """
    iget-object v0, v1, ${GboardVersionBindings.flagNameField.reference}

    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.CURSOR_TRACKPAD_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE,
        "v0, v$RESULT_REGISTER_TOKEN",
    )}

    move-result-object v$RESULT_REGISTER_TOKEN
""".trimIndent()
