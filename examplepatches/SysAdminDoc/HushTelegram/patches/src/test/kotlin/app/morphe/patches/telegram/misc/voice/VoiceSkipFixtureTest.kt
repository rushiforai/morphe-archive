/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.voice

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origString
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/** Next and previous for voice messages (#77): the song skips, the session's music checks and its buttons. */
class VoiceSkipFixtureTest {
    @Test fun `next and previous ask the extension first and a voice message gets the skip buttons`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val sites = context.resolveVoiceSkip()
            assertEquals("$name: ${sites.missing}", null, sites.missing)
            assertEquals(name, "playNextMessageWithoutOrder", sites.next!!.origName)
            assertEquals(name, "playPreviousMessage", sites.previous!!.origName)
            assertTrue("$name: the session's next and previous", sites.gates.sumOf { it.second.size } >= 2)
            val notification = sites.actions.single { it.first.origName == "createNotification" }
            val update = sites.actions.single { it.first.origName == "updatePlaybackState" }
            assertEquals("$name: the notification's buttons while loading and while playing", 2, notification.second.size)
            assertEquals("$name: the session's buttons while loading and while playing", 2, update.second.size)
            // The music player patch swaps other music checks; none of them is one of these.
            val musicChecks = context.resolveVoiceMusicPlayer().calls.flatMap { (m, at) -> at.map { m.origString() to it } }.toSet()
            assertTrue("$name: a check both patches change", sites.gates.flatMap { (m, at) -> at.map { m.origString() to it } }.none { it in musicChecks })

            val byStop = sites.next.parameterRegisterNumber(0)
            val stockNext = sites.next.stock()
            val stockPrevious = sites.previous.stock()
            val stockGates = sites.gates.map { (m, at) -> Triple(m.origString(), m.stock(), at) }
            val stockActions = sites.actions.map { (m, at) -> Triple(m.origString(), m.stock(), at) }
            assertEquals(name, emptyList<String>(), PatchLogCapture.warnings { voiceMusicPlayerPatch.execute(context) })

            val next = context.method(MEDIA_CONTROLLER, sites.next.origString()).controlBody()
            assertEquals("$name: next asks with the song-ended flag", VOICE_SKIP_NEXT, next[0].controlRef())
            assertEquals(name, listOf(byStop), next[0].namedRegisters())
            assertSkipsFirst(name, next, stockNext)
            val previous = context.method(MEDIA_CONTROLLER, sites.previous.origString()).controlBody()
            assertEquals(VOICE_SKIP_PREVIOUS, previous[0].controlRef())
            assertSkipsFirst(name, previous, stockPrevious)

            for ((key, stock, indices) in stockGates) {
                val now = context.method(sites.gates.first { it.first.origString() == key }.first.origDefiningClass, key).controlBody()
                assertEquals("$name: $key keeps its length", stock.size, now.size)
                for (i in stock.indices) {
                    if (i in indices) {
                        assertEquals("$name: $key $i", VOICE_SKIP_ASKS, now[i].controlRef())
                        assertTrue(now[i].opcode == Opcode.INVOKE_STATIC || now[i].opcode == Opcode.INVOKE_STATIC_RANGE)
                        assertEquals("$name: the same message", stock[i].namedRegisters(), now[i].namedRegisters())
                    } else {
                        assertEquals("$name: $key stock $i", shape(stock[i]), shape(now[i]))
                    }
                }
            }

            for ((key, stock, indices) in stockActions) {
                val now = context.method(MUSIC_SERVICE, key).controlBody().filter { it.opcode != Opcode.NOP }
                val plain = stock.filter { it.opcode != Opcode.NOP }
                assertEquals("$name: $key grows by two per store", plain.size + 2 * indices.size, now.size)
                val stores = now.indices.filter { now[it].controlRef() == VOICE_SKIP_ACTIONS }
                assertEquals("$name: $key", indices.size, stores.size)
                for (at in stores) {
                    assertEquals(Opcode.INVOKE_STATIC_RANGE, now[at].opcode)
                    val value = now[at + 2].namedRegisters().first()
                    assertEquals("$name: $key the stored buttons go in", listOf(value, value + 1), now[at].namedRegisters())
                    assertEquals(Opcode.MOVE_RESULT_WIDE, now[at + 1].opcode)
                    assertEquals("$name: and come back in the same register", listOf(value), now[at + 1].namedRegisters())
                    assertEquals(Opcode.IPUT_WIDE, now[at + 2].opcode)
                }
                assertEquals("$name: $key otherwise stock", plain.map(::shape),
                    now.filterIndexed { i, _ -> stores.none { i == it || i == it + 1 } }.map(::shape))
            }

