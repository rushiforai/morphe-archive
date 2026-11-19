package app.morphe.patches.all.text

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.all.shared.isControlFlow
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private fun argRegisters(ins: Instruction): List<Int>? = when (ins) {
    is FiveRegisterInstruction ->
        listOf(
            ins.registerC,
            ins.registerD,
            ins.registerE,
            ins.registerF,
            ins.registerG,
        )
            .take(ins.registerCount)
    is RegisterRangeInstruction ->
        (ins.startRegister until ins.startRegister + ins.registerCount).toList()
    else -> null
}

private fun forceTrueBool(method: MutableMethod, invokeIndex: Int, reg: Int) {
    for (j in invokeIndex - 1 downTo 0) {
        val ins = method.getInstruction(j)
        val op = ins.opcode

        if (ins is NarrowLiteralInstruction && ins is OneRegisterInstruction && ins.registerA == reg) {
            if (ins.narrowLiteral != 1) method.replaceInstruction(j, "const/4 v$reg, 0x1")
            return
        }

        if (isControlFlow(op)) return

        if (ins is OneRegisterInstruction && ins.registerA == reg) return
    }
}

@Suppress("unused")
val allowTextSelectionPatch =
    bytecodePatch(
        name = "Allow text selection",
        description =
        "Makes it so text can be selected and copied on apps that normally block it.",
        default = false,
    ) {
        execute {
            listOf(
                "setTextIsSelectable", // TextView
                "setLongClickable", // View / TextView
            )
                .forEach { name ->
                    // definingClass = null: match by name+signature on any receiver type
                    // (TextView, EditText, View...).
                    methodCall(name = name, parameters = listOf("Z"), returnType = "V")
                        .matchAllMethodIndicesForEach(requireMatches = false) { index ->
                            val regs =
                                argRegisters(getInstruction(index))
                                    ?: return@matchAllMethodIndicesForEach
                            if (regs.size >= 2) forceTrueBool(this, index, regs[1])
                        }
                }
        }
    }
