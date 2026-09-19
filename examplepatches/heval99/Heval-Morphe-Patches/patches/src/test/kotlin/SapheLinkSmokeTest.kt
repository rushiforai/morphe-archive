import com.android.tools.smali.dexlib2.Opcode
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "my.saphelink"

class SapheLinkSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `premium router and Braze telemetry patches apply`() {
        val root = repoRoot()
        val apk = File(root, "apks/saphelink/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "6.6.0",
            patchNames = setOf("Enable Premium", "Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        // The single feature router gate every is*Enabled() check delegates to.
        assertForcedBoolean(
            klass("Lcom/saphe/FeatureToggleRouterImpl;")
                .method("userHasFeature", listOf("Lcom/saphe/communication/FeatureKey;")),
            expected = true,
            label = "FeatureToggleRouterImpl.userHasFeature(FeatureKey)",
        )

        // Braze ships two logCustomEvent overloads; the patch neuters the matched one.
        val logCustomEvents = klass("Lcom/braze/Braze;").methods.filter { it.name == "logCustomEvent" }
        assertTrue(logCustomEvents.isNotEmpty(), "no Braze.logCustomEvent methods found")
        assertTrue(
            logCustomEvents.any { it.instructions().firstOrNull()?.opcode == Opcode.RETURN_VOID },
            "no Braze.logCustomEvent overload was neutered",
        )
    }
}
