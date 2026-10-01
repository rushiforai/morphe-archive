package mightymich.morphe.patches.mymusic.offlinemusicplayer.mp3player.playmusic

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object MusicPlayerCompatibility {
    val MUSIC_PLAYER = Compatibility(
        name = "Music Player",
        packageName = "mymusic.offlinemusicplayer.mp3player.playmusic",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF9800,
        targets = listOf(
            AppTarget(version = "1.02.165.0923")
        )
    )
}
