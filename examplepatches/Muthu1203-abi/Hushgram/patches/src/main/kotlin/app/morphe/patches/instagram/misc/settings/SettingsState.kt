/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.misc.extension.parameterRegisterNumber
import app.morphe.patches.instagram.misc.extension.uniqueMethod
import app.morphe.util.ControlFlow
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val FRAMEWORK_STATE = "android:fragments"
private const val REMOVE = "Landroid/os/BaseBundle;->remove(Ljava/lang/String;)V"
internal const val REMOVE_FRAMEWORK_STATE = "$ENTRY->removeFrameworkState(Landroid/os/Bundle;Ljava/lang/String;)V"

internal object SettingsStateFingerprint : Fingerprint(
    strings = listOf("IgFragmentActivity.internalOnCreate", ".internalOnCreate", FRAMEWORK_STATE),
    custom = { method, _ -> !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
        method.parameterTypes.firstOrNull()?.toString() == "Landroid/os/Bundle;" },
)

/** Preserve a marked settings dialog on both the traced and untraced creation paths. */
internal fun BytecodePatchContext.preserveSettingsState() {
    val method = uniqueMethod("HushGram settings", "host state removal", SettingsStateFingerprint)
    if (method.definingClass !in superclassChain(MAIN_ACTIVITY).toList()) {
        throw PatchException("HushGram settings: state removal is outside the main activity hierarchy")
    }
    val flow = ControlFlow.of(method)
    val code = flow.instructions
    val calls = code.indices.filter { index ->
        code[index].opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) &&
            (code[index] as? ReferenceInstruction)?.reference.toString() == REMOVE
    }
    if (calls.size != 2) throw PatchException("HushGram settings: expected two framework state removals, found ${calls.size}")

    // At joins, retain only origins shared by every incoming path. Exception edges carry the
    // state before the throwing instruction, so a failed write cannot prove a new value.
    val before = mutableMapOf<Int, Map<Int, String>>()
    val pending = ArrayDeque<Int>()
    fun enqueue(index: Int, incoming: Map<Int, String>) {
        val old = before[index]
        val merged = old?.filter { (register, value) -> incoming[register] == value } ?: incoming.toMap()
        if (old == null || old != merged) { before[index] = merged; pending.add(index) }
    }
    enqueue(0, mapOf(method.parameterRegisterNumber(0) to "bundle"))
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        val input = before.getValue(at)
        val output = input.toMutableMap()
        val instruction = code[at]
        val destination = (instruction as? OneRegisterInstruction)?.registerA
        if (instruction.opcode.setsRegister() && destination != null) {
            output.remove(destination)
            if (instruction.opcode.setsWideRegister()) output.remove(destination + 1)
        }
        if (instruction.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)) {
            val move = instruction as TwoRegisterInstruction
            input[move.registerB]?.let { output[move.registerA] = it }
        } else if (instruction.opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
            ((instruction as ReferenceInstruction).reference as? StringReference)?.string == FRAMEWORK_STATE) {
            output[(instruction as OneRegisterInstruction).registerA] = "key"
        }
        flow.normal[at].forEach { enqueue(it, output) }
        flow.exceptional[at].forEach { enqueue(it, input) }
    }
    val replacements = calls.associateWith { at ->
        val call = code[at]
        val registers = when (call) {
            is FiveRegisterInstruction -> listOf(call.registerC, call.registerD).takeIf { call.registerCount == 2 }
            is RegisterRangeInstruction -> listOf(call.startRegister, call.startRegister + 1).takeIf { call.registerCount == 2 }
            else -> null
        } ?: throw PatchException("HushGram settings: unsupported framework removal registers")
        if (before[at]?.get(registers[0]) != "bundle" || before[at]?.get(registers[1]) != "key") {
            throw PatchException("HushGram settings: removal does not use the saved bundle and framework key on every path")
        }
        if (call is RegisterRangeInstruction) {
            "invoke-static/range { v${registers[0]} .. v${registers[1]} }, $REMOVE_FRAMEWORK_STATE"
        } else {
            "invoke-static { v${registers[0]}, v${registers[1]} }, $REMOVE_FRAMEWORK_STATE"
        }
    }
    replacements.forEach { (at, instruction) -> method.replaceInstruction(at, instruction) }
}
