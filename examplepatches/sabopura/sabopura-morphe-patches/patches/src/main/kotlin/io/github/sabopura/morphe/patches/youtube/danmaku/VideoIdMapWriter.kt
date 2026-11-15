package io.github.sabopura.morphe.patches.youtube.danmaku

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Index of the move-result-object that holds the video id passed as the first argument of the map
 * writer at [writerIndex]. Other patches insert their own id hooks between the getter and the writer
 * (Morphe 2.2.0 adds one per feature), so walk back to the instruction that set that register.
 */
internal fun videoIdResultIndex(instructions: List<Instruction>, writerIndex: Int): Int? {
    val idRegister = when (val writer = instructions[writerIndex]) {
        is FiveRegisterInstruction -> writer.registerD.takeIf { writer.registerCount >= 2 }
        is RegisterRangeInstruction -> (writer.startRegister + 1).takeIf { writer.registerCount >= 2 }
        else -> null
    } ?: return null
    for (index in writerIndex - 1 downTo 1) {
        val instruction = instructions[index]
        if (!instruction.writes(idRegister)) continue
        val getter = instructions[index - 1]
        val returnType = ((getter as? ReferenceInstruction)?.reference as? MethodReference)?.returnType
        return index.takeIf {
            instruction.opcode == Opcode.MOVE_RESULT_OBJECT && getter.opcode == Opcode.INVOKE_INTERFACE &&
                returnType == "Ljava/lang/String;"
        }
    }
    return null
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val target = (this as? OneRegisterInstruction)?.registerA ?: return false
    return target == register || (opcode.setsWideRegister() && target + 1 == register)
}

/** Verify the delegate still stores p1 (video id) -> p2 in this player's map. */
internal fun isVideoIdMapWriter(method: Method): Boolean {
    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "V" ||
        method.parameterTypes.size != 2 || method.parameterTypes[0] != "Ljava/lang/String;" ||
        !method.parameterTypes[1].startsWith("L")) return false
    val body = method.implementation ?: return false
    val instructions = body.instructions.toList()
    if (body.registerCount < 3 || instructions.size < 3) return false
    val fieldRead = instructions[instructions.lastIndex - 2]
    val call = instructions[instructions.lastIndex - 1]
    val field = (fieldRead as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    val registers = fieldRead as? TwoRegisterInstruction ?: return false
    val arguments = call as? FiveRegisterInstruction ?: return false
    return fieldRead.opcode == Opcode.IGET_OBJECT &&
        field.definingClass == method.definingClass && field.type == "Ljava/util/Map;" &&
        registers.registerB == body.registerCount - 3 && registers.registerA == arguments.registerC &&
        call.opcode == Opcode.INVOKE_INTERFACE && arguments.registerCount == 3 &&
        (call as? ReferenceInstruction)?.reference.toString() ==
            "Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;" &&
        arguments.registerD == body.registerCount - 2 && arguments.registerE == body.registerCount - 1 &&
        instructions.last().opcode == Opcode.RETURN_VOID
}
