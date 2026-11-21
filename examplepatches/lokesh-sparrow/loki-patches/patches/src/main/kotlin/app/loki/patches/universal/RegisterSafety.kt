/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.patches.universal

import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** Every register an instruction names. */
internal fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}

/**
 * True when every register in [registers] is overwritten before it is read again in [code], read straight through
 * from the start. Code inserted at that start may then use those registers freely: whatever it leaves in them is
 * dead. Stops at the first return or throw (nothing after it reads them) or at the end of [code].
 */
internal fun freeFrom(code: List<Instruction>, registers: Collection<Int>): Boolean {
    val pending = registers.toMutableSet()
    for (instruction in code) {
        if (pending.isEmpty()) return true
        val named = instruction.registers()
        val opcode = instruction.opcode
        val writes = opcode.setsRegister()
        val target = if (writes && instruction is OneRegisterInstruction) instruction.registerA else null
        val readsTarget = opcode.name.endsWith("_2ADDR")
        val reads = named.filterIndexed { index, register ->
            !(index == 0 && register == target && !readsTarget)
        }
        if (reads.any { it in pending }) return false
        if (target != null) {
            pending.remove(target)
            if (opcode.setsWideRegister()) pending.remove(target + 1)
        }
        if (opcode.name.startsWith("RETURN") || opcode.name == "THROW") return true
        // A branch could reach a read this straight scan never sees: not proven, so not free.
        if (opcode.name.startsWith("GOTO") || opcode.name.startsWith("IF_") || opcode.name.endsWith("SWITCH")) {
            return pending.isEmpty()
        }
    }
    return pending.isEmpty()
}
