package mightymich.morphe.patches.com.spotify.music

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object SpotifyCompatibility {
    val SPOTIFY = Compatibility(
        name = "Spotify",
        packageName = "com.spotify.music",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF1DB954,
        targets = listOf(
            AppTarget(version = "9.1.86.2432")
        )
    )
}
