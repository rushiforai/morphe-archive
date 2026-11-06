// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.imgur

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal object GetImgurBaseUrlFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/imageutils/ImgurV3Constants;",
    name = "getBaseURL",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

/** The upload adds the authorization to the connection: ImgurAuthorization.addToHttpURLConnection(connection). */
internal object ImgurUploadFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/imageutils/ImgurUpload;",
    name = "run",
    returnType = "Ljava/lang/String;",
    parameters = listOf("[Ljava/lang/Void;"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Lcom/onelouder/baconreader/imageutils/ImgurAuthorization;",
            name = "addToHttpURLConnection",
        ),
    ),
)

/** Whether an album's image is a video: ImgurImage.isVideo(), true when its "mp4" isn't null. */
internal object ImgurImageIsVideoFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/imgur_gallery/ImgurImage;",
    name = "isVideo",
    returnType = "Z",
    parameters = listOf(),
)

/** What the album viewer plays or saves: ImgurImage.getLink(), its "mp4" unless null, else its "link". */
internal object ImgurImageGetLinkFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/imgur_gallery/ImgurImage;",
    name = "getLink",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)
