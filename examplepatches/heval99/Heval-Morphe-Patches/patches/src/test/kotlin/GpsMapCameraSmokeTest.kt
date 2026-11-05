import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.gkfriend.gpsmapcameraeditor"
private const val ADS = "Lcom/gkfriend/gpsmapcameraeditor/ads/"
private const val SUBSCRIPTION_MANAGER = "Lcom/gkfriend/gpsmapcameraeditor/billing/SubscriptionManager;"
private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"
private const val SIGNATURE_SHA1 = "9195b65a6300de633b99a1fd84a9c191ab8a4fa4"
private const val SPLASH_ACTIVITY = "Lcom/gkfriend/gpsmapcameraeditor/SplashActivity;"

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

class GpsMapCameraSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun List<ClassDef>.type(type: String): ClassDef =
        firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

    private fun Method.calls(owner: String, name: String) = instructions().any {
        val call = (it as? ReferenceInstruction)?.reference as? MethodReference
        call?.definingClass == owner && call.name == name
    }

    @Test
    fun `GPS Map Camera patches skip the licence check, unlock premium, stop ads, spoof the signature and route to MicroG RE`() {
        val root = repoRoot()
        val apk = File(root, "apks/gpsmapcamera/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.0.31",
            patchNames = setOf(
                "Disable license check", "Disable ads", "Enable Premium", "Spoof signature", "GmsCore support",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"

        // Disable license check: PairIP's LicenseClient.checkLicense(Context) returns at once.
        val checkLicense = classes.type(LICENSE_CLIENT).methods.singleOrNull {
            it.name == "checkLicense" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                it.returnType == "V" && it.implementation != null
        } ?: error("LicenseClient.checkLicense(Context) not found")
        assertReturnsEarlyVoid(checkLicense, "LicenseClient.checkLicense(Context)", diagnostics)

        // Disable ads 1: both managers' canShowAds() (the gate that also asks the consent manager)
        // answers false.
        for (manager in listOf("AdManager", "AppOpenAdManager")) {
            val gate = classes.type("$ADS$manager;").method("canShowAds", emptyList())
            assertTrue(gate.returnType == "Z", "$manager.canShowAds() is not boolean")
            assertTrue(
                gate.calls("${ADS}ConsentManager;", "canRequestAds"),
                "$manager.canShowAds() no longer asks ConsentManager.canRequestAds()",
            )
            assertForcedBoolean(gate, expected = false, label = "$manager.canShowAds()", diagnostics = diagnostics)
        }

        // Disable ads 2: every GMA load entry point returns at once.
        for ((owner, names) in GMA_HOOKS) {
            assertAllReturnEarly(classes, owner, *names.toTypedArray())
        }

        // Enable Premium: SubscriptionManager.isSubscribed() answers true.
        val isSubscribed = classes.type(SUBSCRIPTION_MANAGER).method("isSubscribed", emptyList())
        assertForcedBoolean(isSubscribed, expected = true, label = "SubscriptionManager.isSubscribed()", diagnostics = diagnostics)

        // Spoof signature: the extension carries the package and the Play certificate, and every
        // PackageManager.getPackageInfo(String, ...) call (the Places SDK's X-Android-Cert among
        // them) goes through it.
        assertSpoofSignature(classes, PKG, SIGNATURE_SHA1)

        // GmsCore support (the map through MicroG RE's Maps module): the MicroG RE check runs first
        // in SplashActivity.onCreate, every GMS package/action/authority constant (the Maps
        // dynamite loader's "com.google.android.gms" among them) points at MicroG RE, and the
        // manifest carries the spoofing meta-data.
        assertGmsCoreSupport(classes, workDir, PKG, SPLASH_ACTIVITY, SIGNATURE_SHA1)
    }
}
