package app.pyflat.util

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

context(context: BytecodePatchContext)
fun findEnumStaticField(enumString: String, enumType: String): String? {
    val clinitFingerprint = Fingerprint(
        name = "<clinit>",
        definingClass = enumType,
        strings = listOf(enumString),
    )
    val clinit = clinitFingerprint.method

    val stringIndex = clinit.indexOfFirstInstructionOrNull { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.getReference()
        (ref as? StringReference)?.string == enumString
    } ?: return null

    return clinit.enumFieldDescriptorAfter(stringIndex)
}

context(context: BytecodePatchContext)
fun injectEnumReturnByString(
    targetMethod: MutableMethod,
    enumString: String,
    enumType: String? = null
) {
    val resolvedEnumType = enumType ?: targetMethod.returnType

    val fieldRef = findEnumStaticField(enumString, resolvedEnumType)
        ?: throw PatchException("Static field for constant '$enumString' in enum '$resolvedEnumType' not found")

    targetMethod.injectEnumFieldReturn(fieldRef)
}

context(context: BytecodePatchContext)
fun injectEnumReturnByConstants(
    classType: String,
    returnConstant: String,
    vararg enumConstants: String,
) {
    val clinitFingerprint = Fingerprint(
        name = "<clinit>",
        strings = enumConstants.toList(),
    )
    val clinit = clinitFingerprint.method
    val enumType = clinit.definingClass

    val constStringIndex = clinit.indexOfFirstInstructionOrNull { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.getReference()
        (ref as? StringReference)?.string == returnConstant
    } ?: throw PatchException("Enum '$enumType' does not declare constant: $returnConstant")

    val fieldRef = clinit.enumFieldDescriptorAfter(constStringIndex)
        ?: throw PatchException("Could not resolve static field for constant: $returnConstant")

    val targetFingerprint = Fingerprint(
        definingClass = classType,
        returnType = enumType,
    )
    val targetMethod = targetFingerprint.method

    targetMethod.injectEnumFieldReturn(fieldRef)
}

private inline fun Method.indexOfFirstInstructionOrNull(
    startIndex: Int = 0,
    predicate: (Instruction) -> Boolean
): Int? {
    val instructions = implementation?.instructions?.toList() ?: return null
    for (i in startIndex until instructions.size) {
        if (predicate(instructions[i])) return i
    }
    return null
}

private fun Method.indexOfFirstOpcodeOrNull(startIndex: Int, opcode: Opcode): Int? =
    indexOfFirstInstructionOrNull(startIndex) { it.opcode == opcode }

private fun MutableMethod.enumFieldDescriptorAfter(constStringIndex: Int): String? {
    val sputIndex = indexOfFirstOpcodeOrNull(constStringIndex, Opcode.SPUT_OBJECT) ?: return null

    val referenceInstruction = getInstruction<ReferenceInstruction>(sputIndex)
    val field = referenceInstruction.getReference() as? FieldReference ?: return null

    return "${field.definingClass}->${field.name}:${field.type}"
}

private fun MutableMethod.injectEnumFieldReturn(fieldDescriptor: String) =
    addInstructions(
        0,
        """
            sget-object v0, $fieldDescriptor
            return-object v0
        """
    )