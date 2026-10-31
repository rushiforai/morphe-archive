// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.thumbnails

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal const val LINK_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/reddit/Link;"

internal object CanShowThumbnailFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/utils/Utils;",
    name = "canShowThumbnail",
    returnType = "Z",
    parameters = listOf(LINK_CLASS_DESCRIPTOR),
)

/** Loads the thumbnail of a list row with Glide's RequestBuilder.into(ImageView). */
internal object LoadThumbnailFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/LinkProcessor;",
    name = "loadThumbnail",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", LINK_CLASS_DESCRIPTOR, "Landroid/widget/ImageView;"),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, name = "into", parameters = listOf("Landroid/widget/ImageView;")),
    ),
)

internal object LinkHolderUpdateViewFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/LinkHolder;",
    name = "updateView",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(readIsGallery()),
)

internal object DetailLinkFragmentResetHeaderFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/DetailLinkFragment;",
    name = "resetHeader",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(readIsGallery()),
)

/** Reads Link.isGallery, which decides whether the app's gallery indicator is shown. */
private fun readIsGallery() = fieldAccess(
    opcode = Opcode.IGET_OBJECT,
    definingClass = LINK_CLASS_DESCRIPTOR,
    name = "isGallery",
)
