package dev.jason.gboardpatches.patches.gboard.features.zhuyinslide

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwner1777RegisterContract
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMethodCall
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val pointerTrackerClass = GboardVersionBindings.pointerOwner.classType

internal val ZHUYIN_SLIDE_POINTER_PRE_RESET_DELEGATE = zhuyinSlidePointerPreResetDelegate(
    GboardPointerOwner1777RegisterContract.stockRegisterCount,
)

internal val ZHUYIN_SLIDE_CLEAR_POINTER_DELEGATE = """
    invoke-static {p0}, $ZHUYIN_SLIDE_RUNTIME_CLASS->clearPointerState(Ljava/lang/Object;)V
""".trimIndent()

internal val gboardZhuyinSlidePointerAnchorPatch = bytecodePatch(
    description = "在 17.7.7 pbl reset 前固定普通注音滑動的起始 key。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectPointerOwner()
        injectPointerCleanup()
    }
}

context(context: BytecodePatchContext)
private fun injectPointerOwner() = with(context) {
    val pointerOwnerMethod = findMutableMethodOrThrow(GboardVersionBindings.pointerOwner)
    pointerOwnerMethod.applyZhuyinSlidePointerDelegate()
}

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
        invoke-static {${registers.receiver}, ${registers.softKey}, v0, v1}, $ZHUYIN_SLIDE_RUNTIME_CLASS->maybeCaptureAndShouldSuppressRetarget(Ljava/lang/Object;Ljava/lang/Object;FF)Z

        move-result v4

        if-eqz v4, :jasondev_continue_zhuyin_slide_pointer_owner

        return-void
    """.trimIndent()
}

context(context: BytecodePatchContext)
private fun injectPointerCleanup() = with(context) {
    val cancelMethod = findMutableMethodOrThrow(GboardVersionBindings.pointerCancel)
    cancelMethod.addInstructions(0, ZHUYIN_SLIDE_CLEAR_POINTER_DELEGATE)

    val resetMethod = findMutableMethodOrThrow(GboardVersionBindings.pointerReset)
    resetMethod.addInstructions(0, ZHUYIN_SLIDE_CLEAR_POINTER_DELEGATE)
}
