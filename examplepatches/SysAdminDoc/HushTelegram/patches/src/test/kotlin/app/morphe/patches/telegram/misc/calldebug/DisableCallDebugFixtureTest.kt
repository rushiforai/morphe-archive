/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.calldebug

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import java.io.File
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origInterfaces
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

/**
 * The call-debug owner and both WebRTC engines' recorder and speaker thread enter the context.
 * Telegram's other audio and service classes aren't mutation targets.
 */
class DisableCallDebugFixtureTest {
    @Test
    fun `each declared build covers both RPCs and the deferred file upload while preserving cleanup`() {
        for (build in Fixtures.declaredBuilds()) {
            val owner = FixtureDex.classes(build, setOf(VOIP_DEBUG)).getValue(VOIP_DEBUG)
            val context = PatchContexts.of(ExtensionDex.classes() + owner + FixtureDex.classes(build, AUDIO_TYPES).values + callScreens(build) + voiceChatScreens(build))
            val hooks = context.resolveCallDebugHooks()
            assertEquals("${build.name}: complete call diagnostic coverage", CallDebugTarget.entries.toSet(), hooks.keys)
            val before = hooks.mapValues { ImmutableMethod.of(it.value.method) }
            val unchanged = owner.methods.filter { method -> hooks.values.none { it.method.sameSignature(method) } }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { disableCallDebugPatch.execute(context) })

            for ((target, hook) in hooks) {
                val original = before.getValue(target)
                val old = original.instructions()
                val after = hook.method.instructions()
                val invoke = if (target == CallDebugTarget.DEBUG) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC
                assertEquals("${build.name}: $target exact guard", listOf(invoke, Opcode.MOVE_RESULT, Opcode.IF_NEZ),
                    after.subList(hook.index, hook.index + 3).map { it.opcode })
                assertEquals("${build.name}: $target guard method", "$CALL_DEBUG->${HOOKS.getValue(target)}", after[hook.index].reference())
                assertEquals("${build.name}: $target keeps every original operation", old.map(::operation),
                    (after.take(hook.index) + after.drop(hook.index + 3)).map(::operation))
                val oldFlow = ControlFlow.of(original)
                val newFlow = ControlFlow.of(hook.method)
                fun moved(index: Int) = index + if (index >= hook.index) 3 else 0
                for (index in old.indices) {
                    assertEquals("${build.name}: $target keeps stock flow from $index",
                        oldFlow.normal[index].map { if (it == hook.index) hook.index else moved(it) }, newFlow.normal[moved(index)])
                }
                assertTrue("${build.name}: $target true reaches the original return", moved(hook.finish) in newFlow.normal[hook.index + 2])
                assertEquals(Opcode.RETURN_VOID, after[moved(hook.finish)].opcode)
                assertTrue("${build.name}: $target false reaches the original operation", hook.index + 3 in newFlow.normal[hook.index + 2])
                val guardedOperation = if (target == CallDebugTarget.FILE) hook.index + 3 else after.indexOfFirst { it.call()?.let { call ->
                    call.origDefiningClass == "Lorg/telegram/tgnet/ConnectionsManager;" && call.origName == "sendRequest"
                } == true }
                assertFalse("${build.name}: $target has no way to upload without reaching its guard",
                    guardedOperation in reachable(newFlow, 0, hook.index))
            }

            val debug = hooks.getValue(CallDebugTarget.DEBUG)
            val debugBody = debug.method.instructions()
            val debugFlow = ControlFlow.of(debug.method)
            val pendingRemove = debugBody.indexOfFirst { it.call()?.let { call ->
                call.origDefiningClass == "Ljava/util/HashMap;" && call.origName == "remove"
            } == true }
            assertTrue("${build.name}: pending data is removed before any diagnostic guard", pendingRemove in 0 until debug.index)
            assertFalse("${build.name}: cleanup dominates the guard", debug.index in reachable(debugFlow, 0, pendingRemove))
            val requestedBranch = debugBody.indices.single { debugBody[it].opcode == Opcode.IF_NEZ &&
                debugBody[it].namedRegisters() == listOf(debug.method.parameterRegisterNumber(1)) }
            assertEquals("${build.name}: need_debug true reaches the guard", debug.index,
                debugFlow.normal[requestedBranch].single { it != requestedBranch + 1 })
            assertEquals("${build.name}: need_debug false returns without reaching the guard", Opcode.RETURN_VOID,
                debugBody[debugFlow.normal[requestedBranch + 1].single()].opcode)
            val noDataBranch = pendingRemove + 3
            assertEquals(Opcode.IF_EQZ, debugBody[noDataBranch].opcode)
            assertEquals("${build.name}: absent pending data returns without counting", Opcode.RETURN_VOID,
                debugBody[debugFlow.normal[noDataBranch].single { it != noDataBranch + 1 }].opcode)

            val log = hooks.getValue(CallDebugTarget.LOG)
            val logBody = log.method.instructions()
            val logFlow = ControlFlow.of(log.method)
            val fileBranch = log.index - 2
            assertEquals(Opcode.IF_NEZ, logBody[fileBranch].opcode)
            assertEquals("${build.name}: null uploaded file returns before its guard", Opcode.RETURN_VOID, logBody[fileBranch + 1].opcode)
            assertTrue("${build.name}: nonnull file enters its guard", log.index in logFlow.normal[fileBranch])

            for (method in unchanged) {
                val after = context.tgMutableClassDefBy(VOIP_DEBUG).methods.single { it.sameSignature(method) }
                assertEquals("${build.name}: retains call state/preparation method $method", method.instructions().map(::operation), after.instructions().map(::operation))
            }
            val rpcs = FixtureDex.methodsWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() in setOf(SAVE_CALL_DEBUG, SAVE_CALL_LOG) }
            }
            assertEquals("${build.name}: every automatic call diagnostic RPC is covered", 2, rpcs.size)
            assertTrue("${build.name}: no other call diagnostic RPC owner", rpcs.all { it.origDefiningClass == VOIP_DEBUG })
            for (flag in listOf("disableCallDebug", "callRecording", "callRecordButton") + CallDebugTarget.entries.map { it.capability }) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.instructions()
                assertEquals("${build.name}: $flag build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(Opcode.RETURN, status[1].opcode)
            }
        }
    }

    @Test
    fun `wrong response empty log path and compression failure keep their exits without upload guards`() {
        for (build in Fixtures.declaredBuilds()) {
            val owner = FixtureDex.classes(build, setOf(VOIP_DEBUG)).getValue(VOIP_DEBUG)
            val response = owner.methods.single { method -> method.instructions().any {
                it.opcode == Opcode.INSTANCE_OF && it.reference() == "Lorg/telegram/tgnet/TLRPC\$TL_boolFalse;"
            } }
            val responseBody = response.instructions()
            val responseFlow = ControlFlow.of(response)
            val typeCheck = responseBody.indexOfFirst { it.opcode == Opcode.INSTANCE_OF }
            val wrongResponse = responseFlow.normal[typeCheck + 1].single { it != typeCheck + 2 }
            assertEquals("${build.name}: non-request response returns", Opcode.RETURN_VOID, responseBody[wrongResponse].opcode)
            val emptyCheck = responseBody.indexOfFirst { it.call()?.origName == "isEmpty" }
            assertEquals("${build.name}: empty path returns", wrongResponse,
                responseFlow.normal[emptyCheck + 2].single { it != emptyCheck + 3 })
            val compression = owner.methods.single { method -> method.instructions().any { it.call()?.origName == "gzip" || it.gzipWrite() } }
            val body = compression.instructions()
            val gzip = body.indexOfFirst { it.call()?.origName == "gzip" }
            if (gzip >= 0) {
                assertEquals("${build.name}: failed compression returns", Opcode.RETURN_VOID, body[gzip + 3].opcode)
                assertTrue("${build.name}: failure exit is the false compression branch", gzip + 3 in ControlFlow.of(compression).normal[gzip + 2])
            } else {
                // 13.2 inlines gzip: a failed write is caught and logged, and returns without posting the upload.
                val flow = ControlFlow.of(compression)
                val writes = body.indices.filter { body[it].gzipWrite() }
                val post = body.indices.single { body[it].call()?.origName == "runOnUIThread" }
                val failed = mutableSetOf<Int>()
                val queue = ArrayDeque(writes.flatMap { flow.exceptional[it] })
                while (queue.isNotEmpty()) queue.removeFirst().let { at -> if (failed.add(at)) queue.addAll(flow.normal[at] + flow.exceptional[at]) }
                assertTrue("${build.name}: every write can fail", writes.isNotEmpty() && writes.all { flow.exceptional[it].isNotEmpty() })
                assertFalse("${build.name}: a failed compression never posts the upload", post in failed)
                assertTrue("${build.name}: failed compression returns", failed.any { body[it].opcode == Opcode.RETURN_VOID })
            }
            assertFalse(responseBody.any { it.reference()?.startsWith("$CALL_DEBUG->") == true })
            assertFalse(body.any { it.reference()?.startsWith("$CALL_DEBUG->") == true })
        }
    }

    @Test
    fun `changed diagnostic geometry refuses every target before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val owner = FixtureDex.classes(build, setOf(VOIP_DEBUG)).getValue(VOIP_DEBUG)
            for (changed in CallDebugTarget.entries) {
                val context = PatchContexts.of(ExtensionDex.classes() + owner)
                val hooks = context.resolveCallDebugHooks()
                val invalid = hooks.getValue(changed)
                invalid.method.replaceInstruction(if (changed == CallDebugTarget.FILE) invalid.finish else invalid.index - 2, "nop")
                val before = hooks.mapValues { it.value.method.instructions().map(::operation) }
                try {
                    disableCallDebugPatch.execute(context)
                    fail("${build.name}: changed $changed geometry was accepted")
                } catch (expected: PatchException) {
                    assertTrue(expected.message.orEmpty().contains("before editing"))
                }
                for ((target, hook) in hooks) assertEquals("${build.name}: $changed doesn't partly mutate $target",
                    before.getValue(target), hook.method.instructions().map(::operation))
                for (flag in listOf("disableCallDebug", "callRecording", "callRecordButton") + CallDebugTarget.entries.map { it.capability }) {
                    val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.instructions()
                    assertEquals("${build.name}: rejected geometry leaves $flag false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
                }
            }
        }
    }

    @Test
    fun `both WebRTC engines hand each side of a call to the recorder in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val owner = FixtureDex.classes(build, setOf(VOIP_DEBUG)).getValue(VOIP_DEBUG)
            val context = PatchContexts.of(ExtensionDex.classes() + owner + FixtureDex.classes(build, AUDIO_TYPES).values + callScreens(build) + voiceChatScreens(build))
            val plan = context.resolveCallAudio()
            assertEquals("${build.name}: every engine can be tapped", emptyMap<CallAudioEngine, String>(), plan.missing)
            assertEquals(CallAudioEngine.entries, plan.taps.map { it.engine })
            val before = plan.taps.associate { it.engine to (ImmutableMethod.of(it.recordMethod) to ImmutableMethod.of(it.playMethod)) }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { disableCallDebugPatch.execute(context) })

            for (tap in plan.taps) {
                val engine = tap.engine
                val (oldRecord, oldPlay) = before.getValue(engine)
                assertEquals("${build.name}: ${engine.label} engine's registers", REGISTERS.getValue(engine),
                    listOf(tap.recorder, tap.bytes, tap.track, tap.buffer, tap.size))

                val record = tap.recordMethod.instructions()
                val recordHook = record[tap.recordIndex]
                assertEquals(Opcode.INVOKE_STATIC, recordHook.opcode)
                assertEquals("${build.name}: ${engine.label} microphone tap", "${engine.record}->$CALL_AUDIO_HELPER(${engine.record}I)V",
                    recordHook.reference())
                assertEquals(listOf(tap.recorder, tap.bytes), recordHook.namedRegisters())
                assertEquals("${engine.record}->$RECORDED_NATIVE", record[tap.recordIndex + 1].call()?.let { "${it.definingClass}->${it.name}" })
                assertTapped(build.name, oldRecord, tap.recordMethod, tap.recordIndex)

                val play = tap.playMethod.instructions()
                val playHook = play[tap.playIndex]
                assertEquals(Opcode.INVOKE_STATIC, playHook.opcode)
                assertEquals("${build.name}: ${engine.label} speaker tap",
                    "$CALL_RECORDER->${engine.played}(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)V", playHook.reference())
                assertEquals(listOf(tap.track, tap.buffer, tap.size), playHook.namedRegisters())
                assertEquals(listOf(tap.track, tap.buffer, tap.size), play[tap.playIndex + 1].namedRegisters().take(3))
                assertEquals("write", play[tap.playIndex + 1].call()?.name)
                assertTapped(build.name, oldPlay, tap.playMethod, tap.playIndex)

                val helper = context.tgMutableClassDefBy(engine.record).methods.single { it.origName == CALL_AUDIO_HELPER }
                assertEquals(listOf(engine.record, "I"), helper.parameterTypes.map { it.toString() })
                assertEquals("V", helper.returnType)
                assertEquals(AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value, helper.accessFlags)
                assertEquals("${build.name}: ${engine.label} helper reads the recorder and hands it on", listOf(
                    Opcode.IGET_OBJECT to "${engine.record}->audioRecord:Landroid/media/AudioRecord;",
                    Opcode.IGET_OBJECT to "${engine.record}->byteBuffer:Ljava/nio/ByteBuffer;",
                    Opcode.INVOKE_STATIC to "$CALL_RECORDER->${engine.recorded}(Landroid/media/AudioRecord;Ljava/nio/ByteBuffer;I)V",
                    Opcode.RETURN_VOID to null,
                ), helper.instructions().map(::operation))
                for (name in listOf(engine.recorded, engine.played)) {
                    val target = ExtensionDex.classDef(CALL_RECORDER).methods.single { it.origName == name }
                    assertTrue("$name is public static", AccessFlags.PUBLIC.isSet(target.accessFlags) && AccessFlags.STATIC.isSet(target.accessFlags))
                }
            }
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "callRecording" }.instructions()
            assertEquals("${build.name}: callRecording build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    @Test
    fun `an engine that can't be tapped is left out with one warning and the other still records`() {
        for (build in Fixtures.declaredBuilds()) {
            for (changed in CallAudioEngine.entries) {
                val owner = FixtureDex.classes(build, setOf(VOIP_DEBUG)).getValue(VOIP_DEBUG)
                val context = PatchContexts.of(ExtensionDex.classes() + owner + FixtureDex.classes(build, AUDIO_TYPES).values + callScreens(build) + voiceChatScreens(build))
                val thread = context.tgMutableClassDefBy(changed.playout)
                val (method, index) = thread.methods.flatMap { method ->
                    method.instructions().withIndex().filter { (_, instruction) -> instruction.call()?.let { call ->
                        call.origDefiningClass == AUDIO_TRACK && call.origName == "write" &&
                            call.parameterTypes.map { type -> type.toString() } == listOf(BYTE_BUFFER, "I", "I")
                    } == true }.map { method to it.index }
                }.single()
                method.replaceInstruction(index, "nop")
                val recordBefore = context.tgMutableClassDefBy(changed.record).methods.map { it.name to it.instructions().map(::operation) }

                val warnings = PatchLogCapture.warnings { disableCallDebugPatch.execute(context) }
                assertEquals("${build.name}: $changed", listOf("Disable call debug upload: the ${changed.label} engine plays call audio " +
                    "from 0 places. The patch goes on without call recording on the ${changed.label} engine."), warnings)
                assertEquals("${build.name}: the ${changed.label} recorder is left as it was", recordBefore,
                    context.tgMutableClassDefBy(changed.record).methods.map { it.name to it.instructions().map(::operation) })
                val other = CallAudioEngine.entries.single { it != changed }
                assertTrue("${build.name}: the ${other.label} engine still records",
                    context.tgMutableClassDefBy(other.record).methods.any { it.origName == CALL_AUDIO_HELPER })
                assertTrue(context.tgMutableClassDefBy(other.playout).methods.any { candidate ->
                    candidate.instructions().any { it.reference() == "$CALL_RECORDER->${other.played}(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)V" }
                })
                for (flag in listOf("disableCallDebug", "callRecording", "callRecordButton") + CallDebugTarget.entries.map { it.capability }) {
                    val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.instructions()
                    assertEquals("${build.name}: $flag with one engine tapped", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
                }
            }

            // With neither engine there's nothing to record, but the uploads are still blocked.
            val owner = FixtureDex.classes(build, setOf(VOIP_DEBUG)).getValue(VOIP_DEBUG)
            val context = PatchContexts.of(ExtensionDex.classes() + owner)
            val warnings = PatchLogCapture.warnings { disableCallDebugPatch.execute(context) }
            assertEquals(CallAudioEngine.entries.map { "Disable call debug upload: the ${it.label} engine's recorder is gone. " +
                "The patch goes on without call recording on the ${it.label} engine." }, warnings)
            for (flag in listOf("disableCallDebug", "callRecording", "callRecordButton") + CallDebugTarget.entries.map { it.capability }) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.instructions()
                assertEquals("${build.name}: $flag with no engine", if (flag in setOf("callRecording", "callRecordButton")) 0 else 1,
                    (status[0] as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    @Test
    fun `the call screen gets its record button right before it joins the call window in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val owner = FixtureDex.classes(build, setOf(VOIP_DEBUG)).getValue(VOIP_DEBUG)
            val screens = callScreens(build)
            val context = PatchContexts.of(ExtensionDex.classes() + owner + FixtureDex.classes(build, AUDIO_TYPES).values + screens +
                voiceChatScreens(build))
            val plan = context.resolveCallRecordButton()
            assertEquals("${build.name}: the call screen takes a button", null, plan.missing)
            val hook = plan.hook!!
            val screen = screens.single { it.origType == hook.method.origDefiningClass }
            assertEquals("${build.name}: the one call screen", listOf(screen.type),
                screens.filter { CALL_STATE_LISTENER in it.origInterfaces }.map { it.type })
            assertTrue(AccessFlags.STATIC.isSet(hook.method.accessFlags))
            assertEquals(listOf("Landroid/app/Activity;", "I"), hook.method.parameterTypes.map { it.toString() })
            val original = ImmutableMethod.of(hook.method)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { disableCallDebugPatch.execute(context) })

            val body = hook.method.instructions()
            assertEquals(Opcode.INVOKE_STATIC_RANGE, body[hook.index].opcode)
            assertEquals("$CALL_RECORD_BUTTON->attach(Landroid/view/View;)V", body[hook.index].reference())
            assertEquals(listOf(hook.screen), body[hook.index].namedRegisters())
            assertEquals("${build.name}: the button goes on the view the call window gets",
                "Landroid/view/ViewGroup;->addView(Landroid/view/View;)V", body[hook.index + 1].reference())
            assertEquals(hook.screen, body[hook.index + 1].namedRegisters()[1])
            assertTrue("${build.name}: the screen's last add, after the video check",
                body.drop(hook.index + 2).none { it.reference() == "Landroid/view/ViewGroup;->addView(Landroid/view/View;)V" } &&
                    body.take(hook.index).any { it.reference() == "$PHONE_CALL->video:Z" })
            assertTapped(build.name, original, hook.method, hook.index)
            // With no call service Telegram jumps straight to the add, and that path gets the button too.
            val oldFlow = ControlFlow.of(original)
            val newFlow = ControlFlow.of(hook.method)
            val ways = oldFlow.normal.indices.filter { hook.index in oldFlow.normal[it] }
            assertTrue("${build.name}: a branch reached the window add", ways.any { it != hook.index - 1 })
            assertEquals("${build.name}: every way to the window add runs the button first", ways.map { if (it > hook.index) it + 1 else it },
                newFlow.normal.indices.filter { hook.index in newFlow.normal[it] })
            val attach = ExtensionDex.classDef(CALL_RECORD_BUTTON).methods.single { it.origName == "attach" }
            assertTrue("attach is public static", AccessFlags.PUBLIC.isSet(attach.accessFlags) && AccessFlags.STATIC.isSet(attach.accessFlags))
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "callRecordButton" }.instructions()
            assertEquals("${build.name}: callRecordButton build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)

            // Without either screen the recorder still works, with a warning for each and no button.
            val bare = PatchContexts.of(ExtensionDex.classes() + owner + FixtureDex.classes(build, AUDIO_TYPES).values)
            assertEquals(listOf("Disable call debug upload: the call screen is 0 classes. " +
                "The patch goes on without the record button on the call screen.",
                "Disable call debug upload: the voice chat screen is 0 classes. " +
                "The patch goes on without the record button on voice chats and live streams."),
                PatchLogCapture.warnings { disableCallDebugPatch.execute(bare) })
            for ((flag, fact) in listOf("callRecording" to 1, "callRecordButton" to 0)) {
                val bareStatus = bare.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.instructions()
                assertEquals("${build.name}: $flag without the call screen", fact, (bareStatus[0] as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    @Test
    fun `the voice chat screen gets its record buttons right before its top right row joins it in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val owner = FixtureDex.classes(build, setOf(VOIP_DEBUG)).getValue(VOIP_DEBUG)
            val screens = voiceChatScreens(build)
            val context = PatchContexts.of(ExtensionDex.classes() + owner + FixtureDex.classes(build, AUDIO_TYPES).values + screens)
            val plan = context.resolveVoiceChatRecordButton()
            assertEquals("${build.name}: the voice chat screen takes the buttons", null, plan.missing)
            val hook = plan.hook!!
            val screen = screens.single { it.origType == hook.method.origDefiningClass }
            assertTrue("${build.name}: the voice chat screen follows the call", CALL_STATE_LISTENER in screen.origInterfaces)
            assertEquals("<init>", hook.method.name)
            assertTrue(CHAT_CALL in hook.method.origParameterTypes)
            val original = ImmutableMethod.of(hook.method)
            // With no call screen to hand, the voice chat button alone turns the switch on.
            assertEquals(listOf("Disable call debug upload: the call screen is 0 classes. " +
                "The patch goes on without the record button on the call screen."),
                PatchLogCapture.warnings { disableCallDebugPatch.execute(context) })

            val body = hook.method.instructions()
            assertEquals(Opcode.INVOKE_STATIC_RANGE, body[hook.index].opcode)
            assertEquals("$CALL_RECORD_BUTTON->attachRow(Landroid/view/View;)V", body[hook.index].reference())
            assertEquals(listOf(hook.row), body[hook.index].namedRegisters())
            val add = body[hook.index + 1].call()!!
            assertEquals("${build.name}: the buttons go in the row before it joins the screen", "addView", add.name)
            assertEquals(listOf("Landroid/view/View;", "Landroid/view/ViewGroup\$LayoutParams;"), add.parameterTypes.map { it.toString() })
            assertEquals(hook.row, body[hook.index + 1].namedRegisters()[1])
            val made = body.take(hook.index).indexOfLast { it.opcode.setsRegister() && it.namedRegisters().firstOrNull() == hook.row }
            assertEquals("${build.name}: the row is a LinearLayout made here", Opcode.NEW_INSTANCE, body[made].opcode)
            assertEquals("Landroid/widget/LinearLayout;", body[made].reference())
            assertTapped(build.name, original, hook.method, hook.index)
            val attachRow = ExtensionDex.classDef(CALL_RECORD_BUTTON).methods.single { it.origName == "attachRow" }
            assertTrue("attachRow is public static", AccessFlags.PUBLIC.isSet(attachRow.accessFlags) && AccessFlags.STATIC.isSet(attachRow.accessFlags))
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "callRecordButton" }.instructions()
            assertEquals("${build.name}: callRecordButton build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    /** Every class that logs the call screen's string: VoIPFragment, whatever R8 named it, and any other. */
    private fun callScreens(build: File) = FixtureDex.classesWhere(build, SCREEN_CENSUS, { true }) { method ->
        method.instructions().any { it.reference() == CALL_SCREEN_STRING }
    }

    /** Every class built from a group call: GroupCallActivity, whatever R8 named it, and any other. */
    private fun voiceChatScreens(build: File) = FixtureDex.classesWhere(build, VOICE_CHAT_CENSUS, { true }) { method ->
        method.name == "<init>" && CHAT_CALL in method.origParameterTypes
    }

    /**
     * One call went in at [index] and nothing else changed: every original operation is kept, the
     * new call falls through to the one it was put in front of, and nothing else reaches that one.
     */
    private fun assertTapped(build: String, original: Method, tapped: Method, index: Int) {
        val after = tapped.instructions()
        assertEquals("$build: ${tapped.name} keeps every original operation",
            original.instructions().filter { it.opcode != Opcode.NOP }.map(::operation),
            (after.take(index) + after.drop(index + 1)).filter { it.opcode != Opcode.NOP }.map(::operation))
        val flow = ControlFlow.of(tapped)
        assertEquals("$build: ${tapped.name} tap falls through", listOf(index + 1), flow.normal[index])
        assertEquals("$build: only the tap leads to the call it guards", listOf(index),
            flow.normal.indices.filter { index + 1 in flow.normal[it] })
        assertTrue("$build: no handler starts at the tap", flow.exceptional.none { index in it || index + 1 in it })
    }

    private fun reachable(flow: ControlFlow, from: Int, blocked: Int): Set<Int> {
        val found = mutableSetOf<Int>()
        val pending = ArrayDeque<Int>()
        pending.add(from)
        while (pending.isNotEmpty()) {
            val index = pending.removeFirst()
            if (index == blocked || !found.add(index)) continue
            pending.addAll(flow.normal[index])
        }
        return found
    }
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.reference() = origRef()
    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun Instruction.gzipWrite() = call()?.let { it.definingClass == "Ljava/util/zip/GZIPOutputStream;" && it.name == "write" } == true
    private fun operation(instruction: Instruction) = instruction.opcode to instruction.reference()
    private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
    private companion object {
        val AUDIO_TYPES = CallAudioEngine.entries.flatMap { listOf(it.record, it.playout) }.toSet()
        val SCREEN_CENSUS = FixtureDex.ClassCensus()
        val VOICE_CHAT_CENSUS = FixtureDex.ClassCensus()
        /** Recorder, bytes, then the speaker's track, buffer and size, as both declared builds have them. */
        val REGISTERS = mapOf(
            CallAudioEngine.NEWER to listOf(0, 3, 2, 3, 4),
            CallAudioEngine.OLDER to listOf(0, 1, 1, 2, 3),
        )
        val HOOKS = mapOf(
            CallDebugTarget.DEBUG to "skipCallDebugUpload(Z)Z",
            CallDebugTarget.FILE to "skipCallLogFileUpload()Z",
            CallDebugTarget.LOG to "skipCallLogUpload()Z",
        )
    }
}
