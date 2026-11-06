package app.ru_apps.banks.vtb

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_VTB = Compatibility(
        name = "ВТБ Онлайн",
        packageName = "ru.vtb24.mobilebanking.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0A2973,
        targets = listOf(
            AppTarget(
                version = "20.18.1.3",
                versionCode = 2090141585,
            ),
        ),
    )
}
