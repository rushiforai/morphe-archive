/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.analytics

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Two names only the logger's event settings constructor holds, which pick its class out. */
internal val EVENT_SETTINGS_STRINGS = listOf("non-streamable events", "stateful events")

/** What the logger's step for each event holds where it sends an event to Falco's stream or the batch. */
internal val STREAM_STEP_STRINGS = listOf("event.streaming.eligible", "stream_is_active")

/**
 * Keeps Instagram's usage events off Falco's event stream, sending [hook] the logger's switch for
 * it right after the step for each event reads it. The step reads the switch first of everything
 * on the event settings, and branches on it straight away: off, the event goes to the batch upload,
 * whose addresses the rest of this patch refuses, and the step never starts the stream, a
 * sessionless request stream on the gateway host the server picks
 * (test-gateway.instagram.com on 449). That host also carries the app's realtime GraphQL
 * subscriptions, so it can't be refused itself.
 *
 * Answers null when the call went in, or why not.
 */
internal fun BytecodePatchContext.keepEventsOffTheStream(hook: String): String? {
    val settings = mutableListOf<String>()
    val steps = mutableListOf<Method>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val strings = method.strings()
            if (method.name == "<init>" && strings.containsAll(EVENT_SETTINGS_STRINGS)) settings += classDef.type
            if (strings.containsAll(STREAM_STEP_STRINGS)) steps += method
        }
    }
    val config = settings.distinct().singleOrNull()
        ?: return "expected one class whose constructor holds $EVENT_SETTINGS_STRINGS, found ${settings.distinct().size}"
    val step = steps.singleOrNull() ?: return "expected one method holding $STREAM_STEP_STRINGS, found ${steps.size}"
    val mutable = mutableClassDefBy(step.definingClass).methods.single {
        it.name == step.name && it.returnType == step.returnType &&
            it.parameterTypes.map(Any::toString) == step.parameterTypes.map(Any::toString)
    }
    val code = mutable.implementation!!.instructions.toList()
    val read = code.indices.firstOrNull { index ->
        code[index].opcode == Opcode.IGET_BOOLEAN &&
            ((code[index] as ReferenceInstruction).reference as FieldReference).definingClass == config
    } ?: return "${step.definingClass}->${step.name} reads no switch of $config"
    val register = (code[read] as TwoRegisterInstruction).registerA
    val branch = code.getOrNull(read + 1)
    if (branch?.opcode != Opcode.IF_EQZ || (branch as OneRegisterInstruction).registerA != register) {
        return "${step.definingClass}->${step.name} doesn't branch on $config's switch right after reading it"
    }
    val address = IntArray(code.size + 1)
    code.forEachIndexed { index, instruction -> address[index + 1] = address[index] + instruction.codeUnits }
    val landsOnBranch = code.indices.any { index ->
        val jump = code[index] as? OffsetInstruction ?: return@any false
        (jump.opcode.name.startsWith("if-") || jump.opcode.name.startsWith("goto")) &&
            address.indexOf(address[index] + jump.codeOffset) == read + 1
    }
    if (landsOnBranch) return "${step.definingClass}->${step.name} jumps to its branch on $config's switch without reading it"
    mutable.addInstructionsAtControlFlowLabel(
        read + 1,
        """
            invoke-static/range { v$register .. v$register }, $hook
            move-result v$register
        """,
    )
    return null
}

private fun Method.strings(): Set<String> = implementation?.instructions?.mapNotNull { instruction ->
    if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) null
    else ((instruction as ReferenceInstruction).reference as StringReference).string
}?.toSet().orEmpty()
