/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.threeway.misc.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal object ProfileFieldSetterFingerprint : Fingerprint(
    filters = listOf(
        string("pushSettings"),
        string("gold"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("I"),
            returnType = "V",
            location = MatchAfterWithin(8),
        ),
    ),
)

internal fun myProfileFingerprint(profileType: String) = Fingerprint(
    returnType = profileType,
    parameters = listOf(),
    filters = listOf(
        fieldAccess(type = profileType, opcode = Opcode.IGET_OBJECT),
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf(), returnType = profileType),
        fieldAccess(type = profileType, opcode = Opcode.IPUT_OBJECT),
    ),
)
