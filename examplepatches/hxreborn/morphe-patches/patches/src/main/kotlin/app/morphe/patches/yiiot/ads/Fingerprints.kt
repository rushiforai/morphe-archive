/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.yiiot.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

internal object SetNoAdPlanFingerprint : Fingerprint(
    definingClass = "Lcom/xiaoyi/profile/UserFragment;",
    name = "setNoAdPlan",
    returnType = "V",
    filters = listOf(
        methodCall(name = "getIndicatorView"),
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = emptyList(), location = MatchAfterWithin(3)),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = emptyList(),
            returnType = "Z",
            location = MatchAfterWithin(2),
        ),
    ),
)

internal object LoadAppOpenAdFingerprint : Fingerprint(
    definingClass = "Lcom/ants360/yicamera/util/GoogleAdManager;",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Z"),
    strings = listOf("KEY_SPLASH_BANNER_SCREEN_DATA"),
    filters = listOf(opcode(Opcode.IF_EQZ)),
)

internal object AdDialogFragmentOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/ants360/yicamera/fragment/AdDialogFragment;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(opcode(Opcode.INVOKE_SUPER)),
)
