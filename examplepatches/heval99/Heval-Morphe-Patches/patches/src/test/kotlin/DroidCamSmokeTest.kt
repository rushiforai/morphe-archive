import com.android.tools.smali.dexlib2.AccessFlags
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
            version = "10.0",
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
        // 10.0 renamed the GMA public methods to unicode, so the GMA loads (any concrete void taking an
        // AdRequest) and the MobileAds statics are found by shape.
        val gma = "Lcom/google/android/gms/ads/"
        val adRequest = gma + "AdRequest;"
        val managerRequest = gma + "admanager/AdManagerAdRequest;"
        val shapes = listOf(
            // class, request type, must be static
            Triple(gma + "BaseAdView;", adRequest, false),
            Triple(gma + "admanager/AdManagerAdView;", managerRequest, false),
            Triple(gma + "AdLoader;", adRequest, false),
            Triple(gma + "interstitial/InterstitialAd;", adRequest, true),
            Triple(gma + "rewarded/RewardedAd;", adRequest, true),
            Triple(gma + "rewardedinterstitial/RewardedInterstitialAd;", adRequest, true),
            Triple(gma + "appopen/AppOpenAd;", adRequest, true),
        )
        for ((owner, request, static) in shapes) {
            val loads = classes.type(owner).methods.filter { m ->
                !m.name.startsWith("<") && m.returnType == "V" && m.implementation != null &&
                    AccessFlags.STATIC.isSet(m.accessFlags) == static &&
                    m.parameterTypes.any { it.toString() == request }
            }
            assertTrue(loads.isNotEmpty(), "$owner has no ${if (static) "static " else ""}load taking $request")
            loads.forEach { assertReturnsEarlyVoid(it, "$owner->${it.name}", diagnostics) }
        }
        val mobileAds = classes.type(gma + "MobileAds;")
        val init = mobileAds.methods.filter { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.implementation != null &&
                m.parameterTypes.map { it.toString() } ==
                listOf("Landroid/content/Context;", gma + "initialization/OnInitializationCompleteListener;")
        }
        assertTrue(init.isNotEmpty(), "MobileAds has no initialize(Context, listener)")
        init.forEach { assertReturnsEarlyVoid(it, "MobileAds.initialize", diagnostics) }
        assertMobileAdsStaticsNeutralised(mobileAds, required = emptyList())
        assertMaxAdViewHidden(classes)
    }
}
