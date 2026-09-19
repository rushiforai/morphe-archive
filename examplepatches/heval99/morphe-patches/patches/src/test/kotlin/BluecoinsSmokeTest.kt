import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.rammigsoftware.bluecoins"

class BluecoinsSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium patch returns a constant true premium flow`() {
        val root = repoRoot()
        val apk = File(root, "apks/bluecoins/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "13.1.79",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val manager = classes.firstOrNull {
            it.type == "Lcom/rammigsoftware/bluecoins/sourcecommon/billing/BillingDomainManager;"
        } ?: error("BillingDomainManager not found in emitted dexes")

        assertReturnsTrueFlow(
            manager.method("isPremiumVersionFlow"),
            label = "BillingDomainManager.isPremiumVersionFlow()",
        )
    }
}
