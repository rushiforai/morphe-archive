package app.stylus.patches.telegram.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi.ARM64_V8A
import app.morphe.patcher.patch.SupportedAbi.ARMEABI_V7A
import app.morphe.patcher.patch.SupportedAbi.X86
import app.morphe.patcher.patch.SupportedAbi.X86_64

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
                version = "12.10.6",
                versionCodes = mapOf(
                    ARM64_V8A to 71122,
                    ARMEABI_V7A to 71122,
                    X86_64 to 71122,
                    X86 to 71122,
                ),
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
                version = "12.10.5",
                versionCodes = mapOf(
                    ARM64_V8A to 71059,
                    ARMEABI_V7A to 71059,
                    X86_64 to 71059,
                    X86 to 71059,
                ),
                minSdk = 21,
            ),
        ),
    )
}