package dev.ytmruskippper.patches

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.patch

/**
 * The fingerprints match obfuscated classes of this exact build, so no other version is supported.
 */
internal val youtubeMusic = Compatibility(
    packageName = "com.google.android.apps.youtube.music",
    name = "YouTube Music",
    targets = listOf(
        AppTarget(
            version = "9.30.53",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 93053240),
            minSdk = 26,
        )
    ),
)

private const val EXTENSION_PACKAGE = "Ldev/ytmruskippper/skipper"
internal const val PLAYBACK_PROBE = "$EXTENSION_PACKAGE/PlaybackProbe;"
internal const val TRACK_SKIPPER = "$EXTENSION_PACKAGE/TrackSkipper;"
internal const val SKIPPER_SETTINGS = "$EXTENSION_PACKAGE/SkipperSettings;"
internal const val ARTIST_FLAGS = "$EXTENSION_PACKAGE/ArtistFlags;"

/** Adds the extension code (extensions/skipper) to the app. */
internal val skipperExtension = patch {
    extendWith("extensions/skipper.mpe")
}
