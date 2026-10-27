package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertSame
import kotlin.test.assertTrue

internal const val SYNTHETIC_SHARE_COPY = "LX/KLZ;->call()Ljava/lang/Object;"

private const val OPEN = "invoke-direct {v3, v8, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V"
private const val COPY = "invoke-static {v2, v3}, LX/8Bb;->A00(Ljava/io/InputStream;Ljava/io/OutputStream;)V"
private const val CLOSE = "invoke-virtual {v3}, Ljava/io/OutputStream;->close()V"
private const val FROM_FILE = "invoke-static {v8}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;"

/** The share copy's end as Messenger writes it: open the copy on the File, copy the stream in, close it, point a Uri at it. */
private fun shareCopy(
    name: String = SHARE_MEDIA_NAME, copy: String = COPY, close: String = CLOSE, fromFile: String = FROM_FILE,
    jump: String = "", id: String = SYNTHETIC_SHARE_COPY, flags: Int = AccessFlags.PUBLIC.value,
) = fixtureMethod(id, flags = flags, body = """
    $jump
    const-string v1, "$name"
    new-instance v3, Ljava/io/FileOutputStream;
    const/4 v1, 0x0
    $OPEN
    $copy
    $close
    :after_close
    $fromFile
    move-result-object v1
    return-object v1
""".trimIndent(), registers = 12)

/** The share copy for the catalog-wide discovery fixture. */
internal fun shareCopyFixture() = listOf(fixtureClass("LX/KLZ;", listOf(shareCopy())))

private fun Method.code() = implementation!!.instructions.toList()

/**
 * The helper sits right before Uri.fromFile and names the copy's File, and nothing stock moves or changes. An odd-length
 * insertion can add or drop the nop that aligns a switch table further down, so nops don't count.
 */
private fun assertCopyHook(before: List<Instruction>, after: List<Instruction>, site: Int, label: String) {
    val file = (before[site] as FiveRegisterInstruction).registerC
    val helper = after[site] as RegisterRangeInstruction
    assertEquals(Opcode.INVOKE_STATIC_RANGE, helper.opcode, label)
    assertEquals(XHE_AUDIO_HELPER, (helper as ReferenceInstruction).reference.toString(), label)
    assertEquals(listOf(1, file), listOf(helper.registerCount, helper.startRegister), label)
    assertSame(before[site], after[site + 1], label)
    assertStockKept(before.filter { it.opcode != Opcode.NOP }, after.filterIndexed { i, it -> i != site && it.opcode != Opcode.NOP }, label)
}

class XheAudioTest {
    @AfterTest fun reset() { activeProfile = SYNTHETIC_PROFILE }

    @Test fun theFinishedCopyGoesThroughTheExtensionBeforeMessengerReadsIt() {
        val method = shareCopy()
        val found = mirroredControls(shareCopyFixture())
        assertEquals(listOf(SYNTHETIC_SHARE_COPY), found.getValue(XHE_AUDIO).map { it.hookId() })
        validateControls(found, setOf(XHE_AUDIO))
        val before = method.code()
        val site = method.shareCopySite()!!
        injectControl(XHE_AUDIO, mapOf(XHE_AUDIO to listOf(method)))
        assertCopyHook(before, method.code(), site, "copy")
        // Two copies that look alike are ambiguous, so neither is hooked.
        val twin = fixtureClass("LX/KLY;", listOf(shareCopy(id = SYNTHETIC_SHARE_COPY.replace("LX/KLZ;", "LX/KLY;"))))
        assertTrue(findXheAudio(shareCopyFixture() + twin).isEmpty())
    }

    @Test fun theStaticBodyRedexMovesCallIntoIsTheSameCopy() {
        // 346816951 and its siblings: LX/LZc;->A00(LX/LZc;)Ljava/lang/Object; holds what call() used to.
        val static = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
        val outlined = shareCopy(id = "LX/LZc;->A00(LX/LZc;)Ljava/lang/Object;", flags = static)
        val classes = listOf(fixtureClass("LX/LZc;", listOf(outlined)))
        assertEquals(listOf(outlined.hookId()), findXheAudio(classes).map { it.hookId() })
        assertEquals(listOf(outlined.hookId()), mirroredControls(classes).getValue(XHE_AUDIO).map { it.hookId() })
        val before = outlined.code()
        val site = outlined.shareCopySite()!!
        injectControl(XHE_AUDIO, mapOf(XHE_AUDIO to listOf(outlined)))
        assertCopyHook(before, outlined.code(), site, "outlined copy")
        // Another class's parameter, an instance method with it, or a static call() isn't that body.
        val others = listOf(
            shareCopy(id = "LX/LZc;->A00(LX/LZd;)Ljava/lang/Object;", flags = static),
            shareCopy(id = "LX/LZc;->A00(LX/LZc;)Ljava/lang/Object;"),
            shareCopy(id = "LX/LZc;->call()Ljava/lang/Object;", flags = static),
        )
        for (method in others) assertTrue(findXheAudio(listOf(fixtureClass("LX/LZc;", listOf(method)))).isEmpty(), method.hookId())
    }

