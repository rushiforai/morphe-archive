package dev.materialtidal.patches.tidal.layout.waveform

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object WaveformAudioPlayerSwitchFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/player/a;",
    parameters = listOf("Lcom/aspiro/wamp/player/PlaybackType;"),
    returnType = "V",
    custom = { method, _ -> !method.name.startsWith("<") },
)

internal object WaveformAudioPlayerSingletonFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/player/a\$c;",
    parameters = emptyList(),
    returnType = "Lcom/aspiro/wamp/player/a;",
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

internal object WaveformCastCredentialsHelperFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/cast/a;",
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.size == 1 &&
            !method.name.startsWith("<")
    },
)

internal object DefaultAudioSinkHandleBufferFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/audio/DefaultAudioSink;",
    name = "handleBuffer",
    parameters = listOf("Ljava/nio/ByteBuffer;", "J", "I"),
    returnType = "Z",
)
