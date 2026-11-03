package app.tikkamasalla.stremio.tuning

import app.morphe.patcher.Fingerprint

/*
 * Anchors for the player tuning patch. Real names exist only up to 1.10.x (R8 renames Media3 and the
 * player wrapper in 1.12.0 / phone 2.5.0), except stremio-core-kotlin, whose names survive in every build.
 */

/** The player wrapper's primary constructor; its LoadControl is passed to createPlayer and kept for totalAllocatedBytes(). */
object ExoWrapperConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/common/players/ExoPlayer;",
    name = "<init>",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/stremio/core/types/resource/Stream;",
        "Lcom/stremio/core/types/profile/Profile\$Settings;",
        "Landroidx/media3/exoplayer/LoadControl;",
    ),
)

/** Builds the Media3 ExoPlayer and sets its video-change-frame-rate strategy from the profile setting. */
object CreatePlayerFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/common/players/ExoPlayer\$Companion;",
    name = "createPlayer",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/stremio/core/types/resource/Stream;",
        "Lcom/stremio/core/types/profile/Profile\$Settings;",
        "Landroidx/media3/exoplayer/LoadControl;",
    ),
)

private const val PLAYER_FRAGMENT = "Lcom/stremio/tv/views/player/PlayerFragment;"

/** Creates the internal player for a stream URL and starts the media probe (1.6.12). */
object MediaPlayerFingerprint : Fingerprint(
    definingClass = PLAYER_FRAGMENT,
    name = "mediaPlayer",
    parameters = listOf("Ljava/lang/String;", "J", "Lcom/stremio/core/types/resource/Stream;"),
)

/** The media probe finished: Stremio's display matcher, which then starts the playback (1.6.12). */
object AdjustDisplayModeFingerprint : Fingerprint(
    definingClass = PLAYER_FRAGMENT,
    name = "adjustDisplayMode",
    parameters = listOf("Lcom/stremio/common/viewmodels/state/MediaInfo;"),
)

/** The player closed: Stremio clears the window's preferred display mode (1.6.12). */
object RestoreDisplayModeFingerprint : Fingerprint(
    definingClass = PLAYER_FRAGMENT,
    name = "restoreDisplayMode",
    parameters = listOf(),
)

/** Every core player-state update; its subtitle branch re-opens the stream on a count change (1.6.12). */
object OnPlayerStateFingerprint : Fingerprint(
    definingClass = PLAYER_FRAGMENT,
    name = "onPlayerState",
    parameters = listOf("Lcom/stremio/common/viewmodels/state/PlayerState;"),
    returnType = "V",
)

/** Builds and shows the audio/subtitle track dialog from the transport controls (1.6.12). */
object ShowTrackDialogFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/player/ProgressTransportControlGlue;",
    name = "showTrackDialog",
    parameters = listOf("I", "Ljava/lang/String;", "Z"),
)

private const val FRAME_RATE_MATCHER = "Lcom/stremio/common/players/FrameRateMatcher;"
private const val PLAYER_110 = "Lcom/stremio/common/players/Player;"
private const val PLAYER_LISTENER_110 = "Lcom/stremio/common/players/PlayerListener;"

/** Creates the internal player, loads the stream URL into it and starts the media probe (1.10.4). */
object MediaPlayer110Fingerprint : Fingerprint(
    definingClass = "Lcom/stremio/common/players/PlaybackManager;",
    name = "createPlayer\$mediaPlayer",
    parameters = listOf(
        "Lcom/stremio/common/viewmodels/state/PlayerType;",
        "Lcom/stremio/common/players/PlaybackManager;",
        "Lcom/stremio/core/types/resource/Stream;",
        "Ljava/lang/String;",
        "J",
    ),
    returnType = PLAYER_110,
)

/** The media probe finished: Stremio's display matcher, whose callback then starts the playback (1.10.4). */
object AdjustMatcher110Fingerprint : Fingerprint(
    definingClass = FRAME_RATE_MATCHER,
    name = "adjustDisplayMode",
    parameters = listOf("Lcom/stremio/common/viewmodels/state/MediaInfo;"),
)

/** The player screen closed: Stremio clears the window's preferred display mode (1.10.4). */
object RestoreMatcher110Fingerprint : Fingerprint(
    definingClass = FRAME_RATE_MATCHER,
    name = "restoreDisplayMode",
    parameters = listOf(),
)

/** ExoPlayer's prepare: before it, the set media item does not buffer yet (1.10.4). */
object ExoPrepare110Fingerprint : Fingerprint(
    definingClass = "Lcom/stremio/common/players/ExoPlayer;",
    name = "prepare",
    parameters = listOf(PLAYER_LISTENER_110),
)

/** mpv's load starts the file at once (1.10.4). */
object MpvLoad110Fingerprint : Fingerprint(
    definingClass = "Lcom/stremio/common/players/MpvPlayer;",
    name = "load",
    parameters = listOf("Landroid/net/Uri;", "J"),
)

/** VLC's load starts the file, then pauses it (1.10.4). */
object VlcLoad110Fingerprint : Fingerprint(
    definingClass = "Lcom/stremio/common/players/VlcPlayer;",
    name = "load",
    parameters = listOf("Landroid/net/Uri;", "J"),
)

/** The media-info effect: on a probe error stock only calls play(), the held engine start has to end there too (1.10.4). */
object ProbeEffect110Fingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/player/PlayerPageKt\$PlayerPage\$9\$1;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
)

/** Extension marker: its body becomes the build whose silent-switch hooks really landed. */
object FrameRateLandedFingerprint : Fingerprint(
    definingClass = "Lapp/tikkamasalla/stremio/tuning/FrameRateModes;",
    name = "landed",
    parameters = listOf(),
    returnType = "I",
)

/**
 * The merged player-effects lambda of 1.12.0 (`l8` there): its invokeSuspend contains the inlined player
 * creation (case 3) and display-mode adjust (case 4). Anchored by the matcher's log strings plus the
 * suspend signature; the named 1.10.4 matcher (other signature) cannot match this.
 */
object PlayerEffects112Fingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("No applicable display mode found"),
    custom = { _, classDef ->
        !classDef.type.contains('/') &&
            classDef.fields.any { it.type == "I" } &&
            classDef.fields.count { it.type == "Ljava/lang/Object;" } >= 3
    },
)

/** The profile's frame-rate matching strategy: read by both the Media3 hint and Stremio's own display-mode matcher. */
object FrameRateStrategyGetterFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/core/types/profile/Profile\$Settings;",
    name = "getFrameRateMatchingStrategy",
    parameters = listOf(),
)
