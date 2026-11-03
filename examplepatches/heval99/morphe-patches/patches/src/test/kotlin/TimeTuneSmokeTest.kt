import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.gmail.jmartindev.timetune"

class TimeTuneSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun premiumGetters(classes: List<ClassDef>) = classes.flatMap { cls ->
        cls.methods.filter { method ->
            method.returnType == "Z" &&
                method.parameterTypes == listOf("Landroid/content/Context;") &&
                method.implementation != null &&
                method.instructions().mapNotNull { instruction ->
                    (instruction as? ReferenceInstruction)?.reference as? StringReference
                }.any { it.string == "PREF_PREMIUM_SUBS" }
        }.map { cls to it }
    }

    @Test
    fun `Enable Premium forces the subscription getter to true`() {
        val root = repoRoot()
        val apk = File(root, "apks/timetune/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val stock = premiumGetters(patchedApkClasses(apk))
        assertEquals(1, stock.size, "subscription getters: ${stock.map { "${it.second.definingClass}->${it.second.name}" }}")
        val (cls, getter) = stock.single()

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "5.6.3",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val patched = classes.single { it.type == cls.type }
            .methods.single { it.name == getter.name && it.parameterTypes == getter.parameterTypes && it.returnType == "Z" }
        assertForcedBoolean(patched, expected = true, label = "${cls.type}->${getter.name}(Context)Z")
    }
}
