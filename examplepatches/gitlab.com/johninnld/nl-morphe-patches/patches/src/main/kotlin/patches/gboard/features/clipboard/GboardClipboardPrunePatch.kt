package patches.gboard.features.clipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import patches.gboard.shared.VerifiedTransformationPlan
import patches.gboard.shared.VerifiedTransformationState
import patches.gboard.shared.applyVerified
import patches.gboard.shared.findMutableMethodOrThrow
import patches.gboard.shared.isMethodReference
import patches.gboard.shared.isOpcode
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import patches.gboard.shared.runtimeabi.RuntimeCallId

private val PRUNE_RUNTIME_CALL = RuntimeCallId.CLIPBOARD_RUNTIME_HANDLE_CUSTOM_PRUNE

internal val gboardClipboardPrunePatch = bytecodePatch(
    description = "Adjust the clipboard database prune policy."
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = CLIPBOARD_PRUNE_CALLABLE_CLASS,
            name = "h",
            returnType = "V",
            parameterTypes = emptyList()
        )
        mutableMethod.applyClipboardPruneDelegate()
    }
}

internal fun MutableMethod.applyClipboardPruneDelegate() {
    requireExactClipboardTarget(
        CLIPBOARD_PRUNE_CALLABLE_CLASS,
        "h",
        "V",
        emptyList(),
    )
    applyVerified(
        VerifiedTransformationPlan(
            targetName = "$CLIPBOARD_PRUNE_CALLABLE_CLASS->h()V",
            classify = MutableMethod::classifyClipboardPrune,
            mutate = { method ->
                method.addInstructions(0, PRUNE_DELEGATE)
                method
            },
        ),
    )
}

private fun MutableMethod.classifyClipboardPrune(): VerifiedTransformationState {
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val delegateCount = instructions.count { it.isMethodReference(PRUNE_METHOD_DESCRIPTOR) }
    val completed = instructions.size >= 4 &&
        instructions[0].isExactRangeInvoke(PRUNE_METHOD_DESCRIPTOR, p0Register(), 1) &&
        instructions[1].isOpcode("MOVE_RESULT") &&
        (instructions[1] as? OneRegisterInstruction)?.registerA == 0 &&
        instructions[2].isOpcode("IF_EQZ") &&
        (instructions[2] as? OneRegisterInstruction)?.registerA == 0 &&
        instructions.hasExactBranchTarget(2, 4) &&
        instructions[3].isOpcode("RETURN_VOID")
    return when (instructions.clipboardRuntimeReferenceCount()) {
        0 -> VerifiedTransformationState.STOCK
        1 -> if (delegateCount == 1 && completed) {
            VerifiedTransformationState.PATCHED
        } else {
            VerifiedTransformationState.MALFORMED
        }
        else -> VerifiedTransformationState.MALFORMED
    }
}

private val PRUNE_DELEGATE = """
    ${RuntimeCallEmitter.invoke(PRUNE_RUNTIME_CALL, "p0 .. p0")}

    move-result v0

    if-eqz v0, :jasondev_continue

    return-void

    :jasondev_continue
""".trimIndent()

private val PRUNE_METHOD_DESCRIPTOR = RuntimeAbiCatalog.abi(PRUNE_RUNTIME_CALL).reference
