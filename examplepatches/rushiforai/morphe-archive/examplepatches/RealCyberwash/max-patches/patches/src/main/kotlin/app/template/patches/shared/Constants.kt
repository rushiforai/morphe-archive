package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CHMAX = Compatibility(
        name = "Chmax",
        packageName = "ru.oneme.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF0045, // Icon color in Morphe Manager
        targets = listOf(
            // "version = null" means the patch works with the latest app target
            // and is expected to work with all future app targets
            AppTarget(
                version = "26.10.1"
            ),
            AppTarget(
                version = "26.11.3"
            )
        )
    )
    const val IP_CHECKER = "https://ipv4-internet.yandex.net/api/v0/ip"
}
