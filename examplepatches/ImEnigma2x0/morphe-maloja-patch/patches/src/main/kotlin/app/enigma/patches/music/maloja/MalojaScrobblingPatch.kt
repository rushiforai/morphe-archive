package app.enigma.patches.music.maloja

import app.enigma.patches.music.maloja.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/enigma/extension/music/maloja/MalojaPatch;"

@Suppress("unused")
val malojaScrobblingPatch = bytecodePatch(
    name = "Maloja Scrobbling",
    description = "Adds Maloja as a scrobbling provider. Requires the official Morphe patches " +
            "to be applied as well, so the settings appear in the Scrobbling screen.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(malojaResourcePatch)

    extendWith("extensions/maloja.mpe")

    execute {
        MediaSessionSetPlaybackStateFingerprint.hookMediaSessionArgument(
            "$EXTENSION_CLASS->onSetPlaybackState(Landroid/media/session/PlaybackState;)V"
        )

        MediaSessionSetMetadataFingerprint.hookMediaSessionArgument(
            "$EXTENSION_CLASS->onSetMetadata(Landroid/media/MediaMetadata;)V"
        )
    }
}
