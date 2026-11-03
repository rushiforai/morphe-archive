import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.getupnote.android"

class UpNoteSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.label() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    /** The subscription record's no-arg Boolean getter, found like the patch. */
    private fun candidates(methods: List<Method>) = methods.filter { method ->
        method.returnType == "Ljava/lang/Boolean;" && method.parameterTypes.isEmpty() &&
            method.implementation != null
    }

    @Test
    fun `Enable Premium makes the subscription record report premium`() {
        val root = repoRoot()
        val apk = File(root, "apks/upnote/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val stock = patchedApkClasses(apk)
        val stockGate = stock.flatMap { cls ->
            val fields = cls.fields.toList()
            if (fields.count { it.type == "Ljava/lang/Long;" } != 1 ||
                fields.count { it.type == "Ljava/lang/Boolean;" } != 2
            ) {
                emptyList()
            } else {
                candidates(cls.methods.toList()).filter { method ->
                    method.implementation!!.instructions.any { instruction ->
                        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                        reference?.definingClass == cls.type
                    }
                }.map { cls to it }
            }
        }
        assertEquals(1, stockGate.size, "subscription getters: ${stockGate.map { it.second.label() }}")
        val label = stockGate.single().second.label()

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "9.22.8",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val patched = classes.flatMap { it.methods }.single { it.label() == label }
        val insns = patched.implementation!!.instructions.toList()
        assertTrue(
            insns.size >= 2 && insns[0].opcode == Opcode.SGET_OBJECT && insns[1].opcode == Opcode.RETURN_OBJECT,
            "$label does not return immediately; got ${insns.take(2).map { it.opcode }}",
        )
        val field = ((insns[0] as ReferenceInstruction).reference as FieldReference)
        assertTrue(
            field.definingClass == "Ljava/lang/Boolean;" && field.name == "TRUE",
            "$label returns $field, not Boolean.TRUE",
        )
    }
}
