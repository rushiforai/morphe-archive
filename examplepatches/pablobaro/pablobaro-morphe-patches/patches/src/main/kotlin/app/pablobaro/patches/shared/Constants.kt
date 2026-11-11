package app.pablobaro.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val EXTENSION = "extensions/pablobaro.mpe"

internal const val EXTENSION_PACKAGE = "Lapp/pablobaro/extension"

object Constants {
    // The patches find their targets by fingerprints. The targets list the versions they were tested with,
    // so that Morphe recommends a working version. Other versions may still work.

    val COMPATIBILITY_SPOTIFY = Compatibility(
        name = "Spotify",
        packageName = "com.spotify.music",
        appIconColor = 0x1ED760,
        targets = listOf(AppTarget(version = "9.1.94.1929")),
    )
}
