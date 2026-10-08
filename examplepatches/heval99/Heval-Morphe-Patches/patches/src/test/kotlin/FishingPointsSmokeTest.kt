import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile

private const val PKG = "com.gregacucnik.fishingpoints"
private const val APP_CLASS = "Lcom/gregacucnik/fishingpoints/AppClass;"

class FishingPointsSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium forces the AppClass premium aggregates true`() {
        val root = repoRoot()
        val apk = File(root, "apks/fishingpoints/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        // Identify the aggregates in the UNPATCHED app (patched bodies no longer show the
        // OR shape), then assert they are forced in the patched output.
        val original = ZipFile(apk).use { zip ->
            zip.entries().asSequence()
                .filter { Regex("classes\\d*\\.dex").matches(it.name) }
                .flatMap { entry ->
                    val bytes = zip.getInputStream(entry).use { it.readBytes() }
                    DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.asSequence()
                }
                .single { it.type == APP_CLASS }
        }
        val aggregates = original.methods.filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.instructions().count { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference
                    (insn.opcode == Opcode.IGET_BOOLEAN && (ref as? FieldReference)?.definingClass == APP_CLASS) ||
                        (insn.opcode == Opcode.INVOKE_VIRTUAL && (ref as? MethodReference)?.let {
                            it.definingClass == APP_CLASS && it.returnType == "Z" && it.parameterTypes.isEmpty()
                        } == true)
                } >= 3
        }.map { it.name }
        // ad gate (fields OR getters), main premium gate (four tiers), paid-tier gate (three).
        assertTrue(aggregates.size >= 3, "expected >= 3 premium aggregates, found $aggregates")

        val patched = applyPatches(
            apk = apk, workDir = workDir.resolve("patched"), pkg = PKG, version = "4.7.3",
            patchNames = setOf("Enable Premium"), allPatches = loadAllPatches(newestPatchBundle(root)),
        ).single { it.type == APP_CLASS }
        for (name in aggregates) {
            assertForcedBoolean(patched.method(name, emptyList()), expected = true, label = "AppClass.$name()")
        }
    }
}
