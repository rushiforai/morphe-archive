import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile

private const val PKG = "com.monefy.app.lite"

class MonefySmokeTest {

    @TempDir
    lateinit var workDir: File

    /** The unpatched classes, read straight from the APK's dex files. */
    private fun originalClasses(apk: File): List<ClassDef> = ZipFile(apk).use { zip ->
        zip.entries().toList()
            .filter { Regex("classes\\d*\\.dex").matches(it.name) }
            .flatMap { entry ->
                val bytes = zip.getInputStream(entry).use { it.readBytes() }
                DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.toList()
            }
    }

    @Test
    fun `Enable Premium patch forces the pro checks and clears the expired state`() {
        val root = repoRoot()
        val apk = File(root, "apks/monefy/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.23.0",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // R8 renames the classes and methods, so find each target the way the patch does: the
        // ()Z method holding its stable string, read from the stock APK (the patched one no
        // longer holds the strings).
        val stock = originalClasses(apk)
        fun target(string: String, classFilter: (ClassDef) -> Boolean = { true }): Method {
            val matches = stock.filter(classFilter).flatMap { cls ->
                cls.methods.filter { m ->
                    m.returnType == "Z" && m.parameterTypes.isEmpty() &&
                        m.instructions().any { it.stringOrNull() == string }
                }
            }
            val match = matches.singleOrNull() ?: error("expected one ()Z holding \"$string\", found ${matches.size}")
            return classes.first { it.type == match.definingClass }.method(match.name, emptyList())
        }

        assertForcedBoolean(
            target("com.monefy.app.pro") { it.superclass == "Landroid/app/Application;" },
            expected = true, label = "ClearCashApplication master pro check",
        )
        assertForcedBoolean(
            target("KEY_GOOGLE_PLAY_MONEFY_PRO_IN_APP_BOUGHT") { it.type == "Lcom/monefy/helpers/GeneralSettingsProvider;" },
            expected = true, label = "GeneralSettingsProvider pro purchase flag",
        )
        assertForcedBoolean(
            target("KEY_MONEFY_PRO_SUBSCRIPTION_EXPIRED"),
            expected = false, label = "subscription-expired reader",
        )
    }
}
