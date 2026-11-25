/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package patches.aliexpress

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val ALIEXPRESS = Compatibility(
    name = "AliExpress",
    packageName = "com.alibaba.aliexpresshd",
    apkFileType = ApkFileType.APK,
    signatures = setOf(
        "4fc3b267393ea2351c4716b37e6910517f197eb479bc43d9c9a5a46d49dd700e",
    ),
    targets = listOf(
        AppTarget(version = "8.180.0", versionCode = 80005997, minSdk = 21),
        AppTarget(version = "8.180.1", versionCode = 80005998, minSdk = 21),
    ),
)
