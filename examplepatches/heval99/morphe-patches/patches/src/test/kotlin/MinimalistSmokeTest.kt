import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.qqlabs.minimalistlauncher"
private const val FULL_VERSION = "full version"
private const val SETTER_LOG = "setting full version to "

class MinimalistSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.label() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    private fun Method.strings() = implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }.orEmpty()

    private fun isGetter(method: Method) = method.returnType == "Z" &&
        method.parameterTypes.isEmpty() && FULL_VERSION in method.strings()

    private fun isSetter(method: Method) = method.returnType == "V" &&
        SETTER_LOG in method.strings() &&
        method.parameterTypes.map(CharSequence::toString).let { it.size == 2 && it[0] == "Z" }

    @Test
    fun `Enable Premium forces the full version flag and every refresh`() {
        val root = repoRoot()
        val apk = File(root, "apks/minimalist/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.22.8v236",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"

        val getters = classes.flatMap { it.methods }.filter { isGetter(it) }
        assertEquals(1, getters.size, "full version getters: ${getters.map { it.label() }}")
        assertForcedBoolean(getters.single(), expected = true, label = "full version getter", diagnostics = diagnostics)

        val setters = classes.flatMap { it.methods }.filter { isSetter(it) }
        assertEquals(1, setters.size, "full version setters: ${setters.map { it.label() }}")
        val setter = setters.single()
        val insns = setter.implementation!!.instructions.toList()
        val valueRegister = setter.implementation!!.registerCount - 2
        val first = insns.first()
        assertTrue(
            first is NarrowLiteralInstruction && first.opcode == Opcode.CONST_4 &&
                first.narrowLiteral.toInt() == 1 &&
                (first as OneRegisterInstruction).registerA == valueRegister,
            "${setter.label()} does not force the boolean parameter; got ${first.opcode}\n$diagnostics",
        )
    }
}
