/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.sendconfirm

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origInterfaces
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

/** The five places the questions stand, the call sites that move, the stubs that run the stock work again, and the runtime. */
class SendConfirmFixtureTest {
    private val callParameters = listOf(
        "Lorg/telegram/tgnet/TLRPC\$User;", "Z", "Z", "Landroid/app/Activity;", "Lorg/telegram/tgnet/TLRPC\$UserFull;",
        "Lorg/telegram/messenger/AccountInstance;",
    )
    private val fixed = setOf(
        "Lorg/telegram/ui/Components/ChatActivityEnterView;", "Lorg/telegram/messenger/MediaController;", "Lorg/telegram/ui/LaunchActivity;",
        CALLBACK,
    )

    private val WIDE_GOTOS = setOf(Opcode.GOTO_16, Opcode.GOTO_32)

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())
    private fun signature(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    /** A method that starts a call, or one of the places that could stand in front of a send: the classes the resolver reads. */
    private fun wanted(m: Method): Boolean {
        val params = m.origParameterTypes
        val instance = !com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(m.accessFlags)
        if (!instance && m.origReturnType == "V" && params == callParameters) return true
        if (instance && m.origReturnType == "V" && params == listOf(
                "Landroid/view/View;", "Ljava/lang/Object;", "Ljava/lang/String;", "Ljava/lang/Object;", "Z", "I", "I",
                "Lorg/telegram/messenger/MediaController\$PhotoEntry;", "Z",
            )) return true
        val body = m.controlBody()
        if (body.isEmpty()) return false
        if (instance && m.origReturnType == "V" && VideoShape.values().any { it.target == params } && body.any { it.controlRef() == CAMERA_ALLOWED }) return true
        if (body.any { it.call()?.let { c -> c.origDefiningClass == SEND_HELPER && c.origName == "sendSticker" } == true }) return true
        return body.any { it.call()?.let { c -> c.origReturnType == "V" && c.origParameterTypes == callParameters } == true }
    }

    @Test fun `each question stands in front of its method and each call goes through the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val found = FixtureDex.classesWhere(build, { true }) { wanted(it) }
            // The interfaces they implement hold the round video recorder's, which the pause is called through.
            val hosts = (FixtureDex.classes(build, fixed + found.flatMap { it.interfaces }).values + found).distinctBy { it.type }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveSendConfirm()
            assertEquals("$name: the chat bar's sticker send", "Lorg/telegram/ui/Components/ChatActivityEnterView;", site.sticker.definingClass)
            assertEquals("$name: Telegram's end of a recording", "stopRecording", site.voice.origName)
            // 13.2 drops the stars from it and puts its ints first.
            val reordered = site.voice.origParameterTypes == VOICE_TARGET_R8
            assertEquals("$name: the round video recorder's order of arguments",
                VideoShape.SOUND_SECOND, site.shape)
            val before = mapOf(
                "sticker" to ImmutableMethod.of(site.sticker), "gif" to ImmutableMethod.of(site.gif), "voice" to ImmutableMethod.of(site.voice),
                "video" to ImmutableMethod.of(site.video), "header" to ImmutableMethod.of(site.header), "profile" to ImmutableMethod.of(site.profile),
            )
            assertEquals("$name: the strip's two sends, in a chat and in a story's reply bar", 2, site.strips.size)
            val stripsBefore = site.strips.map { ImmutableMethod.of(it.method) }
            val barBefore = ImmutableMethod.of(site.barSendMethod)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { sendConfirmPatch.execute(context) })

            // A question: the extension's call first, then Telegram's own code, which is everything the method held.
            val gates = mapOf(
                "sticker" to Triple(site.sticker, "sticker", 9), "gif" to Triple(site.gif, "gif", 10), "voice" to Triple(site.voice, "voice", 7),
                "video" to Triple(site.video, site.shape.hook, 9),
            )
            for ((key, gate) in gates) {
                val (method, hook, words) = gate
                val stock = before.getValue(key).controlBody().filter { it.opcode != Opcode.NOP }
                val gated = method.controlBody().filter { it.opcode != Opcode.NOP }
                val top = method.implementation!!.registerCount
                // The reordered end first puts this, send, notify, scheduleDate, once and no stars in v0 to v6.
                val lead = if (key == "voice" && reordered) 6 else 0
                if (lead > 0) {
                    val p = top - 5
                    assertEquals("$name $key: 13.1.1's order", listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_FROM16, Opcode.MOVE_FROM16,
                        Opcode.MOVE_FROM16, Opcode.MOVE_FROM16, Opcode.CONST_WIDE_16), gated.take(6).map { it.opcode })
                    assertEquals("$name $key: this, send, notify, scheduleDate and once", listOf(listOf(0, p), listOf(1, p + 1),
                        listOf(2, p + 3), listOf(3, p + 2), listOf(4, p + 4)), gated.take(5).map { it.namedRegisters() })
                    assertEquals("$name $key: no stars", 5 to 0L, gated[5].namedRegisters().first() to (gated[5] as WideLiteralInstruction).wideLiteral)
                }
                assertEquals("$name $key: four instructions", stock.size + 4 + lead, gated.size)
                assertEquals(Opcode.INVOKE_STATIC_RANGE, gated[lead].opcode)
                assertTrue("$name $key: the extension's $hook", gated[lead].controlRef()!!.startsWith("Lapp/hushtelegram/extension/telegram/misc/SendConfirm;->$hook("))
                assertTrue("$name $key: the answer comes back as a boolean", gated[lead].controlRef()!!.endsWith(")Z"))
                assertEquals("$name $key: this and every parameter", if (lead > 0) (0 until words).toList() else (top - words until top).toList(),
                    gated[lead].namedRegisters())
                assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.RETURN_VOID), gated.subList(lead + 1, lead + 4).map { it.opcode })
                assertEquals("$name $key: the answer lands in a local", listOf(0), gated[lead + 1].namedRegisters())
                for (i in stock.indices) assertEquals("$name $key: stock $i", stock[i].shape(), gated[i + 4 + lead].shape())
            }

            // The strip: the question at the send itself, the rest of the callback as it was.
            // A goto widened to reach past the new code is the same goto.
            val kept = { list: List<Instruction> ->
                list.filter { it.opcode != Opcode.NOP }.map { it.shape().let { s -> listOf(if (it.opcode in WIDE_GOTOS) Opcode.GOTO else s[0]) + s.drop(1) } }
            }
            for ((strip, unchanged) in site.strips.zip(stripsBefore)) {
                val key = "${strip.method.definingClass} strip"
                val stock = unchanged.controlBody()
                val gated = strip.method.controlBody()
                val top = strip.method.implementation!!.registerCount
                val at = gated.indexOfFirst { it.controlRef()?.startsWith("$SEND_CONFIRM->stripSticker(") == true }
                assertEquals("$name $key: at the send", strip.call, at)
                assertEquals("$name $key: the callback and its argument", listOf(top - 2, top - 1), gated[at].namedRegisters())
                assertTrue("$name $key: the answer comes back as a boolean", gated[at].controlRef()!!.endsWith(")Z"))
                assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.RETURN_VOID, Opcode.NOP), gated.subList(at + 1, at + 5).map { it.opcode })
                assertEquals("$name $key: the answer lands in a free local", listOf(strip.answer), gated[at + 1].namedRegisters())
                assertEquals("$name $key: Send goes on to the send", setOf(at + 3, at + 4), ControlFlow.of(strip.method).normal[at + 2].toSet())
                assertEquals("$name $key: the send", "sendSticker", gated[at + 5].call()?.origName)
                assertEquals("$name $key: everything before", kept(stock.subList(0, at)), kept(gated.subList(0, at)))
                assertEquals("$name $key: everything after", kept(stock.subList(at, stock.size)), kept(gated.subList(at + 5, gated.size)))
            }

            // The chat bar's send of a clip in its preview: a question right after its test that the
            // clip is there, Telegram's send of it right after the question, the rest as it was.
            assertEquals("$name: the chat bar's send", site.barSend, signature(site.barSendMethod))
            val barGated = site.barSendMethod.controlBody()
            val barTop = site.barSendMethod.implementation!!.registerCount
            val barFlow = ControlFlow.of(site.barSendMethod)
            val r8Send = site.barSend.endsWith("(ZIIJZ)Z")
            val asks = listOf(site.voicePreview to site.voiceClip, site.videoPreview to site.videoClip).map { (preview, field) ->
                val key = "$name ${preview.hook}"
                val at = barGated.indexOfFirst { it.controlRef() == preview.ref }
                assertTrue("$key: in the chat bar's send", at > 0)
                // The range passes the send's own registers, so a long has to meet a long: 13.2 moved
                // the stars ahead of the question, and a narrow parameter there fails verification.
                val wide = { types: List<String> -> types.map { it == "J" || it == "D" } }
                assertEquals("$key: each register in a parameter of its width", wide(site.barSendMethod.origParameterTypes.map { it.toString() }),
                    wide(preview.params.drop(1)))
                assertEquals("$key: the hook for this build's order", if (r8Send) "Reordered" else "", preview.hook.removePrefix("previewVoice").removePrefix("previewVideo"))
                assertEquals("$key: this and every parameter", (barTop - 7 until barTop).toList(), barGated[at].namedRegisters())
                assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.RETURN), barGated.subList(at + 1, at + 4).map { it.opcode })
                assertEquals("$key: the answer in a free local, and returned as the send returns", List(3) { listOf(preview.answer) },
                    barGated.subList(at + 1, at + 4).map { it.namedRegisters() })
                assertTrue("$key: a local", preview.answer < barTop - 7)
                assertEquals("$key: Send goes on to the send", setOf(at + 3, at + 4), barFlow.normal[at + 2].toSet())
                val test = barGated[at - 1]
                assertEquals("$key: right after the clip's null test", Opcode.IF_EQZ, test.opcode)
                assertTrue("$key: of the clip just read", (maxOf(0, at - 5) until at - 1).any { read ->
                    barGated[read].opcode == Opcode.IGET_OBJECT && barGated[read].controlRef() == field &&
                        barGated[read].namedRegisters().first() == test.namedRegisters().first()
                })
                assertTrue("$key: only the test falls into it", barFlow.normal.withIndex().none { (from, to) -> from != at - 1 && at in to })
                at
            }
            assertTrue("$name: two places", asks.distinct().size == 2)
            val hooked = asks.flatMap { it until it + 4 }.toSet()
            assertEquals("$name: the chat bar's send as it was", kept(barBefore.controlBody()),
                kept(barGated.filterIndexed { i, _ -> i !in hooked }))

            // A call: the same registers and the same place, to the extension.
            for ((key, method, index) in listOf(Triple("header", site.header, site.headerCall), Triple("profile", site.profile, site.profileCall))) {
                val stock = before.getValue(key).controlBody()
                val moved = method.controlBody()
                assertEquals("$name $key: no instruction added", stock.size, moved.size)
                assertEquals(Opcode.INVOKE_STATIC_RANGE, moved[index].opcode)
                assertEquals("$name $key: the call", "Lapp/hushtelegram/extension/telegram/misc/SendConfirm;->call(Ljava/lang/Object;ZZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V",
                    moved[index].controlRef())
                assertEquals("$name $key: the same six registers", stock[index].namedRegisters(), moved[index].namedRegisters())
                assertEquals("$name $key: the call it replaced", site.startCall, stock[index].controlRef())
                for (i in stock.indices) if (i != index) assertEquals("$name $key: stock $i", stock[i].shape(), moved[i].shape())
            }
            assertEquals("$name: the header call is the only start of a call in its method", 1,
                before.getValue("header").controlBody().count { it.controlRef() == site.startCall })

            val stub = { n: String -> context.tgMutableClassDefBy(SEND_CONFIRM).methods.single { it.origName == n }.controlBody() }
            val again = { n: String, target: Method, words: Int ->
                val call = stub(n).single { it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
                assertEquals("$name $n: Telegram's own method again", signature(target), (call as ReferenceInstruction).reference.toString())
                assertEquals("$name $n: its arguments, as the extension holds them", (0 until words).toList(), call.namedRegisters())
            }
            again("resumeSticker", site.sticker, 9)
            again("resumeGif", site.gif, 10)
            if (reordered) {
                val call = stub("resumeVoice").single { it.opcode == Opcode.INVOKE_VIRTUAL }
                assertEquals("$name resumeVoice: Telegram's own method again", signature(site.voice), (call as ReferenceInstruction).reference.toString())
                assertEquals("$name resumeVoice: back in its order, send, scheduleDate, notify and once", listOf(0, 1, 3, 2, 4), call.namedRegisters())
            } else {
                again("resumeVoice", site.voice, 7)
            }
            again(site.shape.resume, site.video, 9)

            // Send in front of a paused recording: the chat bar's own send, the one its send button
            // runs, from the bar that holds the clip in its preview.
            val enterView = "Lorg/telegram/ui/Components/ChatActivityEnterView;"
            val bar = context.tgMutableClassDefBy(enterView)
            // 13.2 orders the same five as sound, date, flag, stars and the question.
            val r8 = site.barSend.endsWith("(ZIIJZ)Z")
            assertTrue("$name: the chat bar's send", site.barSend.startsWith("$enterView->") && (r8 || site.barSend.endsWith("(IZIZJ)Z")))
            assertTrue("$name: the send button runs it", bar.methods.any { m ->
                m.parameterTypes.isEmpty() && m.origReturnType == "Z" && m.implementation != null && m.controlBody().any { it.controlRef() == site.barSend }
            })
            val fromBar = stub("sendFromBar")
            val send = fromBar.single { it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
            assertEquals("$name sendFromBar", site.barSend, send.controlRef())
            assertEquals("$name sendFromBar: the bar and its five words", (0..6).toList(), send.namedRegisters())
            assertEquals("$name sendFromBar: the bar it was handed", listOf(Opcode.MOVE_OBJECT, listOf(0, 7)),
                fromBar.single { it.opcode == Opcode.MOVE_OBJECT }.let { listOf(it.opcode, it.namedRegisters()) })
            assertEquals("$name sendFromBar: now, with sound, no flag, its paid-message question free to ask, no stars",
                if (r8) listOf(1 to 1L, 2 to 0L, 3 to 0L, 4 to 0L, 6 to 1L) else listOf(1 to 0L, 2 to 1L, 3 to 0L, 4 to 1L, 5 to 0L),
                fromBar.filterIsInstance<WideLiteralInstruction>().map { (it as Instruction).namedRegisters().first() to it.wideLiteral })
            val isBar = stub("chatBar")
            assertEquals("$name chatBar", listOf(Opcode.INSTANCE_OF, Opcode.RETURN), isBar.map { it.opcode })
            assertEquals("$name chatBar", listOf(enterView, listOf(0, 1)), listOf(isBar[0].controlRef(), isBar[0].namedRegisters()))
            for ((n, field, type) in listOf(
                Triple("voiceClip", site.voiceClip, "Lorg/telegram/tgnet/TLRPC\$TL_document;"),
                Triple("videoClip", site.videoClip, "Lorg/telegram/messenger/VideoEditedInfo;"),
            )) {
                val read = stub(n)
                assertEquals("$name $n", listOf(Opcode.CHECK_CAST, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT), read.map { it.opcode })
                assertEquals("$name $n: the bar's own field", listOf(field, listOf(0, 1)), listOf(read[1].controlRef(), read[1].namedRegisters()))
                val declared = bar.fields.single { it.origString() == field }
                assertEquals("$name $n: the one $type, open to the stub", listOf(type, true, false, false),
                    listOf(declared.origType, AccessFlags.PUBLIC.isSet(declared.accessFlags), AccessFlags.PRIVATE.isSet(declared.accessFlags),
                        AccessFlags.STATIC.isSet(declared.accessFlags)))
            }

            // The pauses before a question: the media controller's for a voice recording, and the
            // recorder's for a round video, each one the chat really implements.
            for ((n, ref, registers) in listOf(
                Triple("voicePaused", "Lorg/telegram/messenger/MediaController;->isRecordingPaused()Z", listOf(1)),
                Triple("pauseVoice", "Lorg/telegram/messenger/MediaController;->toggleRecordingPause(Z)V", listOf(0, 1)),
            )) {
                val call = stub(n).single { it.opcode == Opcode.INVOKE_VIRTUAL }
                assertEquals("$name $n", ref, call.controlRef())
                assertEquals("$name $n: the controller and its view-once flag", registers, call.namedRegisters())
            }
            val chat = context.tgMutableClassDefBy(site.video.definingClass)
            assertTrue("$name: the chat implements the recorder", site.recorder in chat.origInterfaces)
            assertTrue("$name: a paused check and a pause", site.videoPaused.endsWith("()Z") && site.pauseVideo.endsWith("()V"))
            for ((n, ref, registers) in listOf(Triple("videoPaused", site.videoPaused, listOf(1)), Triple("pauseVideo", site.pauseVideo, listOf(0)))) {
                val body = stub(n)
                assertEquals("$name $n: the chat as the recorder", listOf(Opcode.CHECK_CAST, site.recorder), listOf(body[0].opcode, body[0].controlRef()))
                assertEquals("$name $n", listOf(Opcode.INVOKE_INTERFACE, ref, registers), listOf(body[1].opcode, body[1].controlRef(), body[1].namedRegisters()))
                val own = ref.substringAfter("->")
                assertTrue("$name $n: the chat's own $own", chat.methods.any { signature(it).substringAfter("->") == own && it.implementation != null })
            }
            val start = stub("startCall").single { it.opcode == Opcode.INVOKE_STATIC_RANGE }
            assertEquals(site.startCall, start.controlRef())
            assertEquals((0..5).toList(), start.namedRegisters())
            assertEquals("$name: the main window", site.launchField, stub("launchActivity").first().controlRef())
            val resume = stub("resumeStripSticker")
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE, Opcode.RETURN_VOID), resume.map { it.opcode })
            assertEquals("$name: the strip's callback again", "$CALLBACK->run(Ljava/lang/Object;)V", resume[1].controlRef())
            assertEquals(listOf(0, 1), resume[1].namedRegisters())
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "askBeforeSending" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    private val clip = "Lcom/example/Bar;->clip:Ljava/lang/Object;"

    private fun bar(body: String) = MutableMethod(
        ImmutableMethod(
            "Lcom/example/Bar;", "send", listOf(ImmutableMethodParameter("Lcom/example/Bar;", null, null)), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(3, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }

    @Test fun `the send of a clip starts only where its null test alone leads`() {
        assertEquals("right after the test", listOf(3), previewStarts(bar("""
            iget-object v0, p0, $clip
            const/4 v1, 0x0
            if-eqz v0, :none
            invoke-static {v0}, Lcom/example/Log;->keep(Ljava/lang/Object;)V
            :none
            return-void
        """), clip))
        assertEquals("a jump onto the send would skip the question", emptyList<Int>(), previewStarts(bar("""
            iget-object v0, p0, $clip
            if-eqz v0, :none
            :again
            invoke-static {v0}, Lcom/example/Log;->keep(Ljava/lang/Object;)V
            :none
            const/4 v1, 0x0
            if-eqz v1, :again
            return-void
        """), clip))
        assertEquals("the register tested no longer holds the clip", emptyList<Int>(), previewStarts(bar("""
            iget-object v0, p0, $clip
            const/4 v0, 0x0
            if-eqz v0, :none
            invoke-static {v0}, Lcom/example/Log;->keep(Ljava/lang/Object;)V
            :none
            return-void
        """), clip))
        assertEquals("another path reaches the test", emptyList<Int>(), previewStarts(bar("""
            const/4 v0, 0x0
            const/4 v1, 0x0
            if-eqz v1, :test
            iget-object v0, p0, $clip
            :test
            if-eqz v0, :none
            invoke-static {v0}, Lcom/example/Log;->keep(Ljava/lang/Object;)V
            :none
            return-void
        """), clip))
        assertEquals("too far from the read", emptyList<Int>(), previewStarts(bar("""
            iget-object v0, p0, $clip
            const/4 v1, 0x0
            const/4 v1, 0x0
            const/4 v1, 0x0
            const/4 v1, 0x0
            if-eqz v0, :none
            invoke-static {v0}, Lcom/example/Log;->keep(Ljava/lang/Object;)V
            :none
            return-void
        """), clip))
    }
}
