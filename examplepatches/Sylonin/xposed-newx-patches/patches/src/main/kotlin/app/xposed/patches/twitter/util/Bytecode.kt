package app.xposed.patches.twitter.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal val Method.instructionList: List<Instruction>
    get() = implementation?.instructions?.toList().orEmpty()

internal val Instruction.methodRef get() = (this as? ReferenceInstruction)?.reference as? MethodReference
internal val Instruction.fieldRef get() = (this as? ReferenceInstruction)?.reference as? FieldReference
internal val Instruction.typeRef get() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type
internal val Instruction.stringRef get() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

internal val MethodReference.descriptor
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

internal val FieldReference.descriptor get() = "$definingClass->$name:$type"

internal fun String.toJavaClassName() = substring(1, length - 1).replace('/', '.')

internal fun String.isWide() = this == "J" || this == "D"

internal fun ClassDef.isInterface() = accessFlags and AccessFlags.INTERFACE.value != 0

/** Registers taken by the parameters, without `this`. */
internal fun Method.parameterRegisters() = parameterTypes.sumOf { if (it.toString().isWide()) 2 else 1 }

/** The register name of parameter [index] (0 based, without `this`), like `p3`. */
internal fun Method.parameterRegister(index: Int): String {
    val thisRegister = if (accessFlags and AccessFlags.STATIC.value != 0) 0 else 1
    return "p" + (thisRegister + parameterTypes.take(index).sumOf { if (it.toString().isWide()) 2 else 1 })
}

/** Registers free at the start of the method, which is all but the parameter registers. */
internal fun Method.localRegisters(): Int {
    val thisRegister = if (accessFlags and AccessFlags.STATIC.value != 0) 0 else 1
    return implementation!!.registerCount - parameterRegisters() - thisRegister
}

internal fun Method.requireLocals(count: Int) {
    if (localRegisters() < count) {
        throw PatchException("$definingClass->$name has ${localRegisters()} free registers, $count needed")
    }
}

internal fun <T> Collection<T>.single(what: String): T =
    singleOrNull() ?: throw PatchException("Expected one $what, found $size: ${joinToString(limit = 5)}")

/** One register per argument of an invoke, the receiver first for instance calls. */
internal fun Instruction.argumentRegisters(): List<Int> {
    val reference = methodRef ?: throw IllegalArgumentException("$opcode is not an invoke")
    val registers = when (this) {
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        else -> throw IllegalArgumentException("$opcode is not an invoke")
    }
    val arguments = mutableListOf<Int>()
    var i = 0
    if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) arguments += registers[i++]
    reference.parameterTypes.forEach { type ->
        arguments += registers[i]
        i += if (type.toString().isWide()) 2 else 1
    }
    return arguments
}

internal val constOpcodes = setOf(
    Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16,
    Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE, Opcode.CONST_WIDE_HIGH16,
)

internal val moveOpcodes = setOf(
    Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16, Opcode.MOVE_WIDE, Opcode.MOVE_WIDE_FROM16,
    Opcode.MOVE_WIDE_16, Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16,
)

/**
 * Replaces the body of an extension stub with [smali] that may use [locals] registers
 * besides the parameters. The stub is rebuilt because javac gives it too few registers.
 */
internal fun BytecodePatchContext.replaceStub(classType: String, name: String, locals: Int, smali: String) {
    val classDef = mutableClassDefBy(classType)
    val stub = classDef.methods.filter { it.name == name }.single("stub $classType->$name")
    val replacement: MutableMethod = ImmutableMethod(
        stub.definingClass,
        stub.name,
        stub.parameters,
        stub.returnType,
        stub.accessFlags,
        null,
        null,
        MutableMethodImplementation(locals + stub.parameterRegisters()),
    ).toMutable()
    replacement.addInstructions(0, smali)
    classDef.methods.remove(stub)
    classDef.methods.add(replacement)
}

/** A stub returning a constant string. */
internal fun BytecodePatchContext.replaceStubWithString(classType: String, name: String, value: String) {
    require('"' !in value && '\\' !in value) { "Unsupported characters in $value" }
    replaceStub(
        classType,
        name,
        1,
        """
        const-string v0, "$value"
        return-object v0
        """,
    )
}

/**
 * Maps the labels of a data class toString() ("Foo(bar=", ", baz=") to the fields printed
 * after them. R8 reorders the loads and outlines the StringBuilder appends into shared
 * helpers, so the method is evaluated symbolically, following those helpers.
 */
internal fun BytecodePatchContext.toStringFields(toString: Method): Map<String, FieldReference> {
    val parts = ToStringInterpreter(this).run(toString, emptyList(), 0)?.flatten()
        ?: throw PatchException("Could not follow ${toString.definingClass}->toString()")
    val fields = mutableMapOf<String, FieldReference>()
    parts.zipWithNext().forEach { (label, value) ->
        if (label is Value.Text && label.text.endsWith("=") && value is Value.Field) {
            val name = label.text.removeSuffix("=").substringAfterLast('(').substringAfterLast(", ")
            fields.putIfAbsent(name, value.field)
        }
    }
    return fields
}

