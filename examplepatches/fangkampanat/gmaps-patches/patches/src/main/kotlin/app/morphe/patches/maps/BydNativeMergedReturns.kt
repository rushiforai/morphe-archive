package app.morphe.patches.maps

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private val mergedReturnGotos = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val mergedReturnOpcodes = setOf(Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.RETURN_VOID)

/**
 * R8 may merge returns of one register: each early return becomes a goto to a single shared
 * return (Maps 26.42). Both exit with the same value. Returns the return instruction that
 * [index] exits through: itself, or the return its goto reaches directly; otherwise null.
 */
internal fun List<Instruction>.exitAt(index: Int): Instruction? {
    val instruction = getOrNull(index) ?: return null
    if (instruction.opcode in mergedReturnOpcodes) return instruction
    if (instruction.opcode !in mergedReturnGotos) return null
    val address = take(index).sumOf { it.codeUnits } + (instruction as OffsetInstruction).codeOffset
    var cursor = 0
    val target = indices.singleOrNull { val hit = cursor == address; cursor += get(it).codeUnits; hit } ?: return null
    return get(target).takeIf { it.opcode in mergedReturnOpcodes }
}

/** Exit points through [opcode]: each such return plus each goto that reaches one directly. */
internal fun List<Instruction>.mergedExitCount(opcode: Opcode) = indices.count { exitAt(it)?.opcode == opcode }

/** Opcodes that read a goto reaching a return as that return. */
internal fun List<Instruction>.exitOpcodes() = indices.map { exitAt(it)?.opcode ?: this[it].opcode }

/** Register returned through [index], whether it is the return itself or a goto to one. */
internal fun List<Instruction>.exitRegister(index: Int) = ((exitAt(index) ?: this[index]) as OneRegisterInstruction).registerA
