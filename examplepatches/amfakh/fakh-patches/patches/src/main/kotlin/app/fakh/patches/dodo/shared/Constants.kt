/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.dodo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DODO = Compatibility(
        name = "DoDo Music",
        packageName = "com.dundunstudio.autoplay",
        signatures = setOf("68cc09eba3fe891d031457f0d61e0518e26f5f188088d9d9b11925a7b00d49a4"),
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xD32E38,
        targets = listOf(AppTarget(version = "2.0.14", versionCode = 253), AppTarget(version = "2.0.17", versionCode = 256), AppTarget(version = "2.0.18", versionCode = 257), AppTarget(version = "2.0.20", versionCode = 259)),
    )
}
