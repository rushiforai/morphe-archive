/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3386
 * Modified by lavinhoque33, 2026-11-14.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.youtube.video.buffer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * The player load control's shouldContinueLoading.
 */
internal object ShouldContinueLoadingFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(
        // 21.45 reads this buffered-duration field on both loading paths.
        fieldAccess(opcode = Opcode.IGET_WIDE, type = "J"),
        opcode(Opcode.CMP_LONG, location = MatchAfterWithin(3)),
        literal(120000),
        literal(15000L)
    )
)

/**
 * The player load control's onTracksSelected, where the memory limit is calculated.
 */
internal object TracksSelectedFingerprint : Fingerprint(
    classFingerprint = ShouldContinueLoadingFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        literal(389),
        literal(38),
        anyInstruction(
            literal(1024, listOf(Opcode.MUL_INT_LIT16)),
            literal(10, listOf(Opcode.SHL_INT_LIT8))
        ),
    )
)
