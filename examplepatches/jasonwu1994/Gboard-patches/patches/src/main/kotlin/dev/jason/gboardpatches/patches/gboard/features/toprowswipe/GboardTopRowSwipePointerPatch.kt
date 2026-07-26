package dev.jason.gboardpatches.patches.gboard.features.toprowswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwner1777RegisterContract
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMethodCall
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices

private val pointerTrackerClass = GboardVersionBindings.pointerOwner.classType

internal val TOP_ROW_SWIPE_POINTER_DELEGATE = topRowSwipePointerDelegate(
    GboardPointerOwner1777RegisterContract.stockRegisterCount,
)

internal val TOP_ROW_SWIPE_CLEAR_SESSION_DELEGATE = """
    invoke-static {p0}, $TOP_ROW_SWIPE_RUNTIME_CLASS->clearSwipeSession(Ljava/lang/Object;)V
""".trimIndent()

internal val TOP_ROW_SWIPE_FINISH_SESSION_DELEGATE = """
    invoke-static {p0}, $TOP_ROW_SWIPE_RUNTIME_CLASS->finishSwipeSession(Ljava/lang/Object;)V
""".trimIndent()

internal val gboardTopRowSwipePointerPatch = bytecodePatch(
    description = "攔第一排水平手勢 session 並在 gesture 結束時套用 pending page。"
) {
    execute {
        val pointerTrackMethod = findMutableMethodOrThrow(GboardVersionBindings.pointerOwner)
        pointerTrackMethod.applyTopRowSwipePointerDelegate()

        val finishMethod = findMutableMethodOrThrow(
            classType = pointerTrackerClass,
            name = "r",
            returnType = "V",
            parameterTypes = listOf("J", "I")
        )
        val finishReturns = finishMethod.returnInstructionIndices()
        check(finishReturns.isNotEmpty()) { "Unable to find return in Lpbl;->r(JI)V" }
        finishReturns.asReversed().forEach { returnIndex ->
            finishMethod.addInstructions(returnIndex, TOP_ROW_SWIPE_FINISH_SESSION_DELEGATE)
        }

        val cancelMethod = findMutableMethodOrThrow(GboardVersionBindings.pointerCancel)
        val cancelReturns = cancelMethod.returnInstructionIndices()
        check(cancelReturns.isNotEmpty()) { "Unable to find return in target pointer cancel" }
        cancelReturns.asReversed().forEach { returnIndex ->
            cancelMethod.addInstructions(returnIndex, TOP_ROW_SWIPE_CLEAR_SESSION_DELEGATE)
        }

        val resetMethod = findMutableMethodOrThrow(GboardVersionBindings.pointerReset)
        resetMethod.addInstructions(0, TOP_ROW_SWIPE_CLEAR_SESSION_DELEGATE)
    }
}

internal fun MutableMethod.applyTopRowSwipePointerDelegate() {
    val insertIndex = indexOfFirstMethodCall(
        definingClass = pointerTrackerClass,
        name = "ac",
        returnType = "V",
        parameterTypes = emptyList(),
    )
    check(insertIndex >= 0) { "Unable to find Lpbl;->ac()V inside target pointer owner" }
    val registerCount = implementation?.registerCount
        ?: error("Target pointer owner has no implementation")
    addInstructions(insertIndex + 1, topRowSwipePointerDelegate(registerCount))
}

private fun topRowSwipePointerDelegate(registerCount: Int): String {
    val registers = GboardPointerOwner1777RegisterContract.delegateRegisters(registerCount)
    return """
        invoke-static {${registers.receiver}, ${registers.softKey}, v3, v0, v1}, $TOP_ROW_SWIPE_RUNTIME_CLASS->maybeArmAndResolveTopRowOwner(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;FF)Ljava/lang/Object;

        move-result-object ${registers.softKey}

        check-cast ${registers.softKey}, Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;
    """.trimIndent()
}
