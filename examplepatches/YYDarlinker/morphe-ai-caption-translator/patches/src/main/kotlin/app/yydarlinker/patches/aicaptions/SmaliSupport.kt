package app.yydarlinker.patches.aicaptions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

/** Package of the extension (the part of the add-on that runs inside YouTube), as a dex type prefix. */
internal const val EXTENSION = "Lapp/yydarlinker/aicaptions/"
internal const val STRING = "Ljava/lang/String;"
internal const val OBJECT = "Ljava/lang/Object;"

// What an instruction refers to.
internal fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
internal fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference
internal fun Instruction.text() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

// Methods.
internal fun Method.code() = implementation?.instructions?.toList() ?: emptyList()
internal fun Method.hasText(text: String) = code().any { it.text() == text }
internal fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)
internal fun Method.parameterNames() = parameterTypes.map { it.toString() }

/** `Lowner;->name(params)return`, the form that smali uses to name a method. */
internal fun Method.id() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
internal fun MethodReference.parameterNames() = parameterTypes.map { it.toString() }
internal fun MethodReference.id() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
internal fun FieldReference.id() = "$definingClass->$name:$type"

/** The only element, or a failed patching: a structure that is not found exactly once cannot be hooked safely. */
internal fun <T> Iterable<T>.unique(role: String): T {
    val list = toList()
    if (list.size != 1) throw PatchException("AI captions: $role must match exactly once; found ${list.size}")
    return list.single()
}

/**
 * Replaces the stub [name] of an extension class with a method that has the given smali body. The stubs are the
 * entry points that the patched app calls into the extension, or the extension calls into the app.
 * The stubs are static, so their parameters occupy the registers after the locals.
 *
 * @param locals the registers `v0..` that the body uses besides the parameters.
 * @param parameters selects the stub when a name is overloaded.
 */
internal fun MutableClass.bindStub(name: String, locals: Int, body: String, parameters: List<String>? = null) {
    val stub = methods.filter { it.name == name && (parameters == null || it.parameterNames() == parameters) }
        .unique("extension stub $name")
    val parameterRegisters = stub.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    val method = ImmutableMethod(
        type, name, stub.parameters, stub.returnType, stub.accessFlags, stub.annotations, null,
        MutableMethodImplementation(parameterRegisters + locals),
    ).toMutable()
    method.addInstructionsWithLabels(0, body.trimIndent())
    methods.remove(stub)
    methods.add(method)
}
