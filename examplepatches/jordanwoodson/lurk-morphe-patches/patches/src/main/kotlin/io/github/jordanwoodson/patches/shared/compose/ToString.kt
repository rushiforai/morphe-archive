package io.github.jordanwoodson.patches.shared.compose

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val FIELD_READS = setOf(
    Opcode.IGET, Opcode.IGET_WIDE, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN, Opcode.IGET_BYTE, Opcode.IGET_CHAR,
    Opcode.IGET_SHORT,
)
private val RETURNS = setOf(Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT)
private val MOVES = setOf(
    Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16, Opcode.MOVE_WIDE, Opcode.MOVE_WIDE_FROM16, Opcode.MOVE_WIDE_16,
    Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16,
)

/**
 * The field a Kotlin data class prints after [label] in its toString(), such as ", message=". R8 renames the
 * field, but the label is the source name. The value is the argument of the second StringBuilder.append
 * after the label (the first appends the label); R8 may read all fields up front, so the field is the last
 * read into that register before the append.
 */
internal fun ClassDef.toStringField(app: AppCode, label: String): FieldReference {
    val toString = methods.firstOrNull {
        it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    } ?: throw app.error("$type has no toString")
    val instructions = toString.implementation!!.instructions.toList()
    val labelIndex = instructions.indexOfFirst { it.constString() == label }
    if (labelIndex < 0) throw app.error("$type doesn't print \"$label\"")
    val appends = (labelIndex + 1 until instructions.size).filter { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            ((instruction as ReferenceInstruction).reference as MethodReference).let {
                it.definingClass == "Ljava/lang/StringBuilder;" && it.name == "append"
            }
    }
    val valueAppend = appends.getOrNull(1) ?: throw app.error("no value after \"$label\" in $type")
    var register = (instructions[valueAppend] as FiveRegisterInstruction).registerD
    var before = valueAppend
    while (true) {
        val write = (before - 1 downTo 0).firstOrNull {
            instructions[it].opcode.setsRegister() && (instructions[it] as? OneRegisterInstruction)?.registerA == register
        } ?: throw app.error("the value after \"$label\" in $type isn't a field")
        val read = instructions[write]
        // With many fields R8 parks the values in high registers and moves each back before its append.
        if (read.opcode in MOVES) {
            register = (read as TwoRegisterInstruction).registerB
            before = write
            continue
        }
        if (read.opcode !in FIELD_READS) throw app.error("the value after \"$label\" in $type isn't a field")
        return (read as ReferenceInstruction).reference as FieldReference
    }
}

/**
 * The getter of the field a Kotlin data class prints after [label] in its toString(), as a smali method
 * reference: the one method without parameters that only reads that field and returns it.
 */
internal fun ClassDef.toStringGetter(app: AppCode, label: String): String {
    val field = toStringField(app, label)
    val getters = methods.filter { method ->
        val code = method.implementation?.instructions?.toList() ?: return@filter false
        method.parameterTypes.isEmpty() && method.returnType == field.type && code.size == 2 &&
            code[0].opcode in FIELD_READS && (code[0] as ReferenceInstruction).reference == field &&
            code[1].opcode in RETURNS
    }
    val getter = getters.singleOrNull()
        ?: throw app.error("expected one getter for \"$label\" in $type, found ${getters.size}")
    return "$type->${getter.name}()${getter.returnType}"
}
