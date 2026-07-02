package dev.jason.gboardpatches.patches.gboard.features.zhuyinbottomrow

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val SOFT_KEY_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"

internal const val ZHUYIN_BOTTOM_ROW_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/zhuyinbottomrow/GboardZhuyinBottomRowWeightRuntime;"

internal val ZHUYIN_BOTTOM_ROW_AFTER_BIND_DELEGATE = """
    invoke-static {p0}, $ZHUYIN_BOTTOM_ROW_RUNTIME_CLASS->afterSoftKeyBound(Ljava/lang/Object;)V
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
    val mutableMethod = findMutableMethodOrThrow(
        classType = SOFT_KEY_VIEW_CLASS,
        name = "p",
        returnType = "Z",
        parameterTypes = listOf("Loaa;", "J")
    )

    mutableMethod.returnInstructionIndices()
        .asReversed()
        .forEach { returnIndex ->
            mutableMethod.addInstructions(returnIndex, ZHUYIN_BOTTOM_ROW_AFTER_BIND_DELEGATE)
        }
}
