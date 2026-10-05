/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.localcontrols

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal fun controlShape(ok: Boolean, why: String) {
    if (!ok) throw PatchException("Local controls: $why (before editing)")
}
internal fun <T> List<T>.controlSingle(why: String): T {
    controlShape(size == 1, "$why is missing or ambiguous")
    return single()
}
internal fun Method.controlBody() = implementation?.instructions?.toList().orEmpty()
internal fun Instruction.controlRef() = (this as? ReferenceInstruction)?.reference?.toString()
internal fun Instruction.controlCall() = (this as? ReferenceInstruction)?.reference as? MethodReference
internal fun Instruction.controlField() = (this as? ReferenceInstruction)?.reference as? FieldReference
internal fun Instruction.controlString() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
internal fun MethodReference.controlShape(parameters: List<String>, result: String) =
    parameterTypes.map { it.toString() } == parameters && returnType == result
internal fun Method.controlCallable(static: Boolean) = AccessFlags.PUBLIC.isSet(accessFlags) &&
    AccessFlags.STATIC.isSet(accessFlags) == static && !AccessFlags.ABSTRACT.isSet(accessFlags) &&
    !AccessFlags.NATIVE.isSet(accessFlags) && controlBody().isNotEmpty()

internal fun BytecodePatchContext.controlHook(type: String, name: String, parameters: List<String>, result: String): Method {
    val owner = mutableClassDefByOrNull(type)
    controlShape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "$type runtime owner is inaccessible")
    val method = owner!!.methods.filter { it.name == name }.controlSingle("$name runtime hook")
    val operands = parameters.sumOf { if (it == "J" || it == "D") 2 else 1 }
    controlShape(method.controlShape(parameters, result) && method.controlCallable(true) &&
        method.implementation!!.registerCount >= maxOf(operands, if (result == "V") 0 else 1), "$name runtime hook changed")
    return method
}

/** Proves that a receiver copied at entry still names this instance on every path to its use. */
internal fun Method.controlReceiverAlias(register: Int, use: Int) {
    val flow = ControlFlow.of(this)
    val first = flow.instructions.first()
    controlShape(first.opcode in listOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) &&
        first.namedRegisters() == listOf(register, localRegisterCount()), "profile receiver alias changed")
    requireThisIntact("Local IDs", listOf(0))
    val pending = ArrayDeque<Int>()
    val reached = mutableSetOf<Int>()
    for (i in flow.instructions.indices.drop(1)) {
        val instruction = flow.instructions[i]
        val destination = (instruction as? OneRegisterInstruction)?.registerA
        if (instruction.opcode.setsRegister() && destination != null &&
            (destination == register || instruction.opcode.setsWideRegister() && destination + 1 == register)) pending.addAll(flow.normal[i])
    }
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (reached.add(at)) pending.addAll(flow.normal[at] + flow.exceptional[at])
    }
    controlShape(use !in reached, "profile receiver alias lifetime changed")
}
