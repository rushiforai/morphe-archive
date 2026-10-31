// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.tables

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/tables/ShowTablesPatch;"

@Suppress("unused")
val showTablesPatch = bytecodePatch(
    name = "Show tables",
    description = "Shows tables in comments and posts as a grid instead of \"header: value\" lines. " +
        "Wide tables can be expanded and scrolled sideways, and links in tables can be tapped.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // The app flattens tables into lines in RedditSpannerBase.appendTable.
        // Draw them as a grid instead, or let the app flatten them if they can not be parsed.
        AppendTableFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1, p2 }, $EXTENSION_CLASS_DESCRIPTOR->appendTable(Ljava/lang/Object;Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)I
                    move-result v0
                    if-ltz v0, :original
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // Fit the tables to the real width of the text, once the comment or post text is set.
        listOf(CommentHolderUpdateViewFingerprint, DetailLinkFragmentUpdateSelftextFingerprint).forEach { fingerprint ->
            val index = fingerprint.instructionMatches[0].index
            fingerprint.method.apply {
                val textViewRegister = getInstruction<FiveRegisterInstruction>(index).registerC
                addInstruction(
                    index + 1,
                    "invoke-static { v$textViewRegister }, $EXTENSION_CLASS_DESCRIPTOR->onTextSet(Landroid/widget/TextView;)V",
                )
            }
        }

        // The comment body has a touch listener: wrap it, so table touches (expand button,
        // sideways scrolling, links) are handled and the app's listener keeps working.
        CommentHolderConstructorFingerprint.method.apply {
            val setTouchListenerIndex = CommentHolderConstructorFingerprint.instructionMatches[1].index
            val setTouchListener = getInstruction<FiveRegisterInstruction>(setTouchListenerIndex)
            addInstruction(
                setTouchListenerIndex + 1,
                "invoke-static { v${setTouchListener.registerC}, v${setTouchListener.registerD} }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->installTouch(Landroid/view/View;Landroid/view/View\$OnTouchListener;)V",
            )
        }
    }
}
