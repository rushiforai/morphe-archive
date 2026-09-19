import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "eu.livesport.FlashScore_com"
private const val SDK = "Lcom/google/android/libraries/ads/mobile/sdk/"

class FlashscoreSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads patch neuters the Mobile Ads SDK init and load entry points`() {
        val root = repoRoot()
        val apk = File(root, "apks/flashscore/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "26.9.2",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        // SDK initialization is a no-op.
        val mobileAds = klass(SDK + "MobileAds;")
        val initialize = mobileAds.methods.first {
            it.name == "initialize" && it.parameterTypes.size == 2
        }
        assertReturnsEarlyVoid(initialize, label = "MobileAds.initialize(Context, InitializationConfig)")

        // Preloading reports failure and never hands out an ad.
        val preloader = klass(SDK + "banner/BannerAdPreloader;")
        val start = preloader.methods.first {
            it.name == "start" && it.parameterTypes.size == 2 && it.returnType == "Z"
        }
        assertForcedBoolean(start, expected = false, label = "BannerAdPreloader.start(String, PreloadConfiguration)")

        // Direct interstitial loads are a no-op.
        val interstitial = klass(SDK + "interstitial/InterstitialAd;")
        val load = interstitial.methods.first {
            it.name == "load" && it.returnType == "V"
        }
        assertReturnsEarlyVoid(load, label = "InterstitialAd.load(request, callback)")
    }
}
