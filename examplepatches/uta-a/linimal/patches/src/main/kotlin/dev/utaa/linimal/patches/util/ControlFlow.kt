package dev.utaa.linimal.patches.util

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.CallSiteReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MAX_UNCONDITIONAL_STEPS = 64

private val OBJECT_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

/**
 * [fromIndex] から fall-through と `goto` だけをたどって [targetIndex] に着いたとき、[aliases] と同じ値を
 * 持つ register の集合を返します。途中に条件分岐・switch・return・throw があれば、その経路は一本道では
 * ないため null を返します。invoke は [allowInvokes] が false なら同じく null にします（invoke 自体は
 * register を書き換えず、結果は続く move-result が書きます）。
 *
 * <p>`move-object` で値を写した register は集合に加え、別の値で上書きされた register は外します。
 * Compose の skip 側では composer を別 register へ写してから `skipToGroupEnd` を呼ぶため、register 番号の
 * 一致だけでは receiver の対応を確かめられません。</p>
 */
fun unconditionalPathAliases(
    instructions: List<Instruction>,
    fromIndex: Int,
    targetIndex: Int,
    aliases: Set<Int>,
    allowInvokes: Boolean = false,
): Set<Int>? {
    var address = 0
    val indexByAddress = instructions.withIndex().associate { (index, instruction) ->
        (address to index).also { address += instruction.codeUnits }
    }
    var current = aliases
    var index = fromIndex
    repeat(MAX_UNCONDITIONAL_STEPS) {
        if (index == targetIndex) {
            return current
        }
        val instruction = instructions.getOrNull(index) ?: return null
        val opcode = instruction.opcode
        when {
            opcode == Opcode.GOTO || opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32 -> {
                val offset = (instruction as OffsetInstruction).codeOffset
                index = indexByAddress[instructionAddress(instructions, index) + offset] ?: return null
                return@repeat
            }
            instruction is OffsetInstruction || !fallsThrough(instruction) || (!allowInvokes && isInvoke(instruction)) -> return null
            opcode in OBJECT_MOVES -> {
                val move = instruction as TwoRegisterInstruction
                current = if (move.registerB in current) current + move.registerA else current - move.registerA
            }
            else -> current = current.filterNot { instructionWritesRegister(instruction, it) }.toSet()
        }
        index++
    }
    return null
}

/**
 * Compose の `shouldExecute` 分岐で、false 側が同じ composer の `skipToGroupEnd` を経て `endRestartGroup` へ
 * 一本道で進むかどうか。抑制 gate はこの false 側へ合流させるため、ここが崩れていると抑制しても group が
 * 閉じず、Compose の slot table を壊します。
 *
 * @param shouldExecuteIndex `shouldExecute` の invoke。receiver を composer とみなします。
 * @param branchIndex `move-result` を受ける `if-eqz`。
 * @param skipIndex `skipToGroupEnd` の invoke。
 * @param endIndex `endRestartGroup` の invoke。
 */
fun composeSkipReachesGroupEnd(
    instructions: List<Instruction>,
    shouldExecuteIndex: Int,
    branchIndex: Int,
    skipIndex: Int,
    endIndex: Int,
): Boolean {
    val composer = receiverRegister(instructions.getOrNull(shouldExecuteIndex)) ?: return false
    // move-result が composer を上書きすると、分岐先で composer を持つ register が無くなります。
    val result = (instructions.getOrNull(shouldExecuteIndex + 1) as? OneRegisterInstruction)?.registerA
    if (result == null || result == composer || branchIndex != shouldExecuteIndex + 2) {
        return false
    }
    val skipTargetAddress = branchTargetAddress(instructions, branchIndex) ?: return false
    val skipTarget = instructions.indices.firstOrNull { instructionAddress(instructions, it) == skipTargetAddress }
        ?: return false

    val atSkip = unconditionalPathAliases(instructions, skipTarget, skipIndex, setOf(composer)) ?: return false
    if (receiverRegister(instructions[skipIndex]) !in atSkip) {
        return false
    }
    val atEnd = unconditionalPathAliases(instructions, skipIndex + 1, endIndex, atSkip) ?: return false
    return receiverRegister(instructions[endIndex]) in atEnd
}

private fun receiverRegister(instruction: Instruction?): Int? = when (instruction) {
    is FiveRegisterInstruction -> instruction.registerC.takeIf { instruction.registerCount > 0 }
    is RegisterRangeInstruction -> instruction.startRegister.takeIf { instruction.registerCount > 0 }
    else -> null
}

/** invoke 系の命令。method か call site を参照するのは invoke 系だけです。 */
private fun isInvoke(instruction: Instruction): Boolean {
    val reference = (instruction as? ReferenceInstruction)?.reference
    return reference is MethodReference || reference is CallSiteReference
}
