package dev.srwi.gintype.patches.gboard.features.typingeffects

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import dev.srwi.gintype.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.srwi.gintype.patches.gboard.shared.isMethodReference
import dev.srwi.gintype.patches.gboard.shared.mutableClass
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.srwi.gintype.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val SOFT_KEYBOARD_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;"
private const val GESTURE_OVERLAY_VIEW_CLASS =
    "Lcom/google/android/apps/inputmethod/libs/gestureui/GestureOverlayView;"

internal val gboardTypingEffectsBytecodePatch = bytecodePatch(
    description = "Hooks SoftKeyboardView touch/detach lifecycle and GestureOverlayView.onDraw for visual typing effects.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val softKeyboardViewClass = mutableClass(SOFT_KEYBOARD_VIEW_CLASS)

        // 1. SoftKeyboardView.dispatchTouchEvent(MotionEvent)Z
        val dispatchTouchMethod = softKeyboardViewClass.methods.firstOrNull {
            it.name == "dispatchTouchEvent" &&
                it.returnType == "Z" &&
                it.parameterTypes == listOf("Landroid/view/MotionEvent;")
        } ?: throw PatchException(
            "Could not find dispatchTouchEvent(MotionEvent) in $SOFT_KEYBOARD_VIEW_CLASS",
        )
        val touchAbi = RuntimeAbiCatalog.abi(RuntimeCallId.TYPING_EFFECTS_RUNTIME_ON_KEYBOARD_TOUCH_EVENT)
        val existingTouchHooks = dispatchTouchMethod.implementation?.instructions
            ?.count { it.isMethodReference(touchAbi.reference) } ?: 0
        if (existingTouchHooks == 0) {
            val touchInvoke = RuntimeCallEmitter.invoke(
                RuntimeCallId.TYPING_EFFECTS_RUNTIME_ON_KEYBOARD_TOUCH_EVENT,
                "p0, p1",
            )
            dispatchTouchMethod.addInstructions(0, touchInvoke)
        }

        // 2. SoftKeyboardView.onDetachedFromWindow()V
        val detachMethod = softKeyboardViewClass.methods.firstOrNull {
            it.name == "onDetachedFromWindow" &&
                it.returnType == "V" &&
                it.parameterTypes.isEmpty()
        } ?: throw PatchException(
            "Could not find onDetachedFromWindow() in $SOFT_KEYBOARD_VIEW_CLASS",
        )
        val detachAbi = RuntimeAbiCatalog.abi(RuntimeCallId.TYPING_EFFECTS_RUNTIME_ON_KEYBOARD_DETACHED)
        val existingDetachHooks = detachMethod.implementation?.instructions
            ?.count { it.isMethodReference(detachAbi.reference) } ?: 0
        if (existingDetachHooks == 0) {
            val detachInvoke = RuntimeCallEmitter.invoke(
                RuntimeCallId.TYPING_EFFECTS_RUNTIME_ON_KEYBOARD_DETACHED,
                "p0",
            )
            detachMethod.addInstructions(0, detachInvoke)
        }

        // 3. GestureOverlayView.onDraw(Canvas)V — suppress stock swipe trail when Rainbow Swipe Trail is active
        val gestureOverlayViewClass = mutableClass(GESTURE_OVERLAY_VIEW_CLASS)
        val onDrawMethod = gestureOverlayViewClass.methods.firstOrNull {
            it.name == "onDraw" &&
                it.returnType == "V" &&
                it.parameterTypes == listOf("Landroid/graphics/Canvas;")
        } ?: throw PatchException(
            "Could not find onDraw(Canvas) in $GESTURE_OVERLAY_VIEW_CLASS",
        )
        val suppressAbi = RuntimeAbiCatalog.abi(RuntimeCallId.TYPING_EFFECTS_RUNTIME_SHOULD_SUPPRESS_STOCK_TRAIL)
        val existingSuppressHooks = onDrawMethod.implementation?.instructions
            ?.count { it.isMethodReference(suppressAbi.reference) } ?: 0
        if (existingSuppressHooks == 0) {
            val regCount = onDrawMethod.implementation?.registerCount ?: 0
            if (regCount < 3) {
                throw PatchException(
                    "onDraw(Canvas) in $GESTURE_OVERLAY_VIEW_CLASS has insufficient local registers ($regCount)",
                )
            }
            val suppressInvoke = RuntimeCallEmitter.invoke(
                RuntimeCallId.TYPING_EFFECTS_RUNTIME_SHOULD_SUPPRESS_STOCK_TRAIL,
                "p0",
            )
            onDrawMethod.addInstructionsWithLabels(
                0,
                """
                    $suppressInvoke
                    move-result v0
                    if-eqz v0, :typing_effects_allow_stock_trail
                    return-void
                    :typing_effects_allow_stock_trail
                    nop
                """.trimIndent(),
            )
        }
    }
}
