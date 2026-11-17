package app.morphed.patches.twitch.settings

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** The instructions' code addresses (in 16-bit units), by index. */
internal fun addresses(instructions: List<Instruction>): IntArray {
    val out = IntArray(instructions.size)
    var at = 0
    instructions.forEachIndexed { index, instruction ->
        out[index] = at
        at += instruction.codeUnits
    }
    return out
}

/** The indexes the instruction at index can go on to (fall through, jump, switch cases). */
internal fun successors(instructions: List<Instruction>, address: IntArray, index: Int): List<Int> {
    val instruction = instructions[index]
    val byAddress = { target: Int ->
        address.indexOfFirst { it == target }.also { check(it >= 0) { "No instruction at code address $target" } }
    }
    val opcode = instruction.opcode
    val out = mutableListOf<Int>()
    when {
        opcode.name.startsWith("return", ignoreCase = true) || opcode == Opcode.THROW -> Unit
        opcode == Opcode.PACKED_SWITCH || opcode == Opcode.SPARSE_SWITCH -> {
            val payload = instructions[byAddress(address[index] + (instruction as OffsetInstruction).codeOffset)]
            (payload as SwitchPayload).switchElements.forEach { out += byAddress(address[index] + it.offset) }
            out += index + 1
        }
        instruction is OffsetInstruction -> {
            out += byAddress(address[index] + instruction.codeOffset)
            if (!opcode.name.startsWith("goto", ignoreCase = true)) out += index + 1
        }
        else -> out += index + 1
    }
    return out.filter { it < instructions.size }
}

/** The registers an instruction reads. */
internal fun reads(instruction: Instruction): List<Int> = when (instruction) {
    is RegisterRangeInstruction ->
        (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
    is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE,
        instruction.registerF, instruction.registerG).take(instruction.registerCount)
    is ThreeRegisterInstruction -> listOf(instruction.registerB, instruction.registerC) +
        if (instruction.opcode.setsRegister()) emptyList() else listOf(instruction.registerA)
    is TwoRegisterInstruction -> listOf(instruction.registerB) +
        // (a /2addr operation reads its first register too, before writing it)
        if (instruction.opcode.setsRegister() && !instruction.opcode.name.endsWith("/2addr")) emptyList()
        else listOf(instruction.registerA)
    is OneRegisterInstruction -> if (instruction.opcode.setsRegister()) emptyList() else listOf(instruction.registerA)
    else -> emptyList()
}

/** The registers an instruction writes (both halves of a wide value). */
internal fun writes(instruction: Instruction): List<Int> {
    if (!instruction.opcode.setsRegister() || instruction !is OneRegisterInstruction) return emptyList()
    val register = instruction.registerA
    return if (instruction.opcode.setsWideRegister()) listOf(register, register + 1) else listOf(register)
}

/**
 * Fails unless the given registers are written again before anything reads them, along every path from the
 * instruction after index (jumps and switches followed): code injected there overwrites them. what names the
 * injection in the error.
 */
internal fun checkRegistersFree(method: Method, index: Int, registers: Set<Int>, what: String) {
    val instructions = method.implementation!!.instructions.toList()
    val address = addresses(instructions)
    // At each instruction, the registers still to be written on some path that got there: a smaller set at a
    // place already looked at needs no second look.
    val pending = HashMap<Int, Set<Int>>()
    val work = ArrayDeque<Pair<Int, Set<Int>>>()
    work += (index + 1) to registers
    while (work.isNotEmpty()) {
        val (at, open) = work.removeFirst()
        if (at >= instructions.size || open.isEmpty()) continue
        val before = pending[at]
        if (before != null && before.containsAll(open)) continue
        val merged = (before ?: emptySet()) + open
        pending[at] = merged
        val instruction = instructions[at]
        reads(instruction).firstOrNull { it in merged }?.let {
            error("${method.definingClass}->${method.name} still reads v$it after $what; the patch needs an update")
        }
        val stillOpen = merged - writes(instruction).toSet()
        successors(instructions, address, at).forEach { work += it to stillOpen }
    }
}

/** Fails if any jump or switch lands on the instruction at index: code injected before it would be skipped. */
internal fun checkNoJumpTo(method: Method, index: Int, what: String) {
    val instructions = method.implementation!!.instructions.toList()
    val address = addresses(instructions)
    instructions.indices.forEach { from ->
        val targets = successors(instructions, address, from).filter { it != from + 1 }
        check(index !in targets) {
            "${method.definingClass}->${method.name} jumps past where $what goes; the patch needs an update"
        }
    }
}
