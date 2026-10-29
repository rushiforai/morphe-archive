package app.fakhradio.patches

import app.fakhradio.patches.shared.Constants.COMPATIBILITY_RADIO_ID
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val SERVICE = "Lcom/appgeneration/ituner/media/service2/MediaService2;"
private const val SESSION = "Landroid/support/v4/media/session/MediaSessionCompat;"
private const val METADATA = "Landroid/support/v4/media/MediaMetadataCompat;"
private const val EXTENSION = "Lapp/fakhradio/extension/NowPlaying;"

/**
 * `MediaService2.Z(PlaybackStateCompat, MediaMetadataCompat)`: the one place
 * the service hands new metadata to its media session. The app puts the station
 * in DISPLAY_TITLE, the song in TITLE/ARTIST, and only http URLs for the artwork,
 * which SystemUI does not download, so the media card shows the station and no
 * picture.
 */
private val setSessionStateFingerprint = Fingerprint(
    definingClass = SERVICE,
    returnType = "V",
    parameters = listOf("Landroid/support/v4/media/session/PlaybackStateCompat;", METADATA),
)

@Suppress("unused")
val nowPlayingMetadataPatch = bytecodePatch(
    name = "Song info in media notification",
    description = "Shows the song title and its album art in the media notification and the system media player, instead of the station name with no picture.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RADIO_ID)
    category("Feature")
    extendWith("extensions/extension.mpe")

    execute {
        val match = setSessionStateFingerprint.match()
        // R8 renamed the field; it is the service's only MediaSessionCompat.
        val session = match.classDef.fields.singleOrNull { it.type == SESSION }
            ?: throw PatchException("MediaService2 has no single MediaSessionCompat field")

        match.method.addInstructions(
            0,
            """
                iget-object v0, p0, $SERVICE->${session.name}:$SESSION
                invoke-static { p0, v0, p2 }, $EXTENSION->decorate(Landroid/content/Context;Ljava/lang/Object;Landroid/os/Parcelable;)Landroid/os/Parcelable;
                move-result-object p2
                check-cast p2, $METADATA
            """,
        )
    }
}
