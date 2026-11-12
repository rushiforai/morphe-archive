package app.gwp.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x

/**
 * Adds a new method with its own registers ([locals] + parameters) to the class.
 * New methods need no register analysis of existing code, which keeps hooks small and update-proof.
 *
 * @param smali The complete body, including the final return instruction.
 */
fun MutableClass.addMethod(
    name: String,
    parameters: List<String>,
    returnType: String,
    accessFlags: Int,
    locals: Int,
    smali: String,
): MutableMethod {
    if (methods.any { it.name == name && it.parameterTypes == parameters }) {
        throw PatchException("$type->$name already exists")
    }
    val isStatic = accessFlags and AccessFlags.STATIC.value != 0
    val parameterRegisters = parameters.sumOf { if (it == "J" || it == "D") 2 else 1 } + if (isStatic) 0 else 1
    val method = ImmutableMethod(
        type, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType, accessFlags, null, null,
        // Placeholder body; the smali compiler needs an existing method to resolve p-registers.
        ImmutableMethodImplementation(
            locals + parameterRegisters, listOf(ImmutableInstruction10x(Opcode.NOP)), null, null,
        ),
    ).toMutable()
    method.addInstructionsWithLabels(0, smali)
    method.removeInstruction(method.instructions.size - 1) // the placeholder nop
    methods.add(method)
    return method
}
