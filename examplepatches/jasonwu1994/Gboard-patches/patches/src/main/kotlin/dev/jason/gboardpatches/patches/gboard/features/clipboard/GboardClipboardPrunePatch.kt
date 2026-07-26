package dev.jason.gboardpatches.patches.gboard.features.clipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch

internal val gboardClipboardPrunePatch = bytecodePatch(
    description = "移植 clipboard DB prune 策略"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = CLIPBOARD_PRUNE_CALLABLE_CLASS,
            name = "call",
            returnType = "Ljava/lang/Object;",
            parameterTypes = emptyList()
        )
        mutableMethod.applyClipboardPruneDelegate()
    }
}

internal fun MutableMethod.applyClipboardPruneDelegate() {
    requireExactClipboardTarget(
        CLIPBOARD_PRUNE_CALLABLE_CLASS,
        "call",
        "Ljava/lang/Object;",
        emptyList(),
    )
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val delegateCount = instructions.count { it.methodDescriptor() == PRUNE_METHOD_DESCRIPTOR }
    val completed = instructions.size >= 5 &&
        instructions[0].isExactRangeInvoke(PRUNE_METHOD_DESCRIPTOR, p0Register(), 1) &&
        instructions[1].normalizedOpcode() == "MOVE_RESULT" &&
        (instructions[1] as? OneRegisterInstruction)?.registerA == 0 &&
        instructions[2].normalizedOpcode() == "IF_EQZ" &&
        (instructions[2] as? OneRegisterInstruction)?.registerA == 0 &&
        instructions[3].normalizedOpcode() == "CONST_4" &&
        (instructions[3] as? OneRegisterInstruction)?.registerA == 0 &&
        (instructions[3] as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
        instructions[4].normalizedOpcode() == "RETURN_OBJECT" &&
        (instructions[4] as? OneRegisterInstruction)?.registerA == 0
    if (instructions.clipboardRuntimeReferenceCount() > 0) {
        check(delegateCount == 1 && completed) {
            "Malformed partial Clipboard prune delegate in $definingClass->$name"
        }
        return
    }
    addInstructions(0, PRUNE_DELEGATE)
}

private val PRUNE_DELEGATE = """
    invoke-static/range {p0 .. p0}, ${CLIPBOARD_RUNTIME_CLASS}->handleCustomPrune(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :jasondev_continue

    const/4 v0, 0x0

    return-object v0

    :jasondev_continue
""".trimIndent()

private const val PRUNE_METHOD_DESCRIPTOR =
    "$CLIPBOARD_RUNTIME_CLASS->handleCustomPrune(Ljava/lang/Object;)Z"
