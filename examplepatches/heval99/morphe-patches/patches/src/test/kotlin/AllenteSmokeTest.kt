import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "com.canaldigital.go"
private const val VERSION = "6.2.1.0"
private const val ANALYTICS_MODULE = "Lio/invertase/firebase/analytics/ReactNativeFirebaseAnalyticsModule;"

private val TELEMETRY_META = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "firebase_sessions_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
)

class AllenteSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable telemetry pins collection off and sets the Firebase switches`() {
        val root = repoRoot()
        val apk = File(root, "apks/allente/base.apk")

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

        // 1. setAnalyticsCollectionEnabled always receives Boolean.FALSE.
        val module = classes.singleOrNull { it.type == ANALYTICS_MODULE }
            ?: error("$ANALYTICS_MODULE not found in the emitted dexes")
        val switch = module.method("setAnalyticsCollectionEnabled")
        val first = switch.instructions().firstOrNull()
        val field = ((first as? ReferenceInstruction)?.reference) as? FieldReference
        check(
            first?.opcode == Opcode.SGET_OBJECT &&
                field?.definingClass == "Ljava/lang/Boolean;" && field.name == "FALSE",
        ) { "setAnalyticsCollectionEnabled does not force Boolean.FALSE" }
        check((first as OneRegisterInstruction).registerA >= 0) { "sget-object has no register" }

        // 2. The Firebase switches are set exactly once on <application>.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("firebase_sessions_enabled") }
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
