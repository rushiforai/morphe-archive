import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "de.motain.iliga"
private const val GMA = "Lcom/google/android/gms/ads/"

class OneFootballSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads patch neuters GMA init, loads and the app-open preloader`() {
        val root = repoRoot()
        val apk = File(root, "apks/onefootball/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "15.142.0",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        // SDK initialization is a no-op.
        val initialize = klass(GMA + "MobileAds;").methods.single {
            it.name == "initialize" && it.parameterTypes.size == 1
        }
        assertReturnsEarlyVoid(initialize, label = "MobileAds.initialize(Context)")

        // Every format's load entry point is a no-op.
        for (type in listOf(
            GMA + "BaseAdView;",
            GMA + "AdLoader;",
            GMA + "interstitial/InterstitialAd;",
            GMA + "rewarded/RewardedAd;",
            GMA + "appopen/AppOpenAd;",
        )) {
            val loads = klass(type).methods.filter { (it.name == "load" || it.name == "loadAd") && it.returnType == "V" }
            assertTrue(loads.isNotEmpty(), "$type has no load entry point")
            loads.forEach { assertReturnsEarlyVoid(it, label = "$type.${it.name}") }
        }

        // App-open preloading reports failure.
        val preloader = klass(GMA + "appopen/AppOpenAdPreloader;")
        val start = preloader.methods.first { it.name == "start" && it.returnType == "Z" }
        assertForcedBoolean(start, expected = false, label = "AppOpenAdPreloader.start(...)")
    }
}
