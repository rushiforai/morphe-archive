package app.hushmessenger.patches.controls

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/** 581's size check before a re-encode, with the same registers every supported build uses. */
internal val VIDEO_TRANSCODE_BODY = """
    const-string v0, "$VIDEO_PASSTHROUGH_MARK"
    iget-wide v13, v0, LX/Uzs;->A09:J
    move v2, v4
    int-to-long v2, v2
    iget-wide v11, v0, LX/Uzs;->A08:J
    mul-long/2addr v2, v11
    const-wide/16 v11, 8000
    div-long/2addr v2, v11
    const-wide/32 v11, 5000000
    add-long/2addr v2, v11
    cmp-long v11, v13, v2
    if-gez v11, :encode
    return-void
    :encode
    return-void
""".trimIndent()

private fun Method.code() = implementation!!.instructions.toList()
private fun Method.strings() = code().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

/**
 * The compare result goes through the helper with the size pair, and every stock instruction stays in place. [target] is
 * where the stock branch landed before the edit; the native branch jumps back over the new call.
 */
private fun assertPassthroughHook(before: List<Instruction>, target: Int, after: List<Instruction>, site: Int, message: String) {
    val call = after[site + 1] as FiveRegisterInstruction
    assertEquals("$SETTINGS->videoPassthrough(IJ)I", (call as ReferenceInstruction).reference.toString(), message)
    assertEquals(Opcode.INVOKE_STATIC, after[site + 1].opcode, message)
    assertEquals(listOf(11, 13, 14), listOf(call.registerC, call.registerD, call.registerE), message)
    assertEquals(Opcode.MOVE_RESULT, after[site + 2].opcode, message)
    assertEquals(11, (after[site + 2] as OneRegisterInstruction).registerA, message)
    assertEquals(before, after.filterIndexed { i, _ -> i != site + 1 && i != site + 2 }, message)
    assertEquals(Opcode.IF_GEZ, after[site + 3].opcode, message)
    assertTrue(target >= 0, message)
    assertEquals(if (target > site) target + 2 else target, after.branchTarget(site + 3), message)
}

class OriginalVideoTest {
    @AfterTest fun reset() { activeProfile = BASE_PROFILE }

    @Test fun theSizeCheckAsksTheSwitchAndKeepsEveryStockInstruction() {
        val fixture = listOf(fixtureClass(MEDIA_TRANSCODER, listOf(fixtureMethod(VIDEO_TRANSCODE, VIDEO_TRANSCODE_BODY, registers = 24))))
        val found = findControls(fixture)
        validateControls(found, setOf(ORIGINAL_VIDEO))
        val method = found.getValue(ORIGINAL_VIDEO).single() as MutableMethod
        val before = method.code()
        val target = before.branchTarget(11)
        injectControl(ORIGINAL_VIDEO, mapOf(ORIGINAL_VIDEO to listOf(method)))
        assertPassthroughHook(before, target, method.code(), 10, "fixture")
    }

    @Test fun everySupportedBuildHooksItsOneVideoSizeCheck() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val transcoder = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.single { it.type == MEDIA_TRANSCODER }
            val workers = transcoder.methods.filter { it.isVideoTranscode(it.strings()) }
            validateControls(mapOf(ORIGINAL_VIDEO to workers), setOf(ORIGINAL_VIDEO))
            val method = MutableMethod(workers.single())
            val before = method.code()
            val site = method.videoPassthroughSite()
            val target = before.branchTarget(site + 1)
            method.injectOriginalVideo()
            assertPassthroughHook(before, target, method.code(), site, code)
        }
    }
}
