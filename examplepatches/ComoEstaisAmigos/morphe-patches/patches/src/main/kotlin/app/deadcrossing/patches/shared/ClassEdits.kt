package app.deadcrossing.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal fun blankConstStrings(method: MutableMethod, keys: Collection<String>): MutableSet<String> {
    val remaining = keys.toMutableSet()
    val impl = method.implementation ?: throw PatchException("${method.name} has no code")
    impl.instructions.forEachIndexed { index, ins ->
        if (ins.opcode != Opcode.CONST_STRING && ins.opcode != Opcode.CONST_STRING_JUMBO) return@forEachIndexed
        val value = ((ins as ReferenceInstruction).reference as? StringReference)?.string ?: return@forEachIndexed
        if (value !in remaining) return@forEachIndexed
        val register = (ins as OneRegisterInstruction).registerA
        method.replaceInstruction(index, "const-string v$register, \"\"")
        remaining.remove(value)
    }
    return remaining
}
