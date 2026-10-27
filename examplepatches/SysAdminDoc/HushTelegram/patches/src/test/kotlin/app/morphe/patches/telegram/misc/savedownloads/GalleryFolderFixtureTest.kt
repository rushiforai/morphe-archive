/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.savedownloads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/** MediaController's Save to Gallery writes on both declared builds, where the gallery folder is chosen. */
class GalleryFolderFixtureTest {
    private val hosts = setOf(IMAGE_LOADER, FILE_LOADER, MESSAGE_OBJECT, TL_MESSAGE, DOCUMENT, DIALOG_OBJECT, MESSAGES_CONTROLLER,
        MESSAGES_STORAGE, GALLERY_MEDIA_CONTROLLER, ANDROID_UTILITIES)

    private fun context(build: File): BytecodePatchContext {
        val images = FixtureDex.classes(build, setOf(IMAGE_LOADER)).values.single()
        val host = FixtureDex.classes(build, hosts + images.delegateCandidates()).values.map(ImmutableClassDef::of)
        assertTrue("${build.name}: Telegram's download and gallery classes", host.map { it.type }.containsAll(hosts))
        return PatchContexts.of(ExtensionDex.classes() + host)
    }

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), controlRef())

    private fun BytecodePatchContext.flag(name: String) = (mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }
        .controlBody().first() as WideLiteralInstruction).wideLiteral

    /** Every MediaController method body, as opcodes, registers and references. */
    private fun BytecodePatchContext.media() = mutableClassDefBy(GALLERY_MEDIA_CONTROLLER).methods.filter { it.implementation != null }
        .associate { m -> "${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}" to m.controlBody().map { it.shape() } }

    private fun BytecodePatchContext.saveFileInternal() =
        mutableClassDefBy(GALLERY_MEDIA_CONTROLLER).methods.single { it.name == "saveFileInternal" }

    @Test fun `every string Save to Gallery puts goes past the extension and nothing else in MediaController changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val plan = context.resolveGalleryFolder()
            assertEquals("$name: nothing missing", null, plan.missing)
            val saves = plan.saves.associate { (method, puts) -> method.name to puts }
            assertEquals(name, 2, saves.size)
            val live = saves.keys.single { it != "saveFileInternal" }
            assertTrue("$name: $live", live.startsWith("lambda\$saveFile\$"))
            // Ten puts in the ordinary save, four in the live photo's, all of them plain three-register calls.
            assertEquals(name, 10, saves.getValue("saveFileInternal").size)
            assertEquals(name, 4, saves.getValue(live).size)
            // Before Android 10: the photo and the video folder in saveFile's thread, and the live photo's one.
            assertEquals("$name: nothing missing on Android 9", null, plan.olderMissing)
            val older = plan.older.associate { (method, folders) -> method.name to folders }
            val thread = older.keys.single { it != live }
            assertTrue("$name: $thread", thread.startsWith("lambda\$saveFile\$"))
            assertEquals(name, 2, older.getValue(thread).size)
            assertEquals(name, 1, older.getValue(live).size)
            val edited = plan.saves.map { it.first } + plan.older.map { it.first }.filter { it.name !in saves.keys }
            val stock = edited.associate { method -> method.name to ImmutableMethod.of(method).controlBody() }
            val others = context.media().filterKeys { key -> stock.keys.none { key.startsWith("$it(") } }

            assertEquals(emptyList<String>(), PatchLogCapture.warnings { saveDownloadsPatch.execute(context) })

            for (method in edited) {
                val where = "$name: ${method.name}"
                val puts = saves[method.name].orEmpty()
                val before = stock.getValue(method.name)
                val edits = method.controlBody()
                // Each Android 9 folder goes past the extension right after it's made, ahead of Telegram's mkdirs.
                val calls = edits.indices.filter { edits[it].controlRef() == GALLERY_OLDER }
                assertEquals(where, older[method.name].orEmpty().size, calls.size)
                for (j in calls) {
                    assertEquals("$where: $j", GALLERY_FILE_IN, edits[j - 1].controlRef())
                    val folder = listOf(edits[j - 1].namedRegisters().first())
                    assertEquals("$where: $j", Opcode.INVOKE_STATIC_RANGE, edits[j].opcode)
                    assertEquals("$where: $j", folder, edits[j].namedRegisters())
                    assertEquals("$where: $j", Opcode.MOVE_RESULT_OBJECT, edits[j + 1].opcode)
                    assertEquals("$where: $j", folder, edits[j + 1].namedRegisters())
                    assertEquals("$where: $j", "Ljava/io/File;->mkdirs()Z", edits[j + 2].controlRef())
                }
                val after = edits.filterIndexed { i, _ -> calls.none { i == it || i == it + 1 } }
                assertEquals(where, before.size, after.size)
                if (puts.isNotEmpty()) {
                    // Each folder write still comes after its relative_path key, which only the extension reads.
                    assertTrue(where, after.any { it.controlString() == GALLERY_RELATIVE_PATH })
                }
                for (i in before.indices) {
                    if (i in puts) {
                        assertEquals("$where: $i", Opcode.INVOKE_STATIC, after[i].opcode)
                        assertEquals("$where: $i", GALLERY_PUT, after[i].controlRef())
                        assertEquals("$where: $i, the values, the key and the value", before[i].namedRegisters(), after[i].namedRegisters())
                    } else {
                        assertEquals("$where: stock $i", before[i].shape(), after[i].shape())
                    }
                }
                assertEquals(where, emptyList<Int>(), after.indices.filter { after[it].controlRef() == GALLERY_VALUES_PUT })
            }
            assertEquals(name, others, context.media().filterKeys { it in others.keys })
            assertEquals(name, 1L, context.flag("galleryFolder"))
            assertEquals(name, 1L, context.flag("saveDownloads"))
        }
    }

    @Test fun `changed gallery saves keep Telegram's folders and Save downloaded files goes on`() {
        val build = Fixtures.declaredBuilds().first()
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            "Telegram's gallery saves changed (saveFileInternal)" to { context ->
                val media = context.mutableClassDefBy(GALLERY_MEDIA_CONTROLLER)
                val live = media.methods.single { it.name.startsWith("lambda\$saveFile\$") &&
                    it.controlBody().any { i -> i.controlString() == GALLERY_RELATIVE_PATH } }
                val body = live.controlBody()
                val at = body.indexOfFirst { it.controlString() == GALLERY_RELATIVE_PATH }
                live.replaceInstruction(at, "const-string v${body[at].namedRegisters().single()}, \"_display_name\"")
            },
            // A third writer would save somewhere the choice doesn't reach.
            "Telegram's gallery saves changed" to { context ->
                val media = context.mutableClassDefBy(GALLERY_MEDIA_CONTROLLER)
                val save = context.saveFileInternal()
                media.methods.add(ImmutableMethod(save.definingClass, "saveFileInternalAgain", save.parameters, save.returnType,
                    save.accessFlags, save.annotations, save.hiddenApiRestrictions, ImmutableMethod.of(save).implementation).toMutable())
            },
            "MediaController.saveFileInternal no longer puts its folder the way the swap expects" to { context ->
                context.saveFileInternal().addInstruction(0, "invoke-virtual/range {v0 .. v2}, $GALLERY_VALUES_PUT")
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            change(context)
            val untouched = context.media()
            val callback = context.resolveSaveDownloads()
            val warnings = PatchLogCapture.warnings { saveDownloadsPatch.execute(context) }
            assertEquals(why, 1, warnings.size)
            assertTrue("$why: $warnings", warnings.single().startsWith("Save downloaded files: $why"))
            assertTrue("$why: $warnings", warnings.single().endsWith(". The patch goes on without the gallery folder choice."))
            assertEquals(why, untouched, context.media())
            assertEquals(why, "$SAVE_DOWNLOADS->fileLoaded(ILjava/lang/String;Ljava/io/File;Ljava/lang/Object;)V",
                callback.controlBody()[1].controlRef())
            assertEquals(why, 1L, context.flag("saveDownloads"))
            assertEquals(why, 0L, context.flag("galleryFolder"))
        }
    }

    @Test fun `changed Android 9 saves keep Telegram's folders there and the Android 10 choice goes on`() {
        val build = Fixtures.declaredBuilds().first()
        fun BytecodePatchContext.thread() = mutableClassDefBy(GALLERY_MEDIA_CONTROLLER).methods.single { method ->
            method.name.startsWith("lambda\$saveFile\$") && method.controlBody().none { it.controlString() == GALLERY_RELATIVE_PATH } &&
                method.controlBody().any { it.controlRef() == GALLERY_MOVIES }
        }
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            "Telegram's Android 9 gallery saves changed" to { context ->
                val thread = context.thread()
                val body = thread.controlBody()
                val at = body.indexOfFirst { it.controlRef() == GALLERY_MOVIES }
                thread.replaceInstruction(at, "sget-object v${body[at].namedRegisters().single()}, " +
                    "Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;")
            },
            // A jump onto Telegram's mkdirs would skip the hook on that path.
            "makes its Android 9 gallery folder differently" to { context ->
                val thread = context.thread()
                val at = thread.controlBody().indexOfFirst { it.controlRef() == GALLERY_FILE_IN }
                thread.addInstructionsWithLabels(0, "goto :hush_mkdirs", ExternalLabel("hush_mkdirs", thread.getInstruction(at + 1)))
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            val thread = context.thread()
            change(context)
            val stock = thread.controlBody().map { it.shape() }
            val warnings = PatchLogCapture.warnings { saveDownloadsPatch.execute(context) }
            assertEquals(why, 1, warnings.size)
            assertTrue("$why: $warnings", warnings.single().startsWith("Save downloaded files: ") && why in warnings.single())
            assertTrue("$why: $warnings", warnings.single().endsWith(". Saves on Android 9 and older keep Telegram's folders."))
            assertEquals(why, stock, thread.controlBody().map { it.shape() })
            assertEquals(why, emptyList<Int>(), context.saveFileInternal().controlBody().indices
                .filter { context.saveFileInternal().controlBody()[it].controlRef() == GALLERY_VALUES_PUT })
            assertEquals(why, 1L, context.flag("galleryFolder"))
        }
    }

    @Test fun `a changed gallery runtime refuses before anything is edited`() {
        val build = Fixtures.declaredBuilds().first()
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            // The extension ships with the patch, so a mismatch there is a build bug, not a Telegram change.
            "put runtime hook is missing or ambiguous" to { context ->
                context.mutableClassDefBy(GALLERY_FOLDER).methods.removeAll { it.name == "put" }
            },
            "SettingsStatus has no boolean method galleryFolder()" to { context ->
                context.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "galleryFolder" }
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            change(context)
            val untouched = context.media()
            val callback = context.resolveSaveDownloads()
            val stock = callback.controlBody().map { it.shape() }
            try {
                saveDownloadsPatch.execute(context)
                fail("$why: the patch went ahead")
            } catch (refused: PatchException) {
                assertTrue("$why: ${refused.message}", refused.message!!.contains(why))
            }
            assertEquals(why, untouched, context.media())
            assertEquals(why, stock, callback.controlBody().map { it.shape() })
            assertEquals(why, 0L, context.flag("saveDownloads"))
        }
    }
}
