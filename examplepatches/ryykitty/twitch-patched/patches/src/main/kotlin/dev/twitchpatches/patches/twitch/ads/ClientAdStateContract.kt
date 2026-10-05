package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.uniqueHook


internal fun disabledClientAdState(method: Method): FieldReference {
    val implementation = method.implementation ?: throw PatchException("Client-ad constructor has no body")
    if (method.name != "<init>" || method.returnType != "V" || !AccessFlags.PUBLIC.isSet(method.accessFlags) ||
        AccessFlags.STATIC.isSet(method.accessFlags) || method.parameterTypes.count { it.toString() == "Z" } != 1)
        throw PatchException("Client-ad constructor contract changed")
    val words = 1 + method.parameterTypes.sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 }
    val bool = implementation.registerCount - words + parameterWord(method, method.parameterTypes.indexOfFirst { it.toString() == "Z" })
    if (bool !in 0..255 || implementation.tryBlocks.any { it.startCodeAddress == 0 })
        throw PatchException("Client-ad input register or exception contract changed")
    val code = method.code()
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    fun target(index: Int): Int {
        val branch = code[index] as? OffsetInstruction ?: throw PatchException("Client-ad state branch missing")
        return addresses.indexOf(addresses[index] + branch.codeOffset).also {
            if (it !in code.indices) throw PatchException("Client-ad state branch target is invalid")
        }
    }
    val gate = code.withIndex().filter { (_, instruction) -> instruction.opcode == Opcode.IF_EQZ &&
        (instruction as? OneRegisterInstruction)?.registerA == bool
    }.uniqueHook("client-ad initial-state Boolean gate").index
    if (code.take(gate).any { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == bool })
        throw PatchException("Client-ad Boolean is overwritten before state selection")
    val absentAt = target(gate)
    val absent = code[absentAt]
    val field = (absent as? ReferenceInstruction)?.reference as? FieldReference
        ?: throw PatchException("Client-ad false branch has no singleton state")
    if (absent.opcode != Opcode.SGET_OBJECT || field.type != field.definingClass)
        throw PatchException("Client-ad disabled state is not a typed singleton")
    val active = code.getOrNull(gate + 1)
    val construct = code.getOrNull(gate + 2)
    val activeType = (active as? ReferenceInstruction)?.reference as? TypeReference
    val initializer = (construct as? ReferenceInstruction)?.reference as? MethodReference
    if (active?.opcode != Opcode.NEW_INSTANCE || construct?.opcode != Opcode.INVOKE_DIRECT ||
        initializer?.name != "<init>" || initializer.returnType != "V" || initializer.definingClass != activeType?.type ||
        (active as OneRegisterInstruction).registerA != (absent as OneRegisterInstruction).registerA ||
        invokeRegisters(construct).firstOrNull() != active.registerA)
        throw PatchException("Client-ad active and disabled states no longer share the initial-state flow")
    val join = target(absentAt + 1)
    val move = code[join] as? TwoRegisterInstruction ?: throw PatchException("Client-ad initial-state merge changed")
    if (code[join].opcode != Opcode.MOVE_OBJECT || move.registerB != absent.registerA || join != gate + 3 ||
        target(join + 1) <= absentAt)
        throw PatchException("Client-ad initial-state merge is not proven")
    val machine = code.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Ltv/twitch/android/core/mvp/presenter/StateMachine;" && ref.name == "<init>"
    }.uniqueHook("client-ad state machine construction")
    val range = machine.value as? RegisterRangeInstruction ?: throw PatchException("Client-ad state machine invocation changed")
    val machineRef = (machine.value as ReferenceInstruction).reference as MethodReference
    if (machine.value.opcode != Opcode.INVOKE_DIRECT_RANGE || machine.index <= absentAt ||
        machineRef.returnType != "V" || machineRef.parameterTypes.firstOrNull()?.toString() != "Ltv/twitch/android/core/mvp/presenter/PresenterState;" ||
        range.registerCount != 1 + machineRef.parameterTypes.sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 } ||
        range.startRegister + 1 != move.registerA || code.subList(target(join + 1), machine.index).any {
            it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == move.registerA
        }) throw PatchException("Client-ad selected state no longer reaches the original state machine")
    return field
}
