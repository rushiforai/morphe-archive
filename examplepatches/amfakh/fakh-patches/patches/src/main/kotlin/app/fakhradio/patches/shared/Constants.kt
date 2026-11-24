/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakhradio.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_RADIO_ID = Compatibility(
        name = "Radio Indonesia",
        packageName = "com.appmind.radios.id",
        signatures = setOf("dd1064c4fe4b825bd2c5736686b8f159056f1d19349a9dceb8602fd71b629a23"),
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1E6FE0,
        targets = listOf(AppTarget(version = "4.2.30")),
    )
}
