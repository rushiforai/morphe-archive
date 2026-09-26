package mightymich.morphe.patches.musicpitcher

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object MusicPitcherRadioCompatibility {
    val MUSIC_PITCHER_RADIO = Compatibility(
        name = "Music Pitcher Radio",
        packageName = "com.appums.music_pitcher_radio",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF9800,
        targets = listOf(
            AppTarget(version = "1.43")
        )
    )
}
