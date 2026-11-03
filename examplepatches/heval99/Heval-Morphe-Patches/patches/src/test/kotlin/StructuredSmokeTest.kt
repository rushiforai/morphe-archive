import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
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

private const val PKG = "io.unorderly.structured"
private const val CUSTOMER_INFO = "Lcom/revenuecat/purchases/CustomerInfo;"
private const val PRO = "pro"

class StructuredSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.label() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    private fun Method.strings() = implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }.orEmpty()

    private fun Method.isProMapper() = returnType.startsWith("L") &&
        parameterTypes.map(CharSequence::toString) == listOf(CUSTOMER_INFO) &&
        PRO in strings() && "recurring_tasks" in strings()

    @Test
    fun `Enable Premium forces the pro answer and the license check is skipped`() {
        val root = repoRoot()
        val apk = File(root, "apks/structured/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val stock = patchedApkClasses(apk)
        val stockMapper = stock.flatMap { it.methods }.single { it.isProMapper() }

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "3.9.6",
            patchNames = setOf("Enable Premium", "Disable license check"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"
        val mapper = classes.flatMap { it.methods }.single { it.isProMapper() }
        val insns = mapper.implementation!!.instructions.toList()

        val proIndex = insns.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == PRO
        }
        assertTrue(proIndex > 0, "${mapper.label()} has no \"$PRO\"\n$diagnostics")
        val move = insns[proIndex + 2]
        val forced = insns[proIndex + 3]
        val register = (move as OneRegisterInstruction).registerA
        assertTrue(
            move.opcode == Opcode.MOVE_RESULT && forced is NarrowLiteralInstruction &&
                forced.opcode == Opcode.CONST_4 && forced.narrowLiteral.toInt() == 1 &&
                (forced as OneRegisterInstruction).registerA == register,
            "${mapper.label()} does not force the contains() answer; got ${insns.drop(proIndex).take(4).map { it.opcode }}\n$diagnostics",
        )

        // Nothing else changed: dropping the inserted constant leaves the stock instruction list.
        val emitted = insns.map { it.opcode }.toMutableList().also { it.removeAt(proIndex + 3) }
        assertEquals(
            stockMapper.implementation!!.instructions.map { it.opcode },
            emitted,
            "${mapper.label()} changed beyond the forced constant",
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
