package app.ytmextras.patches.pitch

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * androidx.media3.common.PlaybackParameters.toString(), which reads speed and then pitch.
 */
internal object PlaybackParametersToStringFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(definingClass = "this", opcode = Opcode.IGET, type = "F"),
        fieldAccess(opcode = Opcode.IGET, type = "F")
    ),
    strings = listOf("PlaybackParameters(speed=%.2f, pitch=%.2f)")
)

/**
 * androidx.media3.exoplayer.ExoPlayerImpl.setPlaybackParameters(PlaybackParameters).
 */
internal fun setPlaybackParametersFingerprint(playbackParametersType: String) = object : Fingerprint(
    interfaces = listOf("Landroidx/media3/exoplayer/ExoPlayer;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(playbackParametersType)
) {}

/**
 * Constructor of ExoPlayerImpl. More than one can exist at a time, such as with a crossfade.
 */
internal fun exoPlayerConstructorFingerprint(playbackParametersType: String) = object : Fingerprint(
    classFingerprint = setPlaybackParametersFingerprint(playbackParametersType),
    name = "<init>",
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_DIRECT, name = "<init>")
    )
) {}

/**
 * Called with the player response model when a new track loads.
 */
internal object VideoIdFingerprint : Fingerprint(
    parameters = listOf("L", "Ljava/lang/String;"),
    filters = listOf(
        string("Null initialPlayabilityStatus")
    )
)

internal object MusicActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/music/activities/MusicActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)
