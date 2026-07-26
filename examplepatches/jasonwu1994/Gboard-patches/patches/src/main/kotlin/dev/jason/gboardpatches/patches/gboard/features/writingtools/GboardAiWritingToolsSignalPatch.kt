package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsSignalPatch = bytecodePatch(
    description = "只把 17.7.7 三個 Writing Tools signal 的 stock false 結果改成 true。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(
            classType = SIGNAL_GATE_CLASS,
            name = "e",
            returnType = "Z",
            parameterTypes = listOf(SIGNAL_MARKER_CLASS),
        ).applyWritingToolsSignalOverride()
    }
}

internal fun MutableMethod.applyWritingToolsSignalOverride() {
    val instructions = implementation?.instructions
        ?: error("No instructions available in $definingClass->$name")
    val parameterRegister = implementation!!.registerCount - 1
    val identityBranchIndices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        instruction.normalizedOpcode() == "IF_NE" &&
            instruction is TwoRegisterInstruction &&
            instruction.registerA == 0 &&
            instruction.registerB == parameterRegister
    }
    check(identityBranchIndices.size == 1) {
        "Expected exact IF_NE v0,p0 identity branch in $definingClass->$name"
    }
    val identityBranchIndex = identityBranchIndices.single()
    check(identityBranchIndex > 0) {
        "Identity branch has no producer in $definingClass->$name"
    }
    val preserveIndices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        instruction.normalizedOpcode() == "MOVE_OBJECT" &&
            instruction is TwoRegisterInstruction &&
            instruction.registerA == SIGNAL_SCRATCH_REGISTER &&
            instruction.registerB == parameterRegister
    }
    val producerIndex = if (preserveIndices.singleOrNull() == identityBranchIndex - 1) {
        identityBranchIndex - 2
    } else {
        identityBranchIndex - 1
    }
    val producer = instructions.getOrNull(producerIndex) as? OneRegisterInstruction
    check(producer != null &&
        instructions[producerIndex].normalizedOpcode() == "MOVE_RESULT_OBJECT" &&
        producer.registerA == 0) {
        "Identity branch producer changed in $definingClass->$name"
    }

    val returnIndices = returnInstructionIndices()
    check(returnIndices.size == 2) { "Expected two RETURN sites in $definingClass->$name" }
    val signalCalls = instructions.indices.filter { index ->
        instructions[index].signalMethodDescriptor() == SIGNAL_RESULT_DESCRIPTOR
    }
    val completedReturns = returnIndices.count { returnIndex ->
        if (returnIndex < 2) return@count false
        val moveResult = instructions[returnIndex - 1] as? OneRegisterInstruction
        val returned = instructions[returnIndex] as? OneRegisterInstruction
        returned != null &&
            instructions[returnIndex - 2].isExactWritingToolsStaticInvoke(
                SIGNAL_RESULT_DESCRIPTOR,
                SIGNAL_SCRATCH_REGISTER,
                returned.registerA,
            ) &&
            instructions[returnIndex - 1].normalizedOpcode() == "MOVE_RESULT" &&
            moveResult?.registerA == returned?.registerA
    }
    if (signalCalls.isNotEmpty() || preserveIndices.isNotEmpty()) {
        check(signalCalls.size == returnIndices.size &&
            preserveIndices.size == 1 &&
            preserveIndices.single() == identityBranchIndex - 1 &&
            completedReturns == returnIndices.size) {
            "Malformed partial Writing Tools signal override in $definingClass->$name"
        }
        return
    }

    returnIndices.asReversed().forEach { returnIndex ->
        val resultRegister = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
            ?: error("RETURN at $returnIndex does not expose registerA")
        addInstructions(returnIndex, buildSignalResultDelegate(resultRegister))
    }
    addInstructions(identityBranchIndex, "move-object v$SIGNAL_SCRATCH_REGISTER, p0")
}

private fun buildSignalResultDelegate(resultRegister: Int): String = """
    invoke-static {v$SIGNAL_SCRATCH_REGISTER, v$resultRegister}, $AI_WRITING_TOOLS_RUNTIME_CLASS->applySignalResult(Ljava/lang/Object;Z)Z

    move-result v$resultRegister
""".trimIndent()

private const val SIGNAL_SCRATCH_REGISTER = 1
private const val SIGNAL_RESULT_DESCRIPTOR =
    "$AI_WRITING_TOOLS_RUNTIME_CLASS->applySignalResult(Ljava/lang/Object;Z)Z"

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction
    .signalMethodDescriptor(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction
    .normalizedOpcode(): String = opcode.name.uppercase().replace('-', '_')
