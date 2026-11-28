/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.warunglife.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WARUNGLIFE = Compatibility(
        name = "Warung Life Simulator",
        packageName = "com.neopawstudio.warunglife",
        signatures = setOf("1b43a19a74aafa9326fe0e579844cceb23c3ae50cf1b058e8bc21e879a9cb15a"),
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "1.3", versionCode = 52)),
    )
}
