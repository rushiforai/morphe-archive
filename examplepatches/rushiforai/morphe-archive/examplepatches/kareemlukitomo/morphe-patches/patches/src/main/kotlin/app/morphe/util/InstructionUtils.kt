package app.morphe.util

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

fun Method.indexOfFirstInstruction(targetOpcode: Opcode): Int = indexOfFirstInstruction(0, targetOpcode)

fun Method.indexOfFirstInstruction(startIndex: Int = 0, targetOpcode: Opcode): Int =
    indexOfFirstInstruction(startIndex) { opcode == targetOpcode }

fun Method.indexOfFirstInstruction(startIndex: Int = 0, filter: Instruction.() -> Boolean): Int {
    var instructions = implementation?.instructions ?: return -1
    if (startIndex != 0) instructions = instructions.drop(startIndex)
    val index = instructions.indexOfFirst(filter)
    return if (index >= 0) startIndex + index else -1
}

val Instruction.registersUsed: List<Int>
    get() = when (this) {
        is FiveRegisterInstruction ->
            when (registerCount) {
                0 -> emptyList()
                1 -> listOf(registerC)
                2 -> listOf(registerC, registerD)
                3 -> listOf(registerC, registerD, registerE)
                4 -> listOf(registerC, registerD, registerE, registerF)
                else -> listOf(registerC, registerD, registerE, registerF, registerG)
            }

        is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
        is TwoRegisterInstruction -> listOf(registerA, registerB)
        is OneRegisterInstruction -> listOf(registerA)
        is RegisterRangeInstruction -> (startRegister until (startRegister + registerCount)).toList()
        else -> emptyList()
    }
