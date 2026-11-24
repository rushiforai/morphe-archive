/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaiisuper.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TODAII_SUPER = Compatibility(
        name = "Todaii Super",
        packageName = "com.eup.todaiisuper",
        signatures = setOf("d81f07ae81419779a31e926731d1ff423a0a1cfdfb7d48ce4af81907b27b46fb"),
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x04DA8D,
        targets = listOf(AppTarget(version = "1.1.5", versionCode = 19)),
    )
}
