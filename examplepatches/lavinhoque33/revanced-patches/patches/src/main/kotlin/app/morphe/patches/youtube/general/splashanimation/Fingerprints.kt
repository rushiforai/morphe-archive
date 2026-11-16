/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Modified by lavinhoque33, 2026-11-14.
 */

package app.morphe.patches.youtube.general.splashanimation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patches.youtube.utils.navigation.YOUTUBE_MAIN_ACTIVITY_CLASS_TYPE
import com.android.tools.smali.dexlib2.Opcode

internal object SplashScreenStyleFingerprint : Fingerprint(
    definingClass = YOUTUBE_MAIN_ACTIVITY_CLASS_TYPE,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        anyInstruction(
            literal(1074339245), // 20.30+
            literal(269032877L) // 20.29 and lower.
        )
    )
)

/**
 * 21.44+ moves splash setup from onCreate into the main activity delegate.
 */
internal object SplashScreenStyleDelegateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        literal(1074339245)
    )
)

/**
 * Matches visibility checks in the resolved main activity or delegate splash setup method.
 */
internal object ShowSplashScreenFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            returnType = "Z",
            parameters = listOf("I")
        ),
        opcode(
            opcode = Opcode.MOVE_RESULT,
            location = MatchAfterImmediately()
        ),
        anyInstruction(
            opcode(Opcode.IF_EQZ),
            opcode(Opcode.IF_NEZ),
            location = MatchAfterImmediately()
        ),
        anyInstruction(
            opcode(Opcode.CONST_4),
            opcode(Opcode.CONST_16),
            location = MatchAfterWithin(3)
        ),
        opcode(
            opcode = Opcode.IF_NE,
            location = MatchAfterImmediately()
        )
    )
)