internal fun Map<String, FieldReference>.field(owner: String, label: String, type: String? = null): FieldReference {
    val field = this[label] ?: throw PatchException("$owner.toString() prints no \"$label\" (has ${keys.joinToString()})")
    if (type != null && field.type != type) throw PatchException("$owner.$label is ${field.type}, expected $type")
    return field
}

private sealed interface Value {
    data class Text(val text: String) : Value
    data class Field(val field: FieldReference) : Value

    /** A StringBuilder, or a string built by one. */
    class Builder(val parts: MutableList<Value> = mutableListOf()) : Value

    object Unknown : Value
}

private fun Value.flatten(): List<Value> = when (this) {
    is Value.Builder -> parts.flatMap { it.flatten() }
    else -> listOf(this)
}

private class ToStringInterpreter(private val context: BytecodePatchContext) {
    private val stringBuilder = "Ljava/lang/StringBuilder;"

    /** Evaluates [method] with [arguments] in its parameter registers; returns what it returns. */
    fun run(method: Method, arguments: List<Value>, depth: Int): Value? {
        val implementation = method.implementation ?: return null
        val registers = arrayOfNulls<Value>(implementation.registerCount)
        val firstParameter = implementation.registerCount - method.parameterRegisters()
        var register = firstParameter
        method.parameterTypes.forEachIndexed { i, type ->
            registers[register] = arguments.getOrNull(i)
            register += if (type.toString().isWide()) 2 else 1
        }

        var result: Value? = null
        for (instruction in implementation.instructions) {
            when (instruction.opcode) {
                Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO ->
                    registers[(instruction as OneRegisterInstruction).registerA] = Value.Text(instruction.stringRef!!)

                Opcode.IGET, Opcode.IGET_WIDE, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN,
                Opcode.IGET_BYTE, Opcode.IGET_CHAR, Opcode.IGET_SHORT ->
                    registers[(instruction as TwoRegisterInstruction).registerA] = Value.Field(instruction.fieldRef!!)

                Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16, Opcode.MOVE_WIDE, Opcode.MOVE_WIDE_FROM16,
                Opcode.MOVE_WIDE_16, Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 -> {
                    instruction as TwoRegisterInstruction
                    registers[instruction.registerA] = registers[instruction.registerB]
                }

                Opcode.NEW_INSTANCE -> registers[(instruction as OneRegisterInstruction).registerA] =
                    if (instruction.typeRef == stringBuilder) Value.Builder() else Value.Unknown

                Opcode.MOVE_RESULT_OBJECT -> registers[(instruction as OneRegisterInstruction).registerA] = result

                Opcode.RETURN_OBJECT -> return registers[(instruction as OneRegisterInstruction).registerA]

                Opcode.RETURN_VOID -> return null

                Opcode.INVOKE_DIRECT, Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_STATIC,
                Opcode.INVOKE_DIRECT_RANGE, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_STATIC_RANGE ->
                    result = invoke(instruction, registers, depth)

                else -> {
                    // Anything else that writes a register makes it unknown.
                    if (instruction is OneRegisterInstruction && instruction.opcode.writesRegister()) {
                        registers[instruction.registerA] = Value.Unknown
                    }
                }
            }
        }
        return null
    }

    private fun invoke(instruction: Instruction, registers: Array<Value?>, depth: Int): Value? {
        val reference = instruction.methodRef!!
        val isStatic = instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE
        val values = instruction.argumentRegisters().map { registers[it] }

        if (reference.definingClass == stringBuilder) {
            val builder = values[0] as? Value.Builder ?: return Value.Unknown
            when (reference.name) {
                "<init>", "append" -> values.getOrNull(1)?.let { builder.parts += it }
                "toString" -> {}
                else -> return Value.Unknown
            }
            return builder
        }
        if (reference.definingClass == "Ljava/lang/String;" && reference.name == "valueOf") return values[0]
        // Formatting a single field, such as a value class's toString, stands for that field. Outlined
        // helpers get the call site's labels as arguments, so this can't swallow a label.
        val field = values.singleOrNull() as? Value.Field
        if (isStatic && field != null && reference.returnType == "Ljava/lang/String;") return field
        if (!isStatic || depth >= 4 || reference.definingClass.startsWith("Ljava/")) return Value.Unknown

        // An R8-outlined helper: evaluate it with our values. Mutated builders are shared.
        val helper = context.classDefByOrNull(reference.definingClass)?.methods?.firstOrNull {
            it.name == reference.name && it.parameterTypes.map(CharSequence::toString) == reference.parameterTypes.map(CharSequence::toString) &&
                it.returnType == reference.returnType
        } ?: return Value.Unknown
        return run(helper, values.map { it ?: Value.Unknown }, depth + 1) ?: Value.Unknown
    }

    private fun Opcode.writesRegister() = setsRegister() || setsWideRegister()
}
