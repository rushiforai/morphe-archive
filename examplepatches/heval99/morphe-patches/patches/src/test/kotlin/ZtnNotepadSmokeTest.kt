import com.android.tools.smali.dexlib2.iface.ClassDef
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.ztnstudio.notepad"

private val AD_LOADS = mapOf(
    "Lcom/applovin/mediation/ads/MaxAdView;" to listOf("loadAd", "startAutoRefresh"),
    "Lcom/applovin/mediation/ads/MaxInterstitialAd;" to listOf("loadAd", "showAd"),
    "Lcom/applovin/mediation/ads/MaxRewardedAd;" to listOf("loadAd", "showAd"),
    "Lcom/applovin/mediation/ads/MaxAppOpenAd;" to listOf("loadAd", "showAd"),
    "Lcom/applovin/mediation/nativeAds/MaxNativeAdLoader;" to listOf("loadAd"),
    "Lcom/google/android/gms/ads/BaseAdView;" to listOf("loadAd"),
    "Lcom/google/android/gms/ads/admanager/AdManagerAdView;" to listOf("loadAd"),
    "Lcom/google/android/gms/ads/AdLoader;" to listOf("loadAd", "loadAds"),
    "Lcom/google/android/gms/ads/interstitial/InterstitialAd;" to listOf("load"),
    "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAd;" to listOf("load"),
    "Lcom/google/android/gms/ads/rewarded/RewardedAd;" to listOf("load"),
    "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAd;" to listOf("load"),
    "Lcom/google/android/gms/ads/appopen/AppOpenAd;" to listOf("load"),
    "Lcom/facebook/ads/InterstitialAd;" to listOf("loadAd"),
    "Lcom/facebook/ads/AdView;" to listOf("loadAd"),
    "Lcom/facebook/ads/RewardedVideoAd;" to listOf("loadAd"),
)

class ZtnNotepadSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `premium getters are forced and every ad SDK load is neutered`() {
        val root = repoRoot()
        val apk = File(root, "apks/ztnnotepad/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk, workDir = workDir, pkg = PKG, version = "5.4.4.19080",
            patchNames = setOf("Enable Premium", "Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        fun klass(type: String) = classes.firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

        val premiumData = klass("Lcom/ztnstudio/notepad/buy_ad_free/billing/model/UserPremiumData;")
        val premiumGetter = premiumData.methods.single {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
        }
        assertForcedBoolean(premiumGetter, expected = true, label = "UserPremiumData.${premiumGetter.name}()")

        // The forced body no longer holds the pref key, so find the getter by shape only.
        val adFree = klass("Lcom/ztnstudio/notepad/buy_ad_free/BuyAdFreePreferenceHelper;")
        val adFreeGetter = adFree.methods.single {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
        }
        assertForcedBoolean(adFreeGetter, expected = true, label = "BuyAdFreePreferenceHelper.${adFreeGetter.name}()")

        // 5.4.4 mediates through AppLovin MAX with Meta and GMA underneath: every load is neutered.
        val diagnostics = "emitted classes=${classes.size}"
        for ((owner, names) in AD_LOADS) {
            val cls: ClassDef = klass(owner)
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
        assertMaxAdViewHidden(classes)
    }
}
