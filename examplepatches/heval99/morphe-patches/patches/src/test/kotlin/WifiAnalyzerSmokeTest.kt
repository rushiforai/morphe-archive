import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.farproc.wifi.analyzer"
private const val HIDE_AD_KEY = "next_show_ad_time_millisec"
private const val CONTEXT = "Landroid/content/Context;"

class WifiAnalyzerSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.referencesString(value: String): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference
        return ref is StringReference && ref.string == value
    }

    @Test
    fun `Disable ads forces the show-ad gate false`() {
        val root = repoRoot()
        val apk = File(root, "apks/wifianalyzer/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "3.10.5-L",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // The gate lives in the class owning the hide-until preference key.
        val settings = classes.firstOrNull { cls: ClassDef ->
            cls.methods.any { method ->
                method.implementation?.instructions?.any { it.referencesString(HIDE_AD_KEY) } == true
            }
        } ?: error("ad gate class (key '$HIDE_AD_KEY') not found in emitted dexes")

        // The gate is the only static single-Context boolean with a body there.
        val gates = settings.methods.filter { method ->
            method.returnType == "Z" && method.implementation != null &&
                method.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT)
        }
        check(gates.size == 1) { "expected exactly one ad gate, found ${gates.size}" }

        assertForcedBoolean(gates.single(), expected = false, label = "${settings.type} ad gate")
    }
}
