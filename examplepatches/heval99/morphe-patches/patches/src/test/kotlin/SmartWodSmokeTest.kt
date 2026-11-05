import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "net.smartwod.timer"
private const val GMA = "Lcom/google/android/gms/ads/"
private const val PROMISE = "Lcom/facebook/react/bridge/Promise;"
private const val PREMIUM_EXTENSION = "Lapp/template/extension/smartwod/EnablePremiumPatch;"

class SmartWodSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads neuters GMA and Enable Premium resolves owned purchases from the extension`() {
        val root = repoRoot()
        val apk = File(root, "apks/smartwod/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.47.1",
            patchNames = setOf("Disable ads", "Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun find(type: String) =
            classes.firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

        // 1. The RN module's initialize(Promise) resolves Arguments.createArray() and returns
        //    before reaching MobileAds.initialize / setAppMuted.
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

        // 2. MobileAds: both initialize overloads, preload, and the setters that throw without
        //    init return immediately.
        val mobileAds = find("${GMA}MobileAds;")
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
        for (name in listOf("startPreload", "setAppMuted", "setAppVolume", "openDebugMenu")) {
            assertReturnsEarlyVoid(mobileAds.method(name), label = "MobileAds.$name")
        }

        // 3. Every concrete load overload returns immediately (counts as of SmartWOD 1.47.1: its
        //    newer GMA dropped the two AppOpenAd.load overloads that took an orientation int).
        val expectedLoads = mapOf(
            "BaseAdView" to 1,
            "AdLoader" to 3,
            "interstitial/InterstitialAd" to 1,
            "rewarded/RewardedAd" to 2,
            "rewardedinterstitial/RewardedInterstitialAd" to 2,
            "appopen/AppOpenAd" to 1,
            "admanager/AdManagerAdView" to 1,
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

        // --- Enable Premium ---

        // 4. The extension class is merged into the emitted dex with a concrete static
        //    resolve(String, Promise).
        val extension = find(PREMIUM_EXTENSION)
        val resolve = extension.method("resolve", listOf("Ljava/lang/String;", PROMISE))
        assertTrue(
            resolve.returnType == "V" && resolve.implementation != null &&
                resolve.accessFlags and 0x8 != 0,
            "$PREMIUM_EXTENSION.resolve(String, Promise) has the wrong shape",
        )

        // 5. RNIapModule.getAvailableItemsByType hands (type, promise) to the extension and
        //    returns before ensureConnection / queryPurchasesAsync.
        val getItems = find("Lcom/dooboolab/rniap/RNIapModule;")
            .method("getAvailableItemsByType", listOf("Ljava/lang/String;", PROMISE))
        val itemInsns = getItems.instructions()
        val hook = itemInsns.getOrNull(0)
        val hookCall = (hook as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            hook?.opcode == Opcode.INVOKE_STATIC &&
                hookCall?.definingClass == PREMIUM_EXTENSION && hookCall.name == "resolve" &&
                hookCall.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", PROMISE),
            "getAvailableItemsByType does not start with the extension call; got ${hook?.opcode} $hookCall",
        )
        // p1, p2 are the last two registers (p0 is this).
        val params = hook as FiveRegisterInstruction
        val p1 = getItems.implementation!!.registerCount - 2
        assertTrue(
            params.registerCount == 2 && params.registerC == p1 && params.registerD == p1 + 1,
            "extension call does not pass (p1, p2); got v${params.registerC}, v${params.registerD}",
        )
        assertTrue(
            itemInsns.getOrNull(1)?.opcode == Opcode.RETURN_VOID,
            "getAvailableItemsByType does not return after the extension call; got ${itemInsns.getOrNull(1)?.opcode}",
        )
    }
}
