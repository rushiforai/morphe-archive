package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/**
 * Records a call (#105). Messenger plays a call through its own native Oboe module, with nothing in Java to read. Native
 * picks that module from Java's config layers, arrays of numbers it reads last layer first, so with the switch on one more
 * layer goes last and picks WebRTC's Java audio instead. Both of its threads then show their sound to the extension as it
 * passes.
 *
 * Two things that look like the way in and aren't: Rsys's AudioApi is only wired up for Meta AI's voice sessions, so a sink
 * added during a call never gets a frame and setIsCallActive doesn't follow the call, and WebRtcAudioManager's OpenSL check
 * is never asked, because Messenger's module doesn't use that path.
 */
internal const val CALL_RECORDING = "call_recording"
internal const val CALL_RECORDING_ADD_LAYER = "Lapp/hushmessenger/extension/CallRecording;->addLayer(Ljava/util/ArrayList;)V"
internal const val CALL_RECORDING_STARTED = "Lapp/hushmessenger/extension/CallRecording;->playoutStarted()V"
internal const val CALL_RECORDING_STOPPED = "Lapp/hushmessenger/extension/CallRecording;->playoutStopped()V"
internal const val CALL_RECORDING_HEARD = "Lapp/hushmessenger/extension/CallRecording;->heard(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)V"
internal const val CALL_RECORDING_SPOKE = "Lapp/hushmessenger/extension/CallRecording;->spoke(Landroid/media/AudioRecord;Ljava/nio/ByteBuffer;I)V"

internal const val OVERLAY_CONFIG_HOLDER = "Lcom/facebook/rsys/overlayconfigmanager/OverlayConfigManagerHolder;"
internal const val WEBRTC_AUDIO_TRACK = "Lorg/webrtc/voiceengine/WebRtcAudioTrack;"
internal const val WEBRTC_AUDIO_RECORD = "Lorg/webrtc/voiceengine/WebRtcAudioRecord;"
private const val TRACK_WRITE = "Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I"
private const val RECORD_READ = "Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I"
private const val RECORD_HANDLE = "$WEBRTC_AUDIO_RECORD->nativeAudioRecord:J"
private const val RECORD_OBJECT = "$WEBRTC_AUDIO_RECORD->audioRecord:Landroid/media/AudioRecord;"
private const val RECORD_BUFFER = "$WEBRTC_AUDIO_RECORD->byteBuffer:Ljava/nio/ByteBuffer;"

/** Where Java hands its config layers to native. Native calls into this class by name, so the name can't change. */
internal fun Method.isConfigHolder(): Boolean = definingClass == OVERLAY_CONFIG_HOLDER && name == "<init>" &&
    parameterTypes.singleOrNull()?.toString() == "Ljava/util/ArrayList;" && implementation != null

/** Native starts and stops the Java playout thread through these, and that's the call's audio coming and going. */
internal fun Method.isPlayoutSwitch(): Boolean = definingClass == WEBRTC_AUDIO_TRACK &&
    (name == "startPlayout" || name == "stopPlayout") && returnType == "Z" && parameterTypes.isEmpty() && implementation != null

private fun Method.isThreadRun(): Boolean = name == "run" && returnType == "V" && parameterTypes.isEmpty() && implementation != null

private fun Instruction.called(): String? = ((this as? ReferenceInstruction)?.reference)?.toString()

/**
 * Where the playout thread hands a frame to the speaker, or -1. Meta AI has a thread of the same shape under org/webrtc/audio,
 * so the native read has to be this package's.
 */
internal fun Method.playoutWriteAt(): Int {
    if (!isThreadRun()) return -1
    val code = implementation!!.instructions.toList()
    if (code.none { it.called()?.let { call -> call.startsWith("$WEBRTC_AUDIO_TRACK->") && "nativeGetPlayoutData" in call } == true }) return -1
    val writes = code.indices.filter { code[it].opcode == Opcode.INVOKE_VIRTUAL && code[it].called() == TRACK_WRITE }
    val at = writes.singleOrNull() ?: return -1
    return if (at in jumpTargets()) -1 else at
}