    @Test fun aCopyThatMovedIsntFoundOrStopsBeforeAnyEdit() {
        // Discovery skips a method whose copy doesn't end on the same File and stream it opened.
        val moved = mapOf(
            "closes another stream" to shareCopy(close = "invoke-virtual {v4}, Ljava/io/OutputStream;->close()V"),
            "points the Uri at another file" to shareCopy(fromFile = "invoke-static {v9}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;"),
            "copies something else" to shareCopy(copy = "invoke-static {v2}, LX/8Bb;->A00(Ljava/io/InputStream;)V"),
            "copy writes to another stream" to shareCopy(copy = "invoke-static {v2, v4}, LX/8Bb;->A00(Ljava/io/InputStream;Ljava/io/OutputStream;)V"),
        )
        for ((case, method) in moved) assertNull(method.shareCopySite(), case)
        assertTrue(findXheAudio(listOf(fixtureClass("LX/KLZ;", listOf(shareCopy(name = "orca_other_media"))))).isEmpty(), "another name")
        // A jump straight to the Uri would hand Messenger the copy without the extension seeing it.
        val jumped = shareCopy(jump = "if-eqz v3, :after_close")
        val before = jumped.code()
        val failure = assertFailsWith<PatchException> { injectControl(XHE_AUDIO, mapOf(XHE_AUDIO to listOf(jumped))) }
        assertContains(failure.message.orEmpty(), "shared video copy moved")
        assertEquals(before, jumped.code())
    }

    @Test fun thePickedVideosSourceGoesThroughTheExtensionFirst() {
        // 24 registers and five parameters plus this: the source path is v21.
        val method = fixtureMethod(VIDEO_TRANSCODE, TRANSCODE_SOURCE_BODY, registers = 24)
        val found = mirroredControls(listOf(fixtureClass(MEDIA_TRANSCODER, listOf(method))))
        assertEquals(listOf(VIDEO_TRANSCODE), found.getValue(XHE_TRANSCODE).map { it.hookId() })
        val worker = found.getValue(XHE_TRANSCODE).single() as MutableMethod
        assertEquals(21, worker.transcodeSourceRegister())
        assertTrue(worker.parsesTranscodeSource())
        val before = worker.code()
        injectControl(XHE_TRANSCODE, mapOf(XHE_TRANSCODE to listOf(worker)))
        assertSourceHook(before, worker.code(), 21, "fixture")
    }

    @Test fun aWorkerThatMovedItsSourceStopsBeforeAnyEdit() {
        val moved = mapOf(
            "overwrites the source first" to TRANSCODE_SOURCE_BODY.replace("move-object/from16 v20, v21", "const/16 v21, 0x0"),
            "loops back to the start" to ":top\n$TRANSCODE_SOURCE_BODY".replace("return-void", "goto :top"),
        )
        for ((case, body) in moved) {
            val method = fixtureMethod(VIDEO_TRANSCODE, body, registers = 24)
            val before = method.code()
            val failure = assertFailsWith<PatchException>(case) { method.injectXheTranscode() }
            assertContains(failure.message.orEmpty(), "transcoder's source moved", message = case)
            assertEquals(before, method.code(), case)
        }
        // A copy that's overwritten before the parse doesn't count as Messenger parsing its source.
        val lost = fixtureMethod(VIDEO_TRANSCODE, TRANSCODE_SOURCE_BODY.replace("invoke-static/range {v20", "const/16 v20, 0x0\ninvoke-static/range {v20"), registers = 24)
        assertFalse(lost.parsesTranscodeSource())
        assertTrue(mirroredControls(listOf(fixtureClass(MEDIA_TRANSCODER, listOf(lost)))).getValue(XHE_TRANSCODE).isEmpty())
        val before = lost.code()
        val failure = assertFailsWith<PatchException> { lost.injectXheTranscode() }
        assertContains(failure.message.orEmpty(), "isn't parsed")
        assertEquals(before, lost.code())
    }

    @Test fun everySupportedBuildHooksItsOneShareCopy() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val copies = findXheAudio(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(XHE_AUDIO), copies.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(XHE_AUDIO to copies), setOf(XHE_AUDIO))
            val method = MutableMethod(copies.single())
            val before = method.code()
            val site = method.shareCopySite()!!
            method.injectXheAudio()
            assertCopyHook(before, method.code(), site, code)

            // The transcoder worker's first String is the source it parses into a Uri, so the helper hands it over first.
            val worker = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.single { it.type == MEDIA_TRANSCODER }
                .methods.single { it.hookId() == VIDEO_TRANSCODE }
            assertEquals(activeProfile.hooks.getValue(XHE_TRANSCODE), setOf(worker.hookId()), code)
            assertTrue(worker.parsesTranscodeSource(), "$code parses its source")
            val transcode = MutableMethod(worker)
            val source = transcode.transcodeSourceRegister()
            val stock = transcode.code()
            transcode.injectXheTranscode()
            assertSourceHook(stock, transcode.code(), source, code)
        }
    }
}

/**
 * How 583's A05 starts with 24 registers: it copies its source path out of v21 and parses it into a Uri. Past v15 the
 * call takes the range form, as in the real builds.
 */
internal val TRANSCODE_SOURCE_PARSE = """
    move-object/from16 v20, v21
    invoke-static/range {v20 .. v20}, LX/Y3L;->A02(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v1
""".trimIndent()

private val TRANSCODE_SOURCE_BODY = "const-string v0, \"$VIDEO_PASSTHROUGH_MARK\"\n$TRANSCODE_SOURCE_PARSE\nreturn-void"

/** The helper takes the source register and writes its answer back to it, ahead of every stock instruction. */
private fun assertSourceHook(before: List<Instruction>, after: List<Instruction>, source: Int, label: String) {
    val helper = after[0] as RegisterRangeInstruction
    assertEquals(Opcode.INVOKE_STATIC_RANGE, helper.opcode, label)
    assertEquals(XHE_TRANSCODE_HELPER, (helper as ReferenceInstruction).reference.toString(), label)
    assertEquals(listOf(1, source), listOf(helper.registerCount, helper.startRegister), label)
    assertEquals(Opcode.MOVE_RESULT_OBJECT, after[1].opcode, label)
    assertEquals(source, (after[1] as OneRegisterInstruction).registerA, label)
    assertStockKept(before.filter { it.opcode != Opcode.NOP }, after.drop(2).filter { it.opcode != Opcode.NOP }, label)
}
