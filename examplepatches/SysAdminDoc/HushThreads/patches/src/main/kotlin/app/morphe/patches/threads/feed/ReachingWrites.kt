/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.feed

import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Whether this instruction writes [register], counting a wide write into the pair below it. */
internal fun Instruction.writes(register: Int) = opcode.setsRegister() && (this as? OneRegisterInstruction)?.registerA.let {
    it == register || opcode.setsWideRegister() && it == register - 1
}

/**
 * What reaches an instruction for some registers: the instructions whose write still holds there,
 * and whether some path from the method's entry gets there without writing any of them.
 */
internal data class Reaching(val writes: Set<Int>, val fromEntry: Boolean)

/**
 * What [registers] hold when the instruction at [index] runs, over every path there, handlers
 * included. An instruction that throws never writes its destination, so a handler still sees what
 * the register held before it.
 */
internal fun Method.reaching(index: Int, registers: Set<Int>): Reaching {
    val flow = ControlFlow.of(this)
    val into = Array(flow.instructions.size) { mutableListOf<Int>() }
    val thrownInto = Array(flow.instructions.size) { mutableListOf<Int>() }
    flow.normal.forEachIndexed { from, targets -> targets.forEach { into[it] += from } }
    flow.exceptional.forEachIndexed { from, targets -> targets.forEach { thrownInto[it] += from } }
    val writes = mutableSetOf<Int>()
    var fromEntry = false
    // Each instruction once as run and once as thrown.
    val seen = mutableSetOf<Pair<Int, Boolean>>()
    val pending = ArrayDeque<Pair<Int, Boolean>>()
    fun before(at: Int) {
        if (at == 0) fromEntry = true
        into[at].forEach { if (seen.add(it to false)) pending += it to false }
        thrownInto[at].forEach { if (seen.add(it to true)) pending += it to true }
    }
    before(index)
    while (pending.isNotEmpty()) {
        val (at, threw) = pending.removeFirst()
        if (!threw && registers.any { flow.instructions[at].writes(it) }) writes += at else before(at)
    }
    return Reaching(writes, fromEntry)
}
