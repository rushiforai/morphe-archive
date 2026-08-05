package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Neutralizes every `throw` instruction in [method] whose thrown value was
 * constructed via `new-instance ..., [exceptionType]` (identified by the
 * nearest preceding new-instance targeting the same register), leaving
 * everything else in the method -- including throws of other exception types
 * and any unrelated code sharing the method -- untouched.
 *
 * Each matching `throw` is replaced in place with `nop` rather than deleted.
 * `throw` (format 11x) and `nop` (format 10x) are both a single code unit, so
 * this can't shift any instruction addresses -- a deliberate precaution for
 * the control-flow-flattened methods this is used on, where a switch/dispatch
 * table could in principle jump directly at a specific instruction's address.
 * Confirmed safe on Qa.u0.m() and Q2.c.onReceive(), both of which contain a
 * packed-switch: unlike inserting new instructions with their own local
 * branch labels (which corrupted Qa.u0.m()'s packed-switch offset and caused
 * a VerifyError -- see git history), same-size in-place replacement leaves
 * every other instruction's address untouched, so there's nothing for the
 * packed-switch's own offset to get out of sync with.
 */
fun neutralizeExceptionThrows(method: MutableMethod, exceptionType: String) {
    val instructions = method.instructions

    val throwIndices = instructions.indices.filter { i ->
        val insn = instructions[i]
        if (insn.opcode != Opcode.THROW) return@filter false
        val throwReg = (insn as Instruction11x).registerA

        val nearestNewInstance = (i - 1 downTo maxOf(0, i - 15))
            .map { j -> instructions[j] }
            .firstOrNull { it.opcode == Opcode.NEW_INSTANCE && (it as Instruction21c).registerA == throwReg }
            as Instruction21c?

        nearestNewInstance != null &&
            (nearestNewInstance.reference as TypeReference).type == exceptionType
    }

    throwIndices.forEach { index ->
        method.replaceInstruction(index, "nop")
    }
}
