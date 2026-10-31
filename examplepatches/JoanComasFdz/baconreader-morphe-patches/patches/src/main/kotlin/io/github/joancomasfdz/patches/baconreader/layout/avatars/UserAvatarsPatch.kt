// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.avatars

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.baconreader.misc.settings.markPatchIncluded
import io.github.joancomasfdz.patches.baconreader.misc.settings.settingsPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/avatars/UserAvatarsPatch;"

@Suppress("unused")
val userAvatarsPatch = bytecodePatch(
    name = "Show user avatars",
    description = "Adds an option to show the author's avatar before the name in comments, as on Reddit's website.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch, settingsPatch)

    execute {
        markPatchIncluded("userAvatars")

        // Reddit sends the author's id with every comment and message, but the app's Message class (the
        // superclass of Comment) has no field for it. The app's JSON parser (Jackson) fills public fields by name.
        mutableClassDefBy(MESSAGE_CLASS_DESCRIPTOR).fields.add(
            ImmutableField(
                MESSAGE_CLASS_DESCRIPTOR,
                "author_fullname",
                "Ljava/lang/String;",
                AccessFlags.PUBLIC.value,
                null,
                null,
                null,
            ).toMutable(),
        )

        // The avatar goes before the author line of the comment.
        GetCommentSubTextFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                val returnIndex = fingerprint.instructionMatches[0].index
                val subTextRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA
                addInstructions(
                    returnIndex,
                    """
                        invoke-static { v$subTextRegister }, $EXTENSION_CLASS_DESCRIPTOR->withAvatar(Landroid/text/Spannable;)Landroid/text/Spannable;
                        move-result-object v$subTextRegister
                    """,
                )
                // The Comment parameter (p1; p0 is the Context) is reused for other values later in the method.
                addInstruction(
                    0,
                    "invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->setComment(Ljava/lang/Object;)V",
                )
            }
        }

        // The view to redraw when the avatar is loaded.
        CommentHolderUpdateViewFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                val setTextIndex = fingerprint.instructionMatches[1].index
                val viewRegister = getInstruction<FiveRegisterInstruction>(setTextIndex).registerC
                addInstruction(
                    setTextIndex + 1,
                    "invoke-static { v$viewRegister }, $EXTENSION_CLASS_DESCRIPTOR->bindAvatars(Landroid/widget/TextView;)V",
                )
            }
        }

        // The avatar of the replied user on the reply screen.
        UpdateReplyTextFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                val setTextIndex = fingerprint.instructionMatches[1].index
                val viewRegister = getInstruction<FiveRegisterInstruction>(setTextIndex).registerC
                addInstruction(
                    setTextIndex + 1,
                    "invoke-static { v$viewRegister }, $EXTENSION_CLASS_DESCRIPTOR->replyAvatar(Landroid/widget/TextView;)V",
                )
            }
        }

        // The avatar of the author of inbox items.
        InboxHolderUpdateViewFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                val setTextIndex = fingerprint.instructionMatches[1].index
                val viewRegister = getInstruction<FiveRegisterInstruction>(setTextIndex).registerC
                addInstruction(
                    setTextIndex + 1,
                    "invoke-static { p0, v$viewRegister }, $EXTENSION_CLASS_DESCRIPTOR->inboxAvatar(Ljava/lang/Object;Landroid/widget/TextView;)V",
                )
            }
        }
    }
}
