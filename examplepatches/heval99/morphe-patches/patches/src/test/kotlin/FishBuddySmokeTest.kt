import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "no.fishbuddy_playground.app"

class FishBuddySmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium forces User hasPremium`() {
        val root = repoRoot()
        val apk = File(root, "apks/fishbuddy/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "11.0.101",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val user = classes.firstOrNull { it.type == "Lno/fishbuddy/app/data/models/User;" }
            ?: error("User model not found in emitted dexes")

        assertForcedBoolean(
            user.method("hasPremium"),
            expected = true,
            label = "User.hasPremium()",
        )
    }
}
