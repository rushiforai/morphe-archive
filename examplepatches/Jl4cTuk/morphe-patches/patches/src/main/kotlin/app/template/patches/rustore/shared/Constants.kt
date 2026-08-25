package app.template.patches.rustore.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_RUSTORE = Compatibility(
        name = "RuStore",
        packageName = "ru.vk.store",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0077FF,
        targets = listOf(
            AppTarget(version = "1.108.0.2", versionCode = 1108002)
        )
    )
}
