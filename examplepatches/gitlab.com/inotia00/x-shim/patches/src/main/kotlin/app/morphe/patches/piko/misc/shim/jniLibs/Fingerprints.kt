package app.morphe.patches.piko.misc.shim.jniLibs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val JAVA_AUDIO_DEVICE_MODULE_CLASS = "Lorg/webrtc/audio/JavaAudioDeviceModule;"
internal const val PEER_CONNECTION_FACTORY_CLASS = "Lorg/webrtc/PeerConnectionFactory;"

internal object PeerConnectionFactoryBuilderFingerprint : Fingerprint(
    definingClass = $$"Lorg/webrtc/PeerConnectionFactory$Builder;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    name = "createPeerConnectionFactory",
    returnType = PEER_CONNECTION_FACTORY_CLASS,
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            definingClass = PEER_CONNECTION_FACTORY_CLASS,
            parameters = listOf(),
            returnType = "V"
        )
    )
)

internal object PeerConnectionRTCConfigurationFingerprint : Fingerprint(
    definingClass = $$"Lorg/webrtc/PeerConnection$RTCConfiguration;",
    name = "<init>",
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = "this",
            name = "audioJitterBufferFastAccelerate"
        )
    )
)

internal object NativeCreatePeerConnectionFactoryFingerprint : Fingerprint(
    definingClass = PEER_CONNECTION_FACTORY_CLASS,
    name = "nativeCreatePeerConnectionFactory",
    returnType = PEER_CONNECTION_FACTORY_CLASS
)

internal object AudioDeviceModuleFingerprint : Fingerprint(
    definingClass = "Lorg/webrtc/audio/AudioDeviceModule;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.ABSTRACT),
    name = "getNative",
    parameters = listOf("J"),
    returnType = "J"
)

internal object JavaAudioDeviceModuleFingerprint : Fingerprint(
    definingClass = JAVA_AUDIO_DEVICE_MODULE_CLASS,
    name = "getNative",
    parameters = listOf("J"),
    returnType = "J",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            smali = "Lorg/webrtc/audio/JavaAudioDeviceModule;->context:Landroid/content/Context;"
        ),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            smali = "Lorg/webrtc/audio/JavaAudioDeviceModule;->audioManager:Landroid/media/AudioManager;",
            location = MatchAfterImmediately()
        ),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            smali = "Lorg/webrtc/audio/JavaAudioDeviceModule;->audioInput:Lorg/webrtc/audio/WebRtcAudioRecord;",
            location = MatchAfterImmediately()
        ),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            smali = "Lorg/webrtc/audio/JavaAudioDeviceModule;->audioOutput:Lorg/webrtc/audio/WebRtcAudioTrack;",
            location = MatchAfterImmediately()
        ),
        fieldAccess(
            opcode = Opcode.IGET,
            smali = "Lorg/webrtc/audio/JavaAudioDeviceModule;->inputSampleRate:I",
            location = MatchAfterImmediately()
        ),
        fieldAccess(
            opcode = Opcode.IGET,
            smali = "Lorg/webrtc/audio/JavaAudioDeviceModule;->outputSampleRate:I",
            location = MatchAfterImmediately()
        ),
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            smali = "Lorg/webrtc/audio/JavaAudioDeviceModule;->useStereoInput:Z",
            location = MatchAfterImmediately()
        ),
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            smali = "Lorg/webrtc/audio/JavaAudioDeviceModule;->useStereoOutput:Z",
            location = MatchAfterImmediately()
        ),
        opcode(
            opcode = Opcode.MOVE_WIDE,
            location = MatchAfterImmediately()
        ),
        methodCall(
            opcode = Opcode.INVOKE_STATIC_RANGE,
            smali = "Lorg/webrtc/audio/JavaAudioDeviceModule;->nativeCreateAudioDeviceModule(Landroid/content/Context;Landroid/media/AudioManager;Lorg/webrtc/audio/WebRtcAudioRecord;Lorg/webrtc/audio/WebRtcAudioTrack;JIIZZ)J",
            location = MatchAfterImmediately()
        )
    )
)

internal object NativeCreateAudioDeviceModuleFingerprint : Fingerprint(
    definingClass = JAVA_AUDIO_DEVICE_MODULE_CLASS,
    name = "nativeCreateAudioDeviceModule",
    returnType = "J"
)
