package dev.jason.gboardpatches.patches.gboard.features.swipedismiss

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val dispatchHeaderTouchEvent = GboardMethodTarget(
    "Lcom/google/android/libraries/inputmethod/keyboard/impl/KeyboardViewHolder;",
    "dispatchTouchEvent",
    listOf("Landroid/view/MotionEvent;"),
    "Z",
)

private val setAccessPointsCustomizeState = GboardMethodTarget(
    "Lmln;",
    "Q",
    listOf("Z"),
    "V",
)

internal val gboardSwipeDownDismissTouchPatch = bytecodePatch(
    description = "Intercept header touch events while preserving native toolbar gestures.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(dispatchHeaderTouchEvent).applySwipeDownDismissTouchInterceptor()
        findMutableMethodOrThrow(setAccessPointsCustomizeState).applyToolbarEditModeDelegate()
    }
}

internal fun MutableMethod.applyToolbarEditModeDelegate() {
    val call = RuntimeCallId.SWIPE_DOWN_DISMISS_RUNTIME_ON_TOOLBAR_EDIT_MODE_CHANGED
    val abi = RuntimeAbiCatalog.abi(call)
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1 && instructions.first().isMethodReference(abi.reference)) {
            "Malformed toolbar edit-mode delegate in $definingClass->$name"
        }
        return
    }
    addInstructions(0, RuntimeCallEmitter.invoke(call, "p1 .. p1"))
}

internal fun MutableMethod.applySwipeDownDismissTouchInterceptor() {
    val call = RuntimeCallId.SWIPE_DOWN_DISMISS_RUNTIME_ON_HEADER_TOUCH
    val abi = RuntimeAbiCatalog.abi(call)
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1 && instructions.first().isMethodReference(abi.reference)) {
            "Malformed swipe-down dismiss touch interceptor in $definingClass->$name"
        }
        return
    }
    check(implementation!!.registerCount >= 3) { "No local register in $definingClass->$name" }
    addInstructions(0, "nop")
    val continuation = implementation!!.instructions[0]
    addInstructionsWithLabels(
        0,
        """
            ${RuntimeCallEmitter.invoke(call, "p0, p1")}
            move-result v0
            if-eqz v0, :continue_swipe_dismiss
            const/4 v0, 0x1
            return v0
        """.trimIndent(),
        ExternalLabel("continue_swipe_dismiss", continuation),
    )
}
