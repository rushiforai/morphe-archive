import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.rammigsoftware.bluecoins"
private const val PREMIUM_STATE_LOG = "Startup: Encryption: Premium is "
private const val OVERRIDE_LOG = "Startup: Encryption: Google Play premium override"

class BluecoinsSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.stringOrNull(): String? =
        ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Instruction.isBooleanTrue(register: Int): Boolean {
        val field = (this as? ReferenceInstruction)?.reference as? FieldReference
        return opcode == Opcode.SGET_OBJECT &&
            field?.definingClass == "Ljava/lang/Boolean;" && field.name == "TRUE" &&
            (this as OneRegisterInstruction).registerA == register
    }

    // Bluecoins 13.1.149 is fully obfuscated, so find each patched method the same way the
    // patch does: by its Timber log prefix (the patch only inserts, so the strings remain).
    private fun List<ClassDef>.methodWithLogPrefix(prefix: String): Pair<ClassDef, Method> {
        val hits = flatMap { cls ->
            cls.methods.filter { m -> m.instructions().any { it.stringOrNull()?.startsWith(prefix) == true } }
                .map { cls to it }
        }
        assertTrue(hits.size == 1, "expected one method logging '$prefix', found ${hits.map { (c, m) -> "${c.type}.${m.name}" }}")
        return hits.single()
    }

    @Test
    fun `Enable Premium forces the premium state flow to true`() {
        val root = repoRoot()
        val apk = File(root, "apks/bluecoins/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "13.1.149",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // Step 1: the salted-value verifier hands Boolean.TRUE to the downstream collector.
        // The downstream call is the invoke-interface with the emitter's own name and shape.
        val (emitterClass, emitter) = classes.methodWithLogPrefix(PREMIUM_STATE_LOG)
        val insns = emitter.instructions()
        val logIndex = insns.indexOfFirst { it.stringOrNull()?.startsWith(PREMIUM_STATE_LOG) == true }
        val emitIndex = (logIndex + 1 until insns.size).firstOrNull { i ->
            val call = (insns[i] as? ReferenceInstruction)?.reference as? MethodReference
            (insns[i].opcode == Opcode.INVOKE_INTERFACE || insns[i].opcode == Opcode.INVOKE_INTERFACE_RANGE) &&
                call?.name == emitter.name && call.returnType == emitter.returnType &&
                call.parameterTypes.map(CharSequence::toString) == emitter.parameterTypes.map(CharSequence::toString)
        } ?: error("downstream emit not found in ${emitterClass.type}.${emitter.name}")
        val valueRegister = when (val call = insns[emitIndex]) {
            is FiveRegisterInstruction -> call.registerD
            is RegisterRangeInstruction -> call.startRegister + 1
            else -> error("unexpected emit format ${call.opcode}")
        }
        assertTrue(
            insns[emitIndex - 1].isBooleanTrue(valueRegister),
            "${emitterClass.type}.${emitter.name} does not emit Boolean.TRUE; " +
                "instruction before the emit is ${insns[emitIndex - 1].opcode}",
        )

        // Step 2: the Google Play version override combine lambda returns TRUE immediately.
        // Like the patch, require it whenever the use case reads "versionOverride" (13.1.149+).
        val hasOverride = classes.any { cls ->
            cls.methods.any { m ->
                val strings = m.instructions().mapNotNull { it.stringOrNull() }
                "premiumKey" in strings && "versionOverride" in strings
            }
        }
        if (!hasOverride) return
        val (combineClass, combine) = classes.methodWithLogPrefix(OVERRIDE_LOG)
        val first = combine.instructions().getOrNull(0)
        val second = combine.instructions().getOrNull(1)
        val label = "${combineClass.type}.${combine.name} (premium override combine)"
        assertTrue(
            first != null && first.opcode == Opcode.SGET_OBJECT &&
                first.isBooleanTrue((first as OneRegisterInstruction).registerA),
            "$label does not start with Boolean.TRUE; first instruction is ${first?.opcode}",
        )
        assertTrue(
            second?.opcode == Opcode.RETURN_OBJECT &&
                (second as OneRegisterInstruction).registerA == (first as OneRegisterInstruction).registerA,
            "$label does not return Boolean.TRUE immediately; second instruction is ${second?.opcode}",
        )
    }
}
