// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.search

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

internal const val DETAIL_LINK_FRAGMENT_DESCRIPTOR = "Lcom/onelouder/baconreader/adapters/DetailLinkFragment;"

/** The post's header sets up its "COLLAPSE ALL" button: this.collapseButton = button. */
internal object SetCollapseButtonFingerprint : Fingerprint(
    definingClass = DETAIL_LINK_FRAGMENT_DESCRIPTOR,
    filters = listOf(
        fieldAccess(
            definingClass = DETAIL_LINK_FRAGMENT_DESCRIPTOR,
            name = "collapseButton",
            opcode = Opcode.IPUT_OBJECT,
        ),
    ),
)

/** Sets the text of a comment of the post: this.commentBody.setText(text, bufferType). */
internal object CommentHolderUpdateViewFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/CommentHolder;",
    name = "updateView",
    returnType = "V",
    filters = listOf(
        fieldAccess(name = "commentBody", opcode = Opcode.IGET_OBJECT),
        methodCall(name = "setText", opcode = Opcode.INVOKE_VIRTUAL, location = MatchAfterWithin(2)),
    ),
)

/** Gives the comment list its items, from ThreadManager's data. */
internal object CommentsAdapterProcessDataFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/CommentsAdapter;",
    name = "processData",
    returnType = "V",
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    ),
)
