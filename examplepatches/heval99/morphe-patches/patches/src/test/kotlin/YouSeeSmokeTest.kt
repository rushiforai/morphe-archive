import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "yiuo.mobile.tv"
private const val VERSION = "13.12.0 (build 22025)"
private const val ANALYTICS_REGISTRAR =
    "Lcom/google/firebase/analytics/connector/internal/AnalyticsConnectorRegistrar;"

class YouSeeSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable telemetry sets the Firebase switches and drops the analytics component`() {
        val root = repoRoot()
        val apk = File(root, "apks/yousee/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf("Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // 1. The analytics component registers nothing.
        val registrar = classes.singleOrNull { it.type == ANALYTICS_REGISTRAR }
            ?: error("$ANALYTICS_REGISTRAR not found in emitted dexes")
        val getComponents = registrar.methods.single {
            it.name == "getComponents" && it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/util/List;"
        }
        val insns = getComponents.instructions().toList()
        val first = insns.getOrNull(0)
        val field = (first as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            first?.opcode == Opcode.SGET_OBJECT && field?.definingClass == "Ljava/util/Collections;" &&
                field.name == "EMPTY_LIST" && insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
            "$ANALYTICS_REGISTRAR.getComponents() does not return an empty component list; got " +
                insns.take(3).map { it.opcode },
        )

        // 2. The Firebase switches (all four SDKs and the ad ID) are forced in the bytecode; the
        // manifest is no longer edited, so component discovery stays declared as in stock.
        assertFirebaseSwitchesForced(classes, analytics = true, crashlytics = true, sessions = true, performance = true)
    }
}
