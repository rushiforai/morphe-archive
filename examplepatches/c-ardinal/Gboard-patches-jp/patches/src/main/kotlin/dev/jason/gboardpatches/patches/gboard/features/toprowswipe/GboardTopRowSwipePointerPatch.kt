package dev.jason.gboardpatches.patches.gboard.features.toprowswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerRegisterContract
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerFeature
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerFeatureSpec
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerTransformationContext
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerTransformationAdapter
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMethodCall
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.gboardPointerOwnerFeaturePatch
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

private val pointerTrackerClass: String
    get() = GboardVersionBindings.pointerOwnerType.descriptor

internal val TOP_ROW_SWIPE_POINTER_DELEGATE by lazy {
    topRowSwipePointerDelegate(GboardPointerOwnerRegisterContract.stockRegisterCount)
}

internal val TOP_ROW_SWIPE_CLEAR_SESSION_DELEGATE = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_CLEAR_SWIPE_SESSION, "p0")}
""".trimIndent()

internal val TOP_ROW_SWIPE_FINISH_SESSION_DELEGATE = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_FINISH_SWIPE_SESSION, "p0")}
""".trimIndent()

internal val gboardTopRowSwipePointerTransformation =
    GboardPointerOwnerTransformationAdapter { context ->
        context.pointerOwnerMethod.applyTopRowSwipePointerDelegate()

        val finishReturns = context.pointerFinishMethod.returnInstructionIndices()
        check(finishReturns.isNotEmpty()) {
            "Unable to find return in ${GboardVersionBindings.pointerFinish.reference}"
        }
        finishReturns.asReversed().forEach { returnIndex ->
            context.pointerFinishMethod.addInstructions(
                returnIndex,
                TOP_ROW_SWIPE_FINISH_SESSION_DELEGATE,
            )
        }

        val cancelReturns = context.pointerCancelMethod.returnInstructionIndices()
        check(cancelReturns.isNotEmpty()) { "Unable to find return in target pointer cancel" }
        cancelReturns.asReversed().forEach { returnIndex ->
            context.pointerCancelMethod.addInstructions(
                returnIndex,
                TOP_ROW_SWIPE_CLEAR_SESSION_DELEGATE,
            )
        }

        context.pointerResetMethod.addInstructions(0, TOP_ROW_SWIPE_CLEAR_SESSION_DELEGATE)
}

private val gboardTopRowSwipePointerSpec = GboardPointerOwnerFeatureSpec(
    feature = GboardPointerOwnerFeature.TOP_ROW_SWIPE,
    transformation = gboardTopRowSwipePointerTransformation,
)

internal val gboardTopRowSwipePointerPatch = gboardPointerOwnerFeaturePatch(
    description = "攔第一排水平手勢 session 並在 gesture 結束時套用 pending page。",
    spec = gboardTopRowSwipePointerSpec,
)

internal fun MutableMethod.applyTopRowSwipePointerDelegate() {
    val preReset = GboardVersionBindings.pointerPreReset
    val insertIndex = indexOfFirstMethodCall(
        definingClass = preReset.ownerDescriptor,
        name = preReset.name,
        returnType = preReset.returnType,
        parameterTypes = preReset.parameterTypes,
    )
    check(insertIndex >= 0) { "Unable to find ${preReset.reference} inside target pointer owner" }
    val registerCount = implementation?.registerCount
        ?: error("Target pointer owner has no implementation")
    addInstructions(insertIndex + 1, topRowSwipePointerDelegate(registerCount))
}

private fun topRowSwipePointerDelegate(registerCount: Int): String {
    val registers = GboardPointerOwnerRegisterContract.delegateRegisters(registerCount)
    return """
        ${RuntimeCallEmitter.invoke(
            RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_MAYBE_ARM_AND_RESOLVE_TOP_ROW_OWNER,
            "${registers.receiver}, ${registers.softKey}, v3, v0, v1",
        )}

        move-result-object ${registers.softKey}

        check-cast ${registers.softKey}, ${GboardVersionBindings.softKeyViewType.descriptor}
    """.trimIndent()
}
