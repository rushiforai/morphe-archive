package app.afterglow.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
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
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/*
 * Small bytecode helpers shared by Afterglow patches. None of them needs a
 * patch context, so they can be called from any execute block.
 */

/** The field in smali form, `Lcls;->name:Ltype;`, for use inside smali instructions. */
internal val FieldReference.smali: String
    get() = "$definingClass->$name:$type"

/** The method in smali form, `Lcls;->name(params)ret`, for use inside smali instructions. */
internal val MethodReference.smali: String
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** Registers an invoke instruction passes to the called method, in order; empty for other instructions. */
internal val Instruction.invokeRegisters: List<Int>
    get() = when (this) {
        is FiveRegisterInstruction ->
            listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        else -> emptyList()
    }

/** Registers this instruction writes (both halves of a wide pair), or none. */
internal val Instruction.writtenRegisters: List<Int>
    get() {
        if (!opcode.setsRegister()) return emptyList()
        val register = (this as? OneRegisterInstruction)?.registerA ?: return emptyList()
        return if (opcode.setsWideRegister()) listOf(register, register + 1) else listOf(register)
    }

private val FIELD_READS = setOf(
    Opcode.IGET, Opcode.IGET_WIDE, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN,
    Opcode.IGET_BYTE, Opcode.IGET_CHAR, Opcode.IGET_SHORT,
)
private val MOVES = setOf(
    Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16,
    Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16,
)
private const val MAX_TRACE_STEPS = 8

/**
 * Finds the field that this `toString()` prints after [label], such as `", identifierProperty="`.
 *
 * `toString()` appends the label and then the value to a `StringBuilder`. The value's register is
 * traced back to the field read that set it, through register moves and the `String.valueOf` calls
 * that R8 hoists to the start of the method. This lets a patch read obfuscated fields by the names
 * YouTube still prints.
 */
internal fun Method.findFieldFromToString(label: String): FieldReference {
    val where = "$definingClass->$name"
    val instructions = implementation?.instructions?.toList()
        ?: throw PatchException("$where has no code")

    fun Instruction.isStringBuilderAppend(): Boolean {
        val method = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
        return method.definingClass == "Ljava/lang/StringBuilder;" && method.name == "append"
    }

    val labelIndex = instructions.indexOfFirst { instruction ->
        val string = (instruction as? ReferenceInstruction)?.reference as? StringReference
        string?.string?.contains(label) == true
    }
    if (labelIndex < 0) throw PatchException("$where does not print '$label'")
    val labelRegister = (instructions[labelIndex] as OneRegisterInstruction).registerA

    val labelAppend = (labelIndex + 1 until instructions.size).firstOrNull { index ->
        instructions[index].isStringBuilderAppend() &&
            instructions[index].invokeRegisters.getOrNull(1) == labelRegister
    } ?: throw PatchException("$where does not append '$label'")
    val valueAppend = (labelAppend + 1 until instructions.size).firstOrNull { index ->
        instructions[index].isStringBuilderAppend()
    } ?: throw PatchException("$where appends nothing after '$label'")

    var register = instructions[valueAppend].invokeRegisters.getOrNull(1)
        ?: throw PatchException("$where appends no value after '$label'")
    var before = valueAppend
    repeat(MAX_TRACE_STEPS) {
        val writer = (before - 1 downTo 0).firstOrNull { index -> register in instructions[index].writtenRegisters }
            ?: throw PatchException("Nothing sets v$register for '$label' in $where")
        val instruction = instructions[writer]
        when (instruction.opcode) {
            in FIELD_READS -> return (instruction as ReferenceInstruction).reference as FieldReference
            in MOVES -> {
                register = (instruction as TwoRegisterInstruction).registerB
                before = writer
            }
            Opcode.MOVE_RESULT_OBJECT -> {
                // String.valueOf(value) or value.toString(): follow the value.
                val call = instructions[writer - 1]
                val method = (call as? ReferenceInstruction)?.reference as? MethodReference
                if (method?.returnType != "Ljava/lang/String;" || call.invokeRegisters.isEmpty()) {
                    throw PatchException("Unexpected call $method for '$label' in $where")
                }
                register = call.invokeRegisters.first()
                before = writer - 1
            }
            else -> throw PatchException("Unexpected ${instruction.opcode} for '$label' in $where")
        }
    }
    throw PatchException("Could not trace '$label' in $where")
}

/** Adds `public final returnType name()` with the given smali body to the class. */
internal fun MutableClass.addMethod(name: String, returnType: String, registerCount: Int, smali: String) {
    methods.add(
        ImmutableMethod(
            type,
            name,
            emptyList<ImmutableMethodParameter>(),
            returnType,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(registerCount),
        ).toMutable().apply {
            addInstructions(0, smali)
        },
    )
}

/** Adds `public final returnType name()` that returns the object [field] of `this`. */
internal fun MutableClass.addFieldGetter(name: String, returnType: String, field: FieldReference) {
    addMethod(
        name,
        returnType,
        2,
        """
            iget-object v0, p0, ${field.smali}
            return-object v0
        """,
    )
}

/**
 * Sets the register that the instruction at [index] writes to false (0), right after it. Used for
 * flag checks and type checks whose result decides a branch.
 */
internal fun MutableMethod.setRegisterFalseAfter(index: Int) {
    val register = getInstruction<OneRegisterInstruction>(index).registerA
    addInstruction(index + 1, if (register < 16) "const/4 v$register, 0x0" else "const/16 v$register, 0x0")
}
