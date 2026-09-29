import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.textra"

class TextraSmokeTest {

    @TempDir
    lateinit var workDir: File

    // Mirrors the patch: the license preference class is the only one declaring all four
    // methods g()Integer, i(Integer)V, k()Z and l()Z, so no obfuscated names are needed.
    private fun isLicenseClass(cls: ClassDef): Boolean {
        val methods = cls.methods.filter { it.implementation != null }
        fun declares(name: String, returnType: String, parameters: List<String> = emptyList()) =
            methods.any { method ->
                method.name == name &&
                    method.returnType == returnType &&
                    method.parameterTypes.map(CharSequence::toString) == parameters
            }
        return declares("g", "Ljava/lang/Integer;") &&
            declares("i", "V", listOf("Ljava/lang/Integer;")) &&
            declares("k", "Z") &&
            declares("l", "Z")
    }

    private fun ClassDef.booleanMethod(name: String): Method =
        methods.first { it.name == name && it.returnType == "Z" && it.parameterTypes.isEmpty() }

    @Test
    fun `Enable Pro forces the license preference to the purchased state`() {
        val root = repoRoot()
        val apk = File(root, "apks/textra/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "4.85",
            patchNames = setOf("Enable Pro"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val license = classes.singleOrNull { isLicenseClass(it) }
            ?: error("license preference class not found in emitted dexes")

        assertForcedBoolean(
            license.booleanMethod("l"),
            expected = true,
            label = "license.l() (is purchased)",
        )
        assertForcedBoolean(
            license.booleanMethod("k"),
            expected = false,
            label = "license.k() (state 0)",
        )
    }
}
