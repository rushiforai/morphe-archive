package dev.jason.gboardpatches.patches.gboard.features.writingtools

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun com.android.tools.smali.dexlib2.iface.instruction.Instruction
    .isExactWritingToolsStaticInvoke(descriptor: String, vararg registers: Int): Boolean {
    if (opcode != Opcode.INVOKE_STATIC || this !is FiveRegisterInstruction ||
        registerCount != registers.size ||
        ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString() != descriptor) {
        return false
    }
    val actualRegisters = intArrayOf(registerC, registerD, registerE, registerF, registerG)
    return registers.indices.all { index -> actualRegisters[index] == registers[index] }
}
