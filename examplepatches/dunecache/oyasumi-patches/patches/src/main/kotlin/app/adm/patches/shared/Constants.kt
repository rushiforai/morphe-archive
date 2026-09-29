package app.adm.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ADM = Compatibility(
        name = "ADM",
        packageName = "com.dv.adm",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(version = "14.0.27", versionCode = 140027)
        )
    )
}
