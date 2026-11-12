import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "dk.tdc.blockbuster.nordic"
private const val VERSION = "7.1.27"
private const val ANALYTICS_MODULE = "Lio/invertase/firebase/analytics/NativeRNFBTurboAnalytics;"
private const val SENTRY_ANDROID = "Lio/sentry/android/core/SentryAndroid;"

private val TELEMETRY_META = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "firebase_sessions_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
)

class BlockbusterSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable telemetry pins collection off, stops Sentry and sets the Firebase switches`() {
        val root = repoRoot()
        val apk = File(root, "apks/blockbuster/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // 1. setAnalyticsCollectionEnabled always receives false.
        val module = classes.singleOrNull { it.type == ANALYTICS_MODULE }
            ?: error("$ANALYTICS_MODULE not found in the emitted dexes")
        val switch = module.method("setAnalyticsCollectionEnabled")
        val first = switch.instructions().firstOrNull() as? NarrowLiteralInstruction
        check(first != null && first.opcode == Opcode.CONST_4 && first.narrowLiteral == 0) {
            "setAnalyticsCollectionEnabled does not force a false argument"
        }
        check((first as OneRegisterInstruction).registerA ==
            switch.implementation!!.registerCount - switch.parameterTypes.size) {
            "the forced false value is not written to the boolean parameter register"
        }

        // 2. Every SentryAndroid.init overload returns at once.
        val sentry = classes.singleOrNull { it.type == SENTRY_ANDROID }
            ?: error("$SENTRY_ANDROID not found in the emitted dexes")
        val inits = sentry.methods.filter { it.name == "init" && it.returnType == "V" && it.implementation != null }
        check(inits.size >= 4) { "SentryAndroid.init overloads: ${inits.size}" }
        inits.forEach { method ->
            check(method.instructions().firstOrNull()?.opcode == Opcode.RETURN_VOID) {
                "SentryAndroid.init(${method.parameterTypes.joinToString()}) does not return at once"
            }
        }

        // 3. The Firebase switches are set exactly once on <application>.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("firebase_crashlytics_collection_enabled") }
            .firstOrNull() ?: error("no decoded AndroidManifest.xml with the telemetry meta-data under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        fun Element.children(tag: String) =
            getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
        val application = manifest.children("application").single()
        val metaData = application.children("meta-data")
            .filter { it.parentNode == application }
            .groupBy({ it.getAttribute("android:name") }, { it.getAttribute("android:value") })
        for ((name, value) in TELEMETRY_META) {
            check(metaData[name] == listOf(value)) { "meta-data $name is ${metaData[name]}, expected [$value]" }
        }
    }
}
