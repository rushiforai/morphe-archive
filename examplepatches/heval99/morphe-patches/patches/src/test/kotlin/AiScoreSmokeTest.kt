import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile

private const val PKG = "com.onesports.score"
private const val USER_PREFERENCE = "Lcom/onesports/score/base/preference/UserPreference;"

class AiScoreSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.sameClassNoArgCalls(returnType: String) = instructions()
        .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter { it.definingClass == USER_PREFERENCE && it.parameterTypes.isEmpty() && it.returnType == returnType }

    @Test
    fun `Enable Premium forces the cached VIP gate and level`() {
        val root = repoRoot()
        val apk = File(root, "apks/aiscore/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        // Locate the gate in the unpatched dex the same way the patch does.
        val original = ZipFile(apk).use { zip ->
            zip.entries().asSequence()
                .filter { Regex("classes\\d*\\.dex").matches(it.name) }
                .flatMap { entry ->
                    val bytes = zip.getInputStream(entry).use { it.readBytes() }
                    DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.asSequence()
                }
                .single { it.type == USER_PREFERENCE }
        }
        val gate = original.methods.single {
            it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                it.sameClassNoArgCalls("Z").isNotEmpty() && it.sameClassNoArgCalls("I").isNotEmpty()
        }
        val levelName = gate.sameClassNoArgCalls("I").single().name

        val patched = applyPatches(
            apk = apk, workDir = workDir, pkg = PKG, version = "4.3.1",
            patchNames = setOf("Enable Premium"), allPatches = loadAllPatches(newestPatchBundle(root)),
        ).single { it.type == USER_PREFERENCE }

        assertForcedBoolean(patched.method(gate.name, emptyList()), expected = true, label = "UserPreference.${gate.name}() (VIP gate)")
        assertReturnsInt(patched.method(levelName, emptyList()), expected = 1, label = "UserPreference.$levelName() (VIP level)")
    }
}
