package dev.jason.gboardpatches.patches.gboard.features.rambler

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal fun MutableMethod.clearRamblerResetHeaderWithoutShowing() {
    check(definingClass == "Lflz;" && name == "J" && parameterTypes.isEmpty() && returnType == "V")
    val instructions = checkNotNull(implementation).instructions.toList()
    val index = instructions.indices.single {
        (instructions[it] as? ReferenceInstruction)?.reference?.toString() ==
            "Lkaf;->e(Ljava/lang/CharSequence;Lpsx;)V"
    }
    val call = instructions[index] as FiveRegisterInstruction
    val label = instructions.getOrNull(index - 2) as? ReferenceInstruction
    check(call.opcode == Opcode.INVOKE_VIRTUAL && call.registerCount == 3 &&
        (label?.reference as? StringReference)?.string == "" &&
        (label as? OneRegisterInstruction)?.registerA == call.registerD &&
        (instructions.getOrNull(index - 1) as? ReferenceInstruction)?.reference?.toString() ==
            "Lpsx;->a:Lpsx;" &&
        (instructions.getOrNull(index - 1) as? OneRegisterInstruction)?.registerA == call.registerE) {
        "Unexpected Rambler reset header call"
    }
    // e() acquires the voice header before setting text. Reset must only clear
    // the label; its existing b(true)/g(null) calls still release voice UI.
    replaceInstruction(index,
        "invoke-virtual {v${call.registerC}, v${call.registerD}}, Lkaf;->h(Ljava/lang/CharSequence;)V")
}
