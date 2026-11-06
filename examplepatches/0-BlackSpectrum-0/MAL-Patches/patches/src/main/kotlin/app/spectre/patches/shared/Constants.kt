package app.spectre.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MAL = Compatibility(
        name = "MyAnimeList",
        packageName = "net.myanimelist.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = "2.3.15",
                minSdk = 26
            )
        )
    )
}
