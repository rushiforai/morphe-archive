import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.resultadosfutbol.mobile"
private const val SDK = "Lcom/google/android/libraries/ads/mobile/sdk/"
private const val AD_LOAD_CALLBACK = "${SDK}common/AdLoadCallback;"
private const val AD_REQUEST = "${SDK}common/AdRequest;"

class BeSoccerSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `license check is skipped and Google Mobile Ads never initializes or loads`() {
        val root = repoRoot()
        val apk = File(root, "apks/besoccer/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk, workDir = workDir, pkg = PKG, version = "6.7.0",
            patchNames = setOf("Disable license check", "Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun klass(type: String) = byType[type] ?: error("$type not found in emitted dexes")

        fun assertAllNeutered(owner: String, vararg names: String) {
            for (name in names) {
                val targets = klass(owner).methods.filter {
                    it.implementation != null && it.returnType == "V" && it.name == name
                }
                assertTrue(targets.isNotEmpty(), "no concrete void $owner->$name")
                targets.forEach { assertReturnsEarlyVoid(it, label = "$owner->${it.name}${it.parameterTypes}") }
            }
        }

        // PairIP license check.
        assertReturnsEarlyVoid(
            klass("Lcom/pairip/licensecheck/LicenseClient;").method("checkLicense", listOf("Landroid/content/Context;")),
            label = "LicenseClient.checkLicense(Context)",
        )

        // 1. MobileAds: the init the app calls (Companion.initialize with its listener), every void
        //    that throws without init, and putPublisherFirstPartyIdEnabled answering false.
        val companion = "${SDK}MobileAds\$Companion;"
        assertReturnsEarlyVoid(
            klass(companion).method(
                "initialize",
                listOf(
                    "Landroid/content/Context;",
                    "${SDK}initialization/InitializationConfig;",
                    "${SDK}initialization/OnAdapterInitializationCompleteListener;",
                ),
            ),
            label = "MobileAds.Companion.initialize(Context, InitializationConfig, listener)",
        )
        for (owner in listOf("${SDK}MobileAds;", companion)) {
            assertAllNeutered(
                owner, "initialize", "initializeAdapters", "setRequestConfiguration", "setUserMutedApp",
                "setUserControlledAppVolume", "registerWebView", "openDebugMenu", "openAdInspector", "generateSignal",
            )
            assertForcedBoolean(
                klass(owner).method("putPublisherFirstPartyIdEnabled", listOf("Z")),
                expected = false,
                label = "$owner->putPublisherFirstPartyIdEnabled",
            )
        }

        // 2. Loads: the exact entry points the app calls, then every void load on each format.
        assertReturnsEarlyVoid(
            klass("${SDK}banner/AdView;").method("loadAd", listOf("${SDK}banner/BannerAdRequest;", AD_LOAD_CALLBACK)),
            label = "AdView.loadAd(BannerAdRequest, AdLoadCallback)",
        )
        assertReturnsEarlyVoid(
            klass("${SDK}nativead/NativeAdLoader\$Companion;").method(
                "load", listOf("${SDK}nativead/NativeAdRequest;", "${SDK}nativead/NativeAdLoaderCallback;"),
            ),
            label = "NativeAdLoader.Companion.load(NativeAdRequest, NativeAdLoaderCallback)",
        )
        for (format in listOf("interstitial/InterstitialAd", "rewarded/RewardedAd", "appopen/AppOpenAd")) {
            assertReturnsEarlyVoid(
                klass("$SDK$format\$Companion;").method("load", listOf(AD_REQUEST, AD_LOAD_CALLBACK)),
                label = "$format.Companion.load(AdRequest, AdLoadCallback)",
            )
        }
        assertAllNeutered("${SDK}banner/AdView;", "loadAd", "loadFromAdResponse")
        for (format in listOf(
            "banner/BannerAd", "interstitial/InterstitialAd", "rewarded/RewardedAd",
            "rewardedinterstitial/RewardedInterstitialAd", "appopen/AppOpenAd", "nativead/NativeAdLoader",
        )) {
            assertAllNeutered("$SDK$format;", "load", "loadFromAdResponse")
            assertAllNeutered("$SDK$format\$Companion;", "load", "loadFromAdResponse")
        }

        // 3. Every app call into MobileAds or a load lands on a method that returns at once (the
        //    same scan as the patch; getVersion/isInitialized/getInitializationStatus are safe).
        val safe = setOf("getVersion", "isInitialized", "getInitializationStatus")
        val appCalls = mutableSetOf<String>()
        for (classDef in classes) {
            if (classDef.type.startsWith("Lcom/google/") || classDef.type.startsWith("Lads_mobile_sdk/")) continue
            for (method in classDef.methods) {
                for (instruction in method.instructions()) {
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    if (!ref.definingClass.startsWith(SDK)) continue
                    val isMobileAds = ref.definingClass == "${SDK}MobileAds;" || ref.definingClass == companion
                    if (!isMobileAds && ref.name !in setOf("load", "loadAd", "loadFromAdResponse")) continue
                    if (isMobileAds && ref.name in safe) continue
                    val target = klass(ref.definingClass).methods.firstOrNull {
                        it.name == ref.name && it.returnType == ref.returnType &&
                            it.parameterTypes.map(CharSequence::toString) == ref.parameterTypes.map(CharSequence::toString)
                    }
                    val label = "${classDef.type}->${method.name} calls ${ref.definingClass}->${ref.name}"
                    assertTrue(target != null, "$label: target not found")
                    if (target!!.returnType == "Z") {
                        assertForcedBoolean(target, expected = false, label = label)
                    } else {
                        assertReturnsEarlyVoid(target, label = label)
                    }
                    appCalls += "${ref.definingClass}->${ref.name}"
                }
            }
        }
        // The calls 6.6.0 makes; if one disappears the app has moved and the test must be revisited.
        val expected = setOf(
            "$companion->initialize", "$companion->setUserMutedApp", "$companion->setRequestConfiguration",
            "$companion->registerWebView", "${SDK}banner/AdView;->loadAd",
            "${SDK}nativead/NativeAdLoader\$Companion;->load", "${SDK}interstitial/InterstitialAd\$Companion;->load",
            "${SDK}rewarded/RewardedAd\$Companion;->load", "${SDK}appopen/AppOpenAd\$Companion;->load",
        )
        assertTrue(appCalls.containsAll(expected), "app no longer makes ${expected - appCalls}; found $appCalls")
    }
}
