import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.resultadosfutbol.mobile"
private const val MAX = "Lcom/applovin/mediation/"

class BeSoccerSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `license check is skipped and ads are cut at the SDK layer`() {
        val root = repoRoot()
        val apk = File(root, "apks/besoccer/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk, workDir = workDir, pkg = PKG, version = "6.6.0",
            patchNames = setOf("Disable license check", "Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        fun klass(type: String) = classes.firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

        fun assertAllNeutered(owner: String, vararg names: String) {
            val targets = klass(owner).methods.filter {
                it.implementation != null && it.returnType == "V" && it.name in names
            }
            assertTrue(targets.isNotEmpty(), "no ${names.joinToString("/")} on $owner")
            targets.forEach { assertReturnsEarlyVoid(it, label = "$owner.${it.name}${it.parameterTypes}") }
        }

        // PairIP license check.
        assertReturnsEarlyVoid(
            klass("Lcom/pairip/licensecheck/LicenseClient;").method("checkLicense", listOf("Landroid/content/Context;")),
            label = "LicenseClient.checkLicense(Context)",
        )

        // MAX and the mediated networks.
        assertAllNeutered("Lcom/applovin/sdk/AppLovinSdk;", "initialize")
        assertAllNeutered("${MAX}ads/MaxAdView;", "loadAd")
        assertAllNeutered("${MAX}ads/MaxInterstitialAd;", "loadAd", "showAd")
        assertAllNeutered("${MAX}ads/MaxRewardedAd;", "loadAd", "showAd")
        assertAllNeutered("${MAX}ads/MaxAppOpenAd;", "loadAd", "showAd")
        assertAllNeutered("${MAX}nativeAds/MaxNativeAdLoader;", "loadAd")
        assertAllNeutered("Lcom/unity3d/ads/UnityAds;", "initialize")
        assertAllNeutered("Lcom/facebook/ads/AudienceNetworkAds;", "initialize")
        assertAllNeutered("Lcom/vungle/ads/VungleAds;", "init")

        // Banner slots stay GONE.
        val first = klass("${MAX}ads/MaxAdView;").method("setVisibility", listOf("I")).instructions().firstOrNull()
        assertTrue(
            first is NarrowLiteralInstruction && first.narrowLiteral == 8,
            "MaxAdView.setVisibility does not force GONE; first instruction is ${first?.opcode}"
        )
    }
}
