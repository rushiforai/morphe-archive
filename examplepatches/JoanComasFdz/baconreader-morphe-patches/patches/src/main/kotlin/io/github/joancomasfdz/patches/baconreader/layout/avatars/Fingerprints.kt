// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.avatars

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/** The superclass of Comment, also used for the inbox's private messages. */
internal const val MESSAGE_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/reddit/Message;"

/** Builds the author line of a comment: "author [flair] points time". */
internal object GetCommentSubTextFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/parser/SubTextBuilder;",
    name = "getCommentSubText",
    returnType = "Landroid/text/Spannable;",
    filters = listOf(opcode(Opcode.RETURN_OBJECT)),
)

/** Sets the author line of a comment: this.commentSubText.setText(subText). */
internal object CommentHolderUpdateViewFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/CommentHolder;",
    name = "updateView",
    returnType = "V",
    filters = setTextOfField("commentSubText"),
)

/**
 * Shows "Reply to [author] in r/... as [you]" and the replied comment or post on the reply screen:
 * this.subTextView.setText(text).
 */
internal object UpdateReplyTextFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/PostActivity;",
    name = "updateReplyText",
    returnType = "V",
    filters = setTextOfField("subTextView"),
)

/** Shows an inbox item (comment and post replies, mentions and private messages): this.labelView.setText(label). */
internal object InboxHolderUpdateViewFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/InboxHolder;",
    name = "updateView",
    returnType = "V",
    filters = setTextOfField("labelView"),
)

/** The TextView read from the field [fieldName], then its setText(CharSequence). */
private fun setTextOfField(fieldName: String) = listOf(
    fieldAccess(name = fieldName, opcode = Opcode.IGET_OBJECT),
    methodCall(
        name = "setText",
        parameters = listOf("Ljava/lang/CharSequence;"),
        opcode = Opcode.INVOKE_VIRTUAL,
        location = InstructionLocation.MatchAfterWithin(2),
    ),
)
