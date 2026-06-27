package app.hellvetica.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Sankaku Channel app (APK variant — "black" flavor).
     * Package name confirmed from BuildConfig: com.sankakucomplex.channel.black
     * Targeted version: 4.23 (versionCode 91 = rc91)
     */
    val COMPATIBILITY_SANKAKU = Compatibility(
        name = "Sankaku App",
        packageName = "com.sankakucomplex.channel.black",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B1B2F, // Dark blue from Sankaku branding
        targets = listOf(
            AppTarget(
                version = "4.23",
            )
        )
    )
}
