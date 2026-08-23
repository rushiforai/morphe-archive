package dev.jason.gboardpatches.patches.gboard.features.zhuyinslide

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.toprowswipe.TOP_ROW_SWIPE_RUNTIME_CLASS
import dev.jason.gboardpatches.patches.gboard.features.zhuyintraditionalsimplifiedtoggle.ZHUYIN_TOGGLE_RUNTIME_CLASS
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMethodCall
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val SOFT_KEY_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
private val ENGLISH_UPPERCASE_RUNTIME_CLASS = RuntimeAbiCatalog.abi(
    RuntimeCallId.ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_ENABLED,
).owner
private val softKeyMetadataType = GboardVersionBindings.softKeyMetadataType.descriptor

internal val ZHUYIN_SLIDE_SOFT_KEY_DELEGATE = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ZHUYIN_SLIDE_RUNTIME_PATCH_INCOMING_SOFT_KEY_METADATA,
        "p0, p1",
    )}

    move-result-object p1

    check-cast p1, $softKeyMetadataType
""".trimIndent()

internal val gboardZhuyinSlideSoftKeyPatch = bytecodePatch(
    description = "在 17.7.7 SoftKeyView bind 最後補齊普通注音上下滑 action。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectSoftKeyDelegateAfterExistingRewrites()
    }
}

context(context: BytecodePatchContext)
private fun injectSoftKeyDelegateAfterExistingRewrites() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(GboardVersionBindings.softKeyBind)
    val topRowEnd = mutableMethod.indexOfFirstMethodCall(
        definingClass = TOP_ROW_SWIPE_RUNTIME_CLASS,
        name = "patchIncomingSoftKeyMetadata",
        returnType = "Ljava/lang/Object;",
        parameterTypes = listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
    ).let { callIndex -> if (callIndex >= 0) callIndex + 3 else 0 }
    val toggleEnd = mutableMethod.indexOfFirstMethodCall(
        definingClass = ZHUYIN_TOGGLE_RUNTIME_CLASS,
        name = "patchIncomingSoftKeyMetadata",
        returnType = "Ljava/lang/Object;",
        parameterTypes = listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
    ).let { callIndex -> if (callIndex >= 0) callIndex + 3 else 0 }
    val englishEnd = mutableMethod.indexOfFirstMethodCall(
        definingClass = SOFT_KEY_VIEW_CLASS,
        name = "jasondevPatchIncomingMetadata",
        returnType = softKeyMetadataType,
        parameterTypes = listOf(softKeyMetadataType)
    ).let { callIndex -> if (callIndex >= 0) callIndex + 2 else 0 }
    val insertIndex = maxOf(0, topRowEnd, toggleEnd, englishEnd)

    mutableMethod.addInstructions(insertIndex, ZHUYIN_SLIDE_SOFT_KEY_DELEGATE)
}
