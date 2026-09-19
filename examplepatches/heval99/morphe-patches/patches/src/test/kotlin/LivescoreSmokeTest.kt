import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.livescore"

class LivescoreSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads forces the AdsRemovalSettings gate`() {
        val root = repoRoot()
        val apk = File(root, "apks/livescore/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "10.1",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val settings = classes.firstOrNull { it.type == "Lcom/livescore/ads/config/AdsRemovalSettings;" }
            ?: error("AdsRemovalSettings not found in emitted dexes")

        assertForcedBoolean(
            settings.method("areAdsDisabled"),
            expected = true,
            label = "AdsRemovalSettings.areAdsDisabled()",
        )
    }
}
