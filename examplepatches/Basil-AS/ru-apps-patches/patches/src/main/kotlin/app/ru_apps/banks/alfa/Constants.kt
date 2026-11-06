package app.ru_apps.banks.alfa

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ALFA = Compatibility(
        name = "Альфа-Банк",
        packageName = "ru.alfabank.mobile.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xEF3124,
        targets = listOf(
            AppTarget(
                version = "12.60.07",
                versionCode = 2042600700,
            ),
        ),
    )
}
