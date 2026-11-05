import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.futbin"
private const val GMA = "Lcom/google/android/gms/ads/"

private fun Method.strings(): List<String> = instructions().mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}

class FutbinSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads patch turns off the ad switch, app ad paths, Anzu and GMA`() {
        val root = repoRoot()
        val apk = File(root, "apks/futbin/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "27.10",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        // The app is obfuscated: find its methods by log-line prefix or preference key, as the
        // patch does. returnEarly prepends, so the original strings are still there.
        val appMethods = classes.filter { it.type.startsWith("Lx/") || it.type.startsWith("Lcom/futbin/") }
            .flatMap { it.methods }
        fun byString(prefix: String) = appMethods.filter { m -> m.strings().any { it.startsWith(prefix) } }
            .also { assertEquals(1, it.size, "methods with \"$prefix\": ${it.map { m -> "${m.definingClass}->${m.name}" }}") }
            .single()

        // 1. The isAdAllowed preference getter reads false.
        val adAllowed = appMethods.single {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                "preferences.ad.allowed.key" in it.strings()
        }
        assertForcedBoolean(adAllowed, expected = false, label = "isAdAllowed preference getter")

        // 2. FbApplication's GAM/Nimbus init.
        val initAds = byString("Ad Log -> int GAM")
        assertEquals("Lcom/futbin/FbApplication;", initAds.definingClass)
        assertReturnsEarlyVoid(initAds, label = "FbApplication ad SDK init")

        // 3. GAM controller interstitial show (the Nimbus fallback path).
        assertReturnsEarlyVoid(byString("GAM -> !isInterstitialGapPassed"), label = "GAM showInterstitial")

        // 4. Nimbus init and every request entry point.
        val nimbusInit = byString("GAM -> Nimbus -> initAds")
        assertReturnsEarlyVoid(nimbusInit, label = "Nimbus init")
        assertReturnsEarlyVoid(byString("GAM -> Nimbus -> Bottom loadBottomBanner"), label = "Nimbus bottom banner")
        assertReturnsEarlyVoid(byString("GAM -> Nimbus -> In-Feed loadInFeedBanner"), label = "Nimbus in-feed banner")
        val nimbusInterstitial = klass(nimbusInit.definingClass).methods.single {
            it.parameterTypes.firstOrNull()?.toString() == "Landroid/app/Activity;" && "interstitial" in it.strings()
        }
        assertReturnsEarlyVoid(nimbusInterstitial, label = "Nimbus interstitial")

        // 5. Anzu init: the premium check's result is forced to true before its branch.
        val anzu = byString("Ad Log -> init Anzu").instructions()
        val check = (anzu[0] as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            anzu[0].opcode == Opcode.INVOKE_STATIC && check?.returnType == "Z" && anzu[1].opcode == Opcode.MOVE_RESULT,
            "Anzu init does not start with the premium check: ${anzu.take(4).map { it.opcode }}"
        )
        val result = (anzu[1] as OneRegisterInstruction).registerA
        val forced = anzu[2]
        assertTrue(
            forced is NarrowLiteralInstruction && forced.narrowLiteral == 1 &&
                (forced as OneRegisterInstruction).registerA == result,
            "Anzu premium check is not forced to true; third instruction is ${forced.opcode}"
        )
        assertTrue(
            anzu[3].opcode == Opcode.IF_EQZ && (anzu[3] as OneRegisterInstruction).registerA == result,
            "Anzu premium branch does not follow the forced value; fourth instruction is ${anzu[3].opcode}"
        )

        // 6. GMA: both initialize overloads, every format's load entry point, and the
        // app-open preloader.
        val initialize = klass(GMA + "MobileAds;").methods.filter { it.name == "initialize" }
        assertEquals(2, initialize.size, "MobileAds.initialize overloads")
        initialize.forEach { assertReturnsEarlyVoid(it, label = "MobileAds.initialize(${it.parameterTypes.size})") }
        // Rule 9: no MobileAds static can throw for lack of init.
        assertMobileAdsStaticsNeutralised(klass(GMA + "MobileAds;"))

        for (type in listOf(
            GMA + "BaseAdView;",
            GMA + "AdLoader;",
            GMA + "interstitial/InterstitialAd;",
            GMA + "rewarded/RewardedAd;",
            GMA + "rewardedinterstitial/RewardedInterstitialAd;",
            GMA + "appopen/AppOpenAd;",
            GMA + "admanager/AdManagerAdView;",
            GMA + "admanager/AdManagerInterstitialAd;",
        )) {
            val loads = klass(type).methods.filter { (it.name == "load" || it.name == "loadAd") && it.returnType == "V" }
            assertTrue(loads.isNotEmpty(), "$type has no load entry point")
            loads.forEach { assertReturnsEarlyVoid(it, label = "$type.${it.name}") }
        }

        val starts = klass(GMA + "appopen/AppOpenAdPreloader;").methods.filter { it.name == "start" && it.returnType == "Z" }
        assertTrue(starts.isNotEmpty(), "AppOpenAdPreloader has no start(...)")
        starts.forEach { assertForcedBoolean(it, expected = false, label = "AppOpenAdPreloader.start(${it.parameterTypes.size})") }
    }
}
