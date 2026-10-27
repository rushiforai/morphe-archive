import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.myfitnesspal.android"
private const val ENTITLEMENTS = "Lcom/myfitnesspal/queryenvoy/domain/model/subscriptions/entitlements/"
private const val OBSERVABILITY = "Lcom/myfitnesspal/platform/observability/datadog/"
private const val RUM_START_DECISION = "${OBSERVABILITY}DatadogRumStartDecision;"
private const val SKIP_REASON = "${OBSERVABILITY}DatadogRumStartDecision\$SkipReason;"

private val MFP_PATCHES = setOf(
    "Enable Premium+",
    "Disable Datadog telemetry",
)

class MyFitnessPalSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)

    private fun ReferenceInstruction?.field(): FieldReference? = this?.reference as? FieldReference

    private fun assertReturnsEnumConstant(
        method: Method,
        enumType: String,
        field: String,
        label: String,
    ) {
        val insns = method.instructions()
        val first = insns.getOrNull(0) as? ReferenceInstruction
        val ref = first.field()
        assertTrue(
            first != null && first.opcode == Opcode.SGET_OBJECT &&
                ref != null && ref.definingClass == enumType && ref.name == field,
            "$label does not return $enumType.$field; first instruction is ${first?.opcode} $ref",
        )
        assertTrue(
            insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
            "$label does not return immediately; second instruction is ${insns.getOrNull(1)?.opcode}",
        )
    }

    /** The companion's static (String) -> enum parser, found by shape like the patch does. */
    private fun List<ClassDef>.companionParser(enumType: String): Method =
        filter { it.type.startsWith(enumType.removeSuffix(";") + "\$") }
            .flatMap { it.methods }
            .filter {
                AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == enumType &&
                    it.params() == listOf("Ljava/lang/String;")
            }
            .singleOrNull() ?: error("no single (String) -> $enumType companion parser")

    @Test
    fun `MyFitnessPal patches force the entitlement parsers and skip Datadog`() {
        val root = repoRoot()
        val apk = File(root, "apks/myfitnesspal/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "26.42.0",
            patchNames = MFP_PATCHES,
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // Enable Premium+: both server-string parsers return the top constant at once.
        assertReturnsEnumConstant(
            classes.companionParser("${ENTITLEMENTS}Entitlement;"),
            enumType = "${ENTITLEMENTS}Entitlement;",
            field = "Entitled",
            label = "Entitlement parser",
        )
        assertReturnsEnumConstant(
            classes.companionParser("${ENTITLEMENTS}Tier;"),
            enumType = "${ENTITLEMENTS}Tier;",
            field = "PremiumPlus",
            label = "Tier parser",
        )

        // Disable Datadog telemetry: the start decision (found by its return type and its
        // `new Skip(FLAG_DISABLED)` branch) now returns Skip(FLAG_DISABLED) before anything else.
        val decision = classes.flatMap { it.methods }.filter { it.returnType == RUM_START_DECISION }
            .singleOrNull { method ->
                val insns = method.instructions()
                insns.indices.any { i ->
                    val f = (insns[i] as? ReferenceInstruction).field()
                    insns[i].opcode == Opcode.SGET_OBJECT && f?.definingClass == SKIP_REASON &&
                        f.name == "FLAG_DISABLED" && insns.getOrNull(i + 1)?.opcode == Opcode.INVOKE_DIRECT
                }
            } ?: error("no single Datadog start decision method returning $RUM_START_DECISION")
        val insns = decision.instructions()
        val skipType = ((insns.getOrNull(0) as? ReferenceInstruction)?.reference as? TypeReference)?.type
        val reason = (insns.getOrNull(1) as? ReferenceInstruction).field()
        val init = (insns.getOrNull(2) as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            insns.getOrNull(0)?.opcode == Opcode.NEW_INSTANCE && skipType != null &&
                skipType.startsWith(OBSERVABILITY) && skipType != RUM_START_DECISION,
            "Datadog start decision does not build a Skip first; got ${insns.getOrNull(0)?.opcode} $skipType",
        )
        assertTrue(
            insns[1].opcode == Opcode.SGET_OBJECT && reason?.definingClass == SKIP_REASON &&
                reason.name == "FLAG_DISABLED",
            "Datadog start decision does not load SkipReason.FLAG_DISABLED second; got ${insns[1].opcode} $reason",
        )
        assertTrue(
            insns[2].opcode == Opcode.INVOKE_DIRECT && init != null && init.definingClass == skipType &&
                init.name == "<init>" && init.parameterTypes.map(CharSequence::toString) == listOf(SKIP_REASON),
            "Datadog start decision does not construct $skipType(SkipReason); got ${insns[2].opcode} $init",
        )
        assertTrue(
            insns.getOrNull(3)?.opcode == Opcode.RETURN_OBJECT,
            "Datadog start decision does not return the Skip; got ${insns.getOrNull(3)?.opcode}",
        )
    }
}
