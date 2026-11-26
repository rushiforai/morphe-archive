package com.d0r4nn.mergenv1.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TIKTOK = Compatibility(
        name = "TikTok",
        description = "Works on both stock TikTok and TikTok You (com.zhiliaoapp.musically). Automatically detects TikTok You and adds a compact TT YOU shortcut in settings when present.",
        packageName = "com.zhiliaoapp.musically",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x010101,
        targets = listOf(
            AppTarget(
                version = "47.4.3",
                minSdk = 33,
                description = "Verified on stock TikTok & TikTok You 47.4.3 (Android 13+)"
            ),
            AppTarget(
                version = null,
                minSdk = 33,
                isExperimental = true,
                description = "Experimental support for other versions (stock TikTok & TikTok You)"
            )
        )
    )

    val COMPATIBILITY_TIKTOK_ASIA = Compatibility(
        name = "TikTok (Asia)",
        description = "Works on stock TikTok Asia (com.ss.android.ugc.trill) and compatible modified builds.",
        packageName = "com.ss.android.ugc.trill",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x010101,
        targets = listOf(
            AppTarget(
                version = null,
                minSdk = 33,
                isExperimental = true,
                description = "Experimental support (Android 13+)"
            )
        )
    )
}
