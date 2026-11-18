/*
 * Portions of this file are ported from Morphe:
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-17.
 */

package app.morphe.patches.youtube.utils.fix.fullscreen

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/** Fullscreen More videos action that only opens a peeking related-videos panel. */
internal object FullscreenMoreVideosButtonFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Ljava/util/Map;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            returnType = "Z",
            parameters = listOf(),
            location = MatchAfterImmediately()
        ),
        opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            returnType = "V",
            parameters = listOf("I", "I"),
            location = MatchAfterWithin(4)
        ),
        opcode(Opcode.RETURN_VOID, location = MatchAfterImmediately())
    )
)

/** Older handlers already open the panel unconditionally. */
internal object FullscreenMoreVideosUnconditionalFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Ljava/util/Map;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT),
        checkCast("L", location = MatchAfterImmediately()),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("I", "I"),
            returnType = "V",
            location = MatchAfterImmediately()
        ),
        opcode(Opcode.RETURN_VOID, location = MatchAfterImmediately())
    )
)
