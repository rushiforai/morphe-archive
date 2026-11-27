package dev.jason.gboardpatches.patches.gboard.features.swipedismiss

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardSwipeDismissBytecodePatch = bytecodePatch(
    description = "在 KeyboardViewHolder.dispatchTouchEvent 注入 header 下滑關閉手勢攔截器。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(
            classType = KEYBOARD_VIEW_HOLDER_CLASS,
            name = DISPATCH_TOUCH_EVENT_NAME,
            returnType = DISPATCH_TOUCH_EVENT_RETURN,
            parameterTypes = listOf(MOTION_EVENT_TYPE),
        ).applySwipeDismissTouchInterceptor()
    }
}

internal fun MutableMethod.applySwipeDismissTouchInterceptor() {
    val abi = RuntimeAbiCatalog.abi(
        RuntimeCallId.SWIPE_DISMISS_RUNTIME_ON_HEADER_TOUCH,
    )
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1 && instructions.first().isMethodReference(abi.reference)) {
            "Malformed swipe dismiss touch interceptor in $definingClass->$name"
        }
        return
    }
    addInstructions(0, "nop")
    val continuation = implementation!!.instructions[0]
    addInstructionsWithLabels(
        0,
        """
            ${RuntimeCallEmitter.invoke(
                RuntimeCallId.SWIPE_DISMISS_RUNTIME_ON_HEADER_TOUCH,
                "p0, p1",
            )}

            move-result v0

            if-eqz v0, :jasondev_continue_swipe_dismiss

            const/4 v0, 0x1

            return v0
        """.trimIndent(),
        ExternalLabel("jasondev_continue_swipe_dismiss", continuation),
    )
}

private const val KEYBOARD_VIEW_HOLDER_CLASS =
    "Lcom/google/android/libraries/inputmethod/keyboard/impl/KeyboardViewHolder;"
private const val DISPATCH_TOUCH_EVENT_NAME = "dispatchTouchEvent"
private const val MOTION_EVENT_TYPE = "Landroid/view/MotionEvent;"
private const val DISPATCH_TOUCH_EVENT_RETURN = "Z"
