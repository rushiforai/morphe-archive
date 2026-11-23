package app.voidhack.patches.twitter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MUTE_HOOKS = "Lapp/voidhack/extension/twitter/spaces/mute/SpaceLocalMuteHooks;"

private object MuteLiveSpaceViewDelegateRender : Fingerprint(
    definingClass = "Lcom/twitter/rooms/ui/audiospace/a2;",
    name = "O",
    parameters = listOf("Lcom/twitter/weaver/d0;"),
    returnType = "V",
)

private object MuteReplaySpaceViewDelegateRender : Fingerprint(
    definingClass = "Lcom/twitter/rooms/ui/core/replay/l0;",
    name = "O",
    parameters = listOf("Lcom/twitter/weaver/d0;"),
    returnType = "V",
)

private object MuteRoomProfileViewRender : Fingerprint(
    definingClass = "Lcom/twitter/rooms/ui/utils/profile/r0;",
    name = "O",
    parameters = listOf("Lcom/twitter/weaver/d0;"),
    returnType = "V",
)

private object MuteRoomPlaybackStateObserver : Fingerprint(
    definingClass = "Lcom/twitter/rooms/playback/k0;",
    name = "invoke",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
)

private object MuteRoomPlaybackStart : Fingerprint(
    definingClass = "Lcom/twitter/rooms/playback/i0;",
    name = "a",
    parameters = listOf(
        "Lcom/twitter/rooms/playback/i0;",
        "Lcom/twitter/rooms/model/j;",
        "Lcom/twitter/rooms/model/helpers/j;",
    ),
    returnType = "V",
)

private object MuteRoomPlaybackStop : Fingerprint(
    definingClass = "Lcom/twitter/rooms/playback/i0;",
    name = "e",
    parameters = emptyList(),
    returnType = "V",
)

private object MuteMedia3AudioTrackSetVolume : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/audio/AudioTrackAudioOutput;",
    name = "l",
    parameters = listOf("F"),
    returnType = "V",
)

private object MuteMedia3AudioTrackWrite : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/audio/AudioTrackAudioOutput;",
    name = "i",
    parameters = listOf("I", "J", "Ljava/nio/ByteBuffer;"),
    returnType = "Z",
)

private object MuteExo2DefaultAudioSinkWrite : Fingerprint(
    definingClass = "Lcom/google/android/exoplayer2/audio/DefaultAudioSink;",
    name = "w",
    parameters = listOf("J", "Ljava/nio/ByteBuffer;"),
    returnType = "V",
)

private object MuteJanusRemoteAudioTrackAdd : Fingerprint(
    definingClass = "Ltv/periscope/android/hydra/janus/b;",
    name = "d",
    parameters = listOf("Ltv/periscope/android/callin/m;", "Ljava/lang/String;", "Lorg/webrtc/AudioTrack;"),
    returnType = "V",
)

private object MuteJanusRemoteAudioTrackRemove : Fingerprint(
    definingClass = "Ltv/periscope/android/hydra/janus/b;",
    name = "g",
    parameters = listOf("Ltv/periscope/android/callin/m;", "Ljava/lang/String;", "Lorg/webrtc/AudioTrack;"),
    returnType = "V",
)

private object MuteWebRtcAudioSourceEnable : Fingerprint(
    definingClass = "Ltv/periscope/android/hydra/media/d;",
    name = "b",
    parameters = emptyList(),
    returnType = "V",
)

