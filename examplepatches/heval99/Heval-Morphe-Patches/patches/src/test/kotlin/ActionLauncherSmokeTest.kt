import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "com.actionlauncher.playstore"
private const val VERSION = "53.0"
private const val PLUS_PURCHASE_CODE = 0x10382
private const val ADMOB_HANDLE = "Lcom/actionlauncher/ads/AdMobAdHandle;"
private const val CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"

class ActionLauncherSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium, Disable ads and Disable telemetry rewrite their targets`() {
        val root = repoRoot()
        val apk = File(root, "apks/actionlauncher/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Enable Premium", "Disable ads", "Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // 1. The Plus purchase check answers true.
        val readers = classes.flatMap { it.methods }.filter { method ->
            method.returnType == "Z" &&
                method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any { instruction ->
                    instruction is NarrowLiteralInstruction && instruction.narrowLiteral == PLUS_PURCHASE_CODE
                } == true
        }
        check(readers.size == 1) { "Plus readers: ${readers.map { "${it.definingClass}->${it.name}" }}" }
        assertForcedBoolean(readers.single(), expected = true, label = "Plus purchase check")

        // 2. The native ad load returns at once.
        val ads = classes.singleOrNull { it.type == ADMOB_HANDLE }
            ?: error("$ADMOB_HANDLE not found in the emitted dexes")
        assertReturnsEarlyVoid(ads.method("d"), "AdMobAdHandle.d()")

        // 3. Crashlytics log and recordException return at once, and the manifest switch is off.
        val crashlytics = classes.singleOrNull { it.type == CRASHLYTICS }
            ?: error("$CRASHLYTICS not found in the emitted dexes")
        assertReturnsEarlyVoid(crashlytics.method("log", listOf("Ljava/lang/String;")), "Crashlytics.log")
        assertReturnsEarlyVoid(
            crashlytics.method("recordException", listOf("Ljava/lang/Throwable;")),
            "Crashlytics.recordException",
        )

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
        check(metaData["firebase_crashlytics_collection_enabled"] == listOf("false")) {
            "firebase_crashlytics_collection_enabled is ${metaData["firebase_crashlytics_collection_enabled"]}"
        }
        check(metaData["firebase_sessions_enabled"] == listOf("false")) {
            "firebase_sessions_enabled is ${metaData["firebase_sessions_enabled"]}"
        }
    }
}
