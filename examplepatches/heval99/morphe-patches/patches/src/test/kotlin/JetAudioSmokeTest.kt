import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.jetappfactory.jetaudio"
private const val PURCHASE_MARKER = "IAB: QueryInventory info: BGV(%d), XTAL(%d), AM3D(%d), MAXX(%d), VIS(%d), CLOUD(%d), AD(%d), UI(%d), Pebble(%d)"

class JetAudioSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.referencesString(value: String): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference
        return ref is StringReference && ref.string == value
    }

    // Mirrors the patch: leaf boolean getters (no args or a Context) that do not call
    // another getter of the same class are forced true.
    private fun isPurchaseGetter(method: Method): Boolean =
        method.returnType == "Z" && method.implementation != null &&
            (method.parameterTypes.isEmpty() ||
                method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;"))

    private fun callsGetterOf(cls: ClassDef, method: Method, getters: Set<String>): Boolean =
        method.instructions().any { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.definingClass == cls.type &&
                "${ref.name}(${ref.parameterTypes.joinToString("")})" in getters
        }

    @Test
    fun `Enable Pro forces every leaf purchase getter`() {
        val root = repoRoot()
        val apk = File(root, "apks/jetaudio/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "13.1.2",
            patchNames = setOf("Enable Pro"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val purchaseInfo = classes.firstOrNull { cls ->
            cls.methods.any { method ->
                method.implementation?.instructions?.any { it.referencesString(PURCHASE_MARKER) } == true
            }
        } ?: error("purchase info class (marker '$PURCHASE_MARKER') not found in emitted dexes")

        val getters = purchaseInfo.methods.filter { isPurchaseGetter(it) }
        val signatures = getters.map { "${it.name}(${it.parameterTypes.joinToString("")})" }.toSet()
        val leaves = getters.filterNot { callsGetterOf(purchaseInfo, it, signatures) }

        check(leaves.isNotEmpty()) { "no leaf purchase getters found" }
        leaves.forEach { leaf ->
            assertForcedBoolean(
                leaf,
                expected = true,
                label = "${purchaseInfo.type}.${leaf.name}(${leaf.parameterTypes.joinToString("")})",
            )
        }
    }
}
