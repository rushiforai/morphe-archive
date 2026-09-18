import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.monefy.app.lite"

class MonefySmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium patch forces the pro checks and clears the expired state`() {
        val root = repoRoot()
        val apk = File(root, "apks/monefy/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.22.11",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        assertForcedBoolean(klass("Lgh;").method("o"), expected = true, label = "ClearCashApplication.o()")
        assertForcedBoolean(
            klass("Lcom/monefy/helpers/GeneralSettingsProvider;").method("F"),
            expected = true, label = "GeneralSettingsProvider.F()",
        )
        assertForcedBoolean(klass("Lzt;").method("p"), expected = false, label = "zt.p()")
    }
}
