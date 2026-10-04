import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "net.zedge.android"

class ZedgeSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads neuters SDK inits and terminal load-show`() {
        val root = repoRoot()
        val apk = File(root, "apks/zedge/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "9.38.3",
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

        // The terminal interstitial overload is showAd(String, String, Activity).
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

        // Meta Audience Network init neutered (the mod gutted this SDK hardest).
        val audienceNetwork =
            classes.firstOrNull { it.type == "Lcom/facebook/ads/AudienceNetworkAds;" }
                ?: error("AudienceNetworkAds not found in emitted dexes")
        assertReturnsEarlyVoid(
            audienceNetwork.method("initialize"),
            label = "AudienceNetworkAds.initialize",
        )
    }
}
