package app.morphe.patches.piko.misc.shim.methods.broadcast.exoplayer.audio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val EXOPLAYER2_AUDIO_CLASS_PREFIX = "Lcom/google/android/exoplayer2/audio"

internal object ExoPlayerAudioFingerprint : Fingerprint(
    definingClass = EXOPLAYER2_AUDIO_CLASS_PREFIX,
    name = "<init>",
    returnType = "V",
    filters = listOf(
        newInstance("Landroid/os/Handler;"),
        literal(21),
        opcode(Opcode.IF_LT),
        newInstance(EXOPLAYER2_AUDIO_CLASS_PREFIX),
        string("external_surround_sound_enabled")
    )
)

internal object DefaultAudioSinkFingerprint : Fingerprint(
    definingClass = "$EXOPLAYER2_AUDIO_CLASS_PREFIX/DefaultAudioSink;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = EXOPLAYER2_AUDIO_CLASS_PREFIX,
    parameters = listOf(),
    filters = listOf(
        string("android.media.action.HDMI_AUDIO_PLUG"),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            definingClass = EXOPLAYER2_AUDIO_CLASS_PREFIX,
            parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
            returnType = EXOPLAYER2_AUDIO_CLASS_PREFIX
        )
    )
)

internal object AudioDeviceListenerFingerprint : Fingerprint(
    definingClass = EXOPLAYER2_AUDIO_CLASS_PREFIX,
    name = "onAudioDevicesAdded",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("[Landroid/media/AudioDeviceInfo;"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            definingClass = EXOPLAYER2_AUDIO_CLASS_PREFIX,
            parameters = listOf(EXOPLAYER2_AUDIO_CLASS_PREFIX, EXOPLAYER2_AUDIO_CLASS_PREFIX),
            returnType = "V"
        )
    )
)
