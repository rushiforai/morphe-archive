import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "app.pinya.mango"
private const val CACHED_PRO = "billing_cached_is_pro"

class MangoSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun List<ClassDef>.billingClient(): ClassDef = single { cls ->
        cls.methods.any { method ->
            method.name == "<clinit>" && method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == CACHED_PRO
            } == true
        }
    }

    @Test
    fun `Enable Premium forces the Pro seed and the license check is skipped`() {
        val root = repoRoot()
        val apk = File(root, "apks/mango/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.64",
            patchNames = setOf("Enable Premium", "Disable license check"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"

        // The Pro seed after the billing state Set.contains is forced true.
        val client = classes.billingClient()
        val ctor = client.methods.single { it.name == "<init>" && it.parameterTypes.size == 2 }
        val insns = ctor.implementation!!.instructions.toList()
        val at = insns.indexOfFirst {
            val call = (it as? ReferenceInstruction)?.reference as? MethodReference
            it.opcode == Opcode.INVOKE_INTERFACE && call?.name == "contains" && call.returnType == "Z"
        }
        assertTrue(at > 0, "${client.type}.<init> has no Set.contains\n$diagnostics")
        val move = insns[at + 1]
        val forced = insns[at + 2]
        val register = (move as OneRegisterInstruction).registerA
        assertTrue(
            move.opcode == Opcode.MOVE_RESULT && forced is NarrowLiteralInstruction &&
                forced.opcode == Opcode.CONST_4 && forced.narrowLiteral.toInt() == 1 &&
                (forced as OneRegisterInstruction).registerA == register,
            "${client.type}.<init> does not force the Pro seed; got ${insns.drop(at).take(3).map { it.opcode }}\n$diagnostics",
        )

        // Disable license check.
        val licenseClient = classes.single { it.type == "Lcom/pairip/licensecheck/LicenseClient;" }
        val checkLicense = licenseClient.methods.singleOrNull {
            it.name == "checkLicense" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                it.returnType == "V" && it.implementation != null
        } ?: error("LicenseClient.checkLicense(Context) not found")
        assertReturnsEarlyVoid(checkLicense, "LicenseClient.checkLicense(Context)", diagnostics)
    }
}
