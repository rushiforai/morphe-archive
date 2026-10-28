/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.savedownloads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Document
import org.w3c.dom.Element

/** ImageLoader's Android 11 folder for Telegram's own files on both declared builds, where the storage folder switch reaches it (#7). */
class StorageFolderFixtureTest {
    @Rule @JvmField val temporary = TemporaryFolder()

    private val hosts = setOf(IMAGE_LOADER, FILE_LOADER, MESSAGE_OBJECT, TL_MESSAGE, DOCUMENT, DIALOG_OBJECT, MESSAGES_CONTROLLER,
        MESSAGES_STORAGE, GALLERY_MEDIA_CONTROLLER, ANDROID_UTILITIES)

    private fun context(build: File): BytecodePatchContext {
        val images = FixtureDex.classes(build, setOf(IMAGE_LOADER)).values.single()
        val host = FixtureDex.classes(build, hosts + images.delegateCandidates()).values.map(ImmutableClassDef::of)
        assertTrue("${build.name}: Telegram's download and folder classes", host.map { it.type }.containsAll(hosts))
        return PatchContexts.of(ExtensionDex.classes() + host)
    }

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), controlRef())

    private fun BytecodePatchContext.flag(name: String) = (mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }
        .controlBody().first() as WideLiteralInstruction).wideLiteral

    private fun BytecodePatchContext.mediaPaths() = mutableClassDefBy(IMAGE_LOADER).methods.single { it.name == "createMediaPaths" }

    @Test fun `the Android 11 folder goes past the extension right before Telegram keeps it`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val stock = context.mediaPaths().controlBody().map { it.shape() }
            // telegramPath is written on the older Android path and the fallback too. Only the Android 11 one is moved.
            assertTrue(name, stock.count { it[2] == STORAGE_TELEGRAM_PATH } > 1)
            assertEquals("$name: nothing missing", null, context.resolveStorageFolder().missing)

            assertEquals(emptyList<String>(), PatchLogCapture.warnings { saveDownloadsPatch.execute(context) })

            val edits = context.mediaPaths().controlBody()
            val calls = edits.indices.filter { edits[it].controlRef() == STORAGE_TELEGRAM_FOLDER }
            assertEquals(name, 1, calls.size)
            val j = calls.single()
            val folder = edits[j - 1].namedRegisters().first()
            assertEquals(name, GALLERY_FILE_IN, edits[j - 1].controlRef())
            assertEquals(name, STORAGE_FILES_DIR, edits[j - 4].controlRef())
            // The Android 11 branch's call, ahead of the older Android path's.
            assertEquals(name, j - 4, edits.indexOfFirst { it.controlRef() == STORAGE_FILES_DIR })
            assertEquals(name, Opcode.INVOKE_STATIC_RANGE, edits[j].opcode)
            assertEquals(name, listOf(folder), edits[j].namedRegisters())
            assertEquals(name, Opcode.MOVE_RESULT_OBJECT, edits[j + 1].opcode)
            assertEquals(name, listOf(folder), edits[j + 1].namedRegisters())
            assertEquals(name, Opcode.IPUT_OBJECT, edits[j + 2].opcode)
            assertEquals(name, STORAGE_TELEGRAM_PATH, edits[j + 2].controlRef())
            assertEquals(name, folder, edits[j + 2].namedRegisters().first())
            assertEquals(name, stock.filter { it[0] != Opcode.NOP },
                edits.filterIndexed { i, _ -> i != j && i != j + 1 }.map { it.shape() }.filter { it[0] != Opcode.NOP })
            assertEquals(name, 1L, context.flag("storageFolder"))
            assertEquals(name, 1L, context.flag("galleryFolder"))
            assertEquals(name, 1L, context.flag("saveDownloads"))
        }
    }

    @Test fun `a changed Android 11 folder keeps Android data and Save downloaded files goes on`() {
        val build = Fixtures.declaredBuilds().first()
        fun BytecodePatchContext.filesDir() = mediaPaths().controlBody().indexOfFirst { it.controlRef() == STORAGE_FILES_DIR }
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            // Every files dir call, since the Play build has a second one on the older Android path.
            "Telegram's Android 11 folder changed (0 places)" to { context ->
                val method = context.mediaPaths()
                for (at in method.controlBody().indices.filter { method.getInstruction(it).controlRef() == STORAGE_FILES_DIR }) {
                    val owner = method.getInstruction(at).namedRegisters().first()
                    method.replaceInstruction(at, "invoke-virtual/range {v$owner .. v$owner}, Landroid/content/Context;->getFilesDir()Ljava/io/File;")
                }
            },
            // A jump onto Telegram's iput would skip the hook on that path.
            "ImageLoader.createMediaPaths makes its Android 11 folder differently" to { context ->
                val method = context.mediaPaths()
                val keep = method.getInstruction(context.filesDir() + 4)
                method.addInstructionsWithLabels(0, "goto :hush_keep", ExternalLabel("hush_keep", keep))
            },
            "ImageLoader.createMediaPaths changed" to { context ->
                context.mutableClassDefBy(IMAGE_LOADER).methods.removeAll { it.name == "createMediaPaths" }
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            change(context)
            val untouched = context.mutableClassDefBy(IMAGE_LOADER).methods.filter { it.name == "createMediaPaths" }
                .map { m -> m.controlBody().map { it.shape() } }
            val warnings = PatchLogCapture.warnings { saveDownloadsPatch.execute(context) }
            assertEquals(why, 1, warnings.size)
            assertEquals(why, "Save downloaded files: $why. The patch goes on without the storage folder.", warnings.single())
            assertEquals(why, untouched, context.mutableClassDefBy(IMAGE_LOADER).methods.filter { it.name == "createMediaPaths" }
                .map { m -> m.controlBody().map { it.shape() } })
            assertEquals(why, 0L, context.flag("storageFolder"))
            assertEquals(why, 1L, context.flag("galleryFolder"))
            assertEquals(why, 1L, context.flag("saveDownloads"))
        }
    }

    @Test fun `a changed storage runtime refuses before anything is edited`() {
        val build = Fixtures.declaredBuilds().first()
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            // The extension ships with the patch, so a mismatch there is a build bug, not a Telegram change.
            "telegramFolder runtime hook is missing or ambiguous" to { context ->
                context.mutableClassDefBy(STORAGE_FOLDER).methods.removeAll { it.name == "telegramFolder" }
            },
            "SettingsStatus has no boolean method storageFolder()" to { context ->
                context.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "storageFolder" }
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            change(context)
            val stock = context.mediaPaths().controlBody().map { it.shape() }
            try {
                saveDownloadsPatch.execute(context)
                fail("$why: the patch went ahead")
            } catch (refused: PatchException) {
                assertTrue("$why: ${refused.message}", refused.message!!.contains(why))
            }
            assertEquals(why, stock, context.mediaPaths().controlBody().map { it.shape() })
            assertEquals(why, 0L, context.flag("saveDownloads"))
        }
    }

    @Test fun `the manifest asks for All files access once`() {
        val added = manifest("<uses-permission android:name=\"android.permission.WRITE_EXTERNAL_STORAGE\" />")
        assertEquals(listOf("android.permission.WRITE_EXTERNAL_STORAGE", STORAGE_MANAGE_PERMISSION), permissions(added))
        // Ahead of the application element, where Android reads permissions.
        val root = added.documentElement
        val order = (0 until root.childNodes.length).map { root.childNodes.item(it) }.filterIsInstance<Element>().map { it.tagName }
        assertTrue(order.toString(), order.lastIndexOf("uses-permission") < order.indexOf("application"))
        assertEquals("false", (added.getElementsByTagName("application").item(0) as Element).getAttribute("android:enabled"))

        val kept = manifest("<uses-permission android:name=\"$STORAGE_MANAGE_PERMISSION\" />")
        assertEquals(listOf(STORAGE_MANAGE_PERMISSION), permissions(kept))
    }

    private fun permissions(document: Document) = document.getElementsByTagName("uses-permission").let { list ->
        (0 until list.length).map { (list.item(it) as Element).getAttribute("android:name") }
    }

    private fun manifest(permissions: String): Document {
        val work = temporary.newFolder()
        val apk = File(work, "input.apk")
        ApkModule().use { module ->
            module.setManifest(AndroidManifestBlock.empty().apply {
                setPackageName("org.telegram.messenger.web")
                setVersionName("13.1.0")
                setVersionCode(72299)
            })
            module.writeApk(apk)
        }
        val config = PatcherConfig(apkFile = apk, temporaryFilesPath = File(work, "patcher"))
        ResourcePatchContext::class.java.getConstructor(PatcherConfig::class.java).newInstance(config).use { context ->
            val manifest = context["AndroidManifest.xml"]
            manifest.parentFile.mkdirs()
            manifest.writeText("<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\" package=\"org.telegram.messenger.web\">" +
                "<uses-sdk android:minSdkVersion=\"28\" android:targetSdkVersion=\"36\" />$permissions<application android:enabled=\"false\" /></manifest>")
            storageFolderManifestPatch.execute(context)
            return DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifest)
        }
    }
}
