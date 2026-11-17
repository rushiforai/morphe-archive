import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "mark.via.gp"
private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"

class ViaSmokeTest {

    @TempDir
    lateinit var workDir: File

    // Mirrors the patch: the (String, Map)V method that calls FirebaseAnalytics' only
    // (String, Bundle)V method (logEvent, R8-renamed). The call stays behind the early return.
    private fun Method.isFirebaseLogEventSink(): Boolean =
        returnType == "V" &&
            parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Ljava/util/Map;") &&
            instructions().any { instruction ->
                val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                instruction.opcode == Opcode.INVOKE_VIRTUAL && call != null &&
                    call.definingClass == FIREBASE_ANALYTICS && call.returnType == "V" &&
                    call.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Landroid/os/Bundle;")
            }

    @Test
    fun `Disable telemetry stops the Firebase event sink and deactivates Analytics`() {
        val root = repoRoot()
        val apk = File(root, "apks/via/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "7.4.1",
            patchNames = setOf("Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"

        // The tracker's event sink: exactly one, and it returns at once.
        val sinks = classes.flatMap { cls -> cls.methods.filter { it.isFirebaseLogEventSink() } }
        assertEquals(1, sinks.size, "Firebase event sinks: ${sinks.map { "${it.definingClass}->${it.name}" }}")
        sinks.forEach { assertReturnsEarlyVoid(it, "${it.definingClass}->${it.name}(String, Map)", diagnostics) }

        // The Firebase Analytics switch is set on <application>.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("firebase_analytics_collection_deactivated") }
            .firstOrNull() ?: error("no decoded AndroidManifest.xml with the telemetry meta-data under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        fun Element.children(tag: String) =
            getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
        val application = manifest.children("application").single()
        val metaData = application.children("meta-data")
            .filter { it.parentNode == application }
            .groupBy({ it.getAttribute("android:name") }, { it.getAttribute("android:value") })
        assertEquals(
            listOf("true"),
            metaData["firebase_analytics_collection_deactivated"],
            "meta-data firebase_analytics_collection_deactivated",
        )
    }
}
