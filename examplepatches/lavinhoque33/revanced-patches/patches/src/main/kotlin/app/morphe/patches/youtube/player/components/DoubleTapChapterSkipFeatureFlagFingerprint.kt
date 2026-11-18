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

package app.morphe.patches.youtube.player.components

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/** Account experiment that disables two-finger chapter skipping. */
internal object DoubleTapChapterSkipFeatureFlagFingerprint : Fingerprint(
    filters = listOf(literal(45767151L))
)

/** Server configuration for two-finger chapter skipping. */
internal object DoubleTapChapterSkipConfigFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "L",
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
        opcode(opcode = Opcode.CONST_4, location = MatchAfterImmediately()),
        opcode(opcode = Opcode.IF_EQZ, location = MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN, type = "Z", location = MatchAfterWithin(10))
    ),
    custom = { method, _ -> method.parameterTypes.getOrNull(2) == "Landroid/os/Handler;" }
)
