package com.dowjames.patches.thinkdirty

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object ThinkDirtyConstants {
    val COMPATIBILITY_THINK_DIRTY = Compatibility(
        name = "Think Dirty",
        packageName = "com.thinkdirty.thinkdirtyapp",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2ECC71,
        targets = listOf(
            AppTarget(
                version = "4.8.7.4"
            )
        )
    )
}
