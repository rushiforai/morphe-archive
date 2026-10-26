package app.neteaseja.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_NETEASE = Compatibility(
        name = "网易云音乐",
        packageName = "com.netease.cloudmusic",
        apkFileType = ApkFileType.APK,
        // NetEase Cloud Music brand red.
        appIconColor = 0xE60012,
        targets = listOf(
            // Exact version this patch set was developed and verified against.
            // No versionCode pin: the patches are ABI-independent
            // (resource names are resolved by name at patch time).
            AppTarget(
                version = "9.6.13"
            ),
            // Best effort for newer versions: resource names are looked up
            // by name at patch time, so untouched strings keep working.
            // Run tools/migrate_translations.py after each app update.
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
