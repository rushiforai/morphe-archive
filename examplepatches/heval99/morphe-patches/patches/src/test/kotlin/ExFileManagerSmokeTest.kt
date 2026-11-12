import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.ace.ex.file.manager"
private const val ENTITLEMENT_KEY = "key_p_entitlement_active_v2"
private const val MAX = "Lcom/applovin/mediation/"
private const val PANGLE = "Lcom/bytedance/sdk/openadsdk/api/"

class ExFileManagerSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.holds(value: String) = instructions().any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    }

    private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

    @Test
    fun `premium is unlocked, ads and telemetry are off`() {
        val root = repoRoot()
        val apk = File(root, "apks/exfilemanager/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.6.2",
            patchNames = setOf("Enable Premium", "Disable ads", "Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun cls(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes")

        // Enable Premium: the static premium check that calls the cached-flag reader answers true;
        // the reader itself is stock.
        val readers = classes.flatMap { c -> c.methods.filter { !it.isStatic() && it.returnType == "Z" && it.parameterTypes.isEmpty() && it.holds(ENTITLEMENT_KEY) } }
        assertTrue(readers.size == 1, "entitlement readers: ${readers.map { "${it.definingClass}->${it.name}" }}")
        val reader = readers.single()
        assertTrue(reader.instructions().first().opcode.name != "const/4", "the entitlement reader was changed")
        val wrappers = classes.flatMap { c ->
            c.methods.filter { m ->
                m.isStatic() && m.returnType == "Z" && m.parameterTypes.isEmpty() && m.instructions().any {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                        ref.definingClass == reader.definingClass && ref.name == reader.name
                    } == true
                }
            }
        }
        assertTrue(wrappers.size == 1, "premium checks: ${wrappers.map { "${it.definingClass}->${it.name}" }}")
        assertForcedBoolean(wrappers.single(), true, "premium check ${wrappers.single().definingClass}->${wrappers.single().name}")

        // Disable ads: every MAX load/show and every Pangle load returns at once.
        val hooks = mapOf(
            MAX + "ads/MaxAdView;" to setOf("loadAd", "startAutoRefresh"),
            MAX + "ads/MaxInterstitialAd;" to setOf("loadAd", "showAd"),
            MAX + "ads/MaxRewardedAd;" to setOf("loadAd", "showAd"),
            MAX + "ads/MaxAppOpenAd;" to setOf("loadAd", "showAd"),
            MAX + "nativeAds/MaxNativeAdLoader;" to setOf("loadAd"),
            PANGLE + "banner/PAGBannerAd;" to setOf("loadAd"),
            PANGLE + "interstitial/PAGInterstitialAd;" to setOf("loadAd"),
            PANGLE + "nativeAd/PAGNativeAd;" to setOf("loadAd"),
            PANGLE + "open/PAGAppOpenAd;" to setOf("loadAd"),
            PANGLE + "reward/PAGRewardedAd;" to setOf("loadAd"),
        )
        for ((type, names) in hooks) {
            for (name in names) {
                val targets = cls(type).methods.filter { it.name == name && it.returnType == "V" && it.implementation != null }
                assertTrue(targets.isNotEmpty(), "$type has no concrete $name")
                targets.forEach { assertReturnsEarlyVoid(it, "$type->$name") }
            }
        }
        val visibility = cls(MAX + "ads/MaxAdView;").method("setVisibility", listOf("I")).instructions().first()
        assertTrue(visibility.opcode.name == "const/16", "MaxAdView.setVisibility does not force GONE first")

        // Disable telemetry: measurement logEvent and every static void of AppMetrica return at once.
        cls("Lcom/google/android/gms/measurement/api/AppMeasurementSdk;").methods
            .filter { it.name == "logEvent" && it.implementation != null }
            .forEach { assertReturnsEarlyVoid(it, "AppMeasurementSdk.logEvent") }
        val metrica = cls("Lio/appmetrica/analytics/AppMetrica;").methods
            .filter { it.isStatic() && it.returnType == "V" && it.implementation != null && it.name != "<clinit>" }
        assertTrue(metrica.any { it.name == "activate" }, "AppMetrica.activate not found")
        metrica.forEach { assertReturnsEarlyVoid(it, "AppMetrica.${it.name}") }
        // Crashlytics: the settings holder's no-arg booleans answer false.
        val holder = classes.single { c -> c.methods.any { it.holds("firebase_crashlytics_collection_enabled") } }
        holder.methods.filter { it.implementation != null && it.returnType == "Z" && it.parameterTypes.isEmpty() }
            .forEach { assertForcedBoolean(it, false, "${holder.type}->${it.name}") }
    }
}
