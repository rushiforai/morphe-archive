import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "cc.dreamspark.intervaltimer"
private val AD_STATE_FIELDS = setOf("config_ads", "local_ads_time", "local_ads_off")

class IntervalTimerSmokeTest {

    @TempDir
    lateinit var workDir: File

    // Same anchor as the patch: the JSON models are R8-renamed, their field names are not.
    private fun ClassDef.jsonFieldNames(): Set<String> =
        fields.flatMap { field ->
            field.annotations.flatMap { annotation ->
                annotation.elements.mapNotNull { (it.value as? StringEncodedValue)?.value }
            }
        }.toSet()

    @Test
    fun `Interval Timer patches force ad-free and switch off telemetry`() {
        val root = repoRoot()
        val apk = File(root, "apks/intervaltimer/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "2.3.31",
            patchNames = setOf("Disable ads", "Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"

        // Disable ads: the AppInstallation ("device") and User ("token") ad-state getters
        // answer 3 (ad-free) at once.
        // (2.3.31: User dropped the rewarded-ad window fields, so it is keyed by config_ads + token.)
        for ((fields, label) in listOf(
            (AD_STATE_FIELDS + "device") to "AppInstallation",
            setOf("config_ads", "token") to "User",
        )) {
            val model = classes.singleOrNull { it.jsonFieldNames().containsAll(fields) }
                ?: error("no single $label model with JSON fields $fields\n$diagnostics")
            val getter = model.methods.singleOrNull {
                it.returnType == "I" && it.parameterTypes.isEmpty() &&
                    !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
            } ?: error("${model.type} has no single instance ()I ad-state getter\n$diagnostics")
            assertReturnsInt(getter, expected = 3, label = "$label ${model.type}.${getter.name}()", diagnostics)
        }

        // Disable telemetry: the collection switches are set on <application>.
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
        for ((name, value) in mapOf(
            "firebase_analytics_collection_deactivated" to "true",
            "google_analytics_adid_collection_enabled" to "false",
            "firebase_crashlytics_collection_enabled" to "false",
        )) {
            check(metaData[name] == listOf(value)) { "meta-data $name is ${metaData[name]}, expected [$value]" }
        }
    }
}
