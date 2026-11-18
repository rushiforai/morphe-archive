package io.github.jordanwoodson.patches.kick.player

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException

// Kick's player is its own fork of expo-video on Media3 ExoPlayer, `kick-player-v3`. Its Kotlin classes keep their
// names, as do Kick's activity and Media3 itself, so these match by class, method name and full signature.
private const val PLAYER_V3 = "Lcom/kick/mobile/playerv3"

/** The player view React Native lays out; the stream's Media3 PlayerView is its child. */
internal const val PLAYER_VIEW = "$PLAYER_V3/VideoView;"

/** One player (an ExoPlayer and its state), shared between the views that show it. */
internal const val VIDEO_PLAYER = "$PLAYER_V3/player/VideoPlayer;"

/** The stream address and options React Native gives the player. */
internal const val VIDEO_SOURCE = "$PLAYER_V3/records/VideoSource;"

/** A video size, the type of the player's maxResolution. */
internal const val VIDEO_SIZE = "$PLAYER_V3/records/VideoSize;"

internal const val EXO_PLAYER = "Landroidx/media3/exoplayer/ExoPlayer;"
internal const val MEDIA3_PLAYER = "Landroidx/media3/common/Player;"
internal const val MEDIA3_LISTENER = "Landroidx/media3/common/Player\$Listener;"

/** Smali descriptor of the extension's player class. */
internal const val KICK_PLAYER = "Lio/github/jordanwoodson/extension/shared/kick/KickPlayer;"

internal object MainActivityCreateFingerprint : Fingerprint(
    definingClass = "Lcom/kick/mobile/MainActivity;", name = "onCreate", returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/** The player view's setter for its player, which every player React Native shows passes through. */
internal object PlayerViewSetPlayerFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, name = "setVideoPlayer", returnType = "V", parameters = listOf(VIDEO_PLAYER),
)

/** Loads the player's next source (React Native's replace) into its ExoPlayer. */
internal object PlayerPrepareFingerprint : Fingerprint(
    definingClass = VIDEO_PLAYER, name = "prepare", returnType = "V", parameters = emptyList(),
)

/** Releases the player and its ExoPlayer when React Native lets go of it. */
internal object PlayerCloseFingerprint : Fingerprint(
    definingClass = VIDEO_PLAYER, name = "close", returnType = "V", parameters = emptyList(),
)

/** React Native's `player.muted`. */
internal object PlayerSetMutedFingerprint : Fingerprint(
    definingClass = VIDEO_PLAYER, name = "setMuted", returnType = "V", parameters = listOf("Z"),
)

/** React Native's `player.maxResolution`: every quality ceiling, Auto's and a pick's, reaches the player here. */
internal object SetMaxResolutionFingerprint : Fingerprint(
    definingClass = VIDEO_PLAYER, name = "setMaxResolution", returnType = "V", parameters = listOf(VIDEO_SIZE),
)

/**
 * The player's time update, which its interval clock runs on the main thread at the interval React Native sets (once
 * a second for Kick's player), whether it plays or not.
 */
internal object PlayerTimeUpdateFingerprint : Fingerprint(
    definingClass = VIDEO_PLAYER, name = "emitTimeUpdate", returnType = "V", parameters = emptyList(),
)

/** Whether the player keeps playing when Kick goes to the background. */
internal object StaysActiveInBackgroundFingerprint : Fingerprint(
    definingClass = VIDEO_PLAYER, name = "getStaysActiveInBackground", returnType = "Z", parameters = emptyList(),
)

/** Builds the Media3 source of a stream, with Kick's live configuration (target offset, LL-HLS playlist rewrite). */
internal object BuildMediaSourceFingerprint : Fingerprint(
    definingClass = "$PLAYER_V3/DataSourceUtilsKt;", name = "buildKickPlayerV3MediaSource",
    returnType = "Landroidx/media3/exoplayer/source/MediaSource;",
    parameters = listOf("Landroid/content/Context;", VIDEO_SOURCE),
)

/** React Native's startsPictureInPictureAutomatically: whether this view enters picture-in-picture when Kick is left. */
internal object PlayerViewSetAutoEnterPipFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, name = "setAutoEnterPiP", returnType = "V", parameters = listOf("Z"),
)

/** Sets the activity's picture-in-picture parameters, with whether the system may enter it on its own (Android 12+). */
internal object ApplyPipParamsFingerprint : Fingerprint(
    definingClass = "$PLAYER_V3/utils/PictureInPictureUtilsKt;", name = "applyPiPParams", returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Z", "Landroid/util/Rational;"),
)

/** Media3's video frame, which sizes the video inside the PlayerView by its resize mode while measuring. */
internal object AspectRatioMeasureFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/ui/AspectRatioFrameLayout;", name = "onMeasure", returnType = "V",
    parameters = listOf("I", "I"),
)

/**
 * The player's Media3 listener: the anonymous class that is the type of its `playerListener` field, which keeps the
 * player in a synthetic field. Returns the listener's type and that field's reference.
 */
internal fun BytecodePatchContext.playerListener(): Pair<String, String> {
    val type = classDefBy(VIDEO_PLAYER).fields.singleOrNull { it.name == "playerListener" }?.type
        ?: throw PatchException("Kick: the player has no playerListener")
    val listener = classDefBy(type)
    if (MEDIA3_LISTENER !in listener.interfaces) throw PatchException("Kick: the player's listener isn't a Media3 listener")
    val outer = listener.fields.singleOrNull { it.type == VIDEO_PLAYER }
        ?: throw PatchException("Kick: the player's listener doesn't keep its player")
    return type to "$type->${outer.name}:$VIDEO_PLAYER"
}
