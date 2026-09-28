package app.template.patches.ninegag.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.iface.value.EncodedValue

/**
 * Finds and returns the first matching field in the class that matches the given [field].
 *
 * @receiver MutableClass The class to search for the field.
 * @param field The field to match.
 * @return The first matching mutable field.
 */
fun MutableClass.findMutableFieldOf(field: Field) = this.fields.first {
    it.name == field.name && it.type == field.type
}

/**
 * Finds the mutable counterpart of [method] in this class.
 *
 * Matches on name, return type and parameter types rather than a raw
 * [MethodReference] signature so it stays usable with a [Method] instance.
 *
 * @receiver MutableClass The class to search for the method.
 * @param method The method to match.
 * @return The matching mutable method.
 */
fun MutableClass.findMutableMethodOf(method: Method) = this.methods.first {
    it.name == method.name &&
        it.returnType == method.returnType &&
        it.parameterTypes == method.parameterTypes
}

/**
 * Returns the [Field]'s initial value as [T] or null if the initial value is not of type [T].
 *
 * @receiver Field The field to extract the encoded value from.
 * @return The encoded value as type [T], or null if not applicable.
 */
inline fun <reified T : EncodedValue> Field.getEncodedValue() =
    this.initialValue as? T

/**
 * Returns this instruction's reference when it is a [T], or null otherwise.
 *
 * @receiver Instruction The instruction to read.
 * @return The reference, or null if the instruction is not a reference instruction.
 */
inline fun <reified T : Reference> Instruction.getReference() =
    (this as? ReferenceInstruction)?.reference as? T

/**
 * Replaces the whole method body with `return <value>`.
 *
 * This replaces the body outright, which is safe for the ad-gate getter it is
 * used on: that method is a plain static state-flow read with no exception
 * handlers. Use [returnBoxedBooleanEarly] for a coroutine, which must not have
 * its body deleted.
 *
 * @receiver MutableMethod The method to replace the body of.
 * @param value The value to return.
 */
fun MutableMethod.returnEarly(value: Boolean) {
    check(returnType == "Z") { "Expected a boolean return type, found $returnType" }

    replaceBodyWith("const/4 v0, 0x${if (value) "1" else "0"}", "return v0")
}

/**
 * Prepends a boxed Boolean return to this method, for a continuation-style
 * `invokeSuspend` that must yield an object.
 *
 * The original body is deliberately left in place rather than removed. A
 * coroutine's `MoveNext` is a state machine wrapped in exception handlers, and
 * deleting its instructions would leave the try/catch ranges pointing at
 * addresses that no longer exist. The prepended `return-object` makes the rest
 * unreachable, which is the same shape the original helper produced.
 *
 * @receiver MutableMethod The method to add the return to.
 * @param value The value to box and return.
 */
fun MutableMethod.returnBoxedBooleanEarly(value: Boolean) {
    check(returnType == "Ljava/lang/Boolean;" || returnType == "Ljava/lang/Object;") {
        "Expected a boxed boolean return type, found $returnType"
    }

    checkNotNull(implementation) {
        throw PatchException("Cannot add a return to an abstract or native method")
    }

    val constant = if (value) "TRUE" else "FALSE"
    addInstructions(
        0,
        "sget-object v0, Ljava/lang/Boolean;->$constant:Ljava/lang/Boolean;\nreturn-object v0",
    )
}

private fun MutableMethod.replaceBodyWith(vararg instructions: String) {
    checkNotNull(implementation) {
        throw PatchException("Cannot replace the body of an abstract or native method")
    }

    removeInstructions(0, this.instructions.count())
    addInstructions(0, instructions.joinToString("\n"))
}

/**
 * Filters methods of this class based on the [predicate]. Only methods with
 * non-null instructions are considered.
 *
 * @receiver ClassDef The class whose methods will be filtered.
 * @param predicate The predicate to determine if a method should be included.
 * @return List of methods that match the predicate and have instructions.
 */
fun ClassDef.filterMethods(
    predicate: (ClassDef, Method) -> Boolean,
): List<Method> = buildList {
    val classDef = this@filterMethods
    methods.forEach { method ->
        method.instructionsOrNull ?: return@forEach
        if (predicate(classDef, method)) {
            add(method)
        }
    }
}

/**
 * Filters methods from all classes in the list based on the [predicate]. Only methods with
 * non-null instructions are considered.
 *
 * @receiver List<ClassDef> The list of classes to filter methods from.
 * @param predicate The predicate to determine if a method should be included.
 * @return List of methods that match the predicate and have instructions.
 */
fun List<ClassDef>.filterMethods(
    predicate: (ClassDef, Method) -> Boolean,
): List<Method> = flatMap { it.filterMethods(predicate) }
