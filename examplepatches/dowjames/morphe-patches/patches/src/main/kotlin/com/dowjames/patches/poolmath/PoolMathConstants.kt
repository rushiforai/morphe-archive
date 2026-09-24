package com.dowjames.patches.poolmath

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object PoolMathConstants {
    val COMPATIBILITY_POOL_MATH = Compatibility(
        name = "Pool Math",
        packageName = "com.troublefreepool.poolmath",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1E88E5,
        targets = listOf(
            AppTarget(
                version = "514"
            )
        )
    )
}
