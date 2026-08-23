package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAdvancedVoiceAsrSessionPatch = bytecodePatch(
    description = "讓 17.7.7 ASR session reset 使用可重接新 oration 的路徑。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        findMutableMethodOrThrow(GboardVersionBindings.advancedVoiceAsrSessionReset)
            .applyAdvancedVoiceAsrSessionReattachOverride()
    }
}

internal fun MutableMethod.applyAdvancedVoiceAsrSessionReattachOverride() {
    val instructions = implementation?.instructions
        ?: error("ASR session reset target has no implementation")
    val flagReadIndices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode.name.normalized() == "SGET_OBJECT" &&
            field?.definingClass == "Lqwz;" &&
            field.name == "Y" &&
            field.type == "Lnea;"
    }
    check(flagReadIndices.size == 1) {
        "Expected one qwz.Y ASR restart flag read in ${GboardVersionBindings.advancedVoiceAsrSessionReset.reference}"
    }

    val flagReadIndex = flagReadIndices.single()
    val flagRegister = (instructions[flagReadIndex] as? OneRegisterInstruction)?.registerA
        ?: error("qwz.Y flag read does not expose its destination register")
    requireMethodCall(instructions, flagReadIndex + 1, "Lnea;", "g", emptyList(), "Ljava/lang/Object;")
    requireRegisterInstruction(instructions, flagReadIndex + 2, "MOVE_RESULT_OBJECT", flagRegister)
    requireTypeReference(instructions, flagReadIndex + 3, "CHECK_CAST", "Ljava/lang/Boolean;", flagRegister)
    requireMethodCall(
        instructions,
        flagReadIndex + 4,
        "Ljava/lang/Boolean;",
        "booleanValue",
        emptyList(),
        "Z",
        flagRegister,
    )
    requireRegisterInstruction(instructions, flagReadIndex + 5, "MOVE_RESULT", flagRegister)

    val branchIndex = singleNearbyBranchUsingFlagRegister(
        instructions,
        flagReadIndex + 6,
        flagRegister,
    )
    val existingOverrideIndices = ((flagReadIndex + 6) until branchIndex).filter { index ->
        val instruction = instructions[index]
        instruction.opcode.name.normalized() == "CONST_4" &&
            (instruction as? OneRegisterInstruction)?.registerA == flagRegister &&
            (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 1
    }
    check(existingOverrideIndices.size <= 1) {
        "Duplicate ASR session reattach overrides"
    }
    if (existingOverrideIndices.size == 1) {
        return
    }

    addInstructions(flagReadIndex + 6, "const/4 v$flagRegister, 0x1")
}

private fun requireMethodCall(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    index: Int,
    owner: String,
    name: String,
    parameters: List<String>,
    returnType: String,
    receiverRegister: Int? = null,
) {
    val instruction = instructions.getOrNull(index)
        ?: error("Missing $owner->$name call in ASR restart flag chain")
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
    check(reference?.definingClass == owner &&
        reference.name == name &&
        reference.parameterTypes.toList() == parameters &&
        reference.returnType == returnType
    ) {
        "Unexpected ASR restart flag call at $index"
    }
    if (receiverRegister != null) {
        check((instruction as? FiveRegisterInstruction)?.registerC == receiverRegister) {
            "ASR restart flag call receiver drift at $index"
        }
    }
}

private fun requireRegisterInstruction(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    index: Int,
    opcode: String,
    register: Int,
) {
    val instruction = instructions.getOrNull(index)
        ?: error("Missing $opcode in ASR restart flag chain")
    check(instruction.opcode.name.normalized() == opcode &&
        (instruction as? OneRegisterInstruction)?.registerA == register
    ) {
        "Unexpected $opcode shape in ASR restart flag chain at $index"
    }
}

private fun requireTypeReference(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    index: Int,
    opcode: String,
    type: String,
    register: Int,
) {
    val instruction = instructions.getOrNull(index)
        ?: error("Missing $opcode in ASR restart flag chain")
    val reference = (instruction as? ReferenceInstruction)?.reference?.toString()
    check(instruction.opcode.name.normalized() == opcode &&
        (instruction as? OneRegisterInstruction)?.registerA == register &&
        reference == type
    ) {
        "Unexpected $opcode type in ASR restart flag chain at $index"
    }
}

private fun singleNearbyBranchUsingFlagRegister(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    searchStart: Int,
    register: Int,
): Int {
    val branchIndices = (searchStart until minOf(searchStart + 5, instructions.size))
        .filter { index ->
            val instruction = instructions[index]
            instruction.opcode.name.normalized() == "IF_EQZ" &&
                (instruction as? OneRegisterInstruction)?.registerA == register
        }
    check(branchIndices.size == 1) {
        "Expected one nearby ASR restart path branch for v$register"
    }
    return branchIndices.single()
}

private fun String.normalized(): String = uppercase().replace('-', '_')
