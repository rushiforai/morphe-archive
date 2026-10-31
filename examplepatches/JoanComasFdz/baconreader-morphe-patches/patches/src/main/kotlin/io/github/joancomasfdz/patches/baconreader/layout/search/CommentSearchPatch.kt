// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.search

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/search/CommentSearchPatch;"

@Suppress("unused")
val commentSearchPatch = bytecodePatch(
    name = "Search comments",
    description = "Adds a search button to the sort bar of posts, to find, highlight and jump between the " +
        "comments with a text or user name, or show only those comments.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // The search button goes next to "COLLAPSE ALL", when the post's header finds it.
        SetCollapseButtonFingerprint.method.apply {
            val index = SetCollapseButtonFingerprint.instructionMatches[0].index
            val buttonRegister = getInstruction<TwoRegisterInstruction>(index).registerA
            addInstruction(
                index + 1,
                "invoke-static { p0, v$buttonRegister }, $EXTENSION_CLASS_DESCRIPTOR->" +
                    "addSearchButton(Ljava/lang/Object;Landroid/widget/TextView;)V",
            )
        }

        // "Show only matching comments" replaces the list's items when the list gets them.
        CommentsAdapterProcessDataFingerprint.method.addInstruction(
            CommentsAdapterProcessDataFingerprint.instructionMatches[0].index,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onItemsProcessed(Ljava/lang/Object;)V",
        )

        // Highlights the matches, after the comment's text is set.
        CommentHolderUpdateViewFingerprint.method.apply {
            val setTextIndex = CommentHolderUpdateViewFingerprint.instructionMatches[1].index
            val bodyRegister = getInstruction<FiveRegisterInstruction>(setTextIndex).registerC
            addInstruction(
                setTextIndex + 1,
                "invoke-static { p0, v$bodyRegister }, $EXTENSION_CLASS_DESCRIPTOR->" +
                    "highlight(Ljava/lang/Object;Landroid/widget/TextView;)V",
            )
        }
    }
}
