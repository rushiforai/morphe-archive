/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility

object Constants {
    private const val FACEBOOK_SIGNER_SHA256 =
        "e3f9e1e0cf99d0e56a055ba65e241b3399f7cea524326b0cdd6ec1327ed0fdc1"
    private const val META_ROTATED_SIGNER_SHA256 =
        "911d604446084ca7f4760b775bfc160fa8702441240a7258645d7a72c4312d27"

    val COMPATIBILITY = Compatibility(
        name = "Facebook",
        packageName = "com.facebook.katana",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1877F2,
        signatures = setOf(
            FACEBOOK_SIGNER_SHA256,
            META_ROTATED_SIGNER_SHA256,
        ),
        targets = FacebookTargets.PATCH_TARGETS,
    )
}