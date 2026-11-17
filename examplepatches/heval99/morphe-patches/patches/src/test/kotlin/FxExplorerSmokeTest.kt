import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "nextapp.fx"
private const val VERSION = "9.1.0.8"
private const val PLUS_KEY = "plus_json"

class FxExplorerSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium forces the Plus licence check true`() {
        val root = repoRoot()
        val apk = File(root, "apks/fxexplorer/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val readers = classes.flatMap { it.methods }.filter { method ->
            method.returnType == "Z" &&
                method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                method.implementation?.instructions?.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string == PLUS_KEY
                } == true
        }
        check(readers.size == 1) { "licence readers: ${readers.map { "${it.definingClass}->${it.name}" }}" }
        val method = readers.single()
        assertForcedBoolean(method, expected = true, label = "${method.definingClass}->${method.name}")
    }
}
