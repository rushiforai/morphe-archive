// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.loadmore

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/comments/FixLoadMoreCommentsPatch;"
private const val LISTENER = "Lcom/onelouder/baconreader/connectivity/Tasks\$OnCompleteListener;"

@Suppress("unused")
val fixLoadMoreCommentsPatch = bytecodePatch(
    name = "Fix load more comments",
    description = "Makes \"load more comments\" load the hidden comments again.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // Reddit refuses api/morechildren to apps since late October 2026. The app still asks it first, in case
        // Reddit serves it again; the extension loads the comments from their threads when Reddit refuses.
        LoadMoreFingerprint.method.addInstruction(
            0,
            "invoke-static { p2, p3 }, $EXTENSION_CLASS_DESCRIPTOR->loading(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        GetMoreChildrenFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0, p1, p2, p4 }, $EXTENSION_CLASS_DESCRIPTOR->guard(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;$LISTENER)$LISTENER
                move-result-object p4
            """,
        )
    }
}
