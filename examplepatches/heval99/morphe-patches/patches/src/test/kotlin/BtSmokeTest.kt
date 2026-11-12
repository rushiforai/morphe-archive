import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "com.mecom.bt"
private const val VERSION = "4.5.8"
private const val ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val AD_BLOCK = "Lapp/template/extension/webviewads/AdBlock;"
private const val WEBVIEW = "Landroid/webkit/WebView;"
private const val REQUEST = "Landroid/webkit/WebResourceRequest;"

private val TELEMETRY_META = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "firebase_sessions_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
)

class BtSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun List<ClassDef>.type(type: String): ClassDef =
        firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

    @Test
    fun `Disable telemetry stops the Firebase event methods and sets the switches`() {
        val root = repoRoot()
        val apk = File(root, "apks/bt/base.apk")

        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // 1. The three Firebase Analytics event methods return at once.
        val analytics = classes.type(ANALYTICS)
        val eventMethods = analytics.methods.filter {
            it.returnType == "V" && (
                (it.name == "a" && it.parameterTypes.size == 2) ||
                    (it.name == "b" && it.parameterTypes.size == 2) ||
                    (it.name == "setCurrentScreen" && it.parameterTypes.size == 3)
                )
        }
        check(eventMethods.size == 3) { "event methods: ${eventMethods.map { it.name }}" }
        eventMethods.forEach { method ->
            check(method.instructions().firstOrNull()?.opcode == Opcode.RETURN_VOID) {
                "$ANALYTICS.${method.name} does not return at once"
            }
        }

        // 2. The Firebase switches are set exactly once on <application>.
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

    @Test
    fun `Disable ads adds the blocking shouldInterceptRequest to the WebViewClient`() {
        val root = repoRoot()
        val apk = File(root, "apks/bt/base.apk")

        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // The extension is merged into the emitted dex.
        classes.type(AD_BLOCK)

        // The app's WebViewClient gains the blocking override; the extension's own BlockingClient
        // is merged too and also calls isAdUrl, so exclude the extension package.
        val overrides = classes.flatMap { cls -> cls.methods.map { cls to it } }.filter { (cls, method) ->
            !cls.type.startsWith("Lapp/template/extension/webviewads/") &&
                method.name == "shouldInterceptRequest" &&
                method.parameterTypes.map(CharSequence::toString) == listOf(WEBVIEW, REQUEST) &&
                method.implementation?.instructions?.any { insn ->
                    val call = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    call?.definingClass == AD_BLOCK && call.name == "isAdUrl"
                } == true
        }
        check(overrides.size == 1) { "blocking overrides: ${overrides.map { it.first.type }}" }
        val (client, method) = overrides.single()
        val calls = method.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }
        check(calls.any { it.definingClass == AD_BLOCK && it.name == "emptyResponse" }) {
            "$client: the override does not return the empty response"
        }
        check(
            calls.any {
                it.definingClass == "Landroidx/webkit/WebViewClientCompat;" && it.name == "shouldInterceptRequest"
            },
        ) { "$client: the override does not delegate to the WebViewClientCompat super" }
    }
}
