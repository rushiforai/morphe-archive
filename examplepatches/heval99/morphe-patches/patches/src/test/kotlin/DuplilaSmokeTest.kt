import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.duplila.screenshare"
private const val MAIN_ACTIVITY = "Lcom/duplila/screenshare/main/MainActivity;"

class DuplilaSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.calls(definingClass: String, name: String) = instructions().any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == definingClass && ref.name == name
    }

    private fun Method.hasString(value: String) = instructions().any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    }

    @Test
    fun `license check, premium check, consent flow, banner and banner load are patched`() {
        val root = repoRoot()
        val apk = File(root, "apks/duplila/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk, workDir = workDir, pkg = PKG, version = "5.4",
            patchNames = setOf("Disable license check", "Enable Premium", "Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        fun cls(type: String) = classes.firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

        // Disable license check: PairIP.
        assertReturnsEarlyVoid(
            cls("Lcom/pairip/licensecheck/LicenseClient;").method("checkLicense", listOf("Landroid/content/Context;")),
            label = "LicenseClient.checkLicense(Context)",
        )

        // Enable Premium: userPaid() returns Boolean.TRUE before the IO switch / purchase query.
        val userPaid = cls("Lcom/duplila/screenshare/billing/BillingManager;")
            .method("userPaid", listOf("Lkotlin/coroutines/Continuation;"))
        val insns = userPaid.instructions()
        val field = (insns.getOrNull(0) as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            insns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT &&
                field?.definingClass == "Ljava/lang/Boolean;" && field.name == "TRUE",
            "BillingManager.userPaid does not start with Boolean.TRUE; first is ${insns.getOrNull(0)?.opcode} $field"
        )
        assertTrue(
            insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
            "BillingManager.userPaid does not return at once; second is ${insns.getOrNull(1)?.opcode}"
        )
        assertTrue(
            userPaid.calls("Lkotlinx/coroutines/BuildersKt;", "withContext"),
            "BillingManager.userPaid no longer holds the original withContext call (wrong method?)"
        )

        // Disable ads, step 1: the UMP consent flow, found like the fingerprint (the (Z)V
        // MainActivity method reading getConsentInformation()).
        val consentFlows = cls(MAIN_ACTIVITY).methods.filter {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                it.calls(MAIN_ACTIVITY, "getConsentInformation")
        }
        assertEquals(1, consentFlows.size, "expected one consent flow method, found ${consentFlows.map { it.name }}")
        assertReturnsEarlyVoid(consentFlows.single(), label = "MainActivity.${consentFlows.single().name}(Z)")

        // Step 2: the banner composable, found by its "Cannot show ads" filler row.
        val bannerViews = classes.flatMap { c -> c.methods.map { c to it } }.filter { (_, m) ->
            val parameters = m.parameterTypes.map(CharSequence::toString)
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && parameters.size == 5 &&
                parameters[1] == "Z" && parameters[3] == "I" && parameters[4] == "I" &&
                m.hasString("Cannot show ads")
        }
        assertEquals(1, bannerViews.size, "expected one banner composable, found ${bannerViews.map { it.first.type }}")
        val (bannerClass, bannerView) = bannerViews.single()
        assertReturnsEarlyVoid(bannerView, label = "${bannerClass.type}.${bannerView.name}")

        // Step 3: BaseAdView.loadAd (R8-renamed), the method that creates the runnable carrying
        // GMA's "BaseAdView.loadAd" crash tag; BaseAdView is that runnable's ViewGroup field.
        val loadRunnable = classes.single { c ->
            c.methods.any { it.name == "run" && it.returnType == "V" && it.hasString("BaseAdView.loadAd") }
        }
        val baseAdView = loadRunnable.fields.map { it.type }
            .mapNotNull { type -> classes.firstOrNull { it.type == type } }
            .single { it.superclass == "Landroid/view/ViewGroup;" }
        val loadAd = baseAdView.methods.single { method ->
            method.returnType == "V" && method.parameterTypes.size == 1 && method.instructions().any {
                it.opcode == Opcode.NEW_INSTANCE &&
                    ((it as ReferenceInstruction).reference as? TypeReference)?.type == loadRunnable.type
            }
        }
        assertReturnsEarlyVoid(loadAd, label = "BaseAdView.loadAd (${baseAdView.type}.${loadAd.name})")
    }
}
