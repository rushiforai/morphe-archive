package app.noam.patches.chesscom.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal fun Method.instructionList(): List<Instruction> =
    implementation?.instructions?.toList()
        ?: throw PatchException("$name has no implementation")

internal fun Method.indexOfFirst(startIndex: Int = 0, predicate: (Instruction) -> Boolean): Int {
    val instructions = instructionList()
    for (index in startIndex until instructions.size) {
        if (predicate(instructions[index])) return index
    }
    return -1
}

internal fun Method.indexOfFirstOrThrow(
    startIndex: Int = 0,
    description: String,
    predicate: (Instruction) -> Boolean,
): Int = indexOfFirst(startIndex, predicate).also {
    if (it < 0) throw PatchException("Could not find $description in $name")
}

internal fun Method.indexOfLast(endIndex: Int, predicate: (Instruction) -> Boolean): Int {
    val instructions = instructionList()
    for (index in (endIndex - 1) downTo 0) {
        if (predicate(instructions[index])) return index
    }
    return -1
}

internal fun MutableMethod.returnString(value: String) {
    replaceInstruction(0, "const-string v0, \"$value\"")
}

/**
 * A data class's getter for the field its toString() prints after the label (", mode=" and the
 * like), so obfuscated getter names need not be known. Kotlin reads every field into a register
 * first and appends them later, so the label's value register is traced back to its field.
 */
internal fun MutableClass.getterForLabel(label: String): MutableMethod {
    val code = methods.single { it.name == "toString" }.instructionList()
    val at = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == label }
    // label, append(label), append(value)
    val value = (code.getOrNull(at + 2) as? FiveRegisterInstruction)?.registerD?.takeIf { at >= 0 }
        ?: throw PatchException("$type has no $label")
    val field = code.take(at).lastOrNull { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        reference?.definingClass == type && (instruction as? TwoRegisterInstruction)?.registerA == value
    }?.let { (it as ReferenceInstruction).reference as FieldReference }
        ?: throw PatchException("$type's $label is not a field")
    return methods.firstOrNull { method ->
        method.parameterTypes.isEmpty() && method.returnType == field.type && !method.name.startsWith("component") &&
            method.implementation?.instructions?.toList()?.let { body ->
                body.size == 2 && ((body[0] as? ReferenceInstruction)?.reference as? FieldReference)?.name == field.name
            } == true
    } ?: throw PatchException("$type has no getter for $label")
}
