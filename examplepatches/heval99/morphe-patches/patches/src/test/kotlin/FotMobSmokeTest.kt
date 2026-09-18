import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.mobilefootie.wc2010"

class FotMobSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable FotMob+ forces the subscription state and disables the staff bypass`() {
        val root = repoRoot()
        val apk = File(root, "apks/fotmob/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "236.17398.20260827",
            patchNames = setOf("Enable FotMob+"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val manager = classes.firstOrNull { it.type == "Lkra;" }
            ?: error("subscription manager (kra) not found in emitted dexes")
        assertForcedBoolean(
            manager.method("o"),
            expected = true, label = "SubscriptionManager.hasActiveSubscription()",
        )
        assertForcedBoolean(
            manager.method("m"),
            expected = false, label = "SubscriptionManager.isStaffAccount()",
        )
    }
}