@Suppress("unused")
val spacesLocalMutePatch = bytecodePatch(
    name = "Spaces local mute",
    description = "Locally mute specific speakers on the listener side in Twitter/X Spaces and replays (via Space profile popups or header mute sheet) without affecting other listeners. Compatible standalone or alongside Piko.",
) {
    compatibleWith(twitterCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        // 1. Space header mute pill + Space user profile local-mute row
        MuteLiveSpaceViewDelegateRender.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $MUTE_HOOKS->attachLiveSpaceHeader(Ljava/lang/Object;)V",
        )
        MuteReplaySpaceViewDelegateRender.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $MUTE_HOOKS->attachReplaySpaceHeader(Ljava/lang/Object;)V",
        )
        MuteRoomProfileViewRender.method.apply {
            val retIdx = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            check(retIdx >= 0) { "Missing return-void in com.twitter.rooms.ui.utils.profile.r0.O" }
            addInstruction(
                retIdx,
                "invoke-static/range {p0 .. p1}, $MUTE_HOOKS->attachProfileLocalMute(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        }

        // 2. RoomStateManager speaker roster & active-speaker tracking + HLS lifecycle
        MuteRoomPlaybackStateObserver.method.addInstruction(
            0,
            "invoke-static/range {p1 .. p1}, $MUTE_HOOKS->onRoomState(Ljava/lang/Object;)V",
        )
        MuteRoomPlaybackStart.method.addInstruction(
            0,
            "invoke-static/range {p1 .. p2}, $MUTE_HOOKS->onHlsPlaybackStarted(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        MuteRoomPlaybackStop.method.addInstruction(
            0,
            "invoke-static {}, $MUTE_HOOKS->onHlsPlaybackStopped()V",
        )

        // 3. HLS / Replay AudioTrack volume gate (Media3 + legacy ExoPlayer2)
        MuteMedia3AudioTrackSetVolume.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p1}, $MUTE_HOOKS->onMedia3SetVolume(Ljava/lang/Object;F)V",
        )
        MuteMedia3AudioTrackWrite.method.apply {
            val audioTrackReg = (instructions.first {
                val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
                it.opcode == Opcode.IGET_OBJECT &&
                    ref?.definingClass == "Landroidx/media3/exoplayer/audio/AudioTrackAudioOutput;" &&
                    ref.name == "a" && ref.type == "Landroid/media/AudioTrack;"
            } as TwoRegisterInstruction).registerA

            val pcmCounterIndex = instructions.indexOfFirst {
                val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
                it.opcode == Opcode.IGET_WIDE &&
                    ref?.definingClass == "Landroidx/media3/exoplayer/audio/AudioTrackAudioOutput;" &&
                    ref.name == "l" && ref.type == "J"
            }
            check(pcmCounterIndex >= 0) { "Failed to locate PCM counter in AudioTrackAudioOutput.i" }

            addInstruction(
                pcmCounterIndex,
                "invoke-static {p0, v$audioTrackReg}, $MUTE_HOOKS->onMedia3AudioTick(Ljava/lang/Object;Landroid/media/AudioTrack;)V",
            )
        }
        MuteExo2DefaultAudioSinkWrite.method.apply {
            val pcmCounterIndex = instructions.indexOfLast {
                val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
                it.opcode == Opcode.IGET_WIDE &&
                    ref?.definingClass == "Lcom/google/android/exoplayer2/audio/DefaultAudioSink;" &&
                    ref.name == "H" && ref.type == "J"
            }
            check(pcmCounterIndex >= 0) { "Failed to locate PCM counter H in DefaultAudioSink.w" }

            addInstruction(
                pcmCounterIndex,
                "invoke-static/range {p0 .. p0}, $MUTE_HOOKS->onExo2AudioTick(Ljava/lang/Object;)V",
            )
        }

        // 4. WebRTC per-speaker hardware track muting
        MuteJanusRemoteAudioTrackAdd.method.apply {
            val setVolIdx = instructions.indexOfFirst {
                val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    ref?.definingClass == "Lorg/webrtc/AudioTrack;" &&
                    ref.name == "setVolume" &&
                    ref.parameterTypes == listOf("D")
            }
            check(setVolIdx >= 0) { "Failed to locate AudioTrack.setVolume(D) in tv.periscope.android.hydra.janus.b.d" }
            val trackReg = getInstruction<FiveRegisterInstruction>(setVolIdx).registerC
            addInstruction(
                setVolIdx + 1,
                "invoke-static {p2, v$trackReg}, $MUTE_HOOKS->onWebRtcRemoteTrackAdded(Ljava/lang/String;Ljava/lang/Object;)V",
            )
        }
        MuteJanusRemoteAudioTrackRemove.method.addInstruction(
            0,
            "invoke-static/range {p2 .. p3}, $MUTE_HOOKS->onWebRtcRemoteTrackRemoved(Ljava/lang/String;Ljava/lang/Object;)V",
        )
        MuteWebRtcAudioSourceEnable.method.apply {
            val retIdx = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            check(retIdx >= 0) { "Missing return-void in tv.periscope.android.hydra.media.d.b" }
            addInstruction(
                retIdx,
                "invoke-static/range {p0 .. p0}, $MUTE_HOOKS->onWebRtcAudioSourceEnabled(Ljava/lang/Object;)V",
            )
        }
    }
}
