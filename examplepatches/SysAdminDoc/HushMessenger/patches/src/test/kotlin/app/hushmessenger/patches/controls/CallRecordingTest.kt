package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val PLAYOUT_THREAD = "LX/Cvy;"
private const val RECORD_THREAD = "LX/Cvx;"
private const val AI_TRACK = "Lorg/webrtc/audio/WebRtcAudioTrack;"
private const val AI_THREAD = "Lorg/webrtc/audio/WebRtcAudioTrack\$AudioTrackThread;"
private const val TRACK_WRITE = "Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I"
private const val RECORD_READ = "Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I"
private const val PLAYOUT_DATA = "$WEBRTC_AUDIO_TRACK->-\$\$Nest\$mnativeGetPlayoutData(${WEBRTC_AUDIO_TRACK}IJ)V"
private const val AI_PLAYOUT_DATA = "$AI_TRACK->-\$\$Nest\$mnativeGetPlayoutData(${AI_TRACK}IJ)V"
private const val DATA_RECORDED = "$WEBRTC_AUDIO_RECORD->-\$\$Nest\$mnativeDataIsRecorded(${WEBRTC_AUDIO_RECORD}IJ)V"
internal const val SYNTHETIC_CALL_HOLDER = "$OVERLAY_CONFIG_HOLDER-><init>(Ljava/util/ArrayList;)V"
internal const val SYNTHETIC_CALL_START = "$WEBRTC_AUDIO_TRACK->startPlayout()Z"
internal const val SYNTHETIC_CALL_STOP = "$WEBRTC_AUDIO_TRACK->stopPlayout()Z"
internal const val SYNTHETIC_CALL_PLAYOUT = "$PLAYOUT_THREAD->run()V"
internal const val SYNTHETIC_CALL_RECORD = "$RECORD_THREAD->run()V"

private fun holderMethod(id: String = SYNTHETIC_CALL_HOLDER): MutableMethod = fixtureMethod(id, """
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I
    return-void
""".trimIndent(), registers = 3)

private fun switchMethod(id: String): MutableMethod = fixtureMethod(id, """
    const/4 v0, 0x1
    return v0
""".trimIndent(), registers = 2)

/** A frame comes from native, then goes to the speaker with the registers just loaded. */
private fun playoutMethod(owner: String = PLAYOUT_THREAD, reader: String = PLAYOUT_DATA, writes: Int = 1, jumpIn: Boolean = false): MutableMethod {
    val write = "invoke-virtual {v1, v0, v10, v9}, $TRACK_WRITE"
    return fixtureMethod("$owner->run()V", """
        const/4 v7, 0x0
        const/16 v10, 0x1e0
        const/4 v9, 0x0
        const-wide/16 v0, 0x0
        invoke-static {v7, v10, v0, v1}, $reader
        ${if (jumpIn) "if-eqz v9, :write" else "nop"}
        iget-object v1, v7, $WEBRTC_AUDIO_TRACK->audioTrack:Landroid/media/AudioTrack;
        iget-object v0, v7, $WEBRTC_AUDIO_TRACK->byteBuffer:Ljava/nio/ByteBuffer;
        ${if (jumpIn) ":write" else ""}
        ${List(writes) { write }.joinToString("\n")}
        return-void
    """.trimIndent(), registers = 16)
}

/** The microphone is read, then native's handle is loaded and the frame handed over. */
private fun recordMethod(owner: String = RECORD_THREAD, loadsHandle: Boolean = true, jumpIn: Boolean = false): MutableMethod =
    fixtureMethod("$owner->run()V", """
        const/4 v5, 0x0
        const/4 v2, 0x0
        const/4 v4, 0x0
        invoke-virtual {v2, v4, v2}, $RECORD_READ
        move-result v3
        const-wide/16 v0, 0x0
        ${if (jumpIn) "if-eqz v3, :hand" else "nop"}
        ${if (jumpIn) ":hand" else ""}
        ${if (loadsHandle) "iget-wide v0, v5, $WEBRTC_AUDIO_RECORD->nativeAudioRecord:J" else "nop"}
        invoke-static {v5, v3, v0, v1}, $DATA_RECORDED
        return-void
    """.trimIndent(), registers = 7)

internal fun callRecordingFixture(
    holder: MutableMethod? = holderMethod(),
    start: MutableMethod? = switchMethod(SYNTHETIC_CALL_START),
    stop: MutableMethod? = switchMethod(SYNTHETIC_CALL_STOP),
    playout: MutableMethod? = playoutMethod(),
    record: MutableMethod? = recordMethod(),
): List<MutableClass> = listOf(
    fixtureClass(OVERLAY_CONFIG_HOLDER, listOfNotNull(holder)),
    fixtureClass(WEBRTC_AUDIO_TRACK, listOfNotNull(start, stop)),
    fixtureClass(PLAYOUT_THREAD, listOfNotNull(playout)),
    fixtureClass(RECORD_THREAD, listOfNotNull(record)),
    // Meta AI's copy of the playout thread, in another package. It never plays a call.
    fixtureClass(AI_THREAD, listOf(playoutMethod(AI_THREAD, AI_PLAYOUT_DATA))),
)

