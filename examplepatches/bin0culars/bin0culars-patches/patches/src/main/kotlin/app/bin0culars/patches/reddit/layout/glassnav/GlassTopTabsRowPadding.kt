package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HORIZONTAL_PADDING_LITERAL = 0x41800000

private fun isPaddingValuesCall(inst: Instruction): Boolean {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    val ref = if (isStatic) (inst as? ReferenceInstruction)?.reference as? MethodReference else null
    val params = ref?.parameterTypes?.map { it.toString() }
    return ref != null &&
        ref.returnType.startsWith("L") &&
        params == listOf("F", "F", "I")
}

private fun findPaddingConstIndex(instructions: List<Instruction>, callIndex: Int, reg: Int): Int? {
    val writerIndex = (callIndex - 1 downTo 0)
        .takeWhile { !isControlFlowBoundary(instructions[it].opcode) }
        .firstOrNull { idx ->
            val inst = instructions[idx]
            inst is OneRegisterInstruction && inst.opcode.setsRegister() && inst.registerA == reg
        } ?: return null
    val writer = instructions[writerIndex]
    return if (writer is NarrowLiteralInstruction && writer.narrowLiteral == HORIZONTAL_PADDING_LITERAL) {
        writerIndex
    } else {
        null
    }
}

internal fun hookTopTabsRowPadding(tabBarMethod: MutableMethod) {
    val instructions = tabBarMethod.instructions
    val hits = instructions.indices
        .filter { isPaddingValuesCall(instructions[it]) }
        .mapNotNull { callIdx ->
            instructions[callIdx].registersUsed.firstOrNull()?.let { reg ->
                findPaddingConstIndex(instructions, callIdx, reg)?.let { it to reg }
            }
        }
        .distinctBy { it.first }
        .sortedByDescending { it.first }

    for ((constIdx, vX) in hits) {
        tabBarMethod.addInstructions(
            constIdx + 1,
            """
                invoke-static/range { v$vX .. v$vX }, $SEARCH_EXTENSION_CLASS->tabsRowPadding(F)F
                move-result v$vX
            """.trimIndent(),
        )
    }
}
