import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.anydesk.anydeskandroid"
private const val JNI = "Lcom/anydesk/jni/JniAdExt;"

class AnyDeskSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium forces every license wrapper around the stable JNI natives`() {
        val root = repoRoot()
        val apk = File(root, "apks/anydesk/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "9.0.0",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val expected = mapOf(
            "jniIsFreeLicense" to false,
            "jniDoesLicenseAllowAccountRegistration" to true,
            "jniDoesLicenseAllowAddressBook" to true,
            "jniCanRemoveLicense" to true,
        )

        for ((native, result) in expected) {
            val wrapper = classes
                .flatMap { it.methods }
                .firstOrNull { method ->
                    method.implementation != null &&
                        method.instructions().any { insn ->
                            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                            ref?.definingClass == JNI && ref.name == native
                        }
                } ?: error("no wrapper invokes $JNI->$native()")

            assertForcedBoolean(
                wrapper,
                expected = result,
                label = "$JNI wrapper of $native()",
            )
        }
    }
}
