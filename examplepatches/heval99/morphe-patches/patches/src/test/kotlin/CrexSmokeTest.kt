import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
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

private const val PKG = "in.cricketexchange.app.cricketexchange"
private const val APP = "Lin/cricketexchange/app/cricketexchange/utils/application/MyApplication;"
private const val HOME = "Lin/cricketexchange/app/cricketexchange/activities/HomeActivity;"
private const val GMA = "Lcom/google/android/libraries/ads/mobile/sdk/"

class CrexSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `premium gate and ad loads are patched`() {
        val root = repoRoot()
        val apk = File(root, "apks/crex/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "26.10.09",
            patchNames = setOf("Enable Premium", "Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        fun Method.strings() = instructions()
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

        fun Method.callsDateAfter() = instructions().any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)
                ?.let { ref -> ref.definingClass == "Ljava/util/Date;" && ref.name == "after" } == true
        }

        fun Method.params() = parameterTypes.map(CharSequence::toString)

        // Premium 1: MyApplication's "ads eligible" getter (today after the stored expiry date)
        // returns false. Found as the patch does: the no-arg boolean reading "expiry_date".
        val adsEligible = klass(APP).methods.single {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && it.callsDateAfter() &&
                it.strings().containsAll(listOf("expiry_date", "0000-00-00"))
        }
        assertForcedBoolean(adsEligible, expected = false, label = "MyApplication.${adsEligible.name}() (ads eligible)")

        // Premium 2: HomeActivity's expiry check stores false into its static "expired" flag
        // and returns; the flag is the one its original code stores after Date.after.
        val home = klass(HOME)
        val homeCheck = home.methods.single {
            it.returnType == "V" && it.parameterTypes.isEmpty() && it.callsDateAfter() &&
                it.strings().containsAll(listOf("payment", "expiry_date"))
        }
        val insns = homeCheck.instructions()
        val zero = insns.getOrNull(0)
        val store = insns.getOrNull(1)
        val flag = (store as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            zero is NarrowLiteralInstruction && zero.narrowLiteral == 0 &&
                store?.opcode == Opcode.SPUT_BOOLEAN &&
                (store as OneRegisterInstruction).registerA == (zero as OneRegisterInstruction).registerA &&
                flag?.definingClass == HOME && flag.type == "Z" &&
                insns.getOrNull(2)?.opcode == Opcode.RETURN_VOID,
            "HomeActivity.${homeCheck.name}() does not store false and return; starts with ${insns.take(3).map { it.opcode }}",
        )
        val originalStores = insns.drop(3).filter { it.opcode == Opcode.SPUT_BOOLEAN }
            .map { (it as ReferenceInstruction).reference as FieldReference }
        assertTrue(
            originalStores.isNotEmpty() && originalStores.all { it.name == flag!!.name },
            "HomeActivity.${homeCheck.name}() forces ${flag?.name} but its own code stores ${originalStores.map { it.name }}",
        )

        // Premium 3: the flag's <clinit> default is overwritten with false.
        val clinit = home.method("<clinit>").instructions()
        val defaults = clinit.indices.filter { i ->
            clinit[i].opcode == Opcode.SPUT_BOOLEAN &&
                ((clinit[i] as ReferenceInstruction).reference as FieldReference).name == flag!!.name
        }
        assertTrue(defaults.isNotEmpty(), "HomeActivity.<clinit> never sets ${flag?.name}")
        defaults.forEach { i ->
            val forced = clinit[i - 1]
            assertTrue(
                forced is NarrowLiteralInstruction && forced.narrowLiteral == 0 &&
                    (forced as OneRegisterInstruction).registerA == (clinit[i] as OneRegisterInstruction).registerA,
                "HomeActivity.<clinit> does not force ${flag?.name} to false; found ${forced.opcode}",
            )
        }

        // Ads 1: every GMA next-gen load entry point (static on the ad class, on its Companion,
        // and the banner AdView) returns immediately.
        val gmaLoaders = mapOf(
            "interstitial/InterstitialAd" to "common/AdLoadCallback",
            "interstitial/InterstitialAd\$Companion" to "common/AdLoadCallback",
            "rewarded/RewardedAd" to "common/AdLoadCallback",
            "rewarded/RewardedAd\$Companion" to "common/AdLoadCallback",
            "rewardedinterstitial/RewardedInterstitialAd\$Companion" to "common/AdLoadCallback",
            "appopen/AppOpenAd" to "common/AdLoadCallback",
            "appopen/AppOpenAd\$Companion" to "common/AdLoadCallback",
            "nativead/NativeAdLoader" to "nativead/NativeAdLoaderCallback",
            "nativead/NativeAdLoader\$Companion" to "nativead/NativeAdLoaderCallback",
            "banner/AdView" to "common/AdLoadCallback",
        )
        gmaLoaders.forEach { (relative, callback) ->
            val loads = klass("$GMA$relative;").methods.filter {
                it.implementation != null && it.returnType == "V" && "$GMA$callback;" in it.params()
            }
            assertTrue(loads.isNotEmpty(), "no GMA load found on $relative")
            loads.forEach { assertReturnsEarlyVoid(it, label = "$relative.${it.name} (GMA load)") }
        }

        // Ads 2: every public Parth Ads load (banner, inline/native, interstitial, app-open,
        // prediction and poll ads) returns immediately.
        val parthLoads = klass("Lcom/parth/ads/AdRequest;").methods.filter {
            it.implementation != null && it.returnType == "V" &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.params().any { p -> p.endsWith("LoadCallback;") }
        }
        assertTrue(parthLoads.size >= 10, "expected the Parth AdRequest load methods, found ${parthLoads.map { it.name }}")
        parthLoads.forEach { assertReturnsEarlyVoid(it, label = "Parth AdRequest.${it.name}") }

        // Ads 3: Meta Audience Network AdView, both loadAd overloads.
        val fanAdView = klass("Lcom/facebook/ads/AdView;")
        assertReturnsEarlyVoid(fanAdView.method("loadAd", listOf()), label = "AdView.loadAd()")
        assertReturnsEarlyVoid(
            fanAdView.method("loadAd", listOf("Lcom/facebook/ads/AdView\$AdViewLoadConfig;")),
            label = "AdView.loadAd(AdViewLoadConfig)",
        )
    }
}
