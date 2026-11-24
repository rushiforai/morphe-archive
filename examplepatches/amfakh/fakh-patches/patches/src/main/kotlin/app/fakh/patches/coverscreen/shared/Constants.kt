/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.coverscreen.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_COVERSCREEN = Compatibility(
        name = "CoverScreen OS",
        packageName = "apps.ijp.coverscreenos",
        signatures = setOf("466e81c60b3ac6a6bcceb5321e1042459eb963e9ae516219fa764a492f5e7a3b"),
        apkFileType = ApkFileType.APKM,
        targets = listOf(
            AppTarget(version = "CSOS_9.0.3_BETA", versionCode = 246),
        ),
    )
}
