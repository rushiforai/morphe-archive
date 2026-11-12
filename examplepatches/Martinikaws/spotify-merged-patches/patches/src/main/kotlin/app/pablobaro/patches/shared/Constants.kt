package app.pablobaro.patches.shared

import app.spicetify.patches.spotify.spotifyCompatibility

internal const val EXTENSION = "extensions/pablobaro.mpe"

internal const val EXTENSION_PACKAGE = "Lapp/pablobaro/extension"

object Constants {
    // Merged bundle: these patches run on the same Spotify build as the Spicetify patches (9.1.94.1929).
    // They find their targets by fingerprints, so they are not hash-pinned to that build.
    val COMPATIBILITY_SPOTIFY = spotifyCompatibility
}
