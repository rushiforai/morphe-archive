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
}