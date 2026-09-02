package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val TELEGRAM_COMPATIBILITY = Compatibility(
        name = "Telegram",
        packageName = "org.telegram.messenger",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2CA5E0,
        targets = listOf(
            AppTarget(version = "12.10.1", versionCode = 70382)
        )
    )

    val TELEGRAM_WEB_COMPATIBILITY = Compatibility(
        name = "Telegram Web",
        packageName = "org.telegram.messenger.web",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2CA5E0,
        targets = listOf(
            AppTarget(version = "12.10.1", versionCode = 70389)
        )
    )

    val TELEGRAM_PLUS_COMPATIBILITY = Compatibility(
        name = "Telegram Plus",
        packageName = "org.telegram.plus",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2CA5E0,
        targets = listOf(
            AppTarget(version = "12.10.1.0", versionCode = 22478)
        )
    )
}
