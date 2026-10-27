import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.Project100Pi.themusicplayer"
private const val AD_FREE_LITERAL = "AD_FREE"
private const val RESETTER_LOG = "checkAndDisableTempAdFree() :: start"
private const val PREFS_KEY = "isAdFree"
private const val REWARDED_AD = "Lcom/google/android/gms/ads/rewarded/RewardedAd;"

class PiMusicPlayerSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.referencesString(value: String): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference
        return ref is StringReference && ref.string == value
    }

    private fun loadClasses(patchNames: Set<String>): List<ClassDef> {
        val root = repoRoot()
        val apk = File(root, "apks/pimusicplayer/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        return applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "3.2.1.0_release_1",
            patchNames = patchNames,
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
    }

    @Test
    fun `Enable Premium forces the purchase-state checks and seeds the flag`() {
        val classes = loadClasses(setOf("Enable Premium"))

        // Resolve the flag the same way the patch does: the sget-boolean inside
        // the method reporting "AD_FREE".
        val reporter = classes.firstOrNull { cls: ClassDef ->
            cls.methods.any { method ->
                method.implementation?.instructions?.any { it.referencesString(AD_FREE_LITERAL) } == true
            }
        } ?: error("ad-state reporter (literal '$AD_FREE_LITERAL') not found in emitted dexes")
        val flag = reporter.methods
            .flatMap { it.instructions() }
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? FieldReference) }
            .singleOrNull { it.type == "Z" }
            ?: error("premium flag field not found")

        val holder = classes.firstOrNull { it.type == flag.definingClass }
            ?: error("premium flag class ${flag.definingClass} not found in emitted dexes")

        // b(): the no-arg boolean reading the flag; a(): the no-arg boolean it calls.
        val combined = holder.methods.firstOrNull { method: Method ->
            method.returnType == "Z" && method.implementation != null &&
                method.parameterTypes.isEmpty() &&
                method.instructions().any { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ref != null && ref.definingClass == flag.definingClass && ref.name == flag.name
                }
        } ?: error("combined premium check not found in ${holder.type}")
        assertForcedBoolean(combined, expected = true, label = "${holder.type} combined check")

        val listRef = combined.instructions()
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference) }
            .firstOrNull { ref ->
                ref.definingClass == holder.type && ref.returnType == "Z" &&
                    ref.parameterTypes.isEmpty()
            } ?: error("purchase-list check call not found")
        val listCheck = holder.method(listRef.name, emptyList())
        assertForcedBoolean(listCheck, expected = true, label = "${holder.type}.${listRef.name}()")

        // Resetter neutered: first instruction must be return-void.
        val resetterClass = classes.firstOrNull { cls: ClassDef ->
            cls.methods.any { method ->
                method.implementation?.instructions?.any { it.referencesString(RESETTER_LOG) } == true
            }
        } ?: error("temp-ad-free resetter (literal '$RESETTER_LOG') not found in emitted dexes")
        val resetter = resetterClass.methods.firstOrNull { method ->
            method.name != "<init>" && method.name != "<clinit>" &&
                method.returnType == "V" && method.implementation != null &&
                method.parameterTypes.isEmpty() &&
                method.instructions().any { it.referencesString(RESETTER_LOG) }
        } ?: error("temp-ad-free resetter not found in ${resetterClass.type}")
        assertReturnsEarlyVoid(resetter, label = "${resetterClass.type} resetter")

        // Flag seeded true in <clinit>: the second-to-last instruction must be the
        // sput-boolean of the flag (last is return-void).
        val clinit = holder.method("<clinit>")
        val insns = clinit.instructions()
        val seed = insns.getOrNull(insns.size - 2) as? ReferenceInstruction
        val seedRef = seed?.reference as? FieldReference
        check(
            seedRef != null && seedRef.definingClass == flag.definingClass &&
                seedRef.name == flag.name
        ) { "flag not seeded in <clinit>" }

        // No write to the flag stores anything but a constant true: every sput-boolean to it
        // follows a const 0x1 into the same register. The cold-start prefs loader's write (the
        // "isAdFree" preference read) is among them; it used to overwrite the seed every launch.
        var writes = 0
        var prefsWrite = false
        for (cls in classes) for (method in cls.methods) {
            val insns = method.instructions()
            insns.forEachIndexed { index, insn ->
                if (insn.opcode != Opcode.SPUT_BOOLEAN) return@forEachIndexed
                val ref = (insn as ReferenceInstruction).reference as FieldReference
                if (ref.definingClass != flag.definingClass || ref.name != flag.name) return@forEachIndexed
                writes++
                val register = (insn as OneRegisterInstruction).registerA
                val before = insns.getOrNull(index - 1)
                assertTrue(
                    before is NarrowLiteralInstruction && before.narrowLiteral == 1 &&
                        (before as OneRegisterInstruction).registerA == register,
                    "${cls.type}->${method.name} stores a non-constant-true value to ${flag.name} at $index"
                )
                if ((maxOf(0, index - 6) until index).any { insns[it].referencesString(PREFS_KEY) }) prefsWrite = true
            }
        }
        assertTrue(prefsWrite, "the \"$PREFS_KEY\" prefs write to ${flag.name} was not found")
        // The prefs loader, the c(Z) setter and the <clinit> seed.
        assertTrue(writes >= 3, "expected >= 3 writes to ${flag.name}, found $writes")
    }

    @Test
    fun `Disable ads neuters SDK inits, banner, full-screen and rewarded loads`() {
        val classes = loadClasses(setOf("Disable ads"))

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
        // Rule 9: no MobileAds static can throw for lack of init.
        assertMobileAdsStaticsNeutralised(mobileAds)

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

        // MAX never starts: the app calls the static initializeSdk(Context, listener) itself.
        assertAllReturnEarly(classes, "Lcom/applovin/sdk/AppLovinSdk;", "initialize", "initializeSdk")

        // Banners. GMA's loadAd lives on BaseAdView and AdManagerAdView (AdView declares none;
        // hooking "AdView" matched nothing). The MAX banner waterfall and exit-sheet ad call
        // MaxAdView.loadAd, and the unfilled view must stay GONE.
        assertAllReturnEarly(classes, "Lcom/google/android/gms/ads/BaseAdView;", "loadAd")
        assertAllReturnEarly(classes, "Lcom/google/android/gms/ads/admanager/AdManagerAdView;", "loadAd")
        assertAllReturnEarly(classes, "Lcom/applovin/mediation/ads/MaxAdView;", "loadAd", "startAutoRefresh")
        assertMaxAdViewHidden(classes)

        // Natives and GMA interstitials.
        assertAllReturnEarly(classes, "Lcom/google/android/gms/ads/AdLoader;", "loadAd", "loadAds")
        assertAllReturnEarly(classes, "Lcom/google/android/gms/ads/interstitial/InterstitialAd;", "load")

        // Rewarded loads report a failure at once, so the remove-ads sheet's spinner ends: each
        // static load(..., callback) hands the callback to a helper that builds a LoadAdError and
        // calls onAdFailedToLoad.
        val rewarded = classes.firstOrNull { it.type == REWARDED_AD } ?: error("RewardedAd not found in emitted dexes")
        val loads = rewarded.methods.filter { it.name == "load" && it.implementation != null }
        assertTrue(loads.isNotEmpty(), "RewardedAd has no concrete load")
        val helperNames = loads.map { load ->
            val insns = load.instructions()
            val call = (insns.getOrNull(0) as? ReferenceInstruction)?.reference as? MethodReference
            assertTrue(
                insns.getOrNull(0)?.opcode == Opcode.INVOKE_STATIC && call?.definingClass == REWARDED_AD &&
                    insns.getOrNull(1)?.opcode == Opcode.RETURN_VOID,
                "RewardedAd.load(${load.parameterTypes.joinToString()}) does not hand off to the failure helper"
            )
            call!!.name
        }.toSet()
        val helper = rewarded.method(helperNames.single(), listOf("Lcom/google/android/gms/ads/AdLoadCallback;"))
        val calls = helper.instructions().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        assertTrue(
            calls.any { it.definingClass == "Lcom/google/android/gms/ads/LoadAdError;" && it.name == "<init>" } &&
                calls.any { it.name == "onAdFailedToLoad" },
            "RewardedAd failure helper does not build a LoadAdError and call onAdFailedToLoad"
        )
        // The exact 5-argument constructor the helper calls, and it exists in the app's LoadAdError.
        val errorInit = "(ILjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/AdError;" +
            "Lcom/google/android/gms/ads/ResponseInfo;)V"
        fun MethodReference.descriptor() = parameterTypes.joinToString("", "(", ")") + returnType
        val initCalls = calls.filter { it.definingClass == "Lcom/google/android/gms/ads/LoadAdError;" && it.name == "<init>" }
        assertTrue(
            initCalls.map { it.descriptor() } == listOf(errorInit),
            "RewardedAd failure helper calls LoadAdError.<init>${initCalls.map { it.descriptor() }}, expected $errorInit"
        )
        val loadAdError = classes.firstOrNull { it.type == "Lcom/google/android/gms/ads/LoadAdError;" }
            ?: error("LoadAdError not found in emitted dexes")
        assertTrue(
            loadAdError.methods.any { it.name == "<init>" && it.parameterTypes.joinToString("", "(", ")") + it.returnType == errorInit },
            "LoadAdError has no <init>$errorInit"
        )
    }
}
