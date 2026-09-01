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
            AppTarget(version = "1.2.7", versionCodes = mapOf()),
            AppTarget(version = "2.7.17", versionCodes = mapOf())
        )
    )
}
