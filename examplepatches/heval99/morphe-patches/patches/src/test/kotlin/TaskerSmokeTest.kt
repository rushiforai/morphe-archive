import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "net.dinglisch.android.taskerm"

class TaskerSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Full Version patch forces the license status to Licensed`() {
        val root = repoRoot()
        val apk = File(root, "apks/tasker/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "6.6.18",
            patchNames = setOf("Enable Full Version"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val statusClass = classes.firstOrNull { it.type == "Lrf/a0;" }
            ?: error("LicenseStatus mapper (rf.a0) not found in emitted dexes")
        assertReturnsLicensedEnum(statusClass.method("c"), label = "rf.a0.c()")

        val licenseManager = classes.firstOrNull { it.type == "Lrf/w\$a;" }
            ?: error("license manager (rf.w\$a) not found in emitted dexes")
        assertForcedBoolean(
            licenseManager.method("l", listOf("Landroid/content/Context;")),
            expected = true, label = "rf.w\$a.l(Context)",
        )
        assertForcedBoolean(
            licenseManager.method("m", listOf("Landroid/content/Context;", "J")),
            expected = true, label = "rf.w\$a.m(Context, long)",
        )

        val licenseFacade = classes.firstOrNull { it.type == "Lrf/w;" }
            ?: error("license facade (rf.w) not found in emitted dexes")
        assertForcedBoolean(
            licenseFacade.method("G", listOf("Landroid/content/Context;")),
            expected = true, label = "rf.w.G(Context)",
        )
    }
}
