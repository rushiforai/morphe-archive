import com.android.tools.smali.dexlib2.iface.ClassDef
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "bbc.mobile.news.ww"

private val GMA_HOOKS = mapOf(
    "Lcom/google/android/gms/ads/BaseAdView;" to setOf("loadAd"),
    "Lcom/google/android/gms/ads/admanager/AdManagerAdView;" to setOf("loadAd"),
    "Lcom/google/android/gms/ads/AdLoader;" to setOf("loadAd", "loadAds"),
    "Lcom/google/android/gms/ads/interstitial/InterstitialAd;" to setOf("load"),
    "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAd;" to setOf("load"),
    "Lcom/google/android/gms/ads/rewarded/RewardedAd;" to setOf("load"),
    "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAd;" to setOf("load"),
    "Lcom/google/android/gms/ads/appopen/AppOpenAd;" to setOf("load"),
)

class BbcNewsSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun List<ClassDef>.type(type: String): ClassDef =
        firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

    @Test
    fun `Disable ads neuters every Google Mobile Ads load`() {
        val root = repoRoot()
        val apk = File(root, "apks/bbcnews/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "2026.9.1",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"

        for ((owner, names) in GMA_HOOKS) {
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
    }
}
