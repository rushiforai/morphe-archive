package dev.jason.gboardpatches.patches.gboard.features.zhuyinslide

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwner1777RegisterContract
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerFeature
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerFeatureSpec
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerTransformationContext
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerTransformationAdapter
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMethodCall
import dev.jason.gboardpatches.patches.gboard.shared.gboardPointerOwnerFeaturePatch
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

private val pointerTrackerClass = GboardVersionBindings.pointerOwnerType.descriptor

internal val ZHUYIN_SLIDE_POINTER_PRE_RESET_DELEGATE = zhuyinSlidePointerPreResetDelegate(
    GboardPointerOwner1777RegisterContract.stockRegisterCount,
)

internal val ZHUYIN_SLIDE_CLEAR_POINTER_DELEGATE = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ZHUYIN_SLIDE_RUNTIME_CLEAR_POINTER_STATE, "p0")}
""".trimIndent()

internal val gboardZhuyinSlidePointerAnchorTransformation =
    GboardPointerOwnerTransformationAdapter { context ->
        context.pointerOwnerMethod.applyZhuyinSlidePointerDelegate()
        context.injectPointerCleanup()
}

private val gboardZhuyinSlidePointerAnchorSpec = GboardPointerOwnerFeatureSpec(
    feature = GboardPointerOwnerFeature.ZHUYIN_SLIDE,
    transformation = gboardZhuyinSlidePointerAnchorTransformation,
)

internal val gboardZhuyinSlidePointerAnchorPatch = gboardPointerOwnerFeaturePatch(
    description = "在 17.7.7 pbl reset 前固定普通注音滑動的起始 key。",
    spec = gboardZhuyinSlidePointerAnchorSpec,
)

internal fun MutableMethod.applyZhuyinSlidePointerDelegate() {
    val rCallIndex = indexOfFirstMethodCall(
        definingClass = pointerTrackerClass,
        name = "r",
        returnType = "V",
        parameterTypes = listOf("J", "I")
    )
    val acCallIndex = indexOfFirstMethodCall(
        definingClass = pointerTrackerClass,
        name = "ac",
        returnType = "V",
        parameterTypes = emptyList()
    )
    check(rCallIndex >= 0) { "Unable to find target pbl->r(JI)V inside pointer owner" }
    check(acCallIndex >= 0) { "Unable to find target pbl->ac()V inside pointer owner" }
    check(rCallIndex < acCallIndex) {
        "Target pointer owner must finish the prior session before resetting tracker state"
    }

    addInstructions(rCallIndex, "nop")
    val continuationInstruction = implementation!!.instructions[rCallIndex]
    addInstructionsWithLabels(
        rCallIndex,
        zhuyinSlidePointerPreResetDelegate(implementation!!.registerCount),
        ExternalLabel(
            "jasondev_continue_zhuyin_slide_pointer_owner",
            continuationInstruction
        )
    )
}

private fun zhuyinSlidePointerPreResetDelegate(registerCount: Int): String {
    val registers = GboardPointerOwner1777RegisterContract.delegateRegisters(registerCount)
    return """
        ${RuntimeCallEmitter.invoke(
            RuntimeCallId.ZHUYIN_SLIDE_RUNTIME_MAYBE_CAPTURE_AND_SHOULD_SUPPRESS_RETARGET,
            "${registers.receiver}, ${registers.softKey}, v0, v1",
        )}

        move-result v4

        if-eqz v4, :jasondev_continue_zhuyin_slide_pointer_owner

        return-void
    """.trimIndent()
}

private fun GboardPointerOwnerTransformationContext.injectPointerCleanup() {
    pointerCancelMethod.addInstructions(0, ZHUYIN_SLIDE_CLEAR_POINTER_DELEGATE)
    pointerResetMethod.addInstructions(0, ZHUYIN_SLIDE_CLEAR_POINTER_DELEGATE)
}
