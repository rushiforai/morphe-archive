/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.calldebug

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.branchTarget
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.refusedByVerifier
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val CALL_RECORDER = "$EXTENSION_PACKAGE/misc/CallRecorder;"
/** The static helper added to each engine's recorder, which reads its private fields for the hook. */
internal const val CALL_AUDIO_HELPER = "hushCallAudio"
internal const val AUDIO_RECORD = "Landroid/media/AudioRecord;"
internal const val AUDIO_TRACK = "Landroid/media/AudioTrack;"
internal const val BYTE_BUFFER = "Ljava/nio/ByteBuffer;"
internal const val RECORDED_NATIVE = "nativeDataIsRecorded"
internal val CALL_RECORDER_RECORDED = listOf(AUDIO_RECORD, BYTE_BUFFER, "I")
internal val CALL_RECORDER_PLAYED = listOf(AUDIO_TRACK, BYTE_BUFFER, "I")
internal const val CALL_RECORD_BUTTON = "$EXTENSION_PACKAGE/misc/CallRecordButton;"
internal const val VIEW = "Landroid/view/View;"
internal const val CALL_STATE_LISTENER = "Lorg/telegram/messenger/voip/VoIPService\$StateListener;"
internal const val PHONE_CALL = "Lorg/telegram/tgnet/tl/TL_phone\$PhoneCall;"
/** VoIPFragment logs this, so it's how the call screen is found once R8 has renamed it. */
internal const val CALL_SCREEN_STRING = "self-muted"
private val TRACK_WRITE_CALLS = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)
private val RECORDED_CALLS = setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE)
private val SWITCHES = setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH)

/**
 * Telegram ships two WebRTC audio engines and a call runs on one of them, so each gets its own
 * pair of taps: the microphone block on its way to WebRTC and the other side's block on its way
 * to the speaker.
 */
internal enum class CallAudioEngine(private val root: String, private val prefix: String, val label: String) {
    NEWER("Lorg/webrtc/audio/", "modern", "newer"),
    OLDER("Lorg/webrtc/voiceengine/", "legacy", "older");

    val record get() = "${root}WebRtcAudioRecord;"
    val playout get() = "${root}WebRtcAudioTrack\$AudioTrackThread;"
    val recorded get() = "${prefix}Recorded"
    val played get() = "${prefix}Played"
}

/**
 * Where one engine is tapped. [recordMethod] hands WebRTC each recorded block through a call at
 * [recordIndex], with the recorder in [recorder] and the block's length in [bytes]. [playMethod]
 * hands the speaker each block through `AudioTrack.write` at [playIndex].
 */
internal class CallAudioTap(
    val engine: CallAudioEngine,
    val recordMethod: MutableMethod,
    val recordIndex: Int,
    val recorder: Int,
    val bytes: Int,
    val helper: MutableMethod,
    val playMethod: MutableMethod,
    val playIndex: Int,
    val track: Int,
    val buffer: Int,
    val size: Int,
) {
    val recordCode get() = "invoke-static {v$recorder, v$bytes}, ${engine.record}->$CALL_AUDIO_HELPER(${engine.record}I)V"
    val playCode get() = "invoke-static {v$track, v$buffer, v$size}, $CALL_RECORDER->${engine.played}" +
        "(${CALL_RECORDER_PLAYED.joinToString("")})V"
}

/** The engines that can be tapped, and why each of the others can't. Nothing is edited here. */
internal class CallAudioPlan(val taps: List<CallAudioTap>, val missing: Map<CallAudioEngine, String>)

private class CallAudioMissing(reason: String) : Exception(reason)

private fun missingCallAudio(reason: String): Nothing = throw CallAudioMissing(reason)

internal fun BytecodePatchContext.resolveCallAudio(): CallAudioPlan {
    val taps = mutableListOf<CallAudioTap>()
    val missing = linkedMapOf<CallAudioEngine, String>()
    for (engine in CallAudioEngine.entries) {
        try {
            taps += callAudioTap(engine)
        } catch (why: CallAudioMissing) {
            missing[engine] = why.message.orEmpty()
        }
    }
    return CallAudioPlan(taps, missing)
}

/** Adds each engine's helper and both taps. Every tap was already assembled on a copy. */
internal fun BytecodePatchContext.applyCallAudio(plan: CallAudioPlan) {
    for (tap in plan.taps) {
        mutableClassDefBy(tap.engine.record).methods.add(tap.helper)
        tap.recordMethod.addInstructions(tap.recordIndex, tap.recordCode)
        tap.playMethod.addInstructions(tap.playIndex, tap.playCode)
    }
}

