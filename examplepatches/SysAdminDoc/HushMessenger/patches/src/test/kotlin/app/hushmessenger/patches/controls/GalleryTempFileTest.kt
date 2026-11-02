package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** The synthetic label for Messenger's copy of an item it's handed, named after the first build it was found in. */
internal const val INBOUND_COPY = "LX/0PD;->A09()V"
/** The synthetic label for Messenger's check of a temp folder. */
internal const val TEMP_FOLDER_CHECK = "LX/0PA;->A01()Ljava/io/File;"
private const val CREATE = "Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;"
private const val OWN_CREATE = "Lapp/hushmessenger/extension/Settings;->inboundTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;"
private const val OPEN = "Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
private val BODY = """
    const-string v3, "inbound"
    const-string v2, ".jpg"
    const/4 v0, 0x0
    invoke-static {v3, v2, v0}, $CREATE
    move-result-object v3
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct {v2, v3}, $OPEN
    return-void
""".trimIndent()

private const val OWN_CHECK = "Lapp/hushmessenger/extension/Settings;->inboundFolderRefused(Ljava/io/File;)Z"
private const val EXISTS = "Ljava/io/File;->exists()Z"
private val CHECK_BODY = """
    iget-object v5, p0, LX/0PA;->A01:Ljava/io/File;
    invoke-virtual {v5}, $EXISTS
    move-result v0
    if-eqz v0, :missing
    const-string v2, "No write permissions for temporary directory "
    const-string v2, " is not a directory."
    :missing
    return-object v5
""".trimIndent()

private fun checkMethod(id: String = TEMP_FOLDER_CHECK, body: String = CHECK_BODY, flags: Int = AccessFlags.PUBLIC.value, registers: Int = 8) =
    fixtureMethod(id, body, registers, flags)

private fun checkClass(method: MutableMethod = checkMethod()): MutableClass = fixtureClass(method.definingClass, listOf(method))

