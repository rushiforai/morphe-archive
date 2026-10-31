// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.inboxreply

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

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/inbox/InboxReplyPatch;"

@Suppress("unused")
val inboxCommentReplyPatch = bytecodePatch(
    name = "Inbox comment reply screen",
    description = "Opens the comment reply screen, with the replied comment or message, when replying from the " +
        "inbox, instead of the plain \"Send message\" form.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // Comment replies, mentions and private messages open the comment reply screen.
        ReplyMessageFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, $INBOX_HELPER_DESCRIPTOR->activity:Landroid/app/Activity;
                    invoke-static { v0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->openReplyScreen(Landroid/app/Activity;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :send_message
                    return-void
                """,
                ExternalLabel("send_message", getInstruction(0)),
            )
        }

        // A private message has no subreddit: "Reply to [user] in r/null as [you]".
        UpdateReplyTextFingerprint.method.apply {
            val setTextIndex = UpdateReplyTextFingerprint.instructionMatches[1].index
            val viewRegister = getInstruction<FiveRegisterInstruction>(setTextIndex).registerC
            addInstruction(
                setTextIndex + 1,
                "invoke-static { v$viewRegister }, $EXTENSION_CLASS_DESCRIPTOR->fixReplyText(Landroid/widget/TextView;)V",
            )
        }
    }
}
