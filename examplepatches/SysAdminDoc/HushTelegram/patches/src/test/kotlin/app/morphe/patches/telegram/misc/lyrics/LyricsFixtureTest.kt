/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.lyrics

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.voice.MEDIA_CONTROLLER
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import java.util.concurrent.ConcurrentHashMap
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

private val LYRICS_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/** The player's menu button, the request that saves a profile song, the player's song rows, and the stubs. */
class LyricsFixtureTest {
    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())
    private fun Method.code() = controlBody().filter { it.opcode != Opcode.NOP }

    /**
     * What mentions Remove from Profile and every class it holds or calls into, whatever reads a
     * song's artist, the requests and messages the stubs read, and the extension.
     */
    private fun hosts(build: File): List<ClassDef> = (ExtensionDex.classes() + LYRICS_HOSTS.hostsOf(build.path) {
        val menus = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef() == REMOVE_FROM_PROFILE } }
        val rows = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef() == MUSIC_AUTHOR } }
        val near = menus.flatMap { cls ->
            cls.fields.map { it.type } + cls.methods.flatMap { m -> m.controlBody().mapNotNull { it.call()?.definingClass } }
        }.filter { it.startsWith("Lorg/telegram/ui/") }
        menus + rows + FixtureDex.classes(build, near.toSet() + setOf(SAVE_MUSIC, MEDIA_CONTROLLER,
            "Lorg/telegram/messenger/MessageObject;", "Lorg/telegram/messenger/UserConfig;",
            "Lorg/telegram/tgnet/TLRPC\$Document;", "Lorg/telegram/tgnet/TLRPC\$InputDocument;",
            "Lorg/telegram/tgnet/TLRPC\$Message;", "Lorg/telegram/tgnet/TLRPC\$Peer;")).values
    }).distinctBy { it.type }

    private fun status(context: BytecodePatchContext, name: String) =
        context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.controlBody()

    @Test fun `the menu gets Lyrics first, the save request and the song rows ask the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(hosts(build))
            val menu = context.resolveLyricsMenu()
            val dates = context.resolveSongDates(menu.player)
            if (name.contains("-72919")) {
                assertEquals("Lorg/telegram/ui/Components/d8;", menu.player)
                assertEquals("Lorg/telegram/ui/Components/x6;", menu.method.definingClass)
                assertEquals("Lorg/telegram/ui/Components/p60;", menu.item.definingClass)
                assertEquals("l", menu.item.name)
                assertEquals("Lorg/telegram/ui/Cells/w;", dates.rows.map { it.first.definingClass }.distinct().single())
            }
            val menuBefore = ImmutableMethod.of(menu.method).code()
            val savingBefore = ImmutableMethod.of(dates.saving).code()
            val rowsBefore = dates.rows.map { (m, _) -> ImmutableMethod.of(m).code() }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { lyricsPatch.execute(context) })

            // Menu: the anchor in front of makeOptions, then Lyrics right after the menu is kept.
            val after = menu.method.code()
            val make = menuBefore.indexOfFirst { it.call()?.let { c -> c.returnType == c.definingClass } == true &&
                (it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE) && it.call()!!.parameterTypes.size == 4 }
            assertEquals("$name: two calls added", menuBefore.size + 2, after.size)
            assertEquals(LYRICS_ANCHOR, after[make].controlRef())
            val made = menuBefore[make].namedRegisters()
            assertEquals("$name: the container and the button", listOf(made[0], made[2]), after[make].namedRegisters())
            assertEquals("$name: then the stock make", menuBefore[make].shape(), after[make + 1].shape())
            assertEquals(Opcode.MOVE_RESULT_OBJECT, after[make + 2].opcode)
            assertEquals(LYRICS_MENU, after[make + 3].controlRef())
            assertEquals("$name: the menu itself", menuBefore[make + 1].namedRegisters(), after[make + 3].namedRegisters())
            for (i in menuBefore.indices) {
                val j = when {
                    i < make -> i
                    i <= make + 1 -> i + 1
                    else -> i + 2
                }
                assertEquals("$name: stock menu $i", menuBefore[i].shape(), after[j].shape())
            }
            assertTrue("$name: Remove from Profile is still there", after.any { it.controlRef() == REMOVE_FROM_PROFILE })

            // The save request tells the extension first, the rest stock.
            val saving = dates.saving.code()
            assertEquals(SONG_SAVING, saving[0].controlRef())
            assertEquals("$name: the request itself", listOf(dates.saving.implementation!!.registerCount - 2), saving[0].namedRegisters())
            for (i in savingBefore.indices) assertEquals("$name: stock save $i", savingBefore[i].shape(), saving[i + 1].shape())

            // Each artist read in the rows asks the extension with the same registers.
            dates.rows.forEachIndexed { n, (method, indices) ->
                val before = rowsBefore[n]
                val patched = method.code()
                assertEquals("$name: same length", before.size, patched.size)
                for (i in before.indices) {
                    if (i in indices) {
                        assertEquals(SONG_AUTHOR, patched[i].controlRef())
                        assertTrue(patched[i].opcode == Opcode.INVOKE_STATIC || patched[i].opcode == Opcode.INVOKE_STATIC_RANGE)
                        assertEquals("$name: the message and its flag", before[i].namedRegisters(), patched[i].namedRegisters())
                    } else {
                        assertEquals("$name: stock row $i", before[i].shape(), patched[i].shape())
                    }
                }
            }

            val stub = { owner: String, n: String -> context.tgMutableClassDefBy(owner).methods.single { it.origName == n }.controlBody().mapNotNull { it.controlRef() } }
            val item = "${menu.item.definingClass}->${menu.item.name}(${menu.item.parameterTypes.joinToString("")})V"
            assertTrue("$name: addItem adds to the menu", item in stub(LYRICS, "addItem"))
            assertTrue(stub(LYRICS, "playing").first().endsWith("getInstance()$MEDIA_CONTROLLER"))
            assertTrue("Lorg/telegram/messenger/MessageObject;->getMusicTitle(Z)Ljava/lang/String;" in stub(LYRICS, "title"))
            assertTrue(MUSIC_AUTHOR in stub(LYRICS, "author"))
            assertTrue(MUSIC_AUTHOR in stub(SONG_DATES, "musicAuthor"))
            assertTrue("$SAVE_MUSIC->unsave:Z" in stub(SONG_DATES, "unsaves"))
            assertTrue("Lorg/telegram/tgnet/TLRPC\$Peer;->user_id:J" in stub(SONG_DATES, "listedBy"))
            assertTrue("Lorg/telegram/messenger/UserConfig;->getClientUserId()J" in stub(SONG_DATES, "selfId"))
            for (flag in listOf("lyrics", "songDates")) {
                assertEquals("$name: $flag", 1L, (status(context, flag).first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    @Test fun `a build without the song rows gets Lyrics alone and says so`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val all = hosts(build)
            val probe = PatchContexts.of(all)
            val row = probe.resolveSongDates(probe.resolveLyricsMenu().player).rows.first().first.definingClass
            val context = PatchContexts.of(all.filter { it.type != row })
            val before = status(context, "songDates").map { it.opcode }
            val warnings = PatchLogCapture.warnings { lyricsPatch.execute(context) }
            assertEquals("$name: one warning", 1, warnings.size)
            assertTrue("$name: names the switch", warnings.single().contains("song dates switch"))
            assertEquals(1L, (status(context, "lyrics").first() as WideLiteralInstruction).wideLiteral)
            assertEquals("$name: song dates stay off", before, status(context, "songDates").map { it.opcode })
            val saving = context.tgMutableClassDefBy(SAVE_MUSIC).methods.single { it.name == "serializeToStream" }.controlBody()
            assertNotEquals("$name: the save request is stock", SONG_SAVING, saving.first().controlRef())
        }
    }

    @Test fun `a build whose player menu changed refuses before changing anything`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val all = hosts(build)
            val menu = PatchContexts.of(all).resolveLyricsMenu().method.definingClass
            val context = PatchContexts.of(all.filter { it.type != menu })
            assertTrue("$name: resolving refuses", runCatching { context.resolveLyricsMenu() }.exceptionOrNull() is PatchException)
            val before = listOf("lyrics", "songDates").map { flag -> status(context, flag).map { it.opcode } }
            assertThrows(PatchException::class.java) { lyricsPatch.execute(context) }
            assertEquals("$name: both switches stay off", before, listOf("lyrics", "songDates").map { flag -> status(context, flag).map { it.opcode } })
        }
    }
}
