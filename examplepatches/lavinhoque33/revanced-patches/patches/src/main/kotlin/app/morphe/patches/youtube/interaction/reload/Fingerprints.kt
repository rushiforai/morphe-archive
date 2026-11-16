/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to Morphe contributions.
 *
 * Modified by lavinhoque33, 2026-11-14.
 */

package app.morphe.patches.youtube.interaction.reload

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object MiniAppOpenYtContentCommandEndpointFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        string("no error message"),
        opcode(Opcode.IF_EQZ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf(),
            returnType = "V"
        ),
        string("InvalidProtocolBufferException while decoding MiniAppMetadata for MiniAppOpenYTContentCommand: ")
    )
)

// YouTube 21.39: the endpoint handler became a synthetic bridge `b(Request, Map)V` and the
// dismiss player call moved to the end: `iget-boolean; if-eqz; iget-object; invoke-interface;
// move-result-object; check-cast; invoke-virtual {}, dismissPlayer()V`.
internal object MiniAppOpenYtContentCommandEndpointFingerprint2139 : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Ljava/util/Map;"),
    filters = listOf(
        string("no error message"),
        string("InvalidProtocolBufferException while decoding MiniAppWebToNativeParams for MiniAppOpenYTContentCommand: "),
        opcode(Opcode.IGET_BOOLEAN),
        opcode(Opcode.IF_EQZ),
        opcode(Opcode.IGET_OBJECT),
        opcode(Opcode.INVOKE_INTERFACE),
        opcode(Opcode.MOVE_RESULT_OBJECT),
        opcode(Opcode.CHECK_CAST),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf(),
            returnType = "V"
        ),
    )
)

private object AppWatchDescriptorToStringFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("AppWatchDescriptor{watchDescriptor=")
)

// The synthetic dispatch branch was inverted in 21.45. Match the descriptor's back-button
// policy copied into the player instead of depending on the synthetic class discriminator.
context(_: BytecodePatchContext)
internal fun backButtonFinishActivityOnNewVideoIntentFingerprint() = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        opcode(Opcode.IGET_OBJECT),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = emptyList(),
            returnType = "Z",
            location = MatchAfterImmediately()
        ),
        opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
        opcode(Opcode.IPUT_BOOLEAN, location = MatchAfterImmediately()),
    ),
    custom = { method, _ ->
        method.parameterTypes.single() == AppWatchDescriptorToStringFingerprint.originalClassDef.type
    }
)
