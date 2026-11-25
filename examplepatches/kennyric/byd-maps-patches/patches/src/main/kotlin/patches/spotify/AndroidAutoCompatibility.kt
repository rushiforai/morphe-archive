package patches.spotify

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** Only the Android Auto control is approved for this Spotify input. */
internal val spotifyAndroidAuto = Compatibility(
    name = "Spotify", packageName = "com.spotify.music", apkFileType = ApkFileType.APKS,
    appIconColor = 0x1ed760,
    signatures = setOf("6505b181933344f93893d586e399b94616183f04349cb572a9e81a3335e28ffd"),
    targets = listOf(AppTarget(version = "9.2.0.2053", versionCode = 148387875, minSdk = 24)),
)

internal val originalAndroidAutoInput = patches.shared.originalInput(spotifyAndroidAuto)
