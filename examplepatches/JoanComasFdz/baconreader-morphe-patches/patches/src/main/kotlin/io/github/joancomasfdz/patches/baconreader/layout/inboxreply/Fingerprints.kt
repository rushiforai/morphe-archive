// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.inboxreply

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal const val INBOX_HELPER_DESCRIPTOR = "Lcom/onelouder/baconreader/adapters/InboxHelper;"

/** "Reply" of an inbox item: opens the "Send message" form. */
internal object ReplyMessageFingerprint : Fingerprint(
    definingClass = INBOX_HELPER_DESCRIPTOR,
    name = "replyMessage",
    returnType = "V",
)

/** Shows "Reply to [user] in r/[subreddit] as [you]" and the replied text on the reply screen. */
internal object UpdateReplyTextFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/PostActivity;",
    name = "updateReplyText",
    returnType = "V",
    // this.subTextView.setText("Reply to [user] in r/... as [you]").
    filters = listOf(
        fieldAccess(name = "subTextView", opcode = Opcode.IGET_OBJECT),
        methodCall(name = "setText", opcode = Opcode.INVOKE_VIRTUAL, location = MatchAfterWithin(2)),
    ),
)
