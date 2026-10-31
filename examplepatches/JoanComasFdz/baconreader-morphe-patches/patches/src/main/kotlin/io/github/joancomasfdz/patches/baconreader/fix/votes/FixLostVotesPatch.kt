// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.votes

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/votes/FixLostVotesPatch;"

@Suppress("unused")
val fixLostVotesPatch = bytecodePatch(
    name = "Fix lost post votes",
    description = "Fixes votes on a post disappearing from the post list when made while its comments load.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // Remember each vote sent to Reddit.
        VoteFingerprint.method.addInstruction(
            0,
            "invoke-static { p1, p2 }, $EXTENSION_CLASS_DESCRIPTOR->onVote(ILjava/lang/String;)V",
        )

        // The post that comes with the comments was requested before the vote: apply it before the post is saved
        // to the post list.
        CommentsLoadedFingerprint.method.apply {
            val updateIndex = CommentsLoadedFingerprint.instructionMatches[0].index
            val linkRegister = getInstruction<FiveRegisterInstruction>(updateIndex).registerC
            addInstruction(
                updateIndex,
                "invoke-static { v$linkRegister }, $EXTENSION_CLASS_DESCRIPTOR->keepVote(Ljava/lang/Object;)V",
            )
        }
    }
}
