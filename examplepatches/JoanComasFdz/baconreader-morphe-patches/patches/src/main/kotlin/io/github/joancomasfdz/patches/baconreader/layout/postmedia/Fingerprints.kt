// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.postmedia

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

private const val POST_MEDIA_HANDLER_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/PostMediaHandler;"

internal object PostMediaHandlerStartFingerprint : Fingerprint(
    definingClass = POST_MEDIA_HANDLER_CLASS_DESCRIPTOR,
    name = "start",
    returnType = "V",
    parameters = listOf(),
)

internal object LoadGifContentFingerprint : Fingerprint(
    definingClass = POST_MEDIA_HANDLER_CLASS_DESCRIPTOR,
    name = "loadGifContent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

internal object OnReceivedDataFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/PostMediaHandler\$5;",
    name = "onReceivedData",
    parameters = listOf("I", "I"),
)

/** Handles the answer of the RedGIFs API, and cancels with Response.message() when it is an error. */
internal object RedgifsResponseFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/media/gfycat/RedgifHandler\$resolveAsync\$1\$1\$1\$onResponse\$1;",
    name = "invokeSuspend",
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, definingClass = "Lretrofit2/Response;", name = "message"),
    ),
)

internal object RedgifsCancelFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/imageutils/ImageHelper\$4;",
    name = "onCancel",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private const val REDDIT_GALLERY_VIEWER_CLASS_DESCRIPTOR =
    "Lcom/onelouder/baconreader/reddit_gallery/RedditGalleryViewer;"

/** Picks the preview of each gallery image: RedditMediaData.p (the previews), then List.get(index). */
internal object GetGalleryImagesFingerprint : Fingerprint(
    definingClass = REDDIT_GALLERY_VIEWER_CLASS_DESCRIPTOR,
    name = "getGalleryImages",
    returnType = "Ljava/util/List;",
    parameters = listOf("Lcom/onelouder/baconreader/reddit/Link;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "Lcom/onelouder/baconreader/reddit_gallery/RedditMediaData;",
            name = "p",
        ),
        methodCall(opcode = Opcode.INVOKE_INTERFACE, definingClass = "Ljava/util/List;", name = "get"),
    ),
)

internal object GalleryGlideFingerprint : Fingerprint(
    definingClass = REDDIT_GALLERY_VIEWER_CLASS_DESCRIPTOR,
    name = "glide",
    returnType = "V",
    parameters = listOf("Lcom/onelouder/baconreader/reddit_gallery/RedditImage;"),
)

internal object RedditImageThumbnailFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/reddit_gallery/RedditImage;",
    name = "thumbnail",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
)

/** Turns JavaScript on in the web view of link posts, for a few sites only, after setting its default. */
internal object EnableJavascriptFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/BrowserBase;",
    name = "enableJavascript",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, name = "setJavaScriptEnabled"),
    ),
)
