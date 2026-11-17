import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.pzolee.bluetoothscanner"
private const val INTERSTITIAL_UNIT = "ca-app-pub-9043738977093939/5919566899"
private const val ADVIEW = "Lcom/google/android/gms/ads/AdView;"

class BluetoothFinderSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.stringRef(): String? =
        ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Instruction.typeRef(): String? =
        ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

    @Test
    fun `Disable ads stops the MobileAds init listener from loading the banner and interstitial`() {
        val root = repoRoot()
        val apk = File(root, "apks/bluetoothfinder/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.9.4",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // The R8-renamed init-complete listener (1.9.3: ib0.a(q40)), found like the patch does: the
        // live interstitial unit, (one param)V and a check-cast to AdView. It returns at once.
        val listeners = classes.flatMap { classDef ->
            classDef.methods.filter { method ->
                method.returnType == "V" && method.parameterTypes.size == 1 &&
                    method.instructions().any { it.stringRef() == INTERSTITIAL_UNIT } &&
                    method.instructions().any { it.typeRef() == ADVIEW }
            }.map { classDef to it }
        }
        val (listenerClass, listener) = listeners.singleOrNull()
            ?: error("expected one MobileAds init-complete listener; found ${listeners.map { "${it.first.type}.${it.second.name}" }}")
        assertReturnsEarlyVoid(
            listener,
            label = "${listenerClass.type}.${listener.name}(${listener.parameterTypes.joinToString()})",
        )
    }
}
