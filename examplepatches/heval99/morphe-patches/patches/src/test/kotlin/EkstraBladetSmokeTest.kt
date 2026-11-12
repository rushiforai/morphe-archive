import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "dk.ekstrabladet.breakingnews"
private const val VERSION = "2026.09.20"
private const val CRASHLYTICS_REGISTRAR = "Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;"

private val TELEMETRY_META = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "firebase_sessions_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
)

class EkstraBladetSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable telemetry sets the Firebase switches, drops Crashlytics and leaves messaging alone`() {
        val root = repoRoot()
        val apk = File(root, "apks/ekstrabladet/base.apk")

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

        // 1. The Crashlytics component registers nothing.
        val registrar = classes.singleOrNull { it.type == CRASHLYTICS_REGISTRAR }
            ?: error("$CRASHLYTICS_REGISTRAR not found in emitted dexes")
        val getComponents = registrar.methods.single {
            it.name == "getComponents" && it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/util/List;"
        }
        val insns = getComponents.instructions().toList()
        val first = insns.getOrNull(0)
        val field = (first as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            first?.opcode == Opcode.SGET_OBJECT && field?.definingClass == "Ljava/util/Collections;" &&
                field.name == "EMPTY_LIST" && insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
            "$CRASHLYTICS_REGISTRAR.getComponents() does not return an empty component list; got " +
                insns.take(3).map { it.opcode },
        )

        // 2. Snowplow: the tracker's single emit method returns at once.
        val snowplowWrapper = classes.singleOrNull { cls ->
            cls.methods.any { method ->
                method.implementation?.instructions?.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string
                        ?.startsWith("iglu:com.snowplowanalytics.snowplow/button_click/") == true
                } == true
            }
        } ?: error("Snowplow wrapper not found in emitted dexes")
        val trackerType = snowplowWrapper.fields.single { field ->
            !AccessFlags.STATIC.isSet(field.accessFlags) && classes.any { it.type == field.type }
        }.type
        val trackCall = snowplowWrapper.methods.asSequence()
            .flatMap { method -> method.implementation?.instructions?.asSequence() ?: emptySequence() }
            .mapNotNull { insn -> (insn as? ReferenceInstruction)?.reference as? MethodReference }
            .first { call ->
                call.definingClass == trackerType && call.returnType == "V" && call.parameterTypes.size == 1
            }
        val emit = classes.single { it.type == trackerType }.methods.single { method ->
            method.name == trackCall.name && method.returnType == "V" &&
                method.parameterTypes.size == 1 && method.implementation != null
        }
        assertReturnsEarlyVoid(emit, "$trackerType.${trackCall.name}")

        // 3. The manifest switches are set exactly once on <application>.
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

        // 4. Push must keep working: the MESSAGING_EVENT service is still declared.
        val messaging = application.children("service").filter { service ->
            service.children("action").any { it.getAttribute("android:name") == "com.google.firebase.MESSAGING_EVENT" }
        }
        assertTrue(messaging.isNotEmpty(), "Firebase Messaging service was removed from the manifest")
    }
}
