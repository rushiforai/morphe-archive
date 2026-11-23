package dev.ytmruskippper.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

// Obfuscated names (jbg, rxx, npf, bcgj) are those of YouTube Music 9.30.53.

/**
 * Parses the player response. Its first String getter after the playability check is the video ID,
 * which confirms which track is actually loaded.
 */
internal object PlayerResponseFingerprint : Fingerprint(
    isStatic = false,
    parameters = listOf("L", "Ljava/lang/String;"),
    strings = listOf("Null initialPlayabilityStatus"),
    filters = listOf(
        methodCall(parameters = emptyList(), returnType = "Ljava/lang/String;"),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
    ),
)

/** Publishes metadata to the Android media session, whose controller sends Next. */
internal object MediaSessionMetadataFingerprint : Fingerprint(
    isStatic = false,
    returnType = "V",
    parameters = listOf("Landroid/support/v4/media/MediaMetadataCompat;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/media/session/MediaSession;",
            name = "setMetadata",
            parameters = listOf("Landroid/media/MediaMetadata;"),
            returnType = "V",
        ),
    ),
)

/**
 * Updates the media notification from a track model (npf). The first call reads the title from
 * the model, and bcgj.K publishes the title and artist credit. The model also holds the video ID
 * and the artist byline runs, see NotificationTrack.java.
 */
internal object NotificationTrackFingerprint : Fingerprint(
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lj\$/util/Optional;", "Lj\$/util/Optional;"),
    filters = listOf(
        methodCall(definingClass = "Lnpf;", name = "h", returnType = "Ljava/lang/String;"),
        methodCall(definingClass = "Lnpf;", name = "g", returnType = "Ljava/lang/String;"),
        methodCall(
            definingClass = "Lbcgj;",
            name = "K",
            parameters = listOf("Ljava/lang/CharSequence;", "Ljava/lang/CharSequence;"),
            returnType = "V",
        ),
    ),
)

/** onCreate of an Application base class of YouTubeMusicTikTokRoot_Application. */
internal object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Ljbg;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("activity"),
)

/**
 * Sets the Now Playing artist line, the `artist` view (rxx.y). The similar `player_artist` view
 * is a hidden duplicate, so writing to it shows nothing.
 */
internal object NowPlayingArtistFingerprint : Fingerprint(
    definingClass = "Lrxx;",
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "Lrxx;",
            name = "y",
            type = "Lcom/google/android/libraries/youtube/common/ui/YouTubeTextView;",
        ),
        methodCall(
            definingClass = "Lcom/google/android/libraries/youtube/common/ui/YouTubeTextView;",
            name = "setText",
            parameters = listOf("Ljava/lang/CharSequence;"),
            location = MatchAfterImmediately(),
        ),
    ),
)
