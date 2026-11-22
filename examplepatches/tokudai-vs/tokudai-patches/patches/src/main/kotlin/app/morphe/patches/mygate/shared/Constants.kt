/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.mygate.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val MYGATE_PACKAGE_NAME = "com.mygate.user"

    // Developer signing certificate fingerprints
    const val MYGATE_ORIGINAL_CERT_SHA1 = "AAB7E367980DA927FB146E862057CC87CD766987"
    const val MYGATE_ORIGINAL_CERT_SHA256 = "50639F303E2376BA70ED5445F97FA08221E9ABBE1EE2BDE56EA58D953AC2D3C6"

    val COMPATIBILITY_MYGATE = Compatibility(
        name = "MyGate",
        packageName = MYGATE_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "7.38.2", minSdk = 26),
            AppTarget(version = "7.39.0", minSdk = 26),
            AppTarget(version = "7.40.1", minSdk = 26),
        )
    )
}
