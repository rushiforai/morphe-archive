import com.android.tools.smali.dexlib2.AccessFlags
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
                method.parameterTypes.size == 4 &&
                method.parameterTypes.take(3).map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", "I", COMPONENT_MODEL) &&
                method.parameterTypes[3].startsWith("L") &&
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
    fun `Disable ads patch neuters GMA init, loads, the Flutter plugin loads and feed ad components`() {
        val root = repoRoot()
        val apk = File(root, "apks/onefootball/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "15.150.0",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        // Every MobileAds static void (initialize among them, renamed by R8 from 15.150.0) is a
        // no-op, so nothing can throw for lack of init (rule 9: openDebugMenu is reachable from
        // the internal feature-flag screen). The init entry point is the static void taking a
        // Context first.
        val mobileAds = klass(GMA + "MobileAds;")
        assertMobileAdsStaticsNeutralised(mobileAds, required = emptyList())
        val initLike = mobileAds.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.implementation != null &&
                it.parameterTypes.firstOrNull()?.toString() == "Landroid/content/Context;"
        }
        assertTrue(initLike.isNotEmpty(), "MobileAds has no static void taking a Context")

        // Every Flutter google_mobile_ads plugin load reports NO_FILL (shared helper).
        assertTrue(assertFlutterGmaPluginLoadsFail(classes).isNotEmpty(), "no plugin load methods found")

        // Native load entry points found by signature: both banner loads (BaseAdView, which AdView
        // extends, and AdManagerAdView) and every other void taking one request in the SDK package
        // or static (Context, String, request, ...) load are no-ops.
        val requests = setOf(GMA + "AdRequest;", GMA + "admanager/AdManagerAdRequest;")
        val bannerBase = klass(GMA + "AdView;").superclass!!
        for (owner in listOf(bannerBase, GMA + "admanager/AdManagerAdView;")) {
            val loadAd = klass(owner).methods.filter { it.name == "loadAd" && it.returnType == "V" && it.implementation != null }
            assertTrue(loadAd.isNotEmpty(), "$owner has no loadAd")
            loadAd.forEach { assertReturnsEarlyVoid(it, label = "$owner.loadAd") }
        }
        var otherLoads = 0
        var instanceLoadsOutsideBanners = 0 // the AdLoader request loads: the app's own native ad path
        var staticLoads = 0 // the full-screen loads (Interstitial, Rewarded, AppOpen, ...)
        for (classDef in classes) for (method in classDef.methods) {
            if (method.implementation == null || method.returnType != "V" || method.name == "<init>" || method.name == "<clinit>") continue
            val p = method.parameterTypes.map(CharSequence::toString)
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val single = !isStatic && classDef.type.startsWith(GMA) && p.size == 1 && p[0] in requests
            val staticLoad = isStatic && p.size >= 3 && p[0] == "Landroid/content/Context;" &&
                p[1] == "Ljava/lang/String;" && p[2] in requests
            if (single || staticLoad) {
                otherLoads++
                if (staticLoad) staticLoads++
                if (single && classDef.type != bannerBase && classDef.type != GMA + "admanager/AdManagerAdView;") {
                    instanceLoadsOutsideBanners++
                }
                assertReturnsEarlyVoid(method, label = "${classDef.type}->${method.name}(${p.joinToString("")})")
            }
        }
        // 15.150.0 has 11 sites: 2 banner loads, 3 AdLoader-style instance loads, 6 static loads.
        assertTrue(otherLoads >= 3, "expected at least 3 load entry points by signature, found $otherLoads")
        assertTrue(instanceLoadsOutsideBanners >= 1, "no AdLoader-style instance load found outside the banner classes")
        assertTrue(staticLoads >= 5, "expected at least 5 static full-screen loads, found $staticLoads")
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
