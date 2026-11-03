import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "me.bluemail.mail"
private const val GMA = "Lcom/google/android/gms/ads/"

class BlueMailSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads neuters GMA init and every load and resolves the RN initialize promise`() {
        val root = repoRoot()
        val apk = File(root, "apks/bluemail/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "2.2.418",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun find(type: String) =
            classes.firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

        // 1. The RN module's initialize(Promise) resolves Arguments.createArray() and returns
        //    before reaching MobileAds.initialize.
        val rnInit = find("Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsModule;")
            .method("initialize", listOf("Lcom/facebook/react/bridge/Promise;"))
        val insns = rnInit.instructions()
        fun callAt(index: Int) =
            (insns.getOrNull(index) as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            insns.getOrNull(0)?.opcode == Opcode.INVOKE_STATIC &&
                callAt(0)?.definingClass == "Lcom/facebook/react/bridge/Arguments;" &&
                callAt(0)?.name == "createArray",
            "RN initialize does not start with Arguments.createArray(); got ${callAt(0)}",
        )
        assertTrue(
            insns.getOrNull(2)?.opcode == Opcode.INVOKE_INTERFACE &&
                callAt(2)?.definingClass == "Lcom/facebook/react/bridge/Promise;" &&
                callAt(2)?.name == "resolve",
            "RN initialize does not resolve the promise; got ${callAt(2)}",
        )
        assertTrue(
            insns.getOrNull(3)?.opcode == Opcode.RETURN_VOID,
            "RN initialize does not return after resolving; got ${insns.getOrNull(3)?.opcode}",
        )

        // 2. MobileAds: initialize and the setters that throw without init return immediately.
        val mobileAds = find("${GMA}MobileAds;")
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
        for (name in listOf("setAppMuted", "setAppVolume", "openDebugMenu")) {
            assertReturnsEarlyVoid(mobileAds.method(name), label = "MobileAds.$name")
        }

        // 3. Every concrete load overload returns immediately (counts as of 2.2.418).
        val expectedLoads = mapOf(
            "BaseAdView" to 1,
            "AdLoader" to 2,
            "interstitial/InterstitialAd" to 1,
            "rewarded/RewardedAd" to 2,
            "rewardedinterstitial/RewardedInterstitialAd" to 2,
            "appopen/AppOpenAd" to 1,
            "admanager/AdManagerInterstitialAd" to 1,
        )
        for ((relative, count) in expectedLoads) {
            val loads = find("$GMA$relative;").methods.filter {
                it.implementation != null && it.returnType == "V" &&
                    it.name in setOf("load", "loadAd", "loadAds")
            }
            assertEquals(count, loads.size, "$relative load overloads")
            loads.forEach { method ->
                assertReturnsEarlyVoid(
                    method,
                    label = "$relative.${method.name}(${method.parameterTypes.joinToString()})",
                )
            }
        }
    }
}
