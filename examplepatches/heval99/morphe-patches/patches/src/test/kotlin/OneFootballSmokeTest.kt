import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "de.motain.iliga"
private const val GMA = "Lcom/google/android/gms/ads/"
private const val COMPONENT_MODEL = "Lcom/onefootball/experience/core/model/ComponentModel;"
private const val ADS_PROTO = "Lcom/onefootball/experience/component/ads/generated/Ads\$"

class OneFootballSmokeTest {

    private fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    // Finds an ad component parser the way the patch's fingerprints do: parse shape
    // (String, I, ComponentModel, protobuf Any) -> ComponentModel plus the call to the generated
    // properties class's parseFrom (still in the body, after the injected return).
    private fun adComponentParse(classes: List<ClassDef>, properties: String): Method {
        val matches = classes.flatMap { it.methods }.filter { method ->
            method.returnType == COMPONENT_MODEL &&
                method.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", "I", COMPONENT_MODEL, "Lcom/google/protobuf/Any;") &&
                method.instructions().any {
                    it.methodRef()?.let { ref -> ref.definingClass == ADS_PROTO + properties && ref.name == "parseFrom" } == true
                }
        }
        return matches.singleOrNull() ?: error("expected one parse for $properties, found ${matches.size}")
    }

    /** Asserts `const/4 v0, 0x0` + `return-object v0` at the top. */
    private fun assertReturnsNull(method: Method, label: String) {
        val insns = method.instructions()
        val first = insns.getOrNull(0)
        val second = insns.getOrNull(1)
        assertTrue(
            first?.opcode == Opcode.CONST_4 && (first as NarrowLiteralInstruction).narrowLiteral == 0 &&
                (first as OneRegisterInstruction).registerA == 0 &&
                second?.opcode == Opcode.RETURN_OBJECT && (second as OneRegisterInstruction).registerA == 0,
            "$label does not return null; starts with ${first?.opcode}, ${second?.opcode}"
        )
    }

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads patch neuters GMA init, loads, the app-open preloader and feed ad components`() {
        val root = repoRoot()
        val apk = File(root, "apks/onefootball/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "15.147.0",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        // SDK initialization is a no-op.
        val initialize = klass(GMA + "MobileAds;").methods.single {
            it.name == "initialize" && it.parameterTypes.size == 1
        }
        assertReturnsEarlyVoid(initialize, label = "MobileAds.initialize(Context)")
        // Rule 9: no MobileAds static can throw for lack of init (openDebugMenu is reachable
        // from the internal feature-flag screen).
        assertMobileAdsStaticsNeutralised(klass(GMA + "MobileAds;"))

        // Every format's load entry point is a no-op.
        for (type in listOf(
            GMA + "BaseAdView;",
            GMA + "AdLoader;",
            GMA + "interstitial/InterstitialAd;",
            GMA + "rewarded/RewardedAd;",
            GMA + "appopen/AppOpenAd;",
        )) {
            val loads = klass(type).methods.filter { it.name in setOf("load", "loadAd", "loadAds") && it.returnType == "V" }
            assertTrue(loads.isNotEmpty(), "$type has no load entry point")
            loads.forEach { assertReturnsEarlyVoid(it, label = "$type.${it.name}") }
        }

        // AdLoader's batch load (loadAds(AdRequest, int)) is a no-op too, not only loadAd.
        val loadAds = klass(GMA + "AdLoader;").methods.single { it.name == "loadAds" }
        assertReturnsEarlyVoid(loadAds, label = "AdLoader.loadAds(AdRequest, int)")

        // App-open preloading reports failure.
        val preloader = klass(GMA + "appopen/AppOpenAdPreloader;")
        val start = preloader.methods.first { it.name == "start" && it.returnType == "Z" }
        assertForcedBoolean(start, expected = false, label = "AppOpenAdPreloader.start(...)")

        // Both native feed ad component parsers return null, so those ad slots are dropped.
        for (properties in listOf("AdComponentProperties;", "PlaceholderAdComponentProperties;")) {
            val parse = adComponentParse(classes, properties)
            assertReturnsNull(parse, label = "${parse.definingClass}->parse ($properties)")
        }

        // The Flutter ad bridge handlers reply "Ad Blocked" before their own code: the injected
        // block (name check, Result.error, return-void) comes before the original method-name
        // comparison. Found the way the fingerprints find them: handle(MethodCall, Result)V
        // holding the channel method name.
        val bridgeParams = listOf("Lio/flutter/plugin/common/MethodCall;", "Lio/flutter/plugin/common/MethodChannel\$Result;")
        for (channelMethod in listOf("getAdData", "getOMPAdData")) {
            val handle = classes.flatMap { it.methods }.single { method ->
                method.returnType == "V" &&
                    method.parameterTypes.map(CharSequence::toString) == bridgeParams &&
                    method.instructions().any { (it as? ReferenceInstruction)?.reference?.toString() == channelMethod }
            }
            val insns = handle.instructions()
            val error = insns.indexOfFirst {
                it.methodRef()?.let { ref -> ref.name == "error" && ref.definingClass == bridgeParams[1] } == true
            }
            val blocked = insns.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == "Ad Blocked" }
            val firstReturn = insns.indexOfFirst { it.opcode == Opcode.RETURN_VOID }
            val equals = insns.indexOfFirst { it.methodRef()?.let { ref -> ref.definingClass == "Ljava/lang/String;" && ref.name == "equals" } == true }
            assertTrue(
                insns.first().opcode == Opcode.CONST_STRING && equals in 0 until blocked &&
                    blocked in 0 until error && error < firstReturn && firstReturn <= 10,
                "$channelMethod handler does not reply \"Ad Blocked\" first " +
                    "(equals=$equals, blocked=$blocked, error=$error, return=$firstReturn)"
            )
        }
    }
}
