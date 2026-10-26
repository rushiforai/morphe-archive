package app.sqzass.patches.shared

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// ponytail: constants are tracked forward through moves only, within a short
// straight-line window. Loads merged across branches or produced by helper
// methods are missed; upgrade path is a per-method data-flow pass.
private const val LOOKAHEAD = 12

private val MOVE_OPCODES = setOf(Opcode.MOVE, Opcode.MOVE_WIDE, Opcode.MOVE_OBJECT)
private val NARROW_CONST_OPCODES = setOf(
    Opcode.CONST_4,
    Opcode.CONST_16,
    Opcode.CONST,
    Opcode.CONST_HIGH16,
)

/** Registers read by [instruction], most-specific interface first (Five extends Three extends Two extends One). */
fun argumentRegisters(instruction: Instruction): Set<Int> = when (instruction) {
    is FiveRegisterInstruction -> listOf(
        instruction.registerC,
        instruction.registerD,
        instruction.registerE,
        instruction.registerF,
        instruction.registerG,
    ).take(instruction.registerCount).toSet()
    is RegisterRangeInstruction ->
        (instruction.startRegister until instruction.startRegister + instruction.registerCount).toSet()
    is ThreeRegisterInstruction -> setOf(instruction.registerA, instruction.registerB, instruction.registerC)
    is TwoRegisterInstruction -> setOf(instruction.registerA, instruction.registerB)
    is OneRegisterInstruction -> setOf(instruction.registerA)
    else -> emptySet()
}

/** The method reference of an invoke instruction, or null for non-invokes. */
fun methodReferenceOf(instruction: Instruction): MethodReference? =
    (instruction as? ReferenceInstruction)?.reference as? MethodReference

/** The payload of a const-string load, or null. */
fun constStringLoad(instruction: Instruction): String? =
    (instruction as? ReferenceInstruction)?.reference
        ?.let { it as? StringReference }?.string

/** The literal of a 32-bit const load, or null. */
fun narrowConstLoad(instruction: Instruction): Int? =
    if (instruction.opcode in NARROW_CONST_OPCODES && instruction is NarrowLiteralInstruction) {
        instruction.narrowLiteral
    } else {
        null
    }

/**
 * Indices of invokes matching [matchesInvoke] whose argument registers receive a
 * value loaded by a load matching [matchesLoad], following moves within [LOOKAHEAD].
 *
 * Each matching load contributes at most one invoke (fan-out through later moves
 * is not tracked) — see the ceiling note above.
 */
fun findConstArgInvokes(
    instructions: List<Instruction>,
    matchesLoad: (Instruction) -> Boolean,
    matchesInvoke: (Instruction) -> Boolean,
): Set<Int> = buildSet {
    for (index in instructions.indices) {
        val load = instructions[index]
        if (!matchesLoad(load)) continue
        val startRegister = (load as? OneRegisterInstruction)?.registerA ?: continue
        val derived = mutableSetOf(startRegister)
        for (i in index + 1 until minOf(index + 1 + LOOKAHEAD, instructions.size)) {
            val instruction = instructions[i]
            if (matchesInvoke(instruction) && argumentRegisters(instruction).any { it in derived }) {
                add(i)
                break
            }
            if (instruction.opcode in MOVE_OPCODES &&
                instruction is TwoRegisterInstruction
            ) {
                // A move overwrites its destination; drop any stale derived
                // value before possibly promoting a new one.
                derived.remove(instruction.registerA)
                if (instruction.registerB in derived) {
                    derived += instruction.registerA
                }
            }
        }
    }
}