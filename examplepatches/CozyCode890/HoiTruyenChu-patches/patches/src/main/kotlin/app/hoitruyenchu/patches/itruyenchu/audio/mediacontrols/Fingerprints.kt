package app.hoitruyenchu.patches.itruyenchu.audio.mediacontrols

import app.morphe.patcher.Fingerprint

internal const val AUDIO_CONTROLS_SERVICE = "Lexpo/modules/audio/service/AudioControlsService;"
internal const val MEDIA3_PLAYER = "Landroidx/media3/common/Player;"
internal const val MEDIA_SESSION_BUILDER = "Landroidx/media3/session/MediaSession\$Builder;"
internal const val PLAYER_COMMANDS = "Landroidx/media3/common/Player\$Commands;"
internal const val ACCEPTED_RESULT_BUILDER = "Landroidx/media3/session/MediaSession\$ConnectionResult\$AcceptedResultBuilder;"

/** expo-audio: AudioMediaSessionCallback.onConnect(session, controller), removes the next / previous commands. */
internal object AudioSessionOnConnectFingerprint : Fingerprint(
    definingClass = "Lexpo/modules/audio/service/AudioMediaSessionCallback;",
    name = "onConnect",
    returnType = "Landroidx/media3/session/MediaSession\$ConnectionResult;",
    parameters = listOf(
        "Landroidx/media3/session/MediaSession;",
        "Landroidx/media3/session/MediaSession\$ControllerInfo;",
    ),
)

/** expo-audio: private fun setActivePlayerInternal(player, metadata, options), builds the MediaSession. */
internal object SetActivePlayerInternalFingerprint : Fingerprint(
    definingClass = AUDIO_CONTROLS_SERVICE,
    name = "setActivePlayerInternal",
    returnType = "V",
    parameters = listOf(
        "Lexpo/modules/audio/AudioPlayer;",
        "Lexpo/modules/audio/Metadata;",
        "Lexpo/modules/audio/AudioLockScreenOptions;",
    ),
)

/** expo-audio: private fun postOrStartForegroundNotification(startInForeground: Boolean) */
internal object PostOrStartForegroundNotificationFingerprint : Fingerprint(
    definingClass = AUDIO_CONTROLS_SERVICE,
    name = "postOrStartForegroundNotification",
    returnType = "V",
    parameters = listOf("Z"),
)
