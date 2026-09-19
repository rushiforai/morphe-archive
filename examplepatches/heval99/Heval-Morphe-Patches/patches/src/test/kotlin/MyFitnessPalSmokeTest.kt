import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.myfitnesspal.android"
private const val ENTITLEMENTS = "Lcom/myfitnesspal/queryenvoy/domain/model/subscriptions/entitlements/"

class MyFitnessPalSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun assertReturnsEnumConstant(
        method: Method,
        enumType: String,
        field: String,
        label: String,
    ) {
        val insns = method.instructions()
        val first = insns.getOrNull(0) as? ReferenceInstruction
        val ref = first?.reference as? FieldReference
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

    @Test
    fun `Enable Premium+ forces the queryenvoy entitlement and tier parsers`() {
        val root = repoRoot()
        val apk = File(root, "apks/myfitnesspal/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "26.37.0",
            patchNames = setOf("Enable Premium+"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        assertReturnsEnumConstant(
            klass("${ENTITLEMENTS}Entitlement\$a;").method("a", listOf("Ljava/lang/String;")),
            enumType = "${ENTITLEMENTS}Entitlement;",
            field = "Entitled",
            label = "Entitlement parser",
        )
        assertReturnsEnumConstant(
            klass("${ENTITLEMENTS}Tier\$a;").method("a", listOf("Ljava/lang/String;")),
            enumType = "${ENTITLEMENTS}Tier;",
            field = "PremiumPlus",
            label = "Tier parser",
        )
    }
}
