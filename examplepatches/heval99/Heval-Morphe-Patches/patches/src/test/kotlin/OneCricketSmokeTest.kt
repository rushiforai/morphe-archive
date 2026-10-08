import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "one.cricket.app"
private const val ADS = "Lone/cricket/app/ads/"
private const val GMA = "Lcom/google/android/gms/ads/"

class OneCricketSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads neuters the app ad wrappers, AdMob and hides empty slots`() {
        val root = repoRoot()
        val apk = File(root, "apks/onecricket/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "26.08.01",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun klass(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes")

        fun assertAllNeutered(owner: String, parameters: List<String>, minimum: Int) {
            val targets = klass(owner).methods.filter {
                it.implementation != null && it.returnType == "V" &&
                    it.parameterTypes.map(CharSequence::toString) == parameters
            }
            assertTrue(targets.size >= minimum, "$owner: expected >= $minimum entry points, found ${targets.size}")
            targets.forEach { assertReturnsEarlyVoid(it, label = "$owner.${it.name}") }
        }

        // App ad wrappers (R8-renamed methods, matched by shape like the patch).
        assertAllNeutered(
            "${ADS}BannerAdLoader;",
            listOf(
                "Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/lang/String;",
                "Ljava/lang/String;", "Landroid/os/Bundle;", "Lorg/json/JSONObject;", "J",
            ),
            minimum = 2,
        )
        assertAllNeutered(
            "${ADS}InterstitialAdLoader;",
            listOf(
                "Landroid/app/Activity;", "Lone/cricket/app/MyApplication;", "Landroid/content/Context;",
                "Ljava/lang/String;", "Ljava/lang/String;", "Landroid/os/Bundle;", "Ljava/lang/String;",
                "Lorg/json/JSONObject;", "I",
            ),
            minimum = 1,
        )
        assertAllNeutered(
            "${ADS}InlineNativeAdLoader;",
            listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;", "Lorg/json/JSONObject;", "I"),
            minimum = 1,
        )
        assertAllNeutered(
            "${ADS}AppOpenAdLoader;",
            listOf("Lone/cricket/app/MyApplication;", "Ljava/lang/String;", "Ljava/lang/String;", "Lorg/json/JSONObject;"),
            minimum = 2,
        )
        assertReturnsEarlyVoid(klass("${ADS}AppOpenManager;").method("onStart", emptyList()), label = "AppOpenManager.onStart()")

        // AdMob backstop.
        val mobileAds = klass("${GMA}MobileAds;")
        assertReturnsEarlyVoid(mobileAds.method("initialize", listOf("Landroid/content/Context;")), label = "MobileAds.initialize(Context)")
        assertReturnsEarlyVoid(
            mobileAds.method(
                "initialize",
                listOf("Landroid/content/Context;", "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;"),
            ),
            label = "MobileAds.initialize(Context, Listener)",
        )
        assertReturnsEarlyVoid(
            klass("${GMA}BaseAdView;").method("loadAd", listOf("Lcom/google/android/gms/ads/AdRequest;")),
            label = "BaseAdView.loadAd",
        )
        for (relative in listOf("interstitial/InterstitialAd", "admanager/AdManagerInterstitialAd", "appopen/AppOpenAd")) {
            val loads = klass("$GMA$relative;").methods.filter { it.name == "load" && it.implementation != null }
            assertTrue(loads.isNotEmpty(), "$relative.load not found")
            loads.forEach { assertReturnsEarlyVoid(it, label = "$relative.load") }
        }

        // Empty ad slots stay GONE: setVisibility(int) starts by overwriting the argument with 8.
        for (container in listOf(
            "${ADS}BannerAdViewContainer;",
            "${ADS}InlineBannerAdView;",
            "${ADS}MediumBannerAdView;",
            "Lone/cricket/app/utils/BannerAdView;",
        )) {
            val first = klass(container).method("setVisibility", listOf("I")).instructions().firstOrNull()
            assertTrue(
                first is NarrowLiteralInstruction && first.narrowLiteral == 8 &&
                    first.opcode in setOf(Opcode.CONST_16, Opcode.CONST_4),
                "$container.setVisibility does not force GONE; first instruction is ${first?.opcode}"
            )
        }
    }
}
