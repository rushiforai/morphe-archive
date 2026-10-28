package app.iptv.patches.unlock

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_IPTV = Compatibility(
        name = "IPTV Pro Stream Player",
        packageName = "com.iptvprostreamplayer.v1",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3DB8FF,
        targets = listOf(
            AppTarget(version = "1.2.7", versionCodes = mapOf(), description = "Older target · pre-2.7.21"),
            AppTarget(version = "2.7.17", versionCodes = mapOf(), description = "Older target · pre-2.7.21"),
            AppTarget(version = "2.7.21", versionCodes = mapOf(), description = "Verified 2026-10-19 · vc204"),
            AppTarget(version = "2.7.24", versionCodes = mapOf(), description = "Verified 2026-10-27 · vc207")
        )
    )

    val COMPATIBILITY_IPTV_FR = Compatibility(
        name = "IPTV Pro Stream Player (FR)",
        packageName = "com.iptvprostreamplayer.v1.fr",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3DB8FF,
        targets = listOf(
            AppTarget(version = "2.7.21", versionCodes = mapOf(), description = "Verified 2026-10-19 · vc204"),
            AppTarget(version = "2.7.24", versionCodes = mapOf(), description = "Verified 2026-10-27 · vc207")
        )
    )
}
