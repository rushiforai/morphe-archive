// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.comments

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.baconreader.misc.settings.markPatchIncluded
import io.github.joancomasfdz.patches.baconreader.misc.settings.settingsPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/comments/LoadMoreCommentsPatch;"

@Suppress("unused")
val loadMoreCommentsPatch = bytecodePatch(
    name = "Load more comments",
    description = "Adds options to load up to 500 comments when opening a post instead of about 200, and to " +
        "load the \"load more comments\" with few replies automatically.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch, settingsPatch)

    execute {
        markPatchIncluded("loadMoreComments")

        // The app sends no limit (0), so Reddit returns its default of about 200 comments: the setting instead.
        GetCommentsFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p5 }, $EXTENSION_CLASS_DESCRIPTOR->commentLimit(I)I
                move-result p5
            """,
        )

        // After the comment list gets its items, load the small "load more comments".
        ProcessDataFingerprint.method.addInstruction(
            ProcessDataFingerprint.instructionMatches[0].index,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onItemsProcessed(Ljava/lang/Object;)V",
        )
    }
}
