import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
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

private const val PKG = "com.fenchtose.reflog"
private const val BOTTOM_BAR = "Lcom/fenchtose/reflog/widgets/bottomnavigation/BottomNavigationBar;"

class TaskitoSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.strings() = instructions().mapNotNull { instruction ->
        (instruction as? ReferenceInstruction)?.reference as? StringReference
    }.map { it.string }

    /** The no-arg Boolean getter that reads the `premium` and `sku_` preference keys, found like the patch. */
    private fun premiumGetters(classes: List<ClassDef>) = classes
        .flatMap { it.methods }
        .filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() && method.implementation != null &&
                method.strings().let { "premium" in it && "sku_" in it }
        }

    /** The bottom-bar builder, found like Hide Premium tab: bar return type plus both strings. */
    private fun bottomBarBuilders(classes: List<ClassDef>) = classes
        .flatMap { it.methods }
        .filter { method ->
            method.returnType == BOTTOM_BAR && method.parameterTypes.isEmpty() && method.implementation != null &&
                method.strings().let { "premium" in it && "base_activity" in it }
        }

    /** The if-eqz guarding the "premium" tab: the last one before its const-string. */
    private fun premiumTabGuard(instructions: List<Instruction>): Int {
        val premiumTab = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as ReferenceInstruction).reference as StringReference).string == "premium"
        }
        assertTrue(premiumTab > 0, "no \"premium\" tab in the bottom-bar builder")
        return (premiumTab - 1 downTo 0).first { instructions[it].opcode == Opcode.IF_EQZ }
    }

    @Test
    fun `Enable Premium forces the premium getter and Hide Premium tab drops the tab`() {
        val root = repoRoot()
        val apk = File(root, "apks/taskito/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val stockClasses = patchedApkClasses(apk)
        val stock = premiumGetters(stockClasses)
        assertEquals(1, stock.size, "premium getters on the keeper: ${stock.map { it.name }}")
        val getter = stock.single()

        val stockBuilders = bottomBarBuilders(stockClasses)
        assertEquals(1, stockBuilders.size, "bottom-bar builders: ${stockBuilders.map { "${it.definingClass}->${it.name}" }}")
        val stockBuilder = stockBuilders.single()
        val stockBuilderCode = stockBuilder.instructions()
        val stockGuard = premiumTabGuard(stockBuilderCode)
        assertEquals(
            Opcode.MOVE_RESULT, stockBuilderCode[stockGuard - 1].opcode,
            "stock: the \"premium\" tab guard should test a call result",
        )

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.3.4",
            patchNames = setOf("Enable Premium", "Hide Premium tab"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // Enable Premium: the purchase keeper's premium getter returns true.
        val patched = classes.filter { it.type == getter.definingClass }.flatMap { it.methods }
            .single { it.name == getter.name && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        assertForcedBoolean(patched, expected = true, label = "${getter.definingClass}->${patched.name}()Z")

        // Hide Premium tab: the experiment result is zeroed right before the if-eqz that skips
        // the tab, so the branch always jumps past it. The rest of the builder is unchanged.
        val builder = classes.filter { it.type == stockBuilder.definingClass }.flatMap { it.methods }
            .single { it.name == stockBuilder.name && it.parameterTypes.isEmpty() && it.returnType == BOTTOM_BAR }
        val code = builder.instructions()
        val guard = premiumTabGuard(code)
        val register = (code[guard] as OneRegisterInstruction).registerA
        val forced = code[guard - 1]
        val label = "${builder.definingClass}->${builder.name}()"
        assertTrue(
            forced.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16) &&
                (forced as OneRegisterInstruction).registerA == register &&
                (forced as NarrowLiteralInstruction).narrowLiteral == 0,
            "$label: expected const v$register, 0x0 before the \"premium\" tab guard, found ${forced.opcode}",
        )
        assertEquals(
            Opcode.MOVE_RESULT, code[guard - 2].opcode,
            "$label: the zeroed register should be the experiment check's result",
        )
        assertEquals(stockBuilderCode.size + 1, code.size, "$label: the patch should add exactly one instruction")
    }
}
