/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val STREAMING_PROTO =
    $$"Lcom/google/protos/youtube/api/innertube/StreamingDataOuterClass$StreamingData;"

internal fun Instruction.isStreamTransform(method: Method): Boolean {
    val call = getReference<MethodReference>() ?: return false
    return opcode == Opcode.INVOKE_VIRTUAL && call.definingClass == method.definingClass &&
        call.returnType == method.returnType &&
        call.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", method.returnType)
}

/** Match the request base by sibling diagnostics AND the response-transform call, never an obfuscated name. */
internal val streamSwapCallerFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    custom = { method, owner ->
        val parameters = method.parameterTypes.map(CharSequence::toString)
        if (parameters.size !in 3..4 || method.returnType !in parameters ||
            AccessFlags.STATIC.isSet(method.accessFlags) ||
            method.implementation?.instructions?.any { it.isStreamTransform(method) } != true) {
            false
        } else {
            val strings = owner.methods.flatMap { sibling ->
                sibling.implementation?.instructions?.mapNotNull {
                    it.getReference<StringReference>()?.string
                } ?: emptyList()
            }.toSet()
            strings.containsAll(listOf("PLAYER_REQUEST_WAS_AUTOPLAY", "PLAYER_REQUEST_CLICK_TRACKING", "ps_r"))
        }
    },
)

internal fun streamSwapWrapperFingerprint(responseType: String) = Fingerprint(
    name = "<init>",
    interfaces = listOf(responseType),
    parameters = listOf("L", "Lj$/time/Instant;", "J", "L", "L", "Z"),
)

private val consumerOpcodes = listOf(
    Opcode.IPUT_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_INTERFACE,
    Opcode.MOVE_RESULT_WIDE, Opcode.IPUT_WIDE, Opcode.RETURN_VOID,
)

/** The engine re-reads this holder; changing the validator's argument would not change playback. */
internal fun streamSwapConsumerFingerprint(responseType: String) = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(responseType),
    custom = { method, owner ->
        val instructions = method.implementation?.instructions?.toList()
        if (instructions?.size != consumerOpcodes.size || AccessFlags.STATIC.isSet(method.accessFlags) ||
            instructions.indices.any { instructions[it].opcode != consumerOpcodes[it] }) {
            false
        } else {
            val field = instructions[0].getReference<FieldReference>()
            val timestamp = instructions[2].getReference<MethodReference>()
            field != null && field.definingClass == owner.type && field.type == responseType &&
                timestamp != null && timestamp.definingClass == responseType && timestamp.parameterTypes.isEmpty() &&
                timestamp.returnType == "J"
        }
    },
)
