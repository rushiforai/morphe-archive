package io.github.bakwudo.uyu.patches.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/**
 * Inserts instructions at [index] so that branches which jumped to the instruction at [index]
 * now run the inserted code first.
 *
 * A plain insert leaves the branch label on the original instruction, so any branch into it
 * skips the new code. Here the original instruction is duplicated after the new code and then
 * removed, which moves its labels onto the first inserted instruction.
 */
fun MutableMethod.addInstructionsAtControlFlowLabel(
    index: Int,
    smaliInstructions: String,
    vararg externalLabels: ExternalLabel,
) {
    addInstruction(index + 1, getInstruction(index))
    addInstructionsWithLabels(index + 1, smaliInstructions, *externalLabels)
    removeInstruction(index)
}

/** The smali form of a method reference, e.g. `La;->b(Ljava/lang/String;)V`. */
val Method.smaliReference: String
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** The only instance field of the given type. */
fun ClassDef.instanceField(type: String): FieldReference =
    fields.singleOrNull { it.type == type && !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: throw PatchException("No unique $type field in ${this.type}.")

private val INSTANCE_FIELD_READS = setOf(
    Opcode.IGET,
    Opcode.IGET_WIDE,
    Opcode.IGET_OBJECT,
    Opcode.IGET_BOOLEAN,
    Opcode.IGET_BYTE,
    Opcode.IGET_CHAR,
    Opcode.IGET_SHORT,
)

/** Fields of [definingClass] that the method reads, in order. */
fun Method.fieldsRead(definingClass: String): List<FieldReference> =
    (implementation?.instructions ?: emptyList()).mapNotNull { instruction ->
        if (instruction.opcode !in INSTANCE_FIELD_READS) return@mapNotNull null
        ((instruction as ReferenceInstruction).reference as FieldReference)
            .takeIf { it.definingClass == definingClass }
    }

/**
 * Replaces the body of a stub method in the extension. The method is recreated, so the new code
 * does not depend on how many registers the compiled stub used.
 */
fun BytecodePatchContext.replaceMethodBody(
    classType: String,
    methodName: String,
    registerCount: Int,
    smaliInstructions: String,
) {
    val stubClass = mutableClassDefBy(classType)
    val stub = stubClass.methods.singleOrNull { it.name == methodName }
        ?: throw PatchException("$classType->$methodName not found.")
    stubClass.methods.remove(stub)
    stubClass.methods.add(
        ImmutableMethod(
            stub.definingClass,
            stub.name,
            stub.parameters,
            stub.returnType,
            stub.accessFlags,
            null,
            null,
            MutableMethodImplementation(registerCount),
        ).toMutable().apply { addInstructionsWithLabels(0, smaliInstructions) },
    )
}

/** The register of `this` (p0) in an instance method. */
val Method.thisRegister: Int
    get() {
        val parameterRegisters = parameterTypes.fold(1) { count, type ->
            count + if (type.toString() == "J" || type.toString() == "D") 2 else 1
        }
        return (implementation ?: throw PatchException("$name has no code.")).registerCount - parameterRegisters
    }

/** true if an instruction of the method stores a value in [register]. */
fun Method.writesRegister(register: Int): Boolean =
    (implementation?.instructions ?: emptyList()).any { instruction ->
        val opcode = instruction.opcode
        if (!opcode.setsRegister() || instruction !is OneRegisterInstruction) return@any false
        val target = instruction.registerA
        target == register || (opcode.setsWideRegister() && target + 1 == register)
    }
