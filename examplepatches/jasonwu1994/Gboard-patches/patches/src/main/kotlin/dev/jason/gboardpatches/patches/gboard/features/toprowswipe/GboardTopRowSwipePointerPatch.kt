package dev.jason.gboardpatches.patches.gboard.features.toprowswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMethodCall

internal val TOP_ROW_SWIPE_POINTER_DELEGATE = """
    invoke-static {p0, p1, v3, v0, v1}, $TOP_ROW_SWIPE_RUNTIME_CLASS->maybeArmAndResolveTopRowOwner(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;FF)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;
""".trimIndent()

internal val TOP_ROW_SWIPE_CLEAR_SESSION_DELEGATE = """
    invoke-static {p0}, $TOP_ROW_SWIPE_RUNTIME_CLASS->clearSwipeSession(Ljava/lang/Object;)V
""".trimIndent()

internal val gboardTopRowSwipePointerPatch = bytecodePatch(
    description = "攔第一排水平手勢 session 並在 gesture 結束時套用 pending page。"
) {
    execute {
        val pointerTrackMethod = findMutableMethodOrThrow(
            classType = TOP_ROW_SWIPE_POINTER_TRACKER_CLASS,
            name = "B",
            returnType = "V",
            parameterTypes = listOf(
                "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;",
                "F",
                "F",
                "J",
                "I"
            )
        )
        val insertIndex = pointerTrackMethod.indexOfFirstMethodCall(
            definingClass = TOP_ROW_SWIPE_POINTER_TRACKER_CLASS,
            name = "ac",
            returnType = "V",
            parameterTypes = emptyList()
        )
        check(insertIndex >= 0) { "Unable to find Lofk->ac() call inside Lofk->B" }
        pointerTrackMethod.addInstructions(insertIndex + 1, TOP_ROW_SWIPE_POINTER_DELEGATE)

        val cancelMethod = findMutableMethodOrThrow(
            classType = TOP_ROW_SWIPE_POINTER_TRACKER_CLASS,
            name = "s",
            returnType = "V",
            parameterTypes = listOf("J")
        )
        cancelMethod.addInstructions(0, TOP_ROW_SWIPE_CLEAR_SESSION_DELEGATE)

        val resetMethod = findMutableMethodOrThrow(
            classType = TOP_ROW_SWIPE_POINTER_TRACKER_CLASS,
            name = "C",
            returnType = "V",
            parameterTypes = emptyList()
        )
        resetMethod.addInstructions(0, TOP_ROW_SWIPE_CLEAR_SESSION_DELEGATE)
    }
}
