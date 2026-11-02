// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.spoilers

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/** If an element of a comment's or post's HTML is a spoiler (>!...!<) the app hides. */
internal object IsInternalSpoilerFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/parser/RedditSpanner;",
    name = "isInternalSpoiler",
    returnType = "Z",
)

/** Sets the text of a comment: this.commentBody.setText(text, bufferType). */
internal object CommentHolderUpdateViewFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/CommentHolder;",
    name = "updateView",
    returnType = "V",
    filters = listOf(setText("Landroid/widget/TextView\$BufferType;")),
)

/** Sets the text of a post. */
internal object DetailLinkFragmentUpdateSelftextFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/DetailLinkFragment;",
    name = "updateSelftext",
    returnType = "V",
    filters = listOf(setText()),
)

/** A tap on a spoiler shows or hides it, and sets the view's text again. */
internal object SpoilerClickableSpanOnClickFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/parser/SpoilerClickableSpan;",
    name = "onClick",
    returnType = "V",
    filters = listOf(setText()),
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
