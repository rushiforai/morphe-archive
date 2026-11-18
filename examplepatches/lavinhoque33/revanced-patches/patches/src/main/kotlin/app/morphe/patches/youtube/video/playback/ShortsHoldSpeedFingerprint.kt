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

package app.morphe.patches.youtube.video.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/** Starts the held-Short speed gesture and displays its speed indicator on YouTube 21.11+. */
internal object SpeedmasterStartFingerprint : Fingerprint(
    filters = listOf(
        literal(307700L),
        literal(2.0f),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, parameters = listOf("F"), returnType = "V")
    )
)
