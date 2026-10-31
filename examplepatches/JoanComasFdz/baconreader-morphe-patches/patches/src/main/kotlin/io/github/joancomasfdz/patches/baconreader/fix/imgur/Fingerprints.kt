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
