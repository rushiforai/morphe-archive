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

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Open fullscreen related videos regardless of the panel's current state. */
internal val fixFullscreenMoreVideosPatch = bytecodePatch(
    description = "Makes the fullscreen More videos button always open the related videos."
) {
    execute {
        val match = FullscreenMoreVideosButtonFingerprint.matchOrNull()
        if (match == null) {
            // Verify the known old implementation rather than ignoring an unknown handler.
            FullscreenMoreVideosUnconditionalFingerprint.method
            return@execute
        }

        val index = match.instructionMatches[2].index
        val register = match.method.getInstruction<OneRegisterInstruction>(index).registerA

        match.method.replaceInstruction(index, "const/4 v$register, 0x1")
    }
}
