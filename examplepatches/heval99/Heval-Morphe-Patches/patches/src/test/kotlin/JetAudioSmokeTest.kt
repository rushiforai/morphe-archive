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

    // Full identity (owner, name, parameters, return type), as in the patch.
    private fun MethodReference.identity(): String =
        "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun callsAnyOf(method: Method, getters: Set<String>): Boolean =
        method.instructions().any { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.identity() in getters
        }

    private fun List<ClassDef>.purchaseInfo(): ClassDef = singleOrNull { cls ->
        cls.methods.any { method -> method.instructions().any { it.referencesString(PURCHASE_MARKER) } }
    } ?: error("expected one purchase info class (marker '$PURCHASE_MARKER')")

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

        // Classify the getters on the stock class, like the patch does before it rewrites them,
        // so the patched output cannot hide a wrongly dropped or wrongly forced getter.
        val stockInfo = patchedApkClasses(apk).purchaseInfo()
        val stockGetters = stockInfo.methods.filter { isPurchaseGetter(it) }
        val signatures = stockGetters.map { it.identity() }.toSet()
        val (compound, leaves) = stockGetters.partition { callsAnyOf(it, signatures) }
        check(leaves.isNotEmpty()) { "no leaf purchase getters found in ${stockInfo.type}" }

        val purchaseInfo = classes.purchaseInfo()
        fun patched(stock: Method): Method = purchaseInfo.methods.single { it.identity() == stock.identity() }
        leaves.forEach { leaf ->
            assertForcedBoolean(patched(leaf), expected = true, label = leaf.identity())
        }
        // The compound getters are left alone and still read the (now forced) leaves.
        compound.forEach { getter ->
            check(callsAnyOf(patched(getter), signatures)) {
                "${getter.identity()} no longer calls a purchase getter: compound getters must stay unpatched"
            }
        }
    }
}
