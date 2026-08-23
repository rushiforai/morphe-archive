package dev.jason.gboardpatches.patches.gboard.features.zhuyinbottomrow

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val ZHUYIN_BOTTOM_ROW_RUNTIME_CLASS = RuntimeAbiCatalog.abi(
    RuntimeCallId.ZHUYIN_BOTTOM_ROW_WEIGHT_RUNTIME_AFTER_SOFT_KEY_BOUND,
).owner

internal val ZHUYIN_BOTTOM_ROW_AFTER_BIND_DELEGATE = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ZHUYIN_BOTTOM_ROW_WEIGHT_RUNTIME_AFTER_SOFT_KEY_BOUND,
        "p0",
    )}
""".trimIndent()

internal const val ZHUYIN_BOTTOM_ROW_RETURN_INJECTION_MARKER = "returnInstructionIndices"

internal val gboardZhuyinBottomRowWeightSoftKeyPatch = bytecodePatch(
    description = "在 SoftKeyView bind 完成後套用注音底排 7-slot 權重覆寫。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectAfterBindDelegate()
    }
}

context(context: BytecodePatchContext)
private fun injectAfterBindDelegate() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(GboardVersionBindings.softKeyBind)

    mutableMethod.returnInstructionIndices()
        .asReversed()
        .forEach { returnIndex ->
            mutableMethod.addInstructions(returnIndex, ZHUYIN_BOTTOM_ROW_AFTER_BIND_DELEGATE)
        }
}
