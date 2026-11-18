/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.voice

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

/** The lengths Telegram remembers a position past, on the pinned builds. */
class PlaybackPositionFixtureTest {
    @Test fun `each length Telegram compares against is answered by the extension in its own register`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val sites = context.resolvePlaybackPosition()
            assertEquals("$name: ${sites.missing}", null, sites.missing)
            assertEquals("$name: a video's two minutes, the viewer's five twice, and the player's five and ten", 5, sites.edits.size)
            assertEquals(2, sites.edits.count { it.hook == VIDEO_SECONDS })
            assertEquals(1, sites.edits.count { it.hook == VIDEO_SECONDS_LONG })
            assertEquals(2, sites.edits.count { it.hook == AUDIO_SECONDS })
            val before = sites.edits.associate { it.signature to methodOf(context, it).controlBody() }
            assertEquals("$name", emptyList<String>(), PatchLogCapture.warnings { voiceMusicPlayerPatch.execute(context) })
            for (edit in sites.edits.distinctBy { it.signature to it.hook }) {
                val stock = before.getValue(edit.signature).filter { it.opcode != Opcode.NOP }
                val now = methodOf(context, edit).controlBody()
                val here = sites.edits.count { it.signature == edit.signature }
                assertEquals("$name: ${edit.signature} grows by two per hook", stock.size + 2 * here, now.count { it.opcode != Opcode.NOP })
                val calls = now.indices.filter { now[it].controlRef() == edit.hook }
                assertEquals("$name: ${edit.hook} in ${edit.signature}", sites.edits.count { it.signature == edit.signature && it.hook == edit.hook }, calls.size)
                for (at in calls) {
                    val load = now[at - 1]
                    assertTrue("$name: the load", load.opcode in setOf(Opcode.CONST_16, Opcode.CONST, Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE))
                    assertTrue(now[at].opcode == Opcode.INVOKE_STATIC || now[at].opcode == Opcode.INVOKE_STATIC_RANGE)
                    assertEquals(if (edit.wide) Opcode.MOVE_RESULT_WIDE else Opcode.MOVE_RESULT, now[at + 1].opcode)
                    assertEquals("$name: the same register", load.namedRegisters(), now[at + 1].namedRegisters())
                }
            }
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "playbackPosition" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a changed length leaves every site alone and the rest of the patch goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val edit = context.resolvePlaybackPosition().edits.first { it.hook == AUDIO_SECONDS }
            methodOf(context, edit).replaceInstruction(edit.index, "const-wide v0, 0x4000000000000000L")
            val sites = context.resolvePlaybackPosition()
            assertTrue("$name: ${sites.missing}", sites.missing != null && "the player no longer waits" in sites.missing)
            val warnings = PatchLogCapture.warnings { voiceMusicPlayerPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "goes on without the playback position switch" in warnings.single())
            for (e in sites.edits) assertTrue(methodOf(context, e).controlBody().none { it.controlRef() == e.hook })
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "playbackPosition" }.controlBody()
            assertTrue("$name: the build flag stays off", (status.first() as? WideLiteralInstruction)?.wideLiteral != 1L)
            val music = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "voiceMusicPlayer" }.controlBody()
            assertEquals(1L, (music.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    private fun methodOf(context: BytecodePatchContext, edit: PositionEdit) =
        context.tgMutableClassDefBy(edit.type).methods.single { it.toString() == edit.signature }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + voiceHosts(build))
}

/**
 * MediaController, the video viewer and the message class, which hold Telegram's lengths and its
 * voice queue, and the music service with the media session's state builder, which set the
 * session's buttons, from [build].
 */
internal fun voicePlayerHosts(build: File): List<ClassDef> {
    val named = FixtureDex.classes(build, setOf("Lorg/telegram/messenger/MediaController;", "Lorg/telegram/ui/PhotoViewer;",
        "Lorg/telegram/messenger/MessageObject;", MUSIC_SERVICE)).values
    val builders = FixtureDex.classesWhere(build, { true }) { m ->
        m.returnType == "Landroid/support/v4/media/session/PlaybackStateCompat;" && m.parameterTypes.isEmpty() }
    return (named + builders).distinctBy { it.type }.map(ImmutableClassDef::of)
}

/** The hosts of the music player patch itself, and the lengths' classes. */
internal fun voiceHosts(build: File): List<ClassDef> {
    val isMusic = "Lorg/telegram/messenger/MessageObject;->isMusic()Z"
    val player = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef() == isMusic } }.map(ImmutableClassDef::of)
    return player + voicePlayerHosts(build).filter { h -> player.none { it.type == h.type } }
}
