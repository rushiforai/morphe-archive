import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
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

private const val PKG = "com.rarecam.app"
private const val CUSTOMER_INFO = "Lcom/revenuecat/purchases/CustomerInfo;"
private const val RARECAM_PRO = "rarecam_pro"

class RareCamSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.label() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Method.isEntitlementGate() =
        returnType == "V" &&
            parameterTypes.map(CharSequence::toString) == listOf(CUSTOMER_INFO) &&
            implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == RARECAM_PRO
            } == true

    private fun valueOfIndex(insns: List<Instruction>) = insns.indexOfFirst {
        val call = (it as? ReferenceInstruction)?.reference as? MethodReference
        call?.definingClass == "Ljava/lang/Boolean;" && call.name == "valueOf" &&
            call.parameterTypes.map(CharSequence::toString) == listOf("Z")
    }

    @Test
    fun `Enable Premium forces the RareCam Pro state true`() {
        val root = repoRoot()
        val apk = File(root, "apks/rarecam/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.0.92",
            patchNames = setOf("Enable Premium", "Disable license check"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"

        // The app's only RevenueCat consumer: (CustomerInfo)V carrying the entitlement id.
        val gates = classes.flatMap { it.methods }.filter { it.isEntitlementGate() }
        assertEquals(1, gates.size, "entitlement gates: ${gates.map { it.label() }}")
        val gate = gates.single()
        val insns = gate.instructions()

        val at = valueOfIndex(insns)
        assertTrue(at > 1, "${gate.label()} has no Boolean.valueOf(Z)\n$diagnostics")
        val valueRegister = (insns[at] as FiveRegisterInstruction).registerC
        val forced = insns[at - 2]
        val store = insns[at - 1]
        assertTrue(
            forced is NarrowLiteralInstruction && forced.opcode == Opcode.CONST_4 &&
                forced.narrowLiteral.toInt() == 1 &&
                (forced as OneRegisterInstruction).registerA == valueRegister,
            "${gate.label()} does not load 1 into v$valueRegister before the state write; " +
                "got ${forced?.opcode} $diagnostics",
        )
        assertTrue(
            store.opcode == Opcode.SGET_OBJECT,
            "${gate.label()} state read moved; got ${store.opcode}\n$diagnostics",
        )

        // Nothing else changed: dropping the inserted constant leaves the stock instruction list.
        val stockGate = patchedApkClasses(apk).flatMap { it.methods }.single { it.isEntitlementGate() }
        val emitted = insns.map { it.opcode }.toMutableList().also { it.removeAt(at - 2) }
        assertEquals(
            stockGate.instructions().map { it.opcode },
            emitted,
            "${gate.label()} changed beyond the forced constant",
        )

        // Disable license check: PairIP's LicenseClient.checkLicense(Context) returns at once.
        val licenseClient = classes.single { it.type == "Lcom/pairip/licensecheck/LicenseClient;" }
        val checkLicense = licenseClient.methods.singleOrNull {
            it.name == "checkLicense" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                it.returnType == "V" && it.implementation != null
        } ?: error("LicenseClient.checkLicense(Context) not found")
        assertReturnsEarlyVoid(checkLicense, "LicenseClient.checkLicense(Context)", diagnostics)
    }
}
