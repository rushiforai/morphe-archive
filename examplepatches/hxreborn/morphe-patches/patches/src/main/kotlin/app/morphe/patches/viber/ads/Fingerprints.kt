/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.viber.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object BaseAdsControllerFingerprint : Fingerprint(
    filters = listOf(string("BaseAdsController.EventAdLoadStarted")),
)

internal object AdsEnabledFingerprint : Fingerprint(
    classFingerprint = BaseAdsControllerFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "this",
            parameters = listOf(),
            returnType = "Z",
        ),
        opcode(Opcode.SGET_OBJECT),
        opcode(Opcode.IF_EQ),
    ),
)
