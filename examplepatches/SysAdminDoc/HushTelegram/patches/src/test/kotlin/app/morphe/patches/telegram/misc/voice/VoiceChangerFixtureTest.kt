/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.voice

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/** The voice changer in Play voice messages one at a time, on the pinned builds. */
class VoiceChangerFixtureTest {
    @Test fun `both voice recorders read the microphone through the extension and nothing else does`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + lockedVoiceHosts(build))
            val sites = context.resolveVoiceChanger()
            assertNull("$name: ${sites.missing}", sites.missing)
            assertEquals("$name: one read per recorder", 2, sites.reads.size)
            assertNotEquals("$name: the recorders read in different methods", sites.reads[0], sites.reads[1])

            val classes = voiceRecorderHosts(build).map { it.origType }
            val before = classes.associateWith { type -> bodies(context.tgMutableClassDefBy(type).methods) }
            sites.rehearse(context)
            assertEquals("$name: the rehearsal leaves Telegram alone", before,
                classes.associateWith { type -> bodies(context.tgMutableClassDefBy(type).methods) })

            assertEquals(emptyList<String>(), PatchLogCapture.warnings { voiceOneAtATimePatch.execute(context) })
            val after = classes.associateWith { type -> bodies(context.tgMutableClassDefBy(type).methods) }
            val swapped = mutableListOf<String>()
            for (type in classes) for ((method, stock) in before.getValue(type)) {
                val now = after.getValue(type).getValue(method)
                assertEquals("$name: $method keeps its length", stock.size, now.size)
                for (i in stock.indices) {
                    if (stock[i] == now[i]) continue
                    swapped += "$type $method"
                    assertEquals("$name: $method $i was the microphone read", listOf(Opcode.INVOKE_VIRTUAL, AUDIO_READ), stock[i].take(2))
                    assertEquals("$name: $method $i calls the extension with the same registers",
                        listOf(Opcode.INVOKE_STATIC, VOICE_CHANGER_READ, stock[i][2]), now[i])
                }
            }
            assertEquals("$name: the two recorders' reads, and no other", sites.reads.map { "${it.type} ${it.method}" }.sorted(), swapped.sorted())
            val left = after.values.sumOf { methods -> methods.values.sumOf { body -> body.count { it[1] == AUDIO_READ } } }
            assertTrue("$name: the camera, round videos and calls keep their own reads ($left)", left > 0)

            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "voiceChanger" }.controlBody()
            assertEquals("$name: voiceChanger", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a build whose recorders changed keeps the rest of the patch and says why`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val old = oldRecorder(build)
            val newerOnly = lockedVoiceHosts(build).filterNot { host -> host.origType == old }
            val context = PatchContexts.of(ExtensionDex.classes() + newerOnly)
            assertEquals(name, listOf("Play voice messages one at a time: Telegram's own voice recorder no longer has one " +
                "microphone read (0). The patch goes on without the voice changer."),
                PatchLogCapture.warnings { voiceOneAtATimePatch.execute(context) })
            for ((flag, value) in listOf("voiceOneAtATime" to 1L, "lockedVoice" to 1L, "voiceChanger" to 0L)) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                assertEquals("$name: $flag", value, (status.first() as WideLiteralInstruction).wideLiteral)
            }
            val reads = newerOnly.flatMap { host -> context.tgMutableClassDefBy(host.origType).methods.flatMap { m ->
                m.implementation?.instructions?.toList() ?: emptyList() } }.count { it.origRef() == VOICE_CHANGER_READ }
            assertEquals("$name: nothing went to the extension", 0, reads)
        }
    }

    private fun oldRecorder(build: File): String {
        val context = PatchContexts.of(ExtensionDex.classes() + lockedVoiceHosts(build))
        return context.resolveVoiceChanger().reads.first().type
    }

    private fun bodies(methods: Iterable<Method>): Map<String, List<List<Any?>>> =
        methods.associate { method -> method.origString() to (method.implementation?.instructions?.map(::shape) ?: emptyList()) }

    private fun shape(instruction: Instruction): List<Any?> =
        listOf(instruction.opcode, instruction.origRef(), instruction.namedRegisters())
}

private val recorderHosts = mutableMapOf<String, List<ClassDef>>()

/** Every class in [build] that reads a microphone a chunk at a time into a buffer, the voice recorders among them. */
internal fun voiceRecorderHosts(build: File): List<ClassDef> = synchronized(recorderHosts) {
    recorderHosts.getOrPut(FixtureDex.inputIdentity(build)) {
        FixtureDex.classesWhere(build, { true }) { method ->
            method.implementation?.instructions?.any { it.origRef() == AUDIO_READ } == true
        }.map(ImmutableClassDef::of)
    }
}
