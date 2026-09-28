package com.latanvillegas.lawnchair.patches.allapps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchFirst
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val ALL_APPS_CONTAINER =
    "Lcom/android/launcher3/allapps/ActivityAllAppsContainerView;"

/**
 * Targets only the legacy handle-area hit test inside shouldContainerScroll().
 *
 * APK #5155 bytecode sequence:
 *   iget-object v1, p0, ...->mBottomSheetHandleArea:Landroid/view/View;
 *   invoke-virtual {v0, v1, p1}, BaseDragLayer->isEventOverView(...)Z
 *   move-result v1
 *   if-eqz v1, ...
 *   return v2
 *
 * The resource patch removes the handle views. This patch removes the residual
 * hit-test without touching the search box, scrollbar or visible-container tests.
 */
private object BottomSheetHandleTouchFingerprint : Fingerprint(
    definingClass = ALL_APPS_CONTAINER,
    name = "shouldContainerScroll",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            smali = "$ALL_APPS_CONTAINER->mBottomSheetHandleArea:Landroid/view/View;",
            location = MatchFirst(),
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z",
            location = MatchAfterImmediately(),
        ),
    ),
)

@Suppress("unused")
val removeAllAppsHandleTouchPatch = bytecodePatch(
    name = "Remove All Apps handle touch area",
    description = "Removes the obsolete All Apps bottom-sheet handle hit target.",
) {
    compatibleWith(
        Compatibility(
            name = "Lawnchair Nightly",
            packageName = "app.lawnchair.nightly",
            appIconColor = 0x8BC34A,
        ),
    )

    execute {
        val callIndex = BottomSheetHandleTouchFingerprint.instructionMatches.last().index
        val method = BottomSheetHandleTouchFingerprint.method

        // Do not call isEventOverView() with the removed/null handle view.
        // Keep instruction positions valid: replace the invoke with nop and its
        // move-result with a literal false in the same result register (v1 in #5155).
        method.replaceInstruction(callIndex, "nop")
        method.replaceInstruction(callIndex + 1, "const/4 v1, 0x0")
    }
}