class CallRecordingTest {
    private val everyStep = setOf(SYNTHETIC_CALL_HOLDER, SYNTHETIC_CALL_START, SYNTHETIC_CALL_STOP, SYNTHETIC_CALL_PLAYOUT, SYNTHETIC_CALL_RECORD)

    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(CALL_RECORDING).map { it.hookId() }.toSet()

    private fun inject(method: MutableMethod) = injectControl(CALL_RECORDING, mapOf(CALL_RECORDING to listOf(method)))

    private fun MutableMethod.code() = implementation!!.instructions.toList()

    private fun FiveRegisterInstruction.registers() = listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)

    @Test fun aCallPlaysThroughTheseFiveStepsNotMetaAisCopy() {
        assertEquals(everyStep, found(callRecordingFixture()))
        validateControls(mirroredControls(callRecordingFixture()), setOf(CALL_RECORDING))
        assertEquals(everyStep, SYNTHETIC_PROFILE.hooks.getValue(CALL_RECORDING))
        assertEquals(5, BASE_PROFILE.hooks.getValue(CALL_RECORDING).size)
    }

    @Test fun anythingMissingOrAmbiguousFindsNothing() {
        val cases = mapOf(
            "no config holder" to callRecordingFixture(holder = null),
            "a holder that takes something else" to callRecordingFixture(holder = holderMethod("$OVERLAY_CONFIG_HOLDER-><init>(Ljava/util/List;)V")),
            "no start" to callRecordingFixture(start = null),
            "no stop" to callRecordingFixture(stop = null),
            "no playout thread" to callRecordingFixture(playout = null),
            "no record thread" to callRecordingFixture(record = null),
            "two writes to the speaker" to callRecordingFixture(playout = playoutMethod(writes = 2)),
            "a jump straight to the write" to callRecordingFixture(playout = playoutMethod(jumpIn = true)),
            "a jump straight to the hand over" to callRecordingFixture(record = recordMethod(jumpIn = true)),
            "native's handle loaded elsewhere" to callRecordingFixture(record = recordMethod(loadsHandle = false)),
            "two record threads" to callRecordingFixture() + fixtureClass("LX/Second;", listOf(recordMethod("LX/Second;"))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(CALL_RECORDING)) }
        }
    }

    @Test fun theExtensionSeesTheLayersBeforeNativeDoes() {
        val method = holderMethod()
        val stock = method.code().map { it.opcode }
        inject(method)
        val code = method.code()
        assertEquals(listOf(Opcode.INVOKE_STATIC) + stock, code.map { it.opcode })
        assertEquals(CALL_RECORDING_ADD_LAYER, (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(2), (code[0] as FiveRegisterInstruction).registers())
    }

    @Test fun bothSwitchesTellTheExtensionFirst() {
        for ((id, call) in listOf(SYNTHETIC_CALL_START to CALL_RECORDING_STARTED, SYNTHETIC_CALL_STOP to CALL_RECORDING_STOPPED)) {
            val method = switchMethod(id)
            val stock = method.code().map { it.opcode }
            inject(method)
            val code = method.code()
            assertEquals(listOf(Opcode.INVOKE_STATIC) + stock, code.map { it.opcode })
            assertEquals(call, (code[0] as ReferenceInstruction).reference.toString())
        }
    }

    @Test fun theFarSideIsReadWithTheWritesOwnRegistersRightBeforeIt() {
        val method = playoutMethod()
        inject(method)
        val code = method.code()
        val write = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == TRACK_WRITE }
        assertEquals(CALL_RECORDING_HEARD, (code[write - 1] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(1, 0, 10), (code[write - 1] as FiveRegisterInstruction).registers())
        assertEquals(listOf(1, 0, 10, 9), (code[write] as FiveRegisterInstruction).registers())
    }

    @Test fun theMicrophoneIsReadBeforeTheHandleLoadsOverTheRegistersItBorrows() {
        val method = recordMethod()
        inject(method)
        val code = method.code()
        val handle = code.indexOfFirst { it.opcode == Opcode.IGET_WIDE }
        assertEquals(Opcode.IGET_OBJECT, code[handle - 3].opcode)
        assertEquals(Opcode.IGET_OBJECT, code[handle - 2].opcode)
        assertEquals(CALL_RECORDING_SPOKE, (code[handle - 1] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(0, 1, 3), (code[handle - 1] as FiveRegisterInstruction).registers())
        assertEquals(listOf(5, 3, 0, 1), (code[handle + 1] as FiveRegisterInstruction).registers())
    }
}
