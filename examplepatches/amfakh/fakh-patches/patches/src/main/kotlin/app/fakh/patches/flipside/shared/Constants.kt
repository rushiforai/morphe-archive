package app.fakh.patches.flipside.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_FLIPSIDE = Compatibility(
        name = "FlipSide",
        packageName = "com.dinoster.flipside",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "1.6", versionCode = 71)),
    )
}
