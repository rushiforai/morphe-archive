/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.savedownloads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.downloadspeed.LOAD_OPERATION
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/** ImageLoader's finished-download callback on both declared builds, and the checks the stubs borrow. */
class SaveDownloadsFixtureTest {
    private val hosts = setOf(IMAGE_LOADER, FILE_LOADER, MESSAGE_OBJECT, TL_MESSAGE, DOCUMENT, DIALOG_OBJECT, MESSAGES_CONTROLLER,
        MESSAGES_STORAGE, GALLERY_MEDIA_CONTROLLER, ANDROID_UTILITIES, LOAD_OPERATION)

    private fun context(build: File): BytecodePatchContext {
        // The callback is an anonymous class; ImageLoader names it where it hands FileLoader its delegate.
        val images = FixtureDex.classes(build, setOf(IMAGE_LOADER)).values.single()
        val host = FixtureDex.classes(build, hosts + images.delegateCandidates()).values.map(ImmutableClassDef::of)
        assertTrue("${build.name}: Telegram's download classes", host.map { it.type }.containsAll(hosts))
        return PatchContexts.of(ExtensionDex.classes() + host)
    }

    private fun ClassDef.method(name: String) = methods.single { it.name == name }
    private fun BytecodePatchContext.stub(name: String) = mutableClassDefBy(SAVE_DOWNLOADS).method(name).controlBody()
    private fun List<Instruction>.refs() = mapNotNull { it.controlRef() }

