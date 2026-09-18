import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "org.swiftapps.swiftbackup"

class SwiftBackupSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium patch forces the premium state getter`() {
        val root = repoRoot()
        val apk = File(root, "apks/swiftbackup/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "5.1.0",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val state = classes.firstOrNull { it.type == "Lorg/swiftapps/swiftbackup/common/V;" }
            ?: error("premium state holder (V) not found in emitted dexes")
        assertForcedBoolean(state.method("getA"), expected = true, label = "V.getA()")
    }
}
