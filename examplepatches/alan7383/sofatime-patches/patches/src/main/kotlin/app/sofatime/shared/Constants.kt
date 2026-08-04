package app.sofatime.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val SOFATIME_COMPATIBILITY = Compatibility(
        name = "SofaTime",
        packageName = "com.theclashsoft.sofatime",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1E1E2E,
        targets = listOf(
            AppTarget(version = "1.2.1")
        )
    )
}