    @Test fun `every finished download goes past the extension first, and the stubs reach Telegram's own checks`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val callback = context.resolveSaveDownloads()
            assertTrue("$name: ${callback.definingClass}", callback.definingClass.startsWith("Lorg/telegram/messenger/ImageLoader$"))
            val old = ImmutableMethod.of(callback)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { saveDownloadsPatch.execute(context) })

            val before = old.controlBody()
            val after = callback.controlBody()
            assertEquals("$name: two instructions in front", before.size + 2, after.size)
            // The delegate's own account, read into the first local.
            val self = callback.implementation!!.registerCount - 5
            assertEquals(Opcode.IGET, after[0].opcode)
            assertEquals("${callback.definingClass}->val\$currentAccount:I", after[0].controlRef())
            assertEquals(listOf(0, self), after[0].namedRegisters())
            assertEquals(Opcode.INVOKE_STATIC, after[1].opcode)
            assertEquals("$SAVE_DOWNLOADS->fileLoaded(ILjava/lang/String;Ljava/io/File;Ljava/lang/Object;)V", after[1].controlRef())
            // The account, then the name, the file and the parent: the three parameters after this.
            assertEquals(listOf(0, self + 1, self + 2, self + 3), after[1].namedRegisters())
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].controlRef()),
                    listOf(after[i + 2].opcode, after[i + 2].namedRegisters(), after[i + 2].controlRef()))
            }

            // A background download's message, read back the way MessagesStorage wraps one.
            assertEquals(listOf(STORAGE_INSTANCE, STORED_MESSAGE, MESSAGE_OBJECT, NEW_MESSAGE_OBJECT), context.stub("storedMessage").refs())
            assertEquals(listOf(MESSAGE_OBJECT, MESSAGE_OBJECT, GET_DOCUMENT), context.stub("messageDocument").refs())
            assertEquals(listOf(MESSAGE_OBJECT, IS_SECRET_MEDIA, IS_MUSIC, IS_DOCUMENT, IS_GIF, IS_ROUND_VIDEO, IS_VOICE),
                context.stub("fileOrSong").refs())
            assertEquals(listOf(MESSAGE_OBJECT, MESSAGE_OWNER, NO_FORWARDS, GET_DIALOG_ID, IS_ENCRYPTED, CURRENT_ACCOUNT,
                CONTROLLER_INSTANCE, PEER_NO_FORWARDS), context.stub("savingForbidden").refs())
            // The switch for chats that don't allow saving never reaches a secret chat.
            assertEquals(listOf(MESSAGE_OBJECT, MESSAGE_OWNER, GET_DIALOG_ID, IS_ENCRYPTED), context.stub("secretChat").refs())
            // A photo's size goes through attachName too, so it takes any TLObject (#29).
            assertEquals(listOf(TL_OBJECT, ATTACH_NAME), context.stub("attachName").refs())
            assertEquals(listOf(DOCUMENT, DOCUMENT_NAME), context.stub("documentName").refs())
            assertEquals(listOf(MESSAGE_OBJECT, IS_SECRET_MEDIA, IS_GIF, IS_ROUND_VIDEO, IS_PHOTO, IS_VIDEO),
                context.stub("photoOrVideo").refs())
            assertEquals(listOf(MESSAGE_OBJECT, PHOTO_THUMBS, PHOTO_SIZE, CLOSEST_PHOTO_SIZE), context.stub("photo").refs())
            for (stub in listOf("messageDocument", "fileOrSong", "savingForbidden", "secretChat", "attachName", "documentName",
                "storedMessage", "photoOrVideo", "photo")) {
                val method = context.mutableClassDefBy(SAVE_DOWNLOADS).method(stub)
                assertTrue("$name: $stub", AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags))
            }
            val status = context.mutableClassDefBy(SETTINGS_STATUS).method("saveDownloads").controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a changed callback or changed saving rules refuse before anything is edited`() {
        val build = Fixtures.declaredBuilds().first()
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            "ImageLoader's download callback is missing or ambiguous" to { context ->
                val images = context.mutableClassDefBy(IMAGE_LOADER)
                val handOver = images.methods.single { method -> method.controlBody().any { it.controlRef() == SET_DELEGATE } }
                val at = handOver.controlBody().indexOfFirst { it.controlRef() == SET_DELEGATE }
                handOver.replaceInstruction(at, "nop")
            },
            "Telegram's rules for saving a file outside the app changed" to { context ->
                val loader = context.mutableClassDefBy(FILE_LOADER)
                val rules = loader.methods.single { method -> method.controlBody().refs().containsAll(listOf(PEER_NO_FORWARDS, NO_FORWARDS)) }
                val at = rules.controlBody().indexOfFirst { it.controlRef() == NO_FORWARDS }
                rules.replaceInstruction(at, "nop")
            },
            "$PEER_NO_FORWARDS isn't reachable from the extension" to { context ->
                val controller = context.mutableClassDefBy(MESSAGES_CONTROLLER)
                val check = controller.methods.single { it.toString() == PEER_NO_FORWARDS }
                check.accessFlags = check.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value
            },
            "the background download key changed" to { context ->
                val loader = context.mutableClassDefBy(FILE_LOADER)
                val parser = loader.methods.single { method -> method.controlBody().any { it.controlString() == SENT_KEY } }
                val at = parser.controlBody().indexOfFirst { it.controlString() == SENT_KEY }
                val register = (parser.controlBody()[at] as OneRegisterInstruction).registerA
                parser.replaceInstruction(at, "const-string v$register, \"sent_.*_([0-9]+)_([0-9]+)_([0-9]+)\"")
            },
            "$STORED_MESSAGE isn't reachable from the extension" to { context ->
                val storage = context.mutableClassDefBy(MESSAGES_STORAGE)
                val read = storage.methods.single { it.toString() == STORED_MESSAGE }
                read.accessFlags = read.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            val callback = context.resolveSaveDownloads()
            val untouched = callback.controlBody().map { it.opcode to it.namedRegisters() }
            val stub = context.stub("attachName").map { it.opcode }
            change(context)
            try {
                saveDownloadsPatch.execute(context)
                fail("$why: the patch went ahead")
            } catch (refused: PatchException) {
                assertTrue("$why: ${refused.message}", refused.message!!.contains(why))
            }
            assertEquals(why, untouched, callback.controlBody().map { it.opcode to it.namedRegisters() })
            assertEquals(why, stub, context.stub("attachName").map { it.opcode })
            assertEquals(why, 0L, (context.mutableClassDefBy(SETTINGS_STATUS).method("saveDownloads").controlBody().first()
                as WideLiteralInstruction).wideLiteral)
        }
    }
}
