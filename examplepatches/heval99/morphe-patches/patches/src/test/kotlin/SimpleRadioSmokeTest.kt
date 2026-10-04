import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.streema.simpleradio"
private const val IAB_PREMIUM_KEY = "iab_premium"

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
            version = "6.2.0",
            patchNames = patchNames,
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
    }

    @Test
    fun `Enable Premium forces isPremium and the IAB preference gate`() {
        val classes = loadClasses(setOf("Enable Premium"))

        // The unobfuscated Activity-level gate.
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
    }

    @Test
    fun `Disable ads neuters MobileAds init and MAX interstitial load-show`() {
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

        // The terminal interstitial overload is showAd(String, String, Activity);
        // patching only the first match left real ads showing on other apps.
        val maxInterstitial =
            classes.firstOrNull { it.type == "Lcom/applovin/mediation/ads/MaxInterstitialAd;" }
                ?: error("MaxInterstitialAd not found in emitted dexes")
        val terminalShow = maxInterstitial.method(
            "showAd",
            listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/app/Activity;"),
        )
        assertReturnsEarlyVoid(terminalShow, label = "MaxInterstitialAd.showAd(String, String, Activity)")
    }
}
