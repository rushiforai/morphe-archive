import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.camerasideas.trimmer"

class YouCutSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Pro forces the subscribed check`() {
        val root = repoRoot()
        val apk = File(root, "apks/youcut/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.716.1222",
            patchNames = setOf("Enable Pro"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val billing = classes.firstOrNull { it.type == "Lcom/camerasideas/instashot/store/billing/c;" }
            ?: error("billing helper not found in emitted dexes")

        assertForcedBoolean(
            billing.method("d", listOf("Landroid/content/Context;")),
            expected = true,
            label = "billing/c.d(Context) (is subscribed)",
        )
    }
}
