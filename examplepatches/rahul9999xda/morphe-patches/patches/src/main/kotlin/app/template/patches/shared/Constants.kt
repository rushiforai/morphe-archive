package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Telegram-only compatibility definitions for this personal/testing repository.
 *
 * Targets are kept aligned with the current Telegram patch set.
 */
object Constants {
    val TELEGRAM_COMPATIBILITY = Compatibility(
        name = "Telegram",
        packageName = "org.telegram.messenger",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2CA5E0,
        targets = listOf(AppTarget(version = "13.0.0", versionCode = 71581))
    )

    val TELEGRAM_PLUS_COMPATIBILITY = Compatibility(
        name = "Telegram Plus",
        packageName = "org.telegram.plus",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2CA5E0,
        targets = listOf(AppTarget(version = "12.10.6.0", versionCode = 22588))
    )

    val TELEGRAM_WEB_COMPATIBILITY = Compatibility(
        name = "Telegram Web",
        packageName = "org.telegram.messenger.web",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2CA5E0,
        targets = listOf(AppTarget(version = "13.0.0", versionCode = 71589))
    )
}
