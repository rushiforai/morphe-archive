package com.dowjames.patches.yuka

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object YukaConstants {
    val COMPATIBILITY_YUKA = Compatibility(
        name = "Yuka",
        packageName = "io.yuka.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x38D06C,
        targets = listOf(
            AppTarget(
                version = "5.4"
            )
        )
    )
}
