import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.streema.simpleradio"
private const val IAB_PREMIUM_KEY = "iab_premium"
private const val NATIVE_ADS_SHOW_KEY = "android_search_nativeads_show"

class SimpleRadioSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.referencesString(value: String): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference
        return ref is StringReference && ref.string == value
    }

    private fun loadClasses(patchNames: Set<String>): List<ClassDef> {
        val root = repoRoot()
        val apk = File(root, "apks/simpleradio/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        return applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "6.3.1",
            patchNames = patchNames,
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
    }

    // One run with both patches: together they crashed every cold start on 6.2.4 (the ads
    // manager's MobileAds.setAppVolume threw once initialize() was a no-op).
    @Test
    fun `Enable Premium and Disable ads patch their gates together`() {
        val classes = loadClasses(setOf("Enable Premium", "Disable ads"))
        fun cls(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        // Enable Premium. The unobfuscated Activity-level gate.
        val activity = classes.firstOrNull { it.type == "Lcom/streema/simpleradio/SimpleRadioBaseActivity;" }
            ?: error("SimpleRadioBaseActivity not found in emitted dexes")
        assertForcedBoolean(
            activity.method("isPremium", emptyList()),
            expected = true,
            label = "SimpleRadioBaseActivity.isPremium()",
        )

        // The IAB-service check: the only no-arg boolean with a body reading
        // "iab_premium" in the class owning that literal.
        val iabService = classes.firstOrNull { cls: ClassDef ->
            cls.methods.any { method ->
                method.implementation?.instructions?.any { it.referencesString(IAB_PREMIUM_KEY) } == true
            }
        } ?: error("IAB service class (key '$IAB_PREMIUM_KEY') not found in emitted dexes")

        val checks = iabService.methods.filter { method: Method ->
            method.returnType == "Z" && method.implementation != null &&
                method.parameterTypes.isEmpty() &&
                method.instructions().any { it.referencesString(IAB_PREMIUM_KEY) }
        }
        check(checks.size == 1) { "expected exactly one premium check, found ${checks.size}" }

        assertForcedBoolean(checks.single(), expected = true, label = "${iabService.type} premium check")

        // Disable ads, step 1: MobileAds never initializes, and none of its statics can throw
        // "MobileAds.initialize() must be called prior to ...".
        val gma = "Lcom/google/android/gms/ads/"
        val ctx = "Landroid/content/Context;"
        val str = "Ljava/lang/String;"
        val adRequest = "${gma}AdRequest;"
        val amRequest = "${gma}admanager/AdManagerAdRequest;"

        val mobileAds = cls("${gma}MobileAds;")
        val mobileAdsVoids = listOf(
            "initialize" to listOf(ctx),
            "initialize" to listOf(ctx, "${gma}initialization/OnInitializationCompleteListener;"),
            // The app's ads manager calls this right after initialize(): the crash site.
            "setAppVolume" to listOf("F"),
            "setAppMuted" to listOf("Z"),
            "openDebugMenu" to listOf(ctx, str),
        )
        for ((name, parameters) in mobileAdsVoids) {
            assertReturnsEarlyVoid(
                mobileAds.method(name, parameters),
                label = "MobileAds.$name(${parameters.joinToString()})",
            )
        }
        // Every other static void too (openAdInspector, registerWebView, setPlugin, ...).
        mobileAds.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                it.implementation != null && it.name != "<clinit>"
        }.forEach { method ->
            assertReturnsEarlyVoid(method, label = "MobileAds.${method.name}(${method.parameterTypes.joinToString()})")
        }
        assertForcedBoolean(
            mobileAds.method("putPublisherFirstPartyIdEnabled", listOf("Z")),
            expected = false,
            label = "MobileAds.putPublisherFirstPartyIdEnabled(Z)",
        )

        // Step 2: every GMA load entry point (class, method, exact parameters).
        val gmaHooks = listOf(
            // The banner hook used to target AdView, which has no loadAd: a silent no-op.
            Triple("BaseAdView", "loadAd", listOf(adRequest)),
            // What the app's banner slots actually call; it does not delegate to super.
            Triple("admanager/AdManagerAdView", "loadAd", listOf(amRequest)),
            Triple("AdLoader", "loadAd", listOf(adRequest)),
            Triple("AdLoader", "loadAd", listOf(amRequest)),
            Triple("AdLoader", "loadAds", listOf(adRequest, "I")),
            Triple(
                "interstitial/InterstitialAd",
                "load",
                listOf(ctx, str, adRequest, "${gma}interstitial/InterstitialAdLoadCallback;"),
            ),
            // The non-"admob" AdsExperiment buckets load interstitials through Ad Manager.
            Triple(
                "admanager/AdManagerInterstitialAd",
                "load",
                listOf(ctx, str, amRequest, "${gma}admanager/AdManagerInterstitialAdLoadCallback;"),
            ),
            Triple(
                "rewarded/RewardedAd",
                "load",
                listOf(ctx, str, adRequest, "${gma}rewarded/RewardedAdLoadCallback;"),
            ),
            Triple(
                "rewarded/RewardedAd",
                "load",
                listOf(ctx, str, amRequest, "${gma}rewarded/RewardedAdLoadCallback;"),
            ),
            Triple(
                "rewardedinterstitial/RewardedInterstitialAd",
                "load",
                listOf(ctx, str, adRequest, "${gma}rewardedinterstitial/RewardedInterstitialAdLoadCallback;"),
            ),
            Triple(
                "rewardedinterstitial/RewardedInterstitialAd",
                "load",
                listOf(ctx, str, amRequest, "${gma}rewardedinterstitial/RewardedInterstitialAdLoadCallback;"),
            ),
            Triple(
                "appopen/AppOpenAd",
                "load",
                listOf(ctx, str, adRequest, "${gma}appopen/AppOpenAd\$AppOpenAdLoadCallback;"),
            ),
        )
        for ((relative, name, parameters) in gmaHooks) {
            assertReturnsEarlyVoid(
                cls("$gma$relative;").method(name, parameters),
                label = "$relative.$name(${parameters.joinToString()})",
            )
        }

        // Step 2, continued: AppLovin MAX loads.
        val max = "Lcom/applovin/mediation/"
        val maxLoads = listOf(
            "ads/MaxInterstitialAd" to emptyList<String>(),
            "ads/MaxAdView" to emptyList<String>(),
            "ads/MaxRewardedAd" to emptyList<String>(),
            "ads/MaxAppOpenAd" to emptyList<String>(),
            "nativeAds/MaxNativeAdLoader" to emptyList<String>(),
            "nativeAds/MaxNativeAdLoader" to listOf("${max}nativeAds/MaxNativeAdView;"),
        )
        for ((relative, parameters) in maxLoads) {
            assertReturnsEarlyVoid(
                cls("$max$relative;").method("loadAd", parameters),
                label = "$relative.loadAd(${parameters.joinToString()})",
            )
        }

        // The terminal interstitial overload is showAd(String, String, Activity);
        // patching only the first match left real ads showing on other apps.
        val maxInterstitial = cls("${max}ads/MaxInterstitialAd;")
        assertReturnsEarlyVoid(
            maxInterstitial.method("showAd", listOf(str, str, "Landroid/app/Activity;")),
            label = "MaxInterstitialAd.showAd(String, String, Activity)",
        )
        val shows = maxInterstitial.methods.filter { it.name == "showAd" && it.implementation != null }
        check(shows.isNotEmpty()) { "MaxInterstitialAd has no concrete showAd" }
        shows.forEach { show ->
            assertReturnsEarlyVoid(show, label = "MaxInterstitialAd.showAd(${show.parameterTypes.joinToString()})")
        }

        // The app calls MaxAppOpenAd.showAd() directly, so every concrete showAd is patched.
        val appOpenShows = cls("${max}ads/MaxAppOpenAd;").methods.filter { it.name == "showAd" && it.implementation != null }
        check(appOpenShows.isNotEmpty()) { "MaxAppOpenAd has no concrete showAd" }
        appOpenShows.forEach { show ->
            assertReturnsEarlyVoid(show, label = "MaxAppOpenAd.showAd(${show.parameterTypes.joinToString()})")
        }

        // Step 3: the native-ad row switch, found like the patch does: the Boolean that
        // AdsExperiment stores after reading "android_search_nativeads_show", and the no-arg
        // boolean getter(s) reading it (s2() on 6.2.0, x2() on 6.2.4) answer false.
        val adsExperiment = cls("Lcom/streema/simpleradio/experiment/AdsExperiment;")
        val loaderInstructions = adsExperiment.methods
            .map { it.instructions() }
            .singleOrNull { insns -> insns.any { it.referencesString(NATIVE_ADS_SHOW_KEY) } }
            ?: error("expected one AdsExperiment method reading '$NATIVE_ADS_SHOW_KEY'")
        val nativeAdsShow = loaderInstructions
            .drop(loaderInstructions.indexOfFirst { it.referencesString(NATIVE_ADS_SHOW_KEY) })
            .first { it.opcode == Opcode.SPUT_OBJECT }
            .let { (it as ReferenceInstruction).reference as FieldReference }
        check(nativeAdsShow.type == "Ljava/lang/Boolean;") { "'$NATIVE_ADS_SHOW_KEY' is stored in a ${nativeAdsShow.type}" }

        val getters = adsExperiment.methods.filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() && method.implementation != null &&
                method.instructions().any { insn ->
                    insn.opcode == Opcode.SGET_OBJECT &&
                        ((insn as ReferenceInstruction).reference as FieldReference).name == nativeAdsShow.name
                }
        }
        check(getters.isNotEmpty()) { "no AdsExperiment getter reads ${nativeAdsShow.name}" }
        getters.forEach { getter ->
            assertForcedBoolean(getter, expected = false, label = "AdsExperiment.${getter.name}() ($NATIVE_ADS_SHOW_KEY)")
        }
    }
}
