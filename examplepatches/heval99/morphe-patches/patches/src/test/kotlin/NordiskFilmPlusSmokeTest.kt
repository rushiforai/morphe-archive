import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "com.nordiskfilmplus.android"
private const val VERSION = "1.5.4"
private const val SENTRY_INIT_PROVIDER = "Lio/sentry/android/core/SentryInitProvider;"

private val TELEMETRY_META = mapOf(
    "io.sentry.auto-init" to "false",
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "firebase_sessions_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
)

class NordiskFilmPlusSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable telemetry stops the shared Sentry init and sets the manifest switches`() {
        val root = repoRoot()
        val apk = File(root, "apks/nordiskfilmplus/base.apk")

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

        // 1. The Sentry init both start paths call now returns at once.
        val provider = classes.singleOrNull { it.type == SENTRY_INIT_PROVIDER }
            ?: error("$SENTRY_INIT_PROVIDER not found in the emitted dexes")
        val onCreate = provider.methods.single {
            it.name == "onCreate" && it.returnType == "Z" && it.parameterTypes.isEmpty()
        }
        val init = onCreate.instructions()
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
            .singleOrNull { ref ->
                ref.returnType == "V" && ref.parameterTypes.size == 2 &&
                    ref.parameterTypes[0].toString() == "Landroid/content/Context;" &&
                    ref.parameterTypes[1].toString().startsWith("Lio/sentry/android/core/")
            } ?: error("no Sentry init call in $SENTRY_INIT_PROVIDER->onCreate")
        val target = classes.singleOrNull { it.type == init.definingClass }
            ?: error("${init.definingClass} not found in the emitted dexes")
        val method = target.methods.single {
            it.name == init.name && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == init.parameterTypes.map(CharSequence::toString)
        }
        check(method.instructions().firstOrNull()?.opcode == Opcode.RETURN_VOID) {
            "${init.definingClass}->${init.name} does not return at once"
        }

        // 2. The switches are set exactly once on <application>.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("io.sentry.auto-init") }
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
