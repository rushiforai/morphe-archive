import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.twodoor.bookly"
private const val CUSTOMER_INFO = "Lcom/revenuecat/purchases/CustomerInfo;"
private const val PREMIUM_PRODUCT = "chest_of_diamonds_3000"
private const val MANAGER = "Lcom/twodoorgames/bookly/subscription/SubscriptionManager;"
private const val ACTIVE = "Lcom/twodoorgames/bookly/subscription/SubscriptionState\$Active;"

class BooklySmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.label() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    private fun Method.strings() = implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }.orEmpty()

    @Test
    fun `Enable Premium forces the lifetime check and seeds Active`() {
        val root = repoRoot()
        val apk = File(root, "apks/bookly/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "2.4.2",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"

        // 1. The lifetime entitlement check returns true at once.
        val checks = classes.flatMap { it.methods }.filter {
            it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(CUSTOMER_INFO) &&
                PREMIUM_PRODUCT in it.strings()
        }
        assertEquals(1, checks.size, "lifetime checks: ${checks.map { it.label() }}")
        assertForcedBoolean(checks.single(), expected = true, label = "lifetime check", diagnostics = diagnostics)

        // 2. The subscription manager is seeded with Active instead of Unknown.
        val manager = classes.single { it.type == MANAGER }
        val ctor = manager.methods.single { it.name == "<init>" }
        val insns = ctor.implementation!!.instructions.toList()
        val active = insns.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.SGET_OBJECT && reference?.type == ACTIVE
        }
        assertTrue(
            active < 0,
            "the constructor still reads a static Active field",
        )
        assertTrue(
            insns.any {
                it.opcode == Opcode.NEW_INSTANCE &&
                    ((it as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.TypeReference)
                        ?.type == ACTIVE
            },
            "the constructor does not create $ACTIVE\n$diagnostics",
        )
    }
}
