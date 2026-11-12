/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-11.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.music.interaction.jam.registerAt
import app.morphe.util.cloneMutable
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Keep the normal stateful transaction, supplying its real repeated-ID argument rather than a scalar singleton. */
internal fun BytecodePatchContext.resolveNativeQueueBatch(lookup: Method, requestType: String): MutableMethod {
    val code = lookup.implementation!!.instructions.toList()
    val constructor = code.indices.single {
        code[it].getReference<MethodReference>()?.let { call ->
            call.definingClass == requestType && call.name == "<init>"
        } == true
    }
    val request = code[constructor].getReference<MethodReference>()!!
    check(request.parameterTypes.size == 8 && request.parameterTypes[3] == "Ljava/util/List;") {
        "Native Play-next request has no repeated video-ID argument"
    }
    val listRegister = (code[constructor] as ReferenceInstruction).registerAt(4)!!
    val copy = (0 until constructor).last {
        (code[it].isObjectMove() || code[it].opcode == Opcode.MOVE_RESULT_OBJECT) &&
                (code[it] as OneRegisterInstruction).registerA == listRegister
    }
    val copied = code[copy].isObjectMove()
    val output = if (copied) (code[copy] as TwoRegisterInstruction).registerB else listRegister
    val result = if (copied) (0 until copy).last {
        code[it].opcode == Opcode.MOVE_RESULT_OBJECT && (code[it] as OneRegisterInstruction).registerA == output
    } else copy
    val singleton = code[result - 1].getReference<MethodReference>()
        ?: error("Native Play-next video list is not factory-created")
    check(singleton.parameterTypes == listOf("Ljava/lang/Object;") && singleton.returnType.startsWith("L")) {
        "Native Play-next scalar-to-list factory is unavailable"
    }
    val input = (code[result - 1] as ReferenceInstruction).registerAt(0)!!
    val read = (0 until result - 1).last {
        code[it].opcode == Opcode.IGET_OBJECT && (code[it] as TwoRegisterInstruction).registerA == input &&
                code[it].getReference<FieldReference>()?.type == "Ljava/lang/String;"
    }
    check(code.subList(read, copy).mapNotNull { it.getReference<MethodReference>() }.all {
        it == singleton || (it.parameterTypes == listOf("Ljava/lang/String;") && it.returnType == "Z")
    }) { "Native Play-next list construction has additional side effects" }
    fun needed(register: Int): Boolean = code.subList(copy + 1, code.size)
        .firstOrNull { register in it.lookupRegisters() }?.let { !it.onlyWrites(register) } ?: false
    val start = if (input != output && needed(input)) read + 1 else read
    val replacement = if (output != listRegister && needed(output)) {
        "move-object/from16 v$output, p3\nmove-object/from16 v$listRegister, v$output"
    } else {
        "move-object/from16 v$listRegister, p3"
    }

    // Remove the scalar allocation and any empty-list branch, not just overwrite their result afterward.
    requireNoEntryInto(lookup, (start..copy).toSet())
    return lookup.cloneMutable(name = "rvxResolveAutoQueueBatch",
        registerCount = lookup.implementation!!.registerCount + 1,
        parameters = lookup.parameters + ImmutableMethodParameter("Ljava/util/List;", null, null)).apply {
        for (index in copy downTo start) implementation!!.removeInstruction(index)
        addInstructions(start, replacement)
    }
}

private fun Instruction.isObjectMove(): Boolean = opcode == Opcode.MOVE_OBJECT ||
        opcode == Opcode.MOVE_OBJECT_FROM16 || opcode == Opcode.MOVE_OBJECT_16

private fun Instruction.onlyWrites(register: Int): Boolean {
    if ((this as? OneRegisterInstruction)?.registerA != register) return false
    if (this is TwoRegisterInstruction && registerB == register) return false
    return isObjectMove() || opcode == Opcode.IGET_OBJECT || opcode == Opcode.SGET_OBJECT ||
            opcode == Opcode.MOVE_RESULT_OBJECT || opcode == Opcode.NEW_INSTANCE ||
            opcode == Opcode.CONST_4 || opcode == Opcode.CONST_16 || opcode == Opcode.CONST
}
