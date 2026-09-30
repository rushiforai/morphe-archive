/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.utils

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.util.getReference
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

data class MethodFieldMetadata(
    val name: String,
    val definingClass: String,
    val returnType: String,
)

fun classNameToExtension(className: String): String = className.removePrefix("L").replace("/", ".").removeSuffix(";")

fun extensionToClassName(className: String): String = "L" + className.replace(".", "/") + ";"

fun Instruction.methodExtractor(): MethodFieldMetadata {
    val ref = getReference<MethodReference>()
    val defMethodClassName = classNameToExtension(ref!!.definingClass)
    val returnTypeClassName = classNameToExtension(ref.returnType)
    return MethodFieldMetadata(ref.name, defMethodClassName, returnTypeClassName)
}

fun Instruction.fieldExtractor(): MethodFieldMetadata {
    val ref = getReference<FieldReference>()
    val defMethodClassName = classNameToExtension(ref!!.definingClass)
    val fieldTypeClassName = classNameToExtension(ref.type)
    return MethodFieldMetadata(ref.name, defMethodClassName, fieldTypeClassName)
}

private fun Instruction.isConstString() = opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO

/**
 * Rewrites the [index]th string literal of an extension method: the extension ships a placeholder
 * there, and the patch fills in the obfuscated name it resolved.
 */
context(patchContext: BytecodePatchContext)
fun Fingerprint.changeStringAt(
    index: Int,
    value: String,
) {
    val instruction =
        method.instructions.filter { it.isConstString() }.getOrNull(index)
            ?: throw PatchException("${method.definingClass}->${method.name} has no string literal #$index")
    val register = instruction.registersUsed[0]
    method.replaceInstruction(instruction.location.index, "const-string v$register, \"$value\"")
}

/** Rewrites the placeholder equal to [sentinel], so slot order can shift without breaking. */
context(patchContext: BytecodePatchContext)
fun Fingerprint.changeString(
    sentinel: String,
    value: String,
) {
    val instruction =
        method.instructions.firstOrNull { it.isConstString() && it.getReference<StringReference>()?.string == sentinel }
            ?: throw PatchException("${method.definingClass}->${method.name} has no \"$sentinel\" placeholder")
    val register = instruction.registersUsed[0]
    method.replaceInstruction(instruction.location.index, "const-string v$register, \"$value\"")
}

context(patchContext: BytecodePatchContext)
fun Fingerprint.changeFirstString(value: String) {
    changeStringAt(0, value)
}
