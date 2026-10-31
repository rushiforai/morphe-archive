// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.editor

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/editor/MarkdownEditorPatch;"

@Suppress("unused")
val markdownEditorPatch = bytecodePatch(
    name = "Markdown editor",
    description = "Makes the text box of comments, replies, edits, messages and text posts as big as possible, " +
        "adds a bar with Reddit's formats and a character counter above it, and shows the formatting while typing.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // The editors: right after their layout is set (the extension waits for onCreate to finish).
        listOf(PostActivityOnCreateFingerprint, ComposeMessageOnCreateFingerprint).forEach { fingerprint ->
            fingerprint.method.addInstruction(
                fingerprint.instructionMatches[0].index + 1,
                "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onEditorScreen(Landroid/app/Activity;)V",
            )
        }
        SubmitTextPageOnCreateViewFingerprint.method.apply {
            val returnIndex = SubmitTextPageOnCreateViewFingerprint.instructionMatches[0].index
            val viewRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA
            addInstruction(
                returnIndex,
                "invoke-static { v$viewRegister }, $EXTENSION_CLASS_DESCRIPTOR->onEditorView(Landroid/view/View;)V",
            )
        }

        // The app's format button ("A") is replaced by the bar: right after the menu is inflated (the menu's
        // register is reused for the return value at the end).
        listOf(PostActivityMenuFingerprint, ComposeMessageMenuFingerprint, SubmitMenuFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                val inflateIndex = fingerprint.instructionMatches[0].index
                val menuRegister = getInstruction<FiveRegisterInstruction>(inflateIndex).registerE
                addInstruction(
                    inflateIndex + 1,
                    "invoke-static { v$menuRegister }, $EXTENSION_CLASS_DESCRIPTOR->hideFormatButton(Landroid/view/Menu;)V",
                )
            }
        }
    }
}
