import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.melodis.midomiMusicIdentifier.freemium"

class SoundHoundSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads neuters GMA init preload loads and Meta AN init`() {
        val root = repoRoot()
        val apk = File(root, "apks/soundhound/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "10.5.8",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun find(type: String) =
            classes.firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

        val mobileAds = find("Lcom/google/android/gms/ads/MobileAds;")
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
        // Background prefetch must not start either.
        assertReturnsEarlyVoid(
            mobileAds.method(
                "startPreload",
                listOf(
                    "Landroid/content/Context;",
                    "Ljava/util/List;",
                    "Lcom/google/android/gms/ads/preload/PreloadCallback;",
                ),
            ),
            label = "MobileAds.startPreload(Context, List, PreloadCallback)",
        )

        // AdView only inherits loadAd from BaseAdView.
        assertReturnsEarlyVoid(
            find("Lcom/google/android/gms/ads/BaseAdView;")
                .method("loadAd", listOf("Lcom/google/android/gms/ads/AdRequest;")),
            label = "BaseAdView.loadAd(AdRequest)",
        )

        val adLoader = find("Lcom/google/android/gms/ads/AdLoader;")
        assertReturnsEarlyVoid(
            adLoader.method("loadAd", listOf("Lcom/google/android/gms/ads/AdRequest;")),
            label = "AdLoader.loadAd(AdRequest)",
        )
        assertReturnsEarlyVoid(
            adLoader.method(
                "loadAds",
                listOf("Lcom/google/android/gms/ads/AdRequest;", "I"),
            ),
            label = "AdLoader.loadAds(AdRequest, int)",
        )

        assertReturnsEarlyVoid(
            find("Lcom/google/android/gms/ads/interstitial/InterstitialAd;").method(
                "load",
                listOf(
                    "Landroid/content/Context;",
                    "Ljava/lang/String;",
                    "Lcom/google/android/gms/ads/AdRequest;",
                    "Lcom/google/android/gms/ads/interstitial/InterstitialAdLoadCallback;",
                ),
            ),
            label = "InterstitialAd.load(Context, String, AdRequest, Callback)",
        )

        assertReturnsEarlyVoid(
            find("Lcom/google/android/gms/ads/rewarded/RewardedAd;").method(
                "load",
                listOf(
                    "Landroid/content/Context;",
                    "Ljava/lang/String;",
                    "Lcom/google/android/gms/ads/AdRequest;",
                    "Lcom/google/android/gms/ads/rewarded/RewardedAdLoadCallback;",
                ),
            ),
            label = "RewardedAd.load(Context, String, AdRequest, Callback)",
        )

        assertReturnsEarlyVoid(
            find("Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAd;").method(
                "load",
                listOf(
                    "Landroid/content/Context;",
                    "Ljava/lang/String;",
                    "Lcom/google/android/gms/ads/AdRequest;",
                    "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAdLoadCallback;",
                ),
            ),
            label = "RewardedInterstitialAd.load(Context, String, AdRequest, Callback)",
        )

        assertReturnsEarlyVoid(
            find("Lcom/google/android/gms/ads/appopen/AppOpenAd;").method(
                "load",
                listOf(
                    "Landroid/content/Context;",
                    "Ljava/lang/String;",
                    "Lcom/google/android/gms/ads/AdRequest;",
                    "Lcom/google/android/gms/ads/appopen/AppOpenAd\$AppOpenAdLoadCallback;",
                ),
            ),
            label = "AppOpenAd.load(Context, String, AdRequest, Callback)",
        )

        assertReturnsEarlyVoid(
            find("Lcom/google/android/gms/ads/admanager/AdManagerAdView;")
                .method(
                    "loadAd",
                    listOf("Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;"),
                ),
            label = "AdManagerAdView.loadAd(AdManagerAdRequest)",
        )

        assertReturnsEarlyVoid(
            find("Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAd;").method(
                "load",
                listOf(
                    "Landroid/content/Context;",
                    "Ljava/lang/String;",
                    "Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;",
                    "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAdLoadCallback;",
                ),
            ),
            label = "AdManagerInterstitialAd.load(Context, String, AdManagerAdRequest, Callback)",
        )

        assertReturnsEarlyVoid(
            find("Lcom/facebook/ads/AudienceNetworkAds;")
                .method("initialize", listOf("Landroid/content/Context;")),
            label = "AudienceNetworkAds.initialize(Context)",
        )
    }
}