/**
 * Where the record thread reads native's handle to hand a frame over, or -1. Those two registers are about to be overwritten,
 * so the hook can use them, and a mute has already cleared the sound by here.
 */
internal fun Method.recordHandoverAt(): Int {
    if (!isThreadRun()) return -1
    val code = implementation!!.instructions.toList()
    if (code.none { it.called() == RECORD_READ }) return -1
    val hands = code.indices.filter { code[it].called()?.let { call -> call.startsWith("$WEBRTC_AUDIO_RECORD->") && "nativeDataIsRecorded" in call } == true }
    val call = hands.singleOrNull() ?: return -1
    if (call == 0 || code[call - 1].opcode != Opcode.IGET_WIDE || code[call - 1].called() != RECORD_HANDLE) return -1
    val handle = (code[call - 1] as TwoRegisterInstruction).registerA
    val args = code[call] as? FiveRegisterInstruction ?: return -1
    if (args.registerCount != 4 || args.registerE != handle || args.registerF != handle + 1 || handle + 1 > 15) return -1
    return if (call - 1 in jumpTargets()) -1 else call - 1
}

/** The config holder, both switches and the two threads, or nothing unless all five are there exactly once. */
internal fun findCallRecording(classes: Iterable<ClassDef>): List<Method> {
    val all = classes.flatMap { it.methods }
    val holder = all.filter { it.isConfigHolder() }.singleOrNull() ?: return emptyList()
    val switches = all.filter { it.isPlayoutSwitch() }
    val start = switches.singleOrNull { it.name == "startPlayout" } ?: return emptyList()
    val stop = switches.singleOrNull { it.name == "stopPlayout" } ?: return emptyList()
    val playout = all.filter { it.playoutWriteAt() >= 0 }.singleOrNull() ?: return emptyList()
    val record = all.filter { it.recordHandoverAt() >= 0 }.singleOrNull() ?: return emptyList()
    return listOf(holder, start, stop, playout, record)
}

internal fun MutableMethod.validateCallRecording() {
    validateScratch()
    if (!isConfigHolder() && !isPlayoutSwitch() && playoutWriteAt() < 0 && recordHandoverAt() < 0) {
        throw PatchException("Messenger controls: the call's audio threads changed (no audio step in ${hookId()})")
    }
}

/**
 * Moves the call's audio to Java when the switch is on, and shows the extension the sound. Nothing is kept until someone taps
 * Record, and a muted microphone or speaker has already been cleared by the time either thread gets here.
 */
internal fun MutableMethod.injectCallRecording() {
    validateCallRecording()
    when {
        isConfigHolder() -> addInstructions(0, "invoke-static {p1}, $CALL_RECORDING_ADD_LAYER")
        isPlayoutSwitch() -> addInstructions(0, "invoke-static {}, ${if (name == "startPlayout") CALL_RECORDING_STARTED else CALL_RECORDING_STOPPED}")
        playoutWriteAt() >= 0 -> {
            val at = playoutWriteAt()
            val write = getInstruction<FiveRegisterInstruction>(at)
            addInstructions(at, "invoke-static {v${write.registerC}, v${write.registerD}, v${write.registerE}}, $CALL_RECORDING_HEARD")
        }
        else -> {
            val at = recordHandoverAt()
            val free = getInstruction<TwoRegisterInstruction>(at).registerA
            val hand = getInstruction<FiveRegisterInstruction>(at + 1)
            addInstructions(at, """
                iget-object v$free, v${hand.registerC}, $RECORD_OBJECT
                iget-object v${free + 1}, v${hand.registerC}, $RECORD_BUFFER
                invoke-static {v$free, v${free + 1}, v${hand.registerD}}, $CALL_RECORDING_SPOKE
            """.trimIndent())
        }
    }
}
