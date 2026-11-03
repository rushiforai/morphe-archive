import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "ie.rte.news"
private const val COMPOSER = "Landroidx/compose/runtime/q;"
private const val AD_BLOCK_PARAM = "adContainer"
private const val AD_LOAD_LOG = "Ad request targeting: "

class RteNewsSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.label() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    private fun Method.strings() = implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }.orEmpty()

    @Test
    fun `Disable ads removes the article ad block and its load request`() {
        val root = repoRoot()
        val apk = File(root, "apks/rtenews/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "10.0.2",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"
        val methods = classes.flatMap { it.methods }

        // The ad block composable ("adContainer" parameter) returns before emitting anything.
        val blocks = methods.filter {
            it.returnType == "V" && AD_BLOCK_PARAM in it.strings() &&
                COMPOSER in it.parameterTypes.map(CharSequence::toString)
        }
        assertEquals(1, blocks.size, "ad block composables: ${blocks.map { it.label() }}")
        assertReturnsEarlyVoid(blocks.single(), "article ad block ${blocks.single().label()}", diagnostics)

        // The loader no longer calls AdView.loadAd: stock had the call right before building the
        // container, the patched method drops exactly it and keeps everything else.
        val loaders = methods.filter { AD_LOAD_LOG in it.strings() }
        assertEquals(1, loaders.size, "ad loaders: ${loaders.map { it.label() }}")
        val loader = loaders.single()
        val stockLoader = patchedApkClasses(apk).flatMap { it.methods }.single { AD_LOAD_LOG in it.strings() }
        val stock = stockLoader.implementation!!.instructions.toList()
        val patched = loader.implementation!!.instructions.toList()

        val containerIndex = stock.indexOfFirst { instruction ->
            instruction.opcode == Opcode.NEW_INSTANCE &&
                ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == stockLoader.returnType
        }
        assertTrue(containerIndex > 0, "stock loader does not build its container\n$diagnostics")
        val removed = stock[containerIndex - 1]
        val removedRef = (removed as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            removed.opcode == Opcode.INVOKE_VIRTUAL && removedRef?.returnType == "V" &&
                removedRef.parameterTypes.size == 1,
            "stock load is not a one-argument invoke-virtual: ${removed.opcode} $removedRef",
        )

        assertEquals(stock.size - 1, patched.size, "loader instruction count\n$diagnostics")
        assertEquals(
            stock.map { it.opcode }.filterIndexed { index, _ -> index != containerIndex - 1 },
            patched.map { it.opcode },
            "loader changed beyond the removed loadAd call",
        )
    }
}
