import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.foobnix.pdf.reader"

class LibreraSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.strings() = instructions().mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }

    @Test
    fun `Disable ads forces the ad gate off and the reward window open`() {
        val root = repoRoot()
        val apk = File(root, "apks/librera/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "10.0.22",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val methods = classes.flatMap { c -> c.methods.map { c to it } }

        // AppsConfig.isShowAdsInApp(Context) is R8-renamed since 10.0; found like the fingerprint
        // by its "no-ads old device" log line and the Pro app package check.
        val adGates = methods.filter { (_, m) ->
            m.returnType == "Z" && m.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                m.strings().any { it.startsWith("no-ads old device") } &&
                "com.foobnix.pro.pdf.reader" in m.strings()
        }
        assertEquals(1, adGates.size, "expected one isShowAdsInApp, found ${adGates.map { it.first.type }}")
        val (adGateClass, adGate) = adGates.single()
        assertForcedBoolean(adGate, expected = false, label = "isShowAdsInApp (${adGateClass.type}.${adGate.name})")

        // Every isRewardActivated()Z copy: ADS's own (static since 10.0) and the one R8 inlined
        // into AdsFragmentActivity.
        val rewardGates = methods.filter { (_, m) ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() && "isRewardActivated" in m.strings()
        }
        assertTrue(
            rewardGates.any { (_, m) -> AccessFlags.STATIC.isSet(m.accessFlags) },
            "ADS.isRewardActivated (static ()Z) not found among ${rewardGates.map { "${it.first.type}.${it.second.name}" }}"
        )
        rewardGates.forEach { (c, m) ->
            assertForcedBoolean(m, expected = true, label = "isRewardActivated (${c.type}.${m.name})")
        }
    }
}