private fun copyMethod(id: String = INBOUND_COPY, body: String = BODY, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(id, body, flags = flags)

private fun copyClass(method: MutableMethod = copyMethod()): MutableClass = fixtureClass(method.definingClass, listOf(method))

internal fun galleryTempFileFixture(): List<MutableClass> = listOf(checkClass(), copyClass())

private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()
private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

class GalleryTempFileTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(GALLERY_TEMP_FILE).map { it.hookId() }

    @Test fun theCopyIsFoundByItsShape() {
        assertEquals(listOf(TEMP_FOLDER_CHECK, INBOUND_COPY), found(galleryTempFileFixture()))
        validateControls(mirroredControls(galleryTempFileFixture()), setOf(GALLERY_TEMP_FILE))
    }

    @Test fun lookalikesAreNotTheCopy() {
        fun changed(from: String, to: String) = BODY.replace(from, to).also { assertTrue(it != BODY, from) }
        val cases = mapOf(
            "another file name" to copyMethod(body = changed("inbound", "outbound")),
            "two temp files" to copyMethod(body = changed("return-void", "invoke-static {v3, v2, v0}, $CREATE\nreturn-void")),
            "a static method" to copyMethod(flags = STATIC),
            "a method with a parameter" to copyMethod(id = "LX/0PD;->A09(I)V"),
            "a method that returns the file" to copyMethod(id = "LX/0PD;->A09()Ljava/io/File;"),
            "nothing written to the file" to copyMethod(body = changed("FileOutputStream", "FileInputStream")),
            "a range call" to copyMethod(body = changed("invoke-static {v3, v2, v0}", "invoke-static/range {v0 .. v2}")),
        )
        for ((case, method) in cases) {
            assertEquals(emptyList(), found(listOf(checkClass(), copyClass(method))), case)
            assertFailsWith<PatchException>(case) { method.validateGalleryTempFile() }
        }
    }

    @Test fun twoCopiesAreNeitherOfThem() {
        assertEquals(emptyList(), found(listOf(checkClass(), copyClass(), copyClass(copyMethod(id = "LX/0PE;->A09()V")))))
    }

    @Test fun lookalikesAreNotTheCheck() {
        fun changed(from: String, to: String) = CHECK_BODY.replace(from, to).also { assertTrue(it != CHECK_BODY, from) }
        val cases = mapOf(
            "another write message" to checkMethod(body = changed("No write permissions", "No read permissions")),
            "no folder message" to checkMethod(body = changed(" is not a directory.", " is not a file.")),
            "a static method" to checkMethod(flags = STATIC),
            "a method with a parameter" to checkMethod(id = "LX/0PA;->A01(I)Ljava/io/File;"),
            "a method that returns something else" to checkMethod(id = "LX/0PA;->A01()Ljava/lang/Object;"),
            "another class's field" to checkMethod(body = changed("LX/0PA;->A01:", "LX/0PB;->A01:")),
            "a field of another type" to checkMethod(body = changed("A01:Ljava/io/File;", "A01:Ljava/lang/Object;")),
            "a static field" to checkMethod(body = changed("iget-object v5, p0, LX/0PA;->A01:", "sget-object v5, LX/0PA;->A01:")),
            "another first question" to checkMethod(body = changed(EXISTS, "Ljava/io/File;->isFile()Z")),
            "the question asked of another file" to checkMethod(body = changed("invoke-virtual {v5}", "invoke-virtual {v1}")),
            "the answer not read" to checkMethod(body = changed("move-result v0", "const/4 v0, 0x0")),
            "the answer written over the folder" to checkMethod(body = changed("move-result v0", "move-result v5")),
            "a folder too high for the call" to checkMethod(registers = 20, body = changed("v5", "v16")),
        )
        for ((case, method) in cases) {
            assertEquals(emptyList(), found(listOf(checkClass(method), copyClass())), case)
            assertFailsWith<PatchException>(case) { method.validateGalleryTempFile() }
        }
    }

    @Test fun twoChecksAreNeitherOfThem() {
        assertEquals(emptyList(), found(listOf(checkClass(), checkClass(checkMethod(id = "LX/0PB;->A01()Ljava/io/File;", body = CHECK_BODY.replace("LX/0PA;", "LX/0PB;"))), copyClass())))
    }

    @Test fun aCopyWithNoCheckIsNotEnough() {
        assertEquals(emptyList(), found(listOf(copyClass())))
        assertEquals(emptyList(), found(listOf(checkClass())))
    }

    @Test fun theCheckAsksFirstAndHandsARefusedFolderBack() {
        val method = checkMethod()
        val before = method.code().map { it.opcode to it.reference() }
        method.injectGalleryTempFile()
        val after = method.code()
        val ask = after[1] as FiveRegisterInstruction
        assertEquals(Opcode.INVOKE_STATIC, ask.opcode)
        assertEquals(OWN_CHECK, ask.reference())
        assertEquals(listOf(1, 5), listOf(ask.registerCount, ask.registerC))
        assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_OBJECT), after.subList(2, 5).map { it.opcode })
        assertEquals(0, (after[2] as OneRegisterInstruction).registerA)
        assertEquals(0, (after[3] as OneRegisterInstruction).registerA)
        assertEquals(5, (after[4] as OneRegisterInstruction).registerA)
        val stock = (after[3] as OffsetInstruction).codeOffset + after.take(3).sumOf { it.codeUnits }
        assertEquals(EXISTS, after[5].reference())
        assertEquals(after.take(5).sumOf { it.codeUnits }, stock)
        assertEquals(before, (after.take(1) + after.drop(5)).map { it.opcode to it.reference() })
    }

    @Test fun aMovedCheckIsRefusedBeforeAnyEdit() {
        val method = checkMethod(body = CHECK_BODY.replace(EXISTS, "Ljava/io/File;->isFile()Z"))
        val before = method.code().map { it.opcode to it.reference() }
        assertFailsWith<PatchException> { method.injectGalleryTempFile() }
        assertEquals(before, method.code().map { it.opcode to it.reference() })
    }

    @Test fun theSwapKeepsTheRegistersAndAddsNothing() {
        val method = copyMethod()
        val before = method.code()
        method.injectGalleryTempFile()
        val after = method.code()
        assertEquals(before.size, after.size)
        val at = after.indexOfFirst { it.reference() == OWN_CREATE }
        val call = after[at] as FiveRegisterInstruction
        assertEquals(Opcode.INVOKE_STATIC, call.opcode)
        assertEquals(listOf(3, 2, 0), listOf(call.registerC, call.registerD, call.registerE))
        assertEquals(3, call.registerCount)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, after[at + 1].opcode)
        assertEquals(before.filter { it.reference() != CREATE }.map { it.opcode to it.reference() }, after.filter { it.reference() != OWN_CREATE }.map { it.opcode to it.reference() })
    }

    @Test fun aMovedCopyIsRefusedBeforeAnyEdit() {
        val method = copyMethod(body = BODY.replace("inbound", "outbound"))
        val before = method.code().map { it.opcode to it.reference() }
        assertFailsWith<PatchException> { method.injectGalleryTempFile() }
        assertEquals(before, method.code().map { it.opcode to it.reference() })
    }

    @Test fun everySupportedBuildHasOneCopyAndOneCheck() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val sites = findGalleryTempFile(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(GALLERY_TEMP_FILE), sites.map { it.hookId() }.toSet(), code)
            for (site in sites) MutableMethod(site).injectGalleryTempFile()
        }
    }
}
