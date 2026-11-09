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
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origRef
import app.morphe.util.names.origString
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefByOrNull

internal fun controlShape(ok: Boolean, why: String) {
    if (!ok) throw PatchException("Local controls: $why (before editing)")
}
internal fun <T> List<T>.controlSingle(why: String): T {
    controlShape(size == 1, "$why is missing or ambiguous")
    return single()
}
internal fun Method.controlBody() = implementation?.instructions?.toList().orEmpty()
internal fun Instruction.controlRef() = origRef()
internal fun Instruction.controlField() = (this as? ReferenceInstruction)?.reference as? FieldReference
internal fun Instruction.controlString() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
internal fun MethodReference.controlShape(parameters: List<String>, result: String) =
    origParameterTypes == parameters && origReturnType == result
internal fun Method.controlCallable(static: Boolean) = AccessFlags.PUBLIC.isSet(accessFlags) &&
    AccessFlags.STATIC.isSet(accessFlags) == static && !AccessFlags.ABSTRACT.isSet(accessFlags) &&
    !AccessFlags.NATIVE.isSet(accessFlags) && controlBody().isNotEmpty()

internal fun BytecodePatchContext.controlHook(type: String, name: String, parameters: List<String>, result: String): Method {
    val owner = tgMutableClassDefByOrNull(type)
    controlShape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "$type runtime owner is inaccessible")
    val method = owner!!.methods.filter { it.origName == name }.controlSingle("$name runtime hook")
    val operands = parameters.sumOf { if (it == "J" || it == "D") 2 else 1 }
    controlShape(method.controlShape(parameters, result) && method.controlCallable(true) &&
        method.implementation!!.registerCount >= maxOf(operands, if (result == "V") 0 else 1), "$name runtime hook changed")
    return method
}

/** Throws unless [reference], a method or a field, is public on a public class, and static or not as [static] says. */
internal fun BytecodePatchContext.requireReachable(reference: String, static: Boolean) {
    val table = TelegramNames.of(this)
    val resources = "${TelegramNames.RENAMED_PACKAGE}R\$"
    if (static && reference.startsWith(resources) && !table.isIdentity) {
        // 13.2 inlined its R classes: a stub's sget of one goes in as the id, which the build has to carry.
        val kind = reference.removePrefix(resources).substringBefore(';')
        val name = reference.substringAfter("->").substringBefore(':')
        controlShape(table.resourceId(kind, name) != null, "$reference isn't reachable from the extension")
        return
    }
    val owner = tgMutableClassDefByOrNull(reference.substringBefore("->"))
    val member = reference.substringAfter("->")
    val reachable = owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags) && if ('(' in member) {
        owner.methods.any {
            // The member a stub's call turns into, whose descriptor R8 may have changed.
            (it.toString() == reference || it.origString() == reference || it.toString() == table.reference(reference)) &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static
        }
    } else {
        owner.fields.any {
            ("${it.name}:${it.type}" == member || "${it.origName}:${it.origType}" == member) &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static
        }
    }
    controlShape(reachable, "$reference isn't reachable from the extension")
}

/**
 * Throws unless [type] is a public class and each of [wanted] is public on it. A field is written
 * `name:Type` and a method `name(Parameters)Return`, after `static ` when it's static; a method
 * also mustn't be abstract.
 */
internal fun BytecodePatchContext.controlMembers(type: String, vararg wanted: String) {
    val table = TelegramNames.of(this)
    val resources = "${TelegramNames.RENAMED_PACKAGE}R\$"
    if (type.startsWith(resources) && !table.isIdentity) {
        // 13.2 inlined its R classes: what a patch reads from one is an id the build has to carry.
        val kind = type.removePrefix(resources).removeSuffix(";")
        for (member in wanted) {
            controlShape(table.resourceId(kind, member.removePrefix("static ").substringBefore(':')) != null, "$type no longer has $member")
        }
        return
    }
    val owner = tgClassDefByOrNull(type)
    controlShape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "$type is missing")
    for (member in wanted) {
        val static = member.startsWith("static ")
        val name = member.removePrefix("static ")
        val ok = if ('(' in name) owner!!.methods.any { "${it.origName}${it.origDescriptor}" == name &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static && !AccessFlags.ABSTRACT.isSet(it.accessFlags) }
        else owner!!.fields.any { "${it.origName}:${it.origType}" == name && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static }
        controlShape(ok, "$type no longer has $member")
    }
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
