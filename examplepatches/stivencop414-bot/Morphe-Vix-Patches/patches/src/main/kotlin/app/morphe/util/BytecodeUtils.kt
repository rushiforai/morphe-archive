package app.morphe.util

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.Reference

internal fun MutableMethod.returnEarly() {
    check(returnType == "V") { "Expected void return type on $definingClass->$name, got $returnType" }
    addInstruction(0, "return-void")
}

internal fun MutableMethod.returnEarly(value: Boolean) {
    check(returnType == "Z") { "Expected boolean return type on $definingClass->$name, got $returnType" }
    val literal = if (value) "0x1" else "0x0"
    addInstructions(
        0,
        """
            const/4 v0, $literal
            return v0
        """.trimIndent(),
    )
}

internal fun MutableMethod.returnEarlyNull() {
    check(returnType.startsWith("L") || returnType.startsWith("[")) {
        "Expected object/array return type on $definingClass->$name, got $returnType"
    }
    addInstructions(
        0,
        """
            const/4 v0, 0x0
            return-object v0
        """.trimIndent(),
    )
}

internal inline fun <reified T : Reference> Instruction.getReference(): T? =
    (this as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? T

internal fun Method.indexOfFirstInstruction(startIndex: Int = 0, filter: Instruction.() -> Boolean): Int {
    val list = implementation?.instructions?.toList() ?: return -1
    for (i in startIndex until list.size) {
        if (list[i].filter()) return i
    }
    return -1
}

internal fun Method.indexOfFirstInstructionOrThrow(startIndex: Int = 0, filter: Instruction.() -> Boolean): Int {
    val idx = indexOfFirstInstruction(startIndex, filter)
    if (idx < 0) throw PatchException("Instruction not found in $definingClass->$name from index $startIndex")
    return idx
}

internal fun Method.indexOfFirstInstructionReversedOrThrow(filter: Instruction.() -> Boolean): Int {
    val list = implementation?.instructions?.toList()
        ?: throw PatchException("No implementation in $definingClass->$name")
    for (i in list.indices.reversed()) {
        if (list[i].filter()) return i
    }
    throw PatchException("Instruction not found in $definingClass->$name (reverse scan)")
}

internal fun Method.indexOfFirstStringInstruction(value: String): Int =
    indexOfFirstInstruction {
        (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
            getReference<com.android.tools.smali.dexlib2.iface.reference.StringReference>()?.string == value
    }

internal fun Method.indexOfFirstStringInstructionOrThrow(value: String): Int {
    val idx = indexOfFirstStringInstruction(value)
    if (idx < 0) throw PatchException("String \"$value\" not found in $definingClass->$name")
    return idx
}
