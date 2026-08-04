package dev.jason.gboardpatches.patches.gboard.features.zhuyintraditionalsimplifiedtoggle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val BASIC_POPUP_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/popup/BasicPopupView;"

internal val gboardZhuyinTraditionalSimplifiedToggleRuntimePatch = bytecodePatch(
    description = "處理注音 ㄥ 上滑繁簡切換的 runtime 行為、可見鍵刷新與 popup 文案。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        installGestureDispatchHelpers()
        patchBasicPopupView()
    }
}

context(context: BytecodePatchContext)
internal fun BytecodePatchContext.installZhuyinToggleGestureDispatchHelpers() = with(this) {
    GboardVersionBindings.gestureDispatch.installHelper(
        context = this,
        name = "jasondevDispatchOrToggle",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 15,
        body = TARGET_GESTURE_DISPATCH_OR_TOGGLE_BODY
    )
}

internal val TARGET_GESTURE_DISPATCH_OR_TOGGLE_BODY = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ZHUYIN_TRADITIONAL_SIMPLIFIED_TOGGLE_RUNTIME_MAYBE_TOGGLE,
        "p0, p2, p4",
    )}

    move-result v0

    if-nez v0, :cond_return

    iget-object p0, p0, Lpbj;->o:Lpbh;

    invoke-interface/range {p0 .. p13}, Lpbh;->o(Lpbl;Loth;Loud;Lowd;JZZIZJI)V

    :cond_return
    return-void
""".trimIndent()

context(context: BytecodePatchContext)
private fun installGestureDispatchHelpers() = with(context) {
    installZhuyinToggleGestureDispatchHelpers()
}

context(context: BytecodePatchContext)
private fun patchBasicPopupView() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = BASIC_POPUP_VIEW_CLASS,
        name = "b",
        returnType = "Loud;",
        parameterTypes = listOf(
            "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;",
            "Landroid/view/View;",
            "F",
            "F",
            "Lotk;",
            "[I",
            "Z"
        )
    )
    mutableMethod.addInstructions(0, ZHUYIN_TOGGLE_POPUP_DELEGATE)
}

internal val ZHUYIN_TOGGLE_POPUP_DELEGATE = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ZHUYIN_TRADITIONAL_SIMPLIFIED_TOGGLE_RUNTIME_PATCH_POPUP_ACTION,
        "p2, p5",
    )}

    move-result-object p5

    check-cast p5, Lotk;
""".trimIndent()
