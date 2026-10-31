// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.tables

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal object AppendTableFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/parser/RedditSpannerBase;",
    name = "appendTable",
    returnType = "I",
    parameters = listOf(
        "Landroid/text/SpannableStringBuilder;",
        "Lcom/onelouder/baconreader/parser/RedditParser\$Element;",
    ),
)

internal const val COMMENT_HOLDER_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/adapters/CommentHolder;"

/** Sets the touch listener of the comment body: this.commentBody, then setOnTouchListener. */
internal object CommentHolderConstructorFingerprint : Fingerprint(
    definingClass = COMMENT_HOLDER_CLASS_DESCRIPTOR,
    name = "<init>",
    filters = listOf(
        fieldAccess(name = "commentBody", opcode = Opcode.IGET_OBJECT),
        methodCall(name = "setOnTouchListener", opcode = Opcode.INVOKE_VIRTUAL, location = MatchAfterWithin(4)),
    ),
)

internal object CommentHolderUpdateViewFingerprint : Fingerprint(
    definingClass = COMMENT_HOLDER_CLASS_DESCRIPTOR,
    name = "updateView",
    returnType = "V",
    filters = listOf(
        setText("Landroid/widget/TextView\$BufferType;"),
    ),
)

internal object DetailLinkFragmentUpdateSelftextFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/DetailLinkFragment;",
    name = "updateSelftext",
    returnType = "V",
    filters = listOf(
        setText(),
    ),
)

/**
 * TextView.setText(CharSequence[, BufferType]).
 *
 * @param bufferTypeParameter The type of the second parameter, or null for setText(CharSequence).
 */
private fun setText(bufferTypeParameter: String? = null) = methodCall(
    name = "setText",
    parameters = listOfNotNull("Ljava/lang/CharSequence;", bufferTypeParameter),
    opcode = Opcode.INVOKE_VIRTUAL,
)
