import com.android.tools.smali.dexlib2.iface.ClassDef
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.flyersoft.moonreader"
private const val MR_AD = "Lcom/flyersoft/components/MrAd;"

class MoonReaderSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads forces the central ad gate true`() {
        val root = repoRoot()
        val apk = File(root, "apks/moonreader/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes: List<ClassDef> = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "10.7",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // The gate lives on the app's ad manager, the only app class that
        // touches the ad SDK.
        val mrAd = classes.firstOrNull { it.type == MR_AD }
            ?: error("$MR_AD not found in emitted dexes")
        val gate = mrAd.methods.firstOrNull { it.name == "disableAds" && it.returnType == "Z" }
            ?: error("MrAd.disableAds()Z not found")

        assertForcedBoolean(gate, expected = true, label = "MrAd.disableAds()")
    }
}
