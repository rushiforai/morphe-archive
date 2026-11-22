/*
 * Copyright (C) 2026 ssch71
 */
package app.ssch71.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SHUCLE = Compatibility(
        name = "셔클",
        packageName = "com.hyundai.airlab.shucle",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E64FF,
        targets = listOf(
            AppTarget(version = null, isExperimental = true)
        )
    )
}
