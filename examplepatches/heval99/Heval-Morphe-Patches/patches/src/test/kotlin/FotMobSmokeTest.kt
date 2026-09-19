import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.mobilefootie.wc2010"
private const val STAFF_EMAIL = "norapps.as@"

class FotMobSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.referencesString(value: String): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference
        return ref is StringReference && ref.string == value
    }

    // Mirrors the patch: the subscription getter is the manager's only no-arg boolean method
    // that is neither the staff check (holds the staff email string) nor a constant-false stub.
    private fun Method.isSubscriptionGetter(): Boolean {
        if (parameterTypes.isNotEmpty() || returnType != "Z") return false
        val insns = implementation?.instructions?.toList() ?: return false
        val holdsStaffEmail = insns.any { it.referencesString(STAFF_EMAIL) }
        val constantFalse = insns.size <= 2 &&
            (insns.firstOrNull() as? NarrowLiteralInstruction)?.narrowLiteral?.toInt() == 0
        return !holdsStaffEmail && !constantFalse
    }

    @Test
    fun `Enable FotMob+ forces the subscription state and disables the staff bypass`() {
        val root = repoRoot()
        val apk = File(root, "apks/fotmob/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "237.17536.20260911",
            patchNames = setOf("Enable FotMob+"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // The manager is R8-renamed every release, so find it the same way the patch does:
        // the class whose staff check contains the unique email string.
        val manager = classes.firstOrNull { cls ->
            cls.methods.any { method ->
                method.implementation?.instructions?.any { it.referencesString(STAFF_EMAIL) } == true
            }
        } ?: error("subscription manager (staff email string) not found in emitted dexes")

        val staff = manager.methods.first { method ->
            method.implementation?.instructions?.any { it.referencesString(STAFF_EMAIL) } == true
        }
        assertForcedBoolean(staff, expected = false, label = "${manager.type}.${staff.name} (staff check)")

        val getter = manager.methods.firstOrNull { it.isSubscriptionGetter() }
            ?: error("subscription getter not found in ${manager.type}")
        assertForcedBoolean(getter, expected = true, label = "${manager.type}.${getter.name} (subscription)")
    }
}
