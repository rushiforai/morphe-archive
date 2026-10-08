import org.junit.jupiter.api.Assertions.assertNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import java.io.File

private const val PKG = "org.kman.AquaMail"
private const val LICENSE_MANAGER = "Lorg/kman/AquaMail/data/LicenseManager;"
private const val LICENSE_DATA = "Lorg/kman/AquaMail/licensing/LicenseData;"
private const val FEATURE = "Lorg/kman/AquaMail/coredefs/Feature;"

class AquaMailSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium patch unlocks the license level and feature locks`() {
        val root = repoRoot()
        val apk = File(root, "apks/aquamail/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "2.7.0",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val licenseManager = classes.firstOrNull { it.type == LICENSE_MANAGER }
            ?: error("LicenseManager not found in emitted dexes")

        // The UI consumes the numeric level directly.
        assertReturnsInt(licenseManager.method("getLicenseLevel"), expected = 40, label = "LicenseManager.getLicenseLevel()")
        assertReturnsMethodCall(
            licenseManager.method("getLicenseType"),
            targetClass = LICENSE_MANAGER,
            targetName = "getLicenseTypeInApp",
            label = "LicenseManager.getLicenseType()",
        )

        // Issue #16: on a free install getLicenseData() returned null, and the account
        // list, the prefs license line and the account-limit logic gate on a non-null
        // snapshot before consulting any forced getter. The patched method must return a
        // licensed snapshot: new-instance LicenseData, state = 1, confirm deadline +
        // expiry = far future, returned before the original (now dead) body runs.
        assertLicensedSnapshot(licenseManager.method("getLicenseData"))

        assertForcedBoolean(licenseManager.method("isPro"), expected = true, label = "LicenseManager.isPro()")
        assertForcedBoolean(licenseManager.method("isPremium"), expected = true, label = "LicenseManager.isPremium()")
        assertForcedBoolean(licenseManager.method("isLicensedVersion"), expected = true, label = "LicenseManager.isLicensedVersion()")
        assertForcedBoolean(licenseManager.method("isFree"), expected = false, label = "LicenseManager.isFree()")
        assertForcedBoolean(
            licenseManager.method("isFeatureLockedForLicense", listOf(FEATURE)),
            expected = false, label = "LicenseManager.isFeatureLockedForLicense(Feature)",
        )

        val lockFeatures = classes.firstOrNull { it.type == "Lorg/kman/AquaMail/data/LockFeatures;" }
            ?: error("LockFeatures not found in emitted dexes")
        assertForcedBoolean(
            lockFeatures.method("isFeatureLocked", listOf(FEATURE)),
            expected = false, label = "LockFeatures.isFeatureLocked(Feature)",
        )
    }

    private fun Method.insns(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun fieldRefAt(method: Method, index: Int): FieldReference? =
        (method.insns().getOrNull(index) as? ReferenceInstruction)?.reference as? FieldReference

    private fun assertLicensedSnapshot(method: Method) {
        val insns = method.insns()
        val prefix = "LicenseManager.getLicenseData() licensed snapshot"
        assertTrue(
            insns.getOrNull(0)?.opcode == Opcode.NEW_INSTANCE &&
                (insns[0] as? ReferenceInstruction)?.reference.let { ref ->
                    (ref as? com.android.tools.smali.dexlib2.iface.reference.TypeReference)?.type == LICENSE_DATA
                },
            "$prefix does not start with new-instance $LICENSE_DATA; " +
                "first instruction is ${insns.getOrNull(0)?.opcode}"
        )
        assertTrue(
            insns.getOrNull(1)?.opcode == Opcode.INVOKE_DIRECT,
            "$prefix does not construct LicenseData; second instruction is ${insns.getOrNull(1)?.opcode}"
        )
        val stateWrite = insns.getOrNull(3)
        assertTrue(
            stateWrite?.opcode == Opcode.IPUT &&
                (stateWrite as? ReferenceInstruction)?.reference.let { ref ->
                    ref is FieldReference && ref.definingClass == LICENSE_DATA && ref.type == "I"
                },
            "$prefix does not write the licensed state (int) field; fourth instruction is ${stateWrite?.opcode}"
        )
        val deadlineWrites = listOf(5, 6).mapNotNull { i ->
            insns.getOrNull(i)?.takeIf { it.opcode == Opcode.IPUT_WIDE }?.let { insn ->
                (insn as? ReferenceInstruction)?.reference as? FieldReference
            }
        }
        assertTrue(
            deadlineWrites.size == 2 &&
                deadlineWrites.all { it.definingClass == LICENSE_DATA && it.type == "J" } &&
                deadlineWrites[0].name != deadlineWrites[1].name,
            "$prefix does not write two distinct long (deadline/expiry) fields; " +
                "found ${deadlineWrites.mapNotNull { it?.name }}"
        )
        assertTrue(
            insns.getOrNull(7)?.opcode == Opcode.RETURN_OBJECT,
            "$prefix does not return the snapshot; eighth instruction is ${insns.getOrNull(7)?.opcode}"
        )
    }
}
