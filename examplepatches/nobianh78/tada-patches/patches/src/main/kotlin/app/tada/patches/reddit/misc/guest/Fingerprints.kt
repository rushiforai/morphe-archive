/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/3109
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.reddit.misc.guest

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal object FrontPageApplicationHasFinishedOnboardingFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/frontpage/FrontpageApplication;",
    filters = listOf(
        methodCall(smali = "Lcom/reddit/session/Session;->isLoggedIn()Z"),
        methodCall(smali = "Lcom/reddit/session/Session;->isIncognito()Z"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            returnType = "Z",
            parameters = listOf(),
            location = MatchAfterWithin(10)
        )
    )
)
