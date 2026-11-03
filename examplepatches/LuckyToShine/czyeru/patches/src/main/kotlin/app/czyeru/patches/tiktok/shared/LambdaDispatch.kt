/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 * R8 lambda-group helpers from Hushfeed's LazyAbGate.kt, used by Comment tools.
 */
package app.czyeru.patches.tiktok.shared

import app.czyeru.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31t
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** R8's field holding the number that selects one lambda body from a merged group. */
private const val GROUP_INDEX_FIELD = "\$t"

/** How far back the constant handed to the factory is looked for. */
private const val CONSTANT_LOOKBACK = 4

/** How far past a switch target the call it makes is looked for. */
private const val TARGET_LOOKAHEAD = 4

/** Integer register copies R8 may place between a factory number and its call. */
private val INTEGER_MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)


/**
 * The constant the factory is handed: the last one loaded into the [register] the call reads,
 * looking back a few instructions. Matched on the register rather than on being the nearest
 * constant, because the initialiser loads other numbers around the call and the nearest one is
 * not necessarily the one handed over. One ordinary register move is followed, with a fresh
 * lookback from that move, because R8 may copy the number into the factory's argument register.
 */
internal fun constantBefore(instructions: List<Instruction>, at: Int, register: Int): Int? =
    constantBefore(instructions, at, register, followMove = true)

private fun constantBefore(
    instructions: List<Instruction>,
    at: Int,
    register: Int,
    followMove: Boolean,
): Int? {
    for (index in (at - 1) downTo maxOf(0, at - CONSTANT_LOOKBACK)) {
        val instruction = instructions[index]
        if (instruction is WideLiteralInstruction &&
            instruction.opcode.name.startsWith("const") &&
            (instruction as? OneRegisterInstruction)?.registerA == register
        ) {
            return instruction.wideLiteral.toInt()
        }
        if (!followMove || instruction.opcode !in INTEGER_MOVES) continue
        val move = instruction as? TwoRegisterInstruction ?: continue
        if (move.registerA != register) continue
        return constantBefore(instructions, index, move.registerB, followMove = false)
    }
    return null
}

/** Whether the method opens by switching on the group's own lambda number. */
internal fun Method.dispatchesOnIndex(): Boolean {
    val instructions = implementation?.instructions?.toList() ?: return false
    if (instructions.size < 2) return false
    val read = instructions[0]
    if (read.opcode != Opcode.IGET) return false
    val field = read.getReference<FieldReference>() ?: return false
    if (field.definingClass != definingClass ||
        field.name != GROUP_INDEX_FIELD ||
        field.type != "I"
    ) {
        return false
    }
    val switch = instructions[1]
    if (switch.opcode != Opcode.PACKED_SWITCH && switch.opcode != Opcode.SPARSE_SWITCH) return false
    return (read as? TwoRegisterInstruction)?.registerA ==
        (switch as? OneRegisterInstruction)?.registerA
}

/**
 * The method the switch this body opens with calls for [number].
 *
 * <p>Only the switch that follows the read of the number is consulted, the one
 * [dispatchesOnIndex] saw. A later switch in the same method is on something else, and an
 * answer read from it would be a body for some other value that happened to share the number.
 */
internal fun Method.dispatchTarget(group: ClassDef, number: Int): Method? {
    val instructions = implementation?.instructions?.toList() ?: return null
    if (!dispatchesOnIndex()) return null
    val addresses = IntArray(instructions.size)
    var address = 0
    instructions.forEachIndexed { index, instruction ->
        addresses[index] = address
        address += instruction.codeUnits
    }
    val switch = instructions[1] as? Instruction31t ?: return null
    val switchAddress = addresses[1]
    val payload = instructions.getOrNull(
        addresses.indexOf(switchAddress + switch.codeOffset),
    ) as? SwitchPayload ?: return null
    val element = payload.switchElements.firstOrNull { it.key == number } ?: return null
    val target = addresses.indexOf(switchAddress + element.offset)
    if (target < 0) return null
    for (candidate in target until minOf(instructions.size, target + TARGET_LOOKAHEAD)) {
        val call = instructions[candidate]
        if (call.opcode != Opcode.INVOKE_STATIC && call.opcode != Opcode.INVOKE_STATIC_RANGE) {
            continue
        }
        val reference = call.getReference<MethodReference>() ?: continue
        if (reference.definingClass != group.type) continue
        return group.methods.firstOrNull {
            it.name == reference.name &&
                it.parameterTypes.map(CharSequence::toString) ==
                reference.parameterTypes.map(CharSequence::toString) &&
                it.returnType == reference.returnType
        }
    }
    return null
}

/**
 * Whether the method is one of these gates' getters: read the lazy value, unwrap the number it
 * holds, answer from it.
 *
 * <p>The key says which class; this says the method on it is the one that reads the setting
 * rather than some other member of the same signature. The read is matched by the name and
 * shape of `getValue` alone, because the interface it is called on is `kotlin.Lazy` under a name
 * R8 assigns per build; what pins it down is the unwrap of a `Number` straight after.
 */
/**
 * Whether the method reads the lazy value itself, or through one static no-argument helper on
 * its own class that does. 46.9.3 splits the comment sort gate that way: `LIZ(Aweme)Z` asks
 * `LIZIZ()Z` on the same class and the read moved there with it, while the getter the patch
 * hooks kept its shape. One level, on the owner only: a helper elsewhere is some other gate.
 */
