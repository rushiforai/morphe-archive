// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.inbox

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/inbox/UnreadMessagesPatch;"

@Suppress("unused")
val fixUnreadMessagesPatch = bytecodePatch(
    name = "Fix unread messages",
    description = "Turns the orange inbox envelope back to normal when the last unread message is marked as read, " +
        "and removes \"Mark unread\", which Reddit no longer supports.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // "Mark read" only told Reddit and never updated the envelope.
        SetPostStatusFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->setPostStatus(Ljava/lang/Object;)V
                return-void
            """,
        )

        // Reddit answers api/unread_message with 404: "Mark unread" did nothing.
        InboxMenuFingerprint.method.apply {
            val builderIndex = InboxMenuFingerprint.instructionMatches[0].index
            // builder.setAdapter(menu, listener): the menu, already created before the builder.
            val adapterRegister =
                getInstruction<FiveRegisterInstruction>(InboxMenuFingerprint.instructionMatches[1].index).registerD
            addInstruction(
                builderIndex,
                "invoke-static { v$adapterRegister }, $EXTENSION_CLASS_DESCRIPTOR->" +
                    "removeMarkUnread(Landroid/widget/ArrayAdapter;)V",
            )
        }
    }
}
