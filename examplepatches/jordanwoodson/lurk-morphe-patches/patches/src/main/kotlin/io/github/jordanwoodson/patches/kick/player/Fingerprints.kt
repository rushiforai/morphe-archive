package io.github.jordanwoodson.patches.kick.player

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

private const val MANAGER = "Lcom/kick/mobile/kickivsplayerv2/KickIvsPlayerV2Manager;"
internal const val PLAYER_VIEW = "Lcom/kick/mobile/kickivsplayerv2/KickIvsPlayerV2View;"

/** Smali descriptor of the extension's player class. */
internal const val KICK_PLAYER = "Lio/github/jordanwoodson/extension/shared/kick/KickPlayer;"

// Kick's own Kotlin classes keep their names: the activity and its player module.

internal object UserLeaveHintFingerprint : Fingerprint(
    definingClass = "Lcom/kick/mobile/MainActivity;", name = "onUserLeaveHint", returnType = "V",
    parameters = emptyList(), filters = listOf(string("android.software.picture_in_picture")),
)

internal object ShouldRunAudioServiceFingerprint : Fingerprint(
    definingClass = MANAGER, name = "shouldRunAudioService", returnType = "Z", parameters = emptyList(),
)

internal object ActivityResumeFingerprint : Fingerprint(
    definingClass = MANAGER, name = "onActivityResume", returnType = "V", parameters = listOf("Landroid/content/Context;"),
)

internal object PlayerViewPlayFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, name = "play", returnType = "V", parameters = emptyList(),
)

internal object PlayerViewPauseFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, name = "pause", returnType = "V", parameters = emptyList(),
)

internal object PlayerOperationExecutorFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/jvm/functions/Function0;"),
    filters = listOf(string("Player operation rejected")),
)

internal object SetAutoMaxQualityFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, name = "setAutoMaxQuality", returnType = "V", parameters = listOf("Ljava/lang/Integer;"),
)

internal object MainActivityCreateFingerprint : Fingerprint(
    definingClass = "Lcom/kick/mobile/MainActivity;", name = "onCreate", returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object SurfaceTransformFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, name = "updateSurfaceViewTransform", returnType = "V", parameters = emptyList(),
)

internal object UpdatePipParamsFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, name = "updatePipParams", returnType = "Landroid/app/PictureInPictureParams;",
    parameters = listOf("Z", "Landroid/graphics/Rect;", "Landroid/util/Rational;"),
)

/** Kick's once-a-second player observer reads the IVS player's bitrate, duration and latency here. */
internal object PlayerStatisticsFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, name = "handlePlayerStatistics", returnType = "V",
    parameters = listOf("Lcom/amazonaws/ivs/player/Player;"),
)

/** React Native hands the player view each stream's address here; it loads it on the player executor. */
internal object PlayerViewSetStreamUrlFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, name = "setStreamUrl", returnType = "V", parameters = listOf("Ljava/lang/String;"),
)

internal object PlayerViewSeekFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, name = "seekTo", returnType = "V", parameters = listOf("D"),
)
