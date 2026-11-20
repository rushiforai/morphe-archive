package app.southstar21.patches.spotify.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SPOTIFY = Compatibility(
        name = "Spotify",
        packageName = "com.spotify.music",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1ED760,
        targets = listOf(
            // The hook targets an unobfuscated lifecycle method and the bar is found by its
            // resource id, so newer versions will probably work too, but only this is verified.
            AppTarget(
                version = "9.2.0.2053"
            ),
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
