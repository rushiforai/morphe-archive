import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "ru.iptvremote.android.iptv"

class IptvSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `premium trial gate and Wortise initialization are patched`() {
        val root = repoRoot()
        val apk = File(root, "apks/iptv/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "9.1.25",
            patchNames = setOf("Enable Premium", "Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        // The free app overrides the trial gate as a single no-arg boolean (R8-renamed).
        val freeApp = klass("Lru/iptvremote/android/iptv/IptvFreeApplication;")
        val trialGate = freeApp.methods.firstOrNull {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
        } ?: error("no no-arg boolean method on IptvFreeApplication")
        assertForcedBoolean(trialGate, expected = true, label = "IptvFreeApplication.${trialGate.name}()")

        // Wortise is the ad mediation SDK; both initialize overloads are killed.
        val wortise = klass("Lcom/wortise/ads/WortiseSdk;")
        assertReturnsEarlyVoid(
            wortise.method("initialize", listOf("Landroid/content/Context;", "Ljava/lang/String;")),
            label = "WortiseSdk.initialize(Context, String)",
        )
        assertReturnsEarlyVoid(
            wortise.method(
                "initialize",
                listOf("Landroid/content/Context;", "Ljava/lang/String;", "Lmi0;"),
            ),
            label = "WortiseSdk.initialize(Context, String, Listener)",
        )
    }
}
