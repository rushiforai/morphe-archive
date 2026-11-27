package io.github.bryceaspringfield.morphe.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal fun MutableMethod.hookReturns(opcode: Opcode, smali: String) {
    instructions.withIndex().filter { it.value.opcode == opcode }.map { it.index }.reversed().forEach { index ->
        val ret = if (opcode == Opcode.RETURN_VOID) "return-void"
        else "${opcode.name} v${getInstruction<OneRegisterInstruction>(index).registerA}"
        val register = if (opcode == Opcode.RETURN_VOID) "" else ret.substringAfter(' ')
        val lines = smali.trimIndent().lines().map { it.trim() }.filter { it.isNotEmpty() }
            .map { it.replace("{reg}", register) }
        replaceInstruction(index, lines.first())
        addInstructions(index + 1, (lines.drop(1) + ret).joinToString("\n"))
    }
}
