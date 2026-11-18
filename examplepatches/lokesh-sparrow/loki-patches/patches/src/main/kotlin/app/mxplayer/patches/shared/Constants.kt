/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.mxplayer.patches.shared

import app.morphe.patcher.patch.*

/** MX Player Pro ships as one APK with arm64 and armv7 libraries. 1.93.4 is the build this was read from. */
object Constants {
    const val PACKAGE = "com.mxtech.videoplayer.pro"

    /** The codec interface version MX Player 1.93.4 expects (its string resource custom_codec_version). */
    const val CODEC_VERSION = "1.87.0"

    val COMPATIBILITY_MXPLAYER_PRO = Compatibility(
        name = "MX Player Pro",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E88E5,
        targets = listOf(AppTarget(version = "1.93.4")),
    )
}
