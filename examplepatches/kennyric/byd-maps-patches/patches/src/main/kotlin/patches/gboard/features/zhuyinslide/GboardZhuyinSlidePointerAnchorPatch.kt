package patches.gboard.features.zhuyinslide

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import patches.gboard.shared.GboardPointerOwnerRegisterContract
import patches.gboard.shared.GboardPointerOwnerFeature
import patches.gboard.shared.GboardPointerOwnerFeatureSpec
import patches.gboard.shared.GboardPointerOwnerTransformationContext
import patches.gboard.shared.GboardPointerOwnerTransformationAdapter
import patches.gboard.shared.generated.GboardVersionBindings
import patches.gboard.shared.indexOfFirstMethodCall
import patches.gboard.shared.gboardPointerOwnerFeaturePatch
import patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import patches.gboard.shared.runtimeabi.RuntimeCallId

private val pointerTrackerClass: String
    get() = GboardVersionBindings.pointerOwnerType.descriptor

internal val ZHUYIN_SLIDE_POINTER_PRE_RESET_DELEGATE by lazy {
    zhuyinSlidePointerPreResetDelegate(GboardPointerOwnerRegisterContract.stockRegisterCount)
}

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
    description = "Pin the slide origin key before the pvi reset.",
    spec = gboardZhuyinSlidePointerAnchorSpec,
)

internal fun MutableMethod.applyZhuyinSlidePointerDelegate() {
    val finish = GboardVersionBindings.pointerFinish
    val rCallIndex = indexOfFirstMethodCall(
        definingClass = finish.ownerDescriptor,
        name = finish.name,
        returnType = finish.returnType,
        parameterTypes = finish.parameterTypes,
    )
    val preReset = GboardVersionBindings.pointerPreReset
    val acCallIndex = indexOfFirstMethodCall(
        definingClass = preReset.ownerDescriptor,
        name = preReset.name,
        returnType = preReset.returnType,
        parameterTypes = preReset.parameterTypes,
    )
    check(rCallIndex >= 0) { "Unable to find ${finish.reference} inside pointer owner" }
    check(acCallIndex >= 0) { "Unable to find ${preReset.reference} inside pointer owner" }
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
    val registers = GboardPointerOwnerRegisterContract.delegateRegisters(registerCount)
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
