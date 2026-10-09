import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.camerasideas.trimmer"

class YouCutSmokeTest {

    @TempDir
    lateinit var workDir: File

    // Mirrors SubscribedCheckFingerprint: R8 rotates the billing helper's class name, so the
    // gate is the public static (Context)Z method holding both subscription preference keys.
    // returnEarly(true) only prepends, so the original strings are still in the patched body.
    private fun Method.isSubscribedCheck(): Boolean {
        if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" ||
            parameterTypes.map(CharSequence::toString) != listOf("Landroid/content/Context;")
        ) return false
        val strings = instructions().mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
        }.toSet()
        return "SubscribePro" in strings && "com.camerasideas.trimmer.vip" in strings
    }

    @Test
    fun `Enable Pro forces the subscribed check`() {
        val root = repoRoot()
        val apk = File(root, "apks/youcut/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.721.1224",
            patchNames = setOf("Enable Pro"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val gates = classes.flatMap { cls ->
            cls.methods.filter { it.isSubscribedCheck() }.map { cls to it }
        }
        assertTrue(gates.size == 1, "expected exactly one subscribed check, found ${gates.map { (c, m) -> "${c.type}.${m.name}" }}")
        val (billing, gate) = gates.single()

        assertForcedBoolean(gate, expected = true, label = "${billing.type}.${gate.name}(Context) (is subscribed)")
    }
}
