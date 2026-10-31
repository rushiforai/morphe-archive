package app.stylus.patches.telegram.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {

    private const val TELEGRAM_SIGNATURE =
        "49c1522548ebacd46ce322b6fd47f6092bb745d0f88082145caf35e14dcc38e1"

    val COMPATIBILITY_TELEGRAM = Compatibility(
        name = "Telegram",
        packageName = "org.telegram.messenger",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0x2CA5E0,
        signatures = setOf(TELEGRAM_SIGNATURE),
        targets = listOf(
            AppTarget(
                version = "13.1.1",
                minSdk = 23,
            ),
        ),
    )

    val COMPATIBILITY_TELEGRAM_WEB = Compatibility(
        name = "Telegram (web version)",
        packageName = "org.telegram.messenger.web",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0x2CA5E0,
        signatures = setOf(TELEGRAM_SIGNATURE),
        targets = listOf(
            AppTarget(
                version = "13.1.0",
                minSdk = 23,
            ),
        ),
    )
}