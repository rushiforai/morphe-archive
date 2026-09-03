package util

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {

    val MUSIC_PLAYER_COMPATIBILITY = Compatibility(
        name = "Music player",
        packageName = "com.media.music.mp3.musicplayer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "246.02", versionCode = 246)
        )
    )

    val PRINTERSHARE_COMPATIBILITY = Compatibility(
        name = "PrinterShare",
        packageName = "com.dynamixsoftware.printershare",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "12.25.0", versionCode = 550)
        )
    )

    val UNITCONVERTER_COMPATIBILITY = Compatibility(
        name = "Unit Converter",
        packageName = "com.veewalabs.unitconverter",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "2.0.2", versionCode = 89)
        )
    )
}