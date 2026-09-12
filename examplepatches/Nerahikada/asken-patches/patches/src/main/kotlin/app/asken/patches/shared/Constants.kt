package app.asken.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val ASKEN_COMPATIBILITY = Compatibility(
        name = "あすけん",
        packageName = "jp.co.greenhouse.asken",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(version = "9.8.0"),
            AppTarget(version = null, isExperimental = true)
        )
    )
}
