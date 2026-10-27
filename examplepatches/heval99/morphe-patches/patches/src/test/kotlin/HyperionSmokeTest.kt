import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "projekt.launcher"
private const val APP = "Lprojekt/launcher/App;"
private const val BOOLEAN = "Ljava/lang/Boolean;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"

class HyperionSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef(): MethodReference? =
        (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.fieldRef(): FieldReference? =
        (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun Instruction.isBoolean(name: String): Boolean =
        opcode == Opcode.SGET_OBJECT && fieldRef()?.let { it.definingClass == BOOLEAN && it.name == name } == true

    private fun Method.params() = parameterTypes.map(CharSequence::toString)

    private fun Method.calls(definingClass: String, name: String) =
        instructions().any { it.methodRef()?.let { ref -> ref.definingClass == definingClass && ref.name == name } == true }

    // Mirrors the patch: the holder declares the app's only token signer, a static
    // (Context, String, String, String)String using SecretKeySpec, Mac and Base64.
    private fun isPremiumHolder(cls: ClassDef): Boolean = cls.methods.any { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == STRING &&
            method.params() == listOf("Landroid/content/Context;", STRING, STRING, STRING) &&
            method.calls("Ljavax/crypto/spec/SecretKeySpec;", "<init>") &&
            method.calls("Ljavax/crypto/Mac;", "getInstance") &&
            method.calls("Landroid/util/Base64;", "encodeToString")
    }

    private fun List<Instruction>.lastWriterBefore(index: Int, register: Int): Int? =
        (index - 1 downTo 0).firstOrNull { i ->
            val instruction = this[i]
            instruction.opcode.setsRegister() && instruction is OneRegisterInstruction &&
                instruction.registerA == register
        }

    // Writes into the flow: (Object, Object)Z on the flow type, receiver loaded from the field.
    // Returns the index of the instruction that last set the written value.
    private fun Method.flowValueSources(flow: FieldReference): List<Int> {
        val insns = instructions()
        return insns.withIndex().mapNotNull { (index, instruction) ->
            val call = instruction.methodRef() ?: return@mapNotNull null
            if (instruction.opcode != Opcode.INVOKE_VIRTUAL || call.definingClass != flow.type ||
                call.returnType != "Z" || call.parameterTypes.map(CharSequence::toString) != listOf(OBJECT, OBJECT)
            ) return@mapNotNull null
            val invoke = instruction as FiveRegisterInstruction
            val receiver = insns.lastWriterBefore(index, invoke.registerC) ?: return@mapNotNull null
            val field = insns[receiver].fieldRef()
            if (insns[receiver].opcode != Opcode.SGET_OBJECT || field?.definingClass != flow.definingClass ||
                field.name != flow.name
            ) return@mapNotNull null
            insns.lastWriterBefore(index, invoke.registerE)
        }
    }

    @Test
    fun `Enable Premium keeps the premium flow true`() {
        val root = repoRoot()
        val apk = File(root, "apks/hyperion/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "2.2.13",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val holder = classes.singleOrNull { isPremiumHolder(it) }
            ?: error("premium holder (token signer shape) not found in emitted dexes")

        // 3. <clinit> seeds the flow from Boolean.TRUE: TRUE -> MutableStateFlow(Object) ->
        // sput-object into the holder's own field, and FALSE is no longer loaded.
        val clinit = holder.method("<clinit>")
        val clinitInsns = clinit.instructions()
        val seed = clinitInsns.indexOfFirst { it.opcode == Opcode.SGET_OBJECT && it.fieldRef()?.definingClass == BOOLEAN }
        assertTrue(seed >= 0 && clinitInsns[seed].isBoolean("TRUE"), "${holder.type}.<clinit> does not seed Boolean.TRUE")
        assertTrue(clinitInsns.none { it.isBoolean("FALSE") }, "${holder.type}.<clinit> still loads Boolean.FALSE")
        val factory = clinitInsns[seed + 1].methodRef()
        val store = clinitInsns[seed + 3]
        val flow = store.fieldRef()
        assertTrue(
            clinitInsns[seed + 1].opcode == Opcode.INVOKE_STATIC && factory?.parameterTypes?.map(CharSequence::toString) == listOf(OBJECT) &&
                store.opcode == Opcode.SPUT_OBJECT && flow?.definingClass == holder.type && flow.type == factory.returnType,
            "${holder.type}.<clinit> does not store the seeded flow in its own field"
        )
        flow!!

        // 2. Every static no-arg void (not <clinit>) that writes FALSE into the flow, i.e. the
        // reset, now returns at once. Its original body stays behind the return-void.
        val resets = holder.methods.filter { method ->
            method.name != "<clinit>" && method.returnType == "V" && method.parameterTypes.isEmpty() &&
                AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null &&
                method.flowValueSources(flow).any { method.instructions()[it].isBoolean("FALSE") }
        }
        assertTrue(resets.isNotEmpty(), "no reset writing FALSE into ${flow.name} found in ${holder.type}")
        resets.forEach { assertReturnsEarlyVoid(it, label = "${holder.type}.${it.name}() (premium reset)") }

        // 1. App.onCreate loads 1 into the boolean right before the Boolean.valueOf whose
        // result it writes into the flow.
        val onCreate = classes.firstOrNull { it.type == APP }?.method("onCreate", emptyList())
            ?: error("$APP not found in emitted dexes")
        val insns = onCreate.instructions()
        val valueOfs = onCreate.flowValueSources(flow).mapNotNull { source ->
            val box = insns.getOrNull(source - 1)
            val ref = box?.methodRef()
            if (insns[source].opcode == Opcode.MOVE_RESULT_OBJECT && box?.opcode == Opcode.INVOKE_STATIC &&
                ref?.definingClass == BOOLEAN && ref.name == "valueOf"
            ) source - 1 else null
        }
        assertTrue(valueOfs.isNotEmpty(), "App.onCreate writes no Boolean.valueOf(Z) into ${flow.name}")
        valueOfs.forEach { index ->
            val register = (insns[index] as FiveRegisterInstruction).registerC
            val const = insns.getOrNull(index - 1)
            assertTrue(
                const is NarrowLiteralInstruction && const.opcode == Opcode.CONST_4 &&
                    const.narrowLiteral == 1 && (const as OneRegisterInstruction).registerA == register,
                "App.onCreate does not load 1 into v$register before Boolean.valueOf; found ${const?.opcode}"
            )
        }
    }
}
