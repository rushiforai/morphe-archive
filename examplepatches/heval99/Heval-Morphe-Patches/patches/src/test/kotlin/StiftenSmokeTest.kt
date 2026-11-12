import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "dk.aasmain.areader"
private const val VERSION = "15.32"
private const val ADS = "Lcom/kaldorgroup/pugpigbolt/modules/GoogleMobileAds;"
private const val DISPATCHER = "Lcom/kaldorgroup/pugpigbolt/net/analytics/AnalyticsDispatcher;"

class StiftenSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun List<ClassDef>.type(type: String): ClassDef =
        firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

    @Test
    fun `Disable ads empties the PugPig ad entry points`() {
        val root = repoRoot()
        val apk = File(root, "apks/stiften/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val module = classes.type(ADS)

        // Banner: build nothing, return null (the module already returns null before sdkReady).
        val adView = module.methods.single { it.name == "adViewForId" }
        val insns = adView.instructions().toList()
        val nullConst = insns.getOrNull(0) as? NarrowLiteralInstruction
        val nullRegister = (nullConst as? OneRegisterInstruction)?.registerA
        val returned = insns.getOrNull(1) as? OneRegisterInstruction
        assertTrue(
            nullConst != null && nullConst.opcode == Opcode.CONST_4 && nullConst.narrowLiteral == 0 &&
                insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT && returned?.registerA == nullRegister,
            "adViewForId does not return null; got ${insns.take(2).map { it.opcode }}",
        )

        // Interstitial, WebView bridge and destroy helper return at once.
        for (name in listOf("presentInterstitialAdViewForId", "registerWebAdView", "destroyAdView")) {
            val method = module.methods.single { it.name == name }
            assertReturnsEarlyVoid(method, "$ADS.$name")
        }
    }

    @Test
    fun `Disable telemetry stops every analytics send and sets the Firebase switches`() {
        val root = repoRoot()
        val apk = File(root, "apks/stiften/base.apk")

        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // 1. Every dispatcher send method returns at once.
        val dispatcher = classes.type(DISPATCHER)
        val sends = dispatcher.methods.filter {
            it.name in setOf("sendEvent", "setScreen", "setUserInfo") && it.returnType == "V"
        }
        check(sends.count { it.name == "sendEvent" } >= 2) { "sendEvent overloads: ${sends.map { it.name }}" }
        check(sends.count { it.name == "setScreen" } >= 2) { "setScreen overloads: ${sends.map { it.name }}" }
        sends.forEach { method ->
            check(method.instructions().firstOrNull()?.opcode == Opcode.RETURN_VOID) {
                "${method.definingClass}->${method.name} does not return at once"
            }
        }

        // 2. The Firebase switches are forced in the bytecode (no Performance in PugPig).
        assertFirebaseSwitchesForced(classes, analytics = true, crashlytics = true, sessions = true, performance = false)
    }

    @Test
    fun `Unlock articles forces Story isEntitled true`() {
        val root = repoRoot()
        val apk = File(root, "apks/stiften/base.apk")
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Unlock articles"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val story = classes.singleOrNull { it.type == "Lcom/kaldorgroup/pugpigbolt/domain/Story;" }
            ?: error("Story not found in emitted dexes")
        val isEntitled = story.methods.single {
            it.name == "isEntitled" && it.returnType == "Z" && it.parameterTypes.isEmpty()
        }
        assertForcedBoolean(isEntitled, expected = true, label = "Story.isEntitled")
    }
}
