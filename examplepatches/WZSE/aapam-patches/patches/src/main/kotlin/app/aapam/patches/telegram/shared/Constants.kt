package app.aapam.patches.telegram.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TELEGRAM = Compatibility(
        packageName = "org.telegram.messenger.web",
        name = "Telegram",
        description = "Telegram messenger",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2AABEE,
        signatures = setOf(
            "49c1522548ebacd46ce322b6fd47f6092bb745d0f88082145caf35e14dcc38e1"
        ),
        targets = listOf(
            AppTarget(
                version = "12.8.3",
                minSdk = 21,
            ),
            AppTarget(
                version = "12.10.1",
                minSdk = 21,
            ),
        ),
    )
}