package dev.hyzor.patches.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.Reference

/**
 * The small subset of `app.morphe.util` that these patches need, implemented locally so the
 * bundle does not have to pull in the shared patch library just for a handful of helpers.
 *
 * These are implementation details of the bundle, so they are `internal` rather than API.
 */

/** Casts this instruction's reference to [T], or returns null when it carries another kind. */
internal inline fun <reified T : Reference> Instruction.getReference(): T? =
    (this as? ReferenceInstruction)?.reference as? T

/** Index of the first instruction matching [predicate], or -1. */
internal fun Method.indexOfFirstInstruction(predicate: Instruction.() -> Boolean): Int =
    implementation?.instructions?.indexOfFirst { it.predicate() } ?: -1

/** Index of the first instruction matching [predicate]. Throws when there is none. */
internal fun Method.indexOfFirstInstructionOrThrow(predicate: Instruction.() -> Boolean): Int =
    indexOfFirstInstruction(predicate).also {
        if (it < 0) {
            throw PatchException("Could not find instruction in ${this.definingClass}->${this.name}")
        }
    }

/**
 * The only constructor declared by the class.
 *
 * Matched by name: `<clinit>` also carries [AccessFlags.CONSTRUCTOR], and picking it would inject
 * constructor-parameter instructions into the static initializer.
 *
 * Kotlin classes can declare more than one `<init>` (a default-argument constructor is synthetic),
 * so this deliberately fails instead of guessing. Callers that need a specific constructor should
 * select it by parameter types.
 */
internal val MutableClass.constructor: MutableMethod
    get() = this.methods.filter { it.name == "<init>" }.singleOrNull()
        ?: throw PatchException(
            "$type must declare exactly one constructor; select one by parameter types instead",
        )

/** The field declared by the class with the given name. */
internal fun MutableClass.fieldByName(name: String): MutableField =
    this.fields.singleOrNull { it.name == name }
        ?: throw PatchException("$type must declare exactly one field named $name")

/** Clears one access flag from the field. */
internal fun MutableField.removeFlag(flag: AccessFlags) {
    this.accessFlags = this.accessFlags and flag.value.inv()
}

/** The public, no-argument `toString()` of the class, if it declares one. */
internal fun ClassDef.toStringMethod(): Method? = this.methods.firstOrNull {
    it.name == "toString" &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) &&
        it.parameterTypes.isEmpty()
}

private val RETURN_OPCODES = setOf(
    Opcode.RETURN_VOID,
    Opcode.RETURN,
    Opcode.RETURN_WIDE,
    Opcode.RETURN_OBJECT,
)

/**
 * Inserts [smaliInstructions] immediately before the method's last return instruction.
 *
 * Inserting before the *last* instruction is not enough: a method can end with a `throw`, in which
 * case the inserted code would only run on an exception path.
 */
internal fun MutableMethod.addInstructionsBeforeReturn(smaliInstructions: String) {
    val returnIndex = this.instructions.indexOfLast { it.opcode in RETURN_OPCODES }
    if (returnIndex < 0) {
        throw PatchException("${this.definingClass}->${this.name} has no return instruction")
    }

    this.addInstructions(returnIndex, smaliInstructions)
}
