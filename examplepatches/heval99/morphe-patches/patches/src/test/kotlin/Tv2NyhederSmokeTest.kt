import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "dk.tv2.nyhedscenter"
private const val VERSION = "2026.10-10188:RELEASE"

private val GMA_HOOKS = mapOf(
    "Lcom/google/android/gms/ads/BaseAdView;" to listOf("loadAd"),
    "Lcom/google/android/gms/ads/admanager/AdManagerAdView;" to listOf("loadAd"),
    "Lcom/google/android/gms/ads/AdLoader;" to listOf("loadAd", "loadAds"),
    "Lcom/google/android/gms/ads/interstitial/InterstitialAd;" to listOf("load"),
    "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAd;" to listOf("load"),
    "Lcom/google/android/gms/ads/rewarded/RewardedAd;" to listOf("load"),
    "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAd;" to listOf("load"),
    "Lcom/google/android/gms/ads/appopen/AppOpenAd;" to listOf("load"),
)

class Tv2NyhederSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads neuters every GMA load entry point`() {
        val root = repoRoot()
        val apk = File(root, "apks/tv2nyheder/base.apk")

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

        var checked = 0
        for ((type, names) in GMA_HOOKS) {
            val classDef = classes.singleOrNull { it.type == type }
                ?: error("$type not found in the emitted dexes")
            for (name in names) {
                val methods = classDef.methods.filter {
                    it.name == name && it.returnType == "V" && it.implementation != null
                }
                check(methods.isNotEmpty()) { "$type->$name not found" }
                methods.forEach { method ->
                    check(method.instructions().firstOrNull()?.opcode == Opcode.RETURN_VOID) {
                        "$type->$name does not return at once"
                    }
                    checked++
                }
            }
        }
        check(checked >= 8) { "only $checked GMA load methods checked" }
    }

    @Test
    fun `Disable telemetry stops Chartbeat and Bugsnag`() {
        val root = repoRoot()
        val apk = File(root, "apks/tv2nyheder/base.apk")
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // 1. Both Chartbeat setupTracker overloads return at once.
        val tracker = classes.singleOrNull { it.type == "Lcom/chartbeat/androidsdk/Tracker;" }
            ?: error("Chartbeat Tracker not found in the emitted dexes")
        val setups = tracker.methods.filter {
            it.name == "setupTracker" && it.returnType == "V" && it.implementation != null
        }
        check(setups.size >= 2) { "setupTracker overloads: ${setups.size}" }
        setups.forEach { method ->
            check(method.instructions().firstOrNull()?.opcode == Opcode.RETURN_VOID) {
                "Tracker->setupTracker(${method.parameterTypes.joinToString()}) does not return at once"
            }
        }

        // 2. The Bugsnag provider no longer calls the SDK start helper.
        val provider = classes.singleOrNull { it.type == "Lcom/bugsnag/android/internal/BugsnagContentProvider;" }
            ?: error("BugsnagContentProvider not found in the emitted dexes")
        val onCreate = provider.methods.single {
            it.name == "onCreate" && it.returnType == "Z" && it.parameterTypes.isEmpty()
        }
        val insns = onCreate.instructions()
        check(insns.none { it.opcode == Opcode.INVOKE_STATIC }) {
            "BugsnagContentProvider.onCreate still makes a static call"
        }
        check(insns.any { it.opcode == Opcode.NOP }) {
            "BugsnagContentProvider.onCreate has no nop where the start call was"
        }
    }
}
