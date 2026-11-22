package app.tiktoktv.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY_TIKTOK_TV = Compatibility(
        name = "TikTok TV",
        packageName = "com.tiktok.tv",
        description = "Patches TikTok TV for the live TikTok backend.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        formFactor = FormFactor.TV,
        targets = listOf(
            AppTarget(
                version = "12.3.7.1",
                minSdk = 21,
                isExperimental = true,
                description = "The newest TikTok TV build served by APKMirror. Every committed " +
                    "patch matches the stock 12.3.7.1 .apkm and has run on a 32-bit TV device. " +
                    "Experimental while the login work is unfinished.",
            ),
            AppTarget(
                version = "12.3.4.1",
                minSdk = 21,
                description = "The armv7 build these patches were developed and runtime-verified on.",
            ),
        ),
    )
}
