// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.embedcommentimages

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

private const val COMMENT_HOLDER_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/adapters/CommentHolder;"

internal object HandleGifLinkInCommentFingerprint : Fingerprint(
    definingClass = COMMENT_HOLDER_CLASS_DESCRIPTOR,
    name = "handleGifLinkInComment",
    returnType = "V",
)

internal object CommentHolderUpdateViewFingerprint : Fingerprint(
    definingClass = COMMENT_HOLDER_CLASS_DESCRIPTOR,
    name = "updateView",
    returnType = "V",
    filters = listOf(setText("Landroid/widget/TextView\$BufferType;")),
)

internal object DetailLinkFragmentUpdateSelftextFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/DetailLinkFragment;",
    name = "updateSelftext",
    returnType = "V",
    filters = listOf(setText()),
)

/** In card mode, the post text is shown by this list adapter, one paragraph per row. */
internal object SelftextAdapterGetViewFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/SelftextAdapter;",
    name = "getView",
    returnType = "Landroid/view/View;",
    filters = listOf(setText()),
)

/** Image, GIF and video posts: shows their text under the media, in an ExpandableTextView. */
internal object PostMediaHandlerConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/PostMediaHandler;",
    name = "<init>",
    filters = listOf(setText(textViewClass = "Lcom/onelouder/baconreader/ExpandableTextView;")),
)

/**
 * TextView.setText(CharSequence[, BufferType]).
 *
 * @param bufferTypeParameter The type of the second parameter, or null for setText(CharSequence).
 * @param textViewClass The class of the TextView, or null for any.
 */
private fun setText(bufferTypeParameter: String? = null, textViewClass: String? = null) = methodCall(
    opcode = Opcode.INVOKE_VIRTUAL,
    definingClass = textViewClass,
    name = "setText",
    parameters = listOfNotNull("Ljava/lang/CharSequence;", bufferTypeParameter),
)