            val stub = { n: String -> context.method(VOICE_SKIP, n).controlBody().mapNotNull { it.controlRef() } }
            assertTrue(stub("queue").any { "->voiceMessagesPlaylist:" in it })
            assertTrue(stub("unread").any { "->voiceMessagesPlaylistUnread:" in it })
            assertTrue(stub("seconds").any { "->audioProgressSec:" in it })
            assertTrue(PLAY_MESSAGE_PLAIN in stub("play"))
            assertTrue(SET_PLAYLIST in stub("requeue"))
            assertTrue(stub("seekStart").any { "->seekToProgress(" in it })
            assertTrue(stub("dialog").any { it.endsWith("->getDialogId()J") })
            assertTrue(IS_MUSIC in stub("isMusic"))
            val status = context.method(SETTINGS_STATUS, "voiceSkip").controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a music service that sets its buttons another way leaves voice messages alone and the rest goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val found = context.resolveVoiceSkip()
            val (update, stores) = found.actions.single { it.first.origName == "updatePlaybackState" }
            for (index in stores) update.replaceInstruction(index, "nop")
            val sites = context.resolveVoiceSkip()
            assertTrue("$name: ${sites.missing}", sites.missing != null && "no longer sets its buttons" in sites.missing)
            val warnings = PatchLogCapture.warnings { voiceMusicPlayerPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "goes on without the voice skip switch" in warnings.single())

            val hooks = setOf(VOICE_SKIP_NEXT, VOICE_SKIP_PREVIOUS, VOICE_SKIP_ASKS, VOICE_SKIP_ACTIONS)
            for (type in (listOf(MEDIA_CONTROLLER, MUSIC_SERVICE) + found.gates.map { it.first.origDefiningClass }).distinct()) {
                for (m in context.tgMutableClassDefBy(type).methods) {
                    assertTrue("$name: ${m.origString()} stays stock", m.controlBody().none { it.controlRef() in hooks })
                }
            }
            val status = { n: String -> (context.method(SETTINGS_STATUS, n).controlBody().first() as? WideLiteralInstruction)?.wideLiteral }
            assertTrue("$name: the build flag stays off", status("voiceSkip") != 1L)
            assertEquals("$name: the full player still comes", 1L, status("voiceMusicPlayer"))
            assertEquals("$name: and remembering where playback stopped", 1L, status("playbackPosition"))
        }
    }

    /** The four lines in front of a song skip, then the stock method unchanged. */
    private fun assertSkipsFirst(name: String, now: List<Instruction>, stock: List<Instruction>) {
        assertTrue(name, now[0].opcode == Opcode.INVOKE_STATIC || now[0].opcode == Opcode.INVOKE_STATIC_RANGE)
        assertEquals(Opcode.MOVE_RESULT, now[1].opcode)
        assertEquals(Opcode.IF_EQZ, now[2].opcode)
        assertEquals("$name: the answer is what's tested", now[1].namedRegisters(), now[2].namedRegisters())
        assertEquals(Opcode.RETURN_VOID, now[3].opcode)
        assertEquals("$name: then Telegram's own skip", stock.filter { it.opcode != Opcode.NOP }.map(::shape),
            now.drop(4).filter { it.opcode != Opcode.NOP }.map(::shape))
    }

    private fun shape(insn: Instruction) = listOf(kind(insn.opcode), insn.namedRegisters(), insn.controlRef())

    private fun kind(opcode: Opcode) = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode

    private fun MutableMethod.stock() = ImmutableMethod.of(this).controlBody()

    /** The method of [type] whose original name, or original signature, is [key]. */
    private fun BytecodePatchContext.method(type: String, key: String) =
        tgMutableClassDefBy(type).methods.single { it.origString() == key || it.origName == key }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + voiceHosts(build))
}
