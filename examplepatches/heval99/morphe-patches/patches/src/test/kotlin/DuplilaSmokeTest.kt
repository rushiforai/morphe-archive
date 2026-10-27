import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.duplila.screenshare"
private const val GMA = "Lcom/google/android/gms/ads/"

class DuplilaSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.calls(definingClass: String, name: String) = instructions().any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == definingClass && ref.name == name
    }

    @Test
    fun `license check, premium check, consent flow, banner and GMA are patched`() {
        val root = repoRoot()
        val apk = File(root, "apks/duplila/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk, workDir = workDir, pkg = PKG, version = "5.3",
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

        // Disable ads, step 1: the UMP consent flow, found like the fingerprint.
        val consentFlows = classes.flatMap { c -> c.methods.map { c to it } }.filter { (_, m) ->
            m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                m.calls("Lcom/google/android/ump/ConsentInformation;", "requestConsentInfoUpdate")
        }
        assertEquals(1, consentFlows.size, "expected one consent flow method, found ${consentFlows.map { it.first.type }}")
        val (consentOwner, consentFlow) = consentFlows.single()
        assertReturnsEarlyVoid(consentFlow, label = "${consentOwner.type}.${consentFlow.name}(Z)")

        // Step 2: the banner composable, in the class whose AdView factory loads the banner.
        val bannerClass: ClassDef = classes.single { c ->
            !c.type.startsWith("Lcom/google/") && c.methods.any {
                it.returnType == "${GMA}AdView;" &&
                    it.calls("${GMA}AdView;", "setAdUnitId") && it.calls("${GMA}AdView;", "loadAd")
            }
        }
        val bannerView = bannerClass.methods.single {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(
                    "Landroidx/compose/ui/Modifier;", "Z", "Landroidx/compose/runtime/Composer;", "I", "I",
                )
        }
        assertReturnsEarlyVoid(bannerView, label = "${bannerClass.type}.${bannerView.name}")

        // Step 3: rule 9, every MobileAds static void is a no-op (the banner's own
        // setRequestConfiguration + initialize included) and first-party id answers false.
        val mobileAds = cls("${GMA}MobileAds;")
        val ctx = "Landroid/content/Context;"
        for ((name, parameters) in listOf(
            "initialize" to listOf(ctx),
            "initialize" to listOf(ctx, "${GMA}initialization/OnInitializationCompleteListener;"),
            "setRequestConfiguration" to listOf("${GMA}RequestConfiguration;"),
            "setAppVolume" to listOf("F"),
            "setAppMuted" to listOf("Z"),
        )) {
            assertReturnsEarlyVoid(mobileAds.method(name, parameters), label = "MobileAds.$name(${parameters.joinToString()})")
        }
        mobileAds.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                it.implementation != null && it.name != "<clinit>"
        }.forEach { method ->
            assertReturnsEarlyVoid(method, label = "MobileAds.${method.name}(${method.parameterTypes.joinToString()})")
        }
        assertForcedBoolean(
            mobileAds.method("putPublisherFirstPartyIdEnabled", listOf("Z")),
            expected = false,
            label = "MobileAds.putPublisherFirstPartyIdEnabled(Z)",
        )
        assertReturnsEarlyVoid(
            cls("${GMA}BaseAdView;").method("loadAd", listOf("${GMA}AdRequest;")),
            label = "BaseAdView.loadAd(AdRequest)",
        )
    }
}
