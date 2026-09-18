import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "eu.faircode.email"

class FairEmailSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Pro patch forces ActivityBilling isPro`() {
        val root = repoRoot()
        val apk = File(root, "apks/fairemail/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.2337",
            patchNames = setOf("Enable Pro"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val billing = classes.firstOrNull { it.type == "Leu/faircode/email/ActivityBilling;" }
            ?: error("ActivityBilling not found in emitted dexes")
        assertForcedBoolean(
            billing.method("isPro", listOf("Landroid/content/Context;")),
            expected = true,
            label = "ActivityBilling.isPro(Context)",
        )
    }
}
