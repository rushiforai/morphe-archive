/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.downloadspeed

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The classes the best quality switch edits: the photo edit state, the photo viewer and the message sender. */
internal fun qualityClasses(build: File): Collection<ClassDef> {
    val found = FixtureDex.classes(build, setOf(MEDIA_EDIT_STATE, PHOTO_VIEWER, SEND_HELPER)).values
    assertEquals("${build.name}: MediaEditState, PhotoViewer and SendMessagesHelper", 3, found.size)
    return found.map(ImmutableClassDef::of)
}

/** Send photos and videos in the best quality on both declared builds (#63). */
class MediaQualityFixtureTest {
    private fun context(build: File): BytecodePatchContext {
        val queue = "Lorg/telegram/messenger/FileLoaderPriorityQueue;"
        val found = FixtureDex.classes(build, setOf(LOAD_OPERATION, DOWNLOAD_CONTROLLER, UPLOAD_OPERATION, "Lorg/telegram/messenger/FileLoader;", queue))
        assertEquals("${build.name}: the download classes", 5, found.size)
        return PatchContexts.of(ExtensionDex.classes() + found.values.map(ImmutableClassDef::of) +
            queueRunnables(build, found.getValue(queue)) + dataSaverClasses(build) + qualityClasses(build))
    }

    private fun BytecodePatchContext.flag(name: String) =
        (tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.controlBody().first() as WideLiteralInstruction).wideLiteral

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())

    private fun List<Instruction>.code() = filter { it.opcode != Opcode.NOP }

    /** The patch's warnings about photos and videos, leaving out what other parts of Faster downloads say. */
    private fun qualityWarnings(context: BytecodePatchContext) =
        PatchLogCapture.warnings { fasterDownloadsPatch.execute(context) }.filter { it.endsWith("Photos and videos keep Telegram's quality.") }

    @Test fun `the HD fallback and both video size checks go through the extension, with every stock instruction kept`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val plan = context.resolveBestQuality()
            val sites = listOf(plan.photo, plan.editor, plan.direct)
            val loads = sites.map { it.method.controlBody()[it.index].shape() }
            val before = sites.map { site -> site.method.controlBody().code().map { it.shape() } }
            assertEquals(name, emptyList<String>(), qualityWarnings(context))

            for ((i, site) in sites.withIndex()) {
                val where = "$name: ${site.method.origName}"
                val after = site.method.controlBody().code()
                assertEquals(where, before[i].size + 2, after.size)
                val hook = after.indices.single { after[it].controlRef() == site.hook }
                // Telegram's own load stays, and the extension answers for it right after.
                assertEquals(where, loads[i], after[hook - 1].shape())
                assertEquals(where, Opcode.INVOKE_STATIC_RANGE, after[hook].opcode)
                val wide = site.hook == VIDEO_LIMIT_HOOK
                assertEquals(where, if (wide) listOf(site.register, site.register + 1) else listOf(site.register), after[hook].namedRegisters())
                assertEquals(where, if (wide) Opcode.MOVE_RESULT_WIDE else Opcode.MOVE_RESULT, after[hook + 1].opcode)
                assertEquals(where, listOf(site.register), after[hook + 1].namedRegisters())
                // The answer goes where Telegram's own value went: the return of the HD fallback, the size comparison of a video.
                assertEquals(where, if (wide) Opcode.CMP_LONG else Opcode.RETURN, after[hook + 2].opcode)
                assertTrue(where, site.register in after[hook + 2].namedRegisters())
                assertEquals("$where: stock code kept in order", before[i], (after.take(hook) + after.drop(hook + 2)).map { it.shape() })
            }
            assertEquals(name, OWN_SIZE_VIDEO, (plan.editor.method.controlBody()[plan.editor.index] as WideLiteralInstruction).wideLiteral)
            assertEquals(name, OWN_SIZE_VIDEO, (plan.direct.method.controlBody()[plan.direct.index] as WideLiteralInstruction).wideLiteral)
            assertEquals(name, 1L, context.flag("bestQualityMedia"))
            assertEquals(name, 1L, context.flag("fasterDownloads"))
        }
    }

    @Test fun `a changed size check leaves photos and videos to Telegram and the rest of the patch goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val plan = context.resolveBestQuality()
            // A video sender that no longer keeps a 1000 MB file as it is.
            plan.direct.method.replaceInstruction(plan.direct.index, "const-wide/32 v${plan.direct.register}, 0x7d000000")
            val warnings = qualityWarnings(context)
            assertTrue("$name: $warnings", warnings.single().contains("the own-size limit in the video compression settings is missing or ambiguous"))
            assertEquals(name, 0L, context.flag("bestQualityMedia"))
            assertEquals(name, 1L, context.flag("fasterDownloads"))
            for (site in listOf(plan.photo, plan.editor, plan.direct)) {
                assertEquals("$name: ${site.method.origName}", 0, site.method.controlBody().count { it.controlRef() == site.hook })
            }
        }
    }
}