private fun BytecodePatchContext.callAudioTap(engine: CallAudioEngine): CallAudioTap {
    val record = mutableClassDefByOrNull(engine.record) ?: missingCallAudio("the ${engine.label} engine's recorder is gone")
    val sites = record.methods.flatMap { method ->
        val body = method.body()
        body.indices.filter { body[it].call()?.let { call ->
            call.definingClass == record.type && call.name == RECORDED_NATIVE
        } == true }.map { method to it }
    }
    if (sites.size != 1) missingCallAudio("the ${engine.label} engine hands recorded audio to WebRTC from ${sites.size} places")
    val (recordMethod, recordIndex) = sites.single()
    val handOver = recordMethod.getInstruction(recordIndex)
    val native = handOver.call()!!
    val ints = native.parameterTypes.withIndex().filter { it.value.toString() == "I" }
    if (handOver.opcode !in RECORDED_CALLS || ints.size != 1) {
        missingCallAudio("the ${engine.label} engine's recorded audio no longer goes to WebRTC with its length")
    }
    val handed = handOver.namedRegisters()
    // The receiver comes first, then each parameter, two registers for a long.
    val recorder = handed[0]
    val bytes = handed[1 + native.parameterTypes.take(ints.single().index).sumOf { width(it) }]
    if (recorder > 15 || bytes > 15) missingCallAudio("the ${engine.label} engine's recorder moved to registers a hook can't reach")
    if (recordMethod.jumpedOnto(recordIndex)) missingCallAudio("a branch now lands on the ${engine.label} engine's recorded audio")

    for ((name, type) in listOf("audioRecord" to AUDIO_RECORD, "byteBuffer" to BYTE_BUFFER)) {
        val found = record.fields.filter { it.name == name && it.type == type && !AccessFlags.STATIC.isSet(it.accessFlags) }
        if (found.size != 1) missingCallAudio("the ${engine.label} engine's recorder has no $name")
    }
    if (record.methods.any { it.name == CALL_AUDIO_HELPER }) missingCallAudio("the ${engine.label} engine's recorder is already tapped")
    val helper = recordHelper(engine)

    val thread = mutableClassDefByOrNull(engine.playout) ?: missingCallAudio("the ${engine.label} engine's speaker thread is gone")
    val writes = thread.methods.flatMap { method ->
        val body = method.body()
        body.indices.filter { body[it].trackWrite() }.map { method to it }
    }
    if (writes.size != 1) missingCallAudio("the ${engine.label} engine plays call audio from ${writes.size} places")
    val (playMethod, playIndex) = writes.single()
    val (track, buffer, size) = playMethod.getInstruction(playIndex).namedRegisters()
    if (maxOf(track, buffer, size) > 15) missingCallAudio("the ${engine.label} engine's speaker moved to registers a hook can't reach")
    if (playMethod.jumpedOnto(playIndex)) missingCallAudio("a branch now lands on the ${engine.label} engine's speaker write")

    val tap = CallAudioTap(engine, recordMethod, recordIndex, recorder, bytes, helper, playMethod, playIndex, track, buffer, size)
    // Assembled on copies, so a snippet the compiler refuses leaves the app untouched.
    try {
        MutableMethod(ImmutableMethod.of(recordMethod)).addInstructions(recordIndex, tap.recordCode)
        MutableMethod(ImmutableMethod.of(playMethod)).addInstructions(playIndex, tap.playCode)
    } catch (refused: RuntimeException) {
        missingCallAudio("the ${engine.label} engine's taps don't assemble: ${refused.message}")
    }
    return tap
}

/**
 * `hushCallAudio(recorder, bytes)`: the recorder's AudioRecord and buffer are private, so a
 * static method of the recorder itself reads them and passes them on to the extension.
 */
private fun BytecodePatchContext.recordHelper(engine: CallAudioEngine): MutableMethod {
    val type = engine.record
    val helper = ImmutableMethod(
        type,
        CALL_AUDIO_HELPER,
        listOf(ImmutableMethodParameter(type, null, null), ImmutableMethodParameter("I", null, null)),
        "V",
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        null,
        null,
        MutableMethodImplementation(4),
    ).toMutable()
    try {
        helper.addInstructions(
            0,
            """
                iget-object v0, p0, $type->audioRecord:$AUDIO_RECORD
                iget-object v1, p0, $type->byteBuffer:$BYTE_BUFFER
                invoke-static {v0, v1, p1}, $CALL_RECORDER->${engine.recorded}(${CALL_RECORDER_RECORDED.joinToString("")})V
                return-void
            """,
        )
    } catch (refused: RuntimeException) {
        missingCallAudio("the ${engine.label} engine's recorder helper doesn't assemble: ${refused.message}")
    }
    // ART verifies the whole class when it loads, and a refused helper would take WebRTC's recorder down with it.
    val refusals = try {
        refusedByVerifier(helper, { classDefByOrNull(it)?.superclass },
            { classDefByOrNull(it)?.let { found -> AccessFlags.INTERFACE.isSet(found.accessFlags) } })
    } catch (unreadable: IllegalArgumentException) {
        listOf("its body can't be checked: ${unreadable.message}")
    }
    if (refusals.isNotEmpty()) missingCallAudio("the ${engine.label} engine's recorder helper would fail Android's verifier: ${refusals.joinToString("; ")}")
    return helper
}

