import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.rawcam.app"
private val PREFS_HELPER_PARAMS = listOf("Landroid/content/SharedPreferences;", "Ljava/lang/String;", "Z")

class NativeCameraSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.referencesString(value: String) = instructions().any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    }

    private fun prefsHelper(insn: com.android.tools.smali.dexlib2.iface.instruction.Instruction): MethodReference? {
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference ?: return null
        return ref.takeIf { insn.opcode == Opcode.INVOKE_STATIC && it.parameterTypes.map(CharSequence::toString) == PREFS_HELPER_PARAMS }
    }

    @Test
    fun `license check is skipped and premium is persisted and locked true`() {
        val root = repoRoot()
        val apk = File(root, "apks/nativecamera/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk, workDir = workDir, pkg = PKG, version = "1.4.3",
            patchNames = setOf("Disable license check", "Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // PairIP license check.
        val licenseClient = classes.first { it.type == "Lcom/pairip/licensecheck/LicenseClient;" }
        assertReturnsEarlyVoid(
            licenseClient.method("checkLicense", listOf("Landroid/content/Context;")),
            label = "LicenseClient.checkLicense(Context)",
        )

        // CameraViewModel: located like the fingerprints (stable prefs file + key).
        val viewModel: ClassDef = classes.first { cls ->
            cls.methods.any {
                it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/app/Application;") &&
                    it.referencesString("is_premium") && it.referencesString("rawcam_prefs")
            }
        }

        // Setter: the argument is forced true before anything else runs.
        val setter = viewModel.methods.single {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                it.referencesString("is_premium")
        }
        val first = setter.instructions().firstOrNull()
        assertTrue(
            first is NarrowLiteralInstruction && first.narrowLiteral == 1 && first.opcode == Opcode.CONST_4,
            "${viewModel.type}.${setter.name}(Z) does not force its argument true; first is ${first?.opcode}"
        )

        // Constructor: const 1 -> persist(prefs, key, 1) -> restore default -> original read.
        val init = viewModel.methods.single {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/app/Application;")
        }
        val insns = init.instructions()
        val keyIndex = insns.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "is_premium" }
        val persistIndex = (keyIndex + 1 until insns.size).first { prefsHelper(insns[it])?.returnType == "V" }
        val readIndex = (persistIndex + 1 until insns.size).first { prefsHelper(insns[it]) != null }

        val setTrue = insns[persistIndex - 1]
        val persist = insns[persistIndex] as FiveRegisterInstruction
        val restore = insns[persistIndex + 1]
        val read = insns[readIndex] as FiveRegisterInstruction
        assertTrue(
            setTrue is NarrowLiteralInstruction && setTrue.narrowLiteral == 1 &&
                (setTrue as OneRegisterInstruction).registerA == persist.registerE,
            "constructor does not load true into the persist argument"
        )
        assertTrue(prefsHelper(insns[readIndex])?.returnType != "V", "premium read not found after the persist call")
        assertTrue(
            persist.registerC == read.registerC && persist.registerD == read.registerD,
            "persist call does not use the read's prefs/key registers"
        )
        assertTrue(
            restore is NarrowLiteralInstruction && (restore as OneRegisterInstruction).registerA == read.registerE,
            "default register is not restored before the original read"
        )
    }
}
