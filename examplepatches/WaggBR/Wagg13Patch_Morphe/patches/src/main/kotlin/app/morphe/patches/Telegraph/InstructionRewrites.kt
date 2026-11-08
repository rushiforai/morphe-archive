package app.morphe.patches.telegraph

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Um filtro de Fingerprint só devolve a primeira ocorrência por método. Estes helpers varrem o
// método inteiro, porque o mesmo método pode chamar o alvo várias vezes.

/** Troca por `nop` toda chamada static void a [definingClass]. Retorna quantas trocou. */
internal fun MutableMethod.nopStaticCallsTo(definingClass: String): Int {
    val indexes = implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (instruction.opcode == Opcode.INVOKE_STATIC &&
            reference?.definingClass == definingClass &&
            reference.returnType == "V"
        ) index else null
    }
    indexes.reversed().forEach { replaceInstruction(it, "nop") }
    return indexes.size
}

/** Troca por `const/4 vX, 0x0` toda leitura iget-boolean do campo [name] de [definingClass]. */
internal fun MutableMethod.zeroBooleanFieldReads(definingClass: String, name: String): Int {
    val indexes = implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        if (instruction.opcode == Opcode.IGET_BOOLEAN &&
            reference?.definingClass == definingClass &&
            reference.name == name
        ) index else null
    }
    indexes.reversed().forEach { index ->
        val register = (implementation!!.instructions[index] as TwoRegisterInstruction).registerA
        replaceInstruction(index, "const/4 v$register, 0x0")
    }
    return indexes.size
}