/**
 * Where the call screen gets its record button: in VoIPFragment's static `show`, which builds the
 * screen's view (createView is inlined there) and then adds it to the call window, the method's last
 * one-argument `addView`. [screen] holds that view.
 */
internal class CallRecordButtonHook(val method: MutableMethod, val index: Int, val screen: Int) {
    val code get() = "invoke-static/range {v$screen .. v$screen}, $CALL_RECORD_BUTTON->attach($VIEW)V"
}

/** The button's hook, or why the call screen can't take one. Nothing is edited here. */
internal class CallRecordButtonPlan(val hook: CallRecordButtonHook?, val missing: String?)

internal fun BytecodePatchContext.resolveCallRecordButton(): CallRecordButtonPlan = try {
    CallRecordButtonPlan(callRecordButtonHook(), null)
} catch (why: CallAudioMissing) {
    CallRecordButtonPlan(null, why.message.orEmpty())
}

/** Adds the button's hook, already assembled on a copy. Answers whether there was one. */
internal fun applyCallRecordButton(plan: CallRecordButtonPlan): Boolean {
    val hook = plan.hook ?: return false
    hook.method.addInstructionsAtControlFlowLabel(hook.index, hook.code)
    return true
}

private fun BytecodePatchContext.callRecordButtonHook(): CallRecordButtonHook {
    val screens = classDefsMentioning(Mention.string(CALL_SCREEN_STRING)).filter { classDef ->
        CALL_STATE_LISTENER in classDef.interfaces && classDef.methods.any { it.showsCallScreen() }
    }
    if (screens.size != 1) missingCallAudio("the call screen is ${screens.size} classes")
    val show = mutableClassDefBy(screens.single()).methods.singleOrNull { it.showsCallScreen() }
        ?: missingCallAudio("the call screen is shown from more than one place")
    val body = show.body()
    val video = body.indices.lastOrNull { body[it].readsVideoFlag() } ?: missingCallAudio("the call screen no longer checks for a video call")
    val adds = body.indices.filter { it > video && body[it].addsOneView() }
    if (adds.size != 1) missingCallAudio("the call screen joins its window from ${adds.size} places")
    val index = adds.single()
    val screen = body[index].namedRegisters()[1]
    val hook = CallRecordButtonHook(show, index, screen)
    // Without a call service Telegram jumps straight to the add, so the hook takes over its label.
    try {
        MutableMethod(ImmutableMethod.of(show)).addInstructionsAtControlFlowLabel(index, hook.code)
    } catch (refused: Exception) {
        missingCallAudio("the call screen's record button doesn't assemble: ${refused.message}")
    }
    return hook
}

private fun Method.showsCallScreen() = AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    parameterTypes.map { it.toString() } == listOf("Landroid/app/Activity;", "I")

private fun Instruction.readsVideoFlag() = opcode == Opcode.IGET_BOOLEAN &&
    ((this as ReferenceInstruction).reference as? FieldReference)?.let { field ->
        field.definingClass == PHONE_CALL && field.name == "video" && field.type == "Z"
    } == true

private fun Instruction.addsOneView() = opcode == Opcode.INVOKE_VIRTUAL && call()?.let { call ->
    call.definingClass == "Landroid/view/ViewGroup;" && call.name == "addView" && call.returnType == "V" &&
        call.parameterTypes.map { it.toString() } == listOf(VIEW)
} == true

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.trackWrite() = opcode in TRACK_WRITE_CALLS && call()?.let { call ->
    call.definingClass == AUDIO_TRACK && call.name == "write" && call.returnType == "I" &&
        call.parameterTypes.map { it.toString() } == listOf(BYTE_BUFFER, "I", "I")
} == true

private fun width(type: CharSequence) = if (type.toString() == "J" || type.toString() == "D") 2 else 1

/**
 * Whether anything but falling through reaches [index]: a branch, a switch arm or a handler. An
 * instruction put in front of it would be skipped on that path, since a jump keeps its target.
 */
private fun Method.jumpedOnto(index: Int): Boolean {
    val flow = try {
        ControlFlow.of(this)
    } catch (unreadable: IllegalArgumentException) {
        return true
    }
    if (flow.exceptional.any { index in it }) return true
    return flow.normal.indices.any { from ->
        index in flow.normal[from] && (from != index - 1 || flow.instructions[from].let { before ->
            before is OffsetInstruction && (before.opcode in SWITCHES ||
                flow.instructions.branchTarget(from) { missingCallAudio(it) } == index)
        })
    }
}
