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

private const val PKG = "com.Relmtech.Remote"
private const val LICENSE_STATUS_KEY = "License.Status"
private const val CONTEXT = "Landroid/content/Context;"

class UnifiedRemoteSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.referencesString(value: String): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference
        return ref is StringReference && ref.string == value
    }

    private fun isContextBoolean(method: Method): Boolean =
        method.returnType == "Z" && method.implementation != null &&
            method.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT)

    private fun callsIntGetterOf(owner: String, method: Method): Boolean =
        method.instructions().any { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.definingClass == owner && ref.returnType == "I" &&
                ref.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT)
        }

    @Test
    fun `Enable Pro forces the local license status check`() {
        val root = repoRoot()
        val apk = File(root, "apks/unifiedremote/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "3.25.1",
            patchNames = setOf("Enable Pro"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // The holder class is located by its unique "License.Status" literal (it also
        // contains the putInt writer).
        val licenseStatus = classes.firstOrNull { cls: ClassDef ->
            cls.methods.any { method ->
                method.implementation?.instructions?.any { it.referencesString(LICENSE_STATUS_KEY) } == true
            }
        } ?: error("license status class (key '$LICENSE_STATUS_KEY') not found in emitted dexes")

        // The Full check: the only Context-boolean consulting the status int getter.
        val fullChecks = licenseStatus.methods.filter { method ->
            isContextBoolean(method) && callsIntGetterOf(licenseStatus.type, method)
        }
        check(fullChecks.size == 1) { "expected exactly one Full check, found ${fullChecks.size}" }

        assertForcedBoolean(fullChecks.single(), expected = true, label = "${licenseStatus.type} Full check")
    }
}
