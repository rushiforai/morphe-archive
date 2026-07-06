package app.paresh.patches.vneditor.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_VN = Compatibility(
        name = "VN",
        packageName = "com.frontrow.vlog",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x42484B,
        targets = listOf(
            AppTarget(version = "2.12.0")
        )
    )
}