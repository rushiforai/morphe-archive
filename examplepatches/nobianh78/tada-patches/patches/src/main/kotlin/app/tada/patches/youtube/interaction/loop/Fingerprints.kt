/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.interaction.loop

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object SleepTimerCancelMethodFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "sleeptimer_snackbar_canceled_text")
    )
)

internal object SleepTimerConstructorFingerprint : Fingerprint(
    classFingerprint = SleepTimerCancelMethodFingerprint,
    name = "<init>",
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_DIRECT, name = "<init>")
    )
)

internal object SleepTimerVideoEndedEventFingerprint : Fingerprint(
    classFingerprint = SleepTimerCancelMethodFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I", "Z"),
    filters = listOf(
        opcode(Opcode.IGET_OBJECT),
        opcode(Opcode.SGET_OBJECT)
    )
)
