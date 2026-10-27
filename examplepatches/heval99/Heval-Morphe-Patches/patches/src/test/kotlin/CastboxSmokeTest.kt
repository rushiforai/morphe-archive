import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "fm.castbox.audiobook.radio.podcast"

class CastboxSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads neuters SDK inits, banner and full-screen loads`() {
        val root = repoRoot()
        val apk = File(root, "apks/castbox/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "11.27.0-261014339",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val mobileAds = classes.firstOrNull { it.type == "Lcom/google/android/gms/ads/MobileAds;" }
            ?: error("MobileAds not found in emitted dexes")
        assertReturnsEarlyVoid(
            mobileAds.method("initialize", listOf("Landroid/content/Context;")),
            label = "MobileAds.initialize(Context)",
        )
        assertReturnsEarlyVoid(
            mobileAds.method(
                "initialize",
                listOf(
                    "Landroid/content/Context;",
                    "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;",
                ),
            ),
            label = "MobileAds.initialize(Context, Listener)",
        )
        // Rule 9: no MobileAds static can throw for lack of init.
        assertMobileAdsStaticsNeutralised(mobileAds)

        // The terminal interstitial overload is showAd(String, String, Activity);
        // patching only the first match left real ads showing on other apps.
        val maxInterstitial =
            classes.firstOrNull { it.type == "Lcom/applovin/mediation/ads/MaxInterstitialAd;" }
                ?: error("MaxInterstitialAd not found in emitted dexes")
        assertReturnsEarlyVoid(
            maxInterstitial.method(
                "showAd",
                listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/app/Activity;"),
            ),
            label = "MaxInterstitialAd.showAd(String, String, Activity)",
        )

        // MAX never starts: the app calls AppLovinSdk.initialize itself.
        assertAllReturnEarly(classes, "Lcom/applovin/sdk/AppLovinSdk;", "initialize")

        // Banners. GMA's loadAd lives on BaseAdView and AdManagerAdView (AdView declares none;
        // hooking "AdView" matched nothing). The app's own banner/MREC slots are MaxAdView
        // loadAd + startAutoRefresh, and the unfilled view must stay GONE.
        assertAllReturnEarly(classes, "Lcom/google/android/gms/ads/BaseAdView;", "loadAd")
        assertAllReturnEarly(classes, "Lcom/google/android/gms/ads/admanager/AdManagerAdView;", "loadAd")
        assertAllReturnEarly(classes, "Lcom/applovin/mediation/ads/MaxAdView;", "loadAd", "startAutoRefresh")
        assertMaxAdViewHidden(classes)

        // GMA full-screen statics (reached through the bundled TradPlus/BidMachine adapters).
        assertAllReturnEarly(classes, "Lcom/google/android/gms/ads/interstitial/InterstitialAd;", "load")
        assertAllReturnEarly(classes, "Lcom/google/android/gms/ads/rewarded/RewardedAd;", "load")
    }
}
