/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaiigerman.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TODAII_GERMAN = Compatibility(
        name = "Todaii: Learn German A1-C1",
        packageName = "mobi.eup.easygerman",
        signatures = setOf("9a7256fe63399de21de63acf31d89420bed88ae615016077f5a17d8e8b32027d"),
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2F8963,
        targets = listOf(AppTarget(version = "2.8.2", versionCode = 213), AppTarget(version = "2.8.3", versionCode = 214)),
    )
}
