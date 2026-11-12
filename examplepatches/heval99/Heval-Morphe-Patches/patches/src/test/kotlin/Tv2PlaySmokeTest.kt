import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "dk.tv2.tv2play"
private const val VERSION = "2026.10-1"
private const val ANALYTICS_DEACTIVATED_KEY = "firebase_analytics_collection_deactivated"

private val TELEMETRY_META = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "firebase_sessions_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
)

class Tv2PlaySmokeTest {

    private fun Method.strings(): List<String> =
        instructions().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable telemetry forces the measurement off and sets the Firebase switches`() {
        val root = repoRoot()
        val apk = File(root, "apks/tv2play/base.apk")

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

        // 1. The "firebase_analytics_collection_deactivated" read answers Boolean.TRUE.
        val readers = classes.flatMap { cls -> cls.methods }
            .filter { method -> ANALYTICS_DEACTIVATED_KEY in method.strings() }
        assertTrue(
            readers.size == 1,
            "expected one $ANALYTICS_DEACTIVATED_KEY reader, found " +
                readers.map { "${it.definingClass}.${it.name}" },
        )
        val insns = readers.single().instructions().toList()
        val keyIndex = insns.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ANALYTICS_DEACTIVATED_KEY }
        assertTrue(keyIndex >= 0, "the $ANALYTICS_DEACTIVATED_KEY string vanished")
        val keyRegister = (insns[keyIndex] as OneRegisterInstruction).registerA
        val invoke = insns.getOrNull(keyIndex + 1)
        val call = (invoke as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            invoke is FiveRegisterInstruction && invoke.registerCount == 2 &&
                call?.returnType == "Ljava/lang/Boolean;" &&
                call.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
                invoke.registerD == keyRegister,
            "the $ANALYTICS_DEACTIVATED_KEY string is not read through a Boolean get(String)",
        )
        val move = insns.getOrNull(keyIndex + 2) as? OneRegisterInstruction
        val forced = insns.getOrNull(keyIndex + 3) as? ReferenceInstruction
        val forcedField = forced?.reference as? FieldReference
        assertTrue(
            insns.getOrNull(keyIndex + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT && move != null &&
                forced?.opcode == Opcode.SGET_OBJECT &&
                forcedField?.definingClass == "Ljava/lang/Boolean;" && forcedField.name == "TRUE" &&
                (forced as OneRegisterInstruction).registerA == move.registerA,
            "the $ANALYTICS_DEACTIVATED_KEY read is not overwritten with Boolean.TRUE",
        )

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
}
