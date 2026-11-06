package app.pablobaro.patches.shared

import app.morphe.patcher.patch.Compatibility

internal const val EXTENSION = "extensions/pablobaro.mpe"

internal const val EXTENSION_PACKAGE = "Lapp/pablobaro/extension"

object Constants {
    // "version = null" (the default target) means the patches find their targets by fingerprints
    // and are expected to work with the latest app version.

    val COMPATIBILITY_SPOTIFY = Compatibility(
        name = "Spotify",
        packageName = "com.spotify.music",
        appIconColor = 0x1ED760,
    )
}
