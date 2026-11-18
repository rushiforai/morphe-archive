package patches.spotify

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val spotify = Compatibility(
    name = "Spotify", packageName = "com.spotify.music", apkFileType = ApkFileType.APK,
    appIconColor = 0x1ed760,
    signatures = setOf("6505b181933344f93893d586e399b94616183f04349cb572a9e81a3335e28ffd"),
    targets = listOf(
        AppTarget(
            version = "9.1.94.1929", versionCode = 147600575, minSdk = 24,
        ),
    ),
)

internal val originalInput = patches.shared.originalInput(spotify)

internal val COMPATIBILITY_SPOTIFY get() = spotify
