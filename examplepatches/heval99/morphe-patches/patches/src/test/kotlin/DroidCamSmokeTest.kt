import com.android.tools.smali.dexlib2.iface.ClassDef
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.dev47apps.obsdroidcam"

class DroidCamSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun List<ClassDef>.type(type: String): ClassDef =
        firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

    @Test
    fun `Disable ads neuters the MAX and GMA ad stack`() {
        val root = repoRoot()
        val apk = File(root, "apks/droidcam/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "8.2",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"

        // The SDK initialisers are inert.
        for ((owner, names) in mapOf(
            "Lcom/applovin/sdk/AppLovinSdk;" to listOf("initialize"),
            "Lcom/inmobi/sdk/InMobiSdk;" to listOf("init"),
        )) {
            val cls = classes.type(owner)
            for (name in names) {
                val methods = cls.methods.filter {
                    it.name == name && it.returnType == "V" && it.implementation != null
                }
                assertTrue(methods.isNotEmpty(), "$owner has no concrete void $name")
                methods.forEach {
                    assertReturnsEarlyVoid(it, "$owner->$name(${it.parameterTypes.joinToString()})", diagnostics)
                }
            }
        }

        // Every GMA/MAX load and show returns at once, and the MobileAds statics are neutralised.
        assertAllReturnEarly(classes, "Lcom/applovin/mediation/ads/MaxAdView;", "loadAd", "startAutoRefresh")
        assertAllReturnEarly(classes, "Lcom/applovin/mediation/ads/MaxInterstitialAd;", "loadAd", "showAd")
        assertAllReturnEarly(classes, "Lcom/applovin/mediation/ads/MaxRewardedAd;", "loadAd", "showAd")
        assertAllReturnEarly(classes, "Lcom/google/android/gms/ads/interstitial/InterstitialAd;", "load")
        assertMobileAdsStaticsNeutralised(classes.type("Lcom/google/android/gms/ads/MobileAds;"))
        assertMaxAdViewHidden(classes)
    }
}
