package mightymich.morphe.patches.org.telegram.messenger

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object TelegramCompatibility {
    val TELEGRAM = Compatibility(
        name = "Telegram",
        packageName = "org.telegram.messenger",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0088CC,
        targets = listOf(
            AppTarget(version = "12.10.1")
        )
    )
}
