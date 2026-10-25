import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.template.patches.shared.hevalcontrols.HEVAL_SETTINGS_CLASS
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.HevalRegistryCodec
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.hevalControlsPatch
import app.template.patches.shared.hevalcontrols.hevalReturnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "com.rawcam.app"
private const val EXTENSION = "Lapp/template/extension/hevalcontrols/"

/**
 * Runs the Heval Controls host and a test-only feature patch through the real patcher. Heval
 * Controls is not wired to any app yet, so the patches are built here and never enter the bundle;
 * any small APK in `apks/` works (Native Camera, ~3 MB).
 */
class HevalControlsPatcherTest {

    @TempDir
    lateinit var workDir: File

    private val feature = HevalFeature(
        id = "test.gate",
        name = "Test gate",
        description = "Gated at runtime by the Heval Controls test.",
        category = "Test",
        default = false,
    )

    /** The method the feature patch gated, found the same way in both runs. */
    private var gated: String? = null

    private fun patch(run: String): List<ClassDef> {
        val apk = File(repoRoot(), "apks/nativecamera/base.apk")
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val host = hevalControlsPatch(
            Compatibility(
                name = "Native Camera",
                packageName = PKG,
                apkFileType = ApkFileType.APKM,
                appIconColor = 0xD0BCFF,
                targets = listOf(AppTarget(version = "1.4.5", versionCode = 57)),
            ),
        )
        val featurePatch = host.featurePatch(feature) {
            // Any concrete boolean method of the app with a local register.
            var target: Pair<String, String>? = null
            classDefForEach { classDef ->
                if (target != null || classDef.type.startsWith(EXTENSION)) return@classDefForEach
                classDef.methods.firstOrNull { it.isGateable() }?.let { target = classDef.type to it.name }
            }
            val (type, name) = target ?: error("no gateable boolean method")
            val method = mutableClassDefBy(type).methods.first { it.name == name && it.isGateable() }
            gated = "$type->$name"
            method.hevalReturnEarly(feature.id, true)
        }

        return applyPatches(
            apk = apk,
            workDir = workDir.resolve(run),
            pkg = PKG,
            version = "1.4.5",
            patchNames = setOf("Heval Controls", feature.name),
            allPatches = setOf(host.patch, featurePatch),
        )
    }

    @Test
    fun hostMergesTheExtensionWritesTheRegistryAndAddsTheManifestComponents() {
        val classes = patch("first")
        val byType = classes.associateBy { it.type }

        // The extension classes are merged into the emitted dex.
        listOf(
            "HevalSettings;", "Registry;", "RegistryCodec;", "CrashGuard;", "InitProvider;", "PrefsStore;",
            "ui/HevalControlsActivity;", "ui/Views;", "ui/Palette;", "ui/Diagnostics;",
        ).forEach { assertTrue("$EXTENSION$it" in byType, "$EXTENSION$it is not in the patched dex") }

        // Registry getters were rewritten.
        val registry = byType.getValue("${EXTENSION}Registry;")
        assertEquals(HevalRegistryCodec.encode(listOf(feature)), registry.constString("encoded"))
        assertEquals("1.4.5 (57)", registry.constString("patchedAppVersion"))
        assertTrue(registry.constString("bundleVersion").isNotBlank())

        // The feature's method starts with the gate.
        val (type, name) = gated!!.split("->")
        val method = byType.getValue(type).methods.first { it.name == name && it.isGateable(allowGated = true) }
        val instructions = method.instructions()
        assertEquals(feature.id, ((instructions[0] as ReferenceInstruction).reference as StringReference).string)
        val call = (instructions[1] as ReferenceInstruction).reference as MethodReference
        assertEquals("$HEVAL_SETTINGS_CLASS->isEnabled", "${call.definingClass}->${call.name}")
        assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ), instructions.subList(2, 4).map { it.opcode })

        // Manifest: non-exported provider with a high initOrder and non-exported activity, no alias.
        val manifestFile = workDir.walkTopDown()
            .firstOrNull { it.name == "AndroidManifest.xml" && it.readText().contains("hevalcontrols") }
            ?: error("no decoded AndroidManifest.xml with Heval Controls under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        fun elements(tag: String) = manifest.getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
        val provider = elements("provider").single { it.getAttribute("android:name").endsWith(".hevalcontrols.InitProvider") }
        assertEquals("$PKG.hevalcontrols", provider.getAttribute("android:authorities"))
        assertEquals("false", provider.getAttribute("android:exported"))
        assertEquals("1000", provider.getAttribute("android:initOrder"))
        val activity = elements("activity").single { it.getAttribute("android:name").endsWith(".ui.HevalControlsActivity") }
        assertEquals("false", activity.getAttribute("android:exported"))
        assertTrue(elements("activity-alias").none { it.getAttribute("android:targetActivity").contains("hevalcontrols") })

        // A second run in the same JVM writes the same registry (the host starts empty each run).
        val again = patch("second").associateBy { it.type }.getValue("${EXTENSION}Registry;")
        assertEquals(HevalRegistryCodec.encode(listOf(feature)), again.constString("encoded"))
    }

    private fun Method.isGateable(allowGated: Boolean = false): Boolean {
        val implementation = implementation ?: return false
        if (returnType != "Z" || AccessFlags.ABSTRACT.isSet(accessFlags)) return false
        val self = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
        val parameters = self + parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
        if (implementation.registerCount <= parameters) return false
        val first = implementation.instructions.firstOrNull() ?: return false
        if (allowGated) return true
        return first.opcode != Opcode.CONST_STRING
    }

    /** The string a rewritten `returnEarly(String)` getter returns. */
    private fun ClassDef.constString(name: String): String {
        val first = methods.single { it.name == name }.instructions().first()
        assertTrue(first.opcode == Opcode.CONST_STRING || first.opcode == Opcode.CONST_STRING_JUMBO, "$name was not rewritten")
        return ((first as ReferenceInstruction).reference as StringReference).string
    }
}
