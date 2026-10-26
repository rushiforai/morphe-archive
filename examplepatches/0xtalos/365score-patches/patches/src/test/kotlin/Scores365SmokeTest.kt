import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import kotlin.test.assertTrue

private const val PKG = "com.scores365"
private const val ENTITLEMENT_STATE = "Lcom/scores365/billingClient/entitlement/EntitlementState;"
private const val BASE_ACTIVITY = "Lcom/scores365/Design/Activities/BaseActivity;"
private const val BASE_ACTION_BAR_ACTIVITY = "Lcom/scores365/Design/Activities/BaseActionBarActivity;"
private const val MAIN_DASHBOARD = "Lcom/scores365/dashboard/MainDashboardActivity;"
private const val SPLASH = "Lcom/scores365/ui/Splash;"

class Scores365SmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `365Scores patches unlock premium, remove ads and update prompts, and defuse play services update`() {
        val root = repoRoot()
        val apk = File(root, "base.apk")

        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "14.9.7",
            patchNames = setOf(
                "Disable ads", "Unlock premium", "Block update screen", "GmsCore support", "Spoof signature",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }

        assertDisableAds(classes, byType)
        assertUnlockPremium(byType)
        assertBlockUpdateScreen(byType)
        assertGmsCoreSupport(classes, byType)
        assertGoogleSignInWiring(classes)
    }

    @Test
    fun `365Scores default patches without GmsCore defuse play services update and disable ads`() {
        val root = repoRoot()
        val apk = File(root, "base.apk")

        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "14.9.7",
            patchNames = setOf(
                "Disable ads", "Unlock premium", "Block update screen",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }

        assertDisableAds(classes, byType)
        assertUnlockPremium(byType)
        assertBlockUpdateScreen(byType)
    }

    private fun assertDisableAds(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        val mobileAds = byType["Lcom/google/android/gms/ads/MobileAds;"]
            ?: error("MobileAds not found in emitted dexes")
        assertReturnsEarlyVoid(
            mobileAds.method("initialize", listOf("Landroid/content/Context;")),
            label = "MobileAds.initialize(Context)",
        )
        assertReturnsEarlyVoid(
            mobileAds.method(
                "initialize",
                listOf(
                    "Landroid/content/Context;",
                    "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;",
                ),
            ),
            label = "MobileAds.initialize(Context, Listener)",
        )
        assertMobileAdsStaticsNeutralised(mobileAds)

        val gates = classes.flatMap { cls ->
            cls.methods.filter {
                it.name in setOf("showAdsForContext", "isBannerNeedToBeShown") &&
                    it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
            }.map { cls to it }
        }
        for (type in listOf(
            BASE_ACTION_BAR_ACTIVITY,
            "Lcom/scores365/Design/Activities/BottomNavigationActivity;",
            "Lcom/scores365/gameCenter/GameCenterBaseActivity;",
            "Lcom/scores365/ui/WebViewActivity;",
        )) {
            assertTrue(gates.any { (cls, _) -> cls.type == type }, "no app ad gate patched in $type")
        }
        for ((cls, method) in gates) {
            assertForcedBoolean(method, expected = false, label = "${cls.type}.${method.name}()")
        }
    }

    private fun assertUnlockPremium(byType: Map<String, ClassDef>) {
        val state = byType[ENTITLEMENT_STATE] ?: error("$ENTITLEMENT_STATE not found")
        val constructor = state.method(
            "<init>",
            listOf("Z", "Z", "Z", "Z", "Z", "Ljava/util/Set;", "Ljava/util/List;", "J", "Z"),
        )
        val p1 = constructor.implementation!!.registerCount - 10
        val insns = constructor.instructions()
        for (slot in 0 until 5) {
            val insn = insns.getOrNull(slot)
            assertTrue(
                insn?.opcode == Opcode.CONST_16 &&
                    (insn as OneRegisterInstruction).registerA == p1 + slot &&
                    (insn as WideLiteralInstruction).wideLiteral == 1L,
                "EntitlementState.<init> instruction $slot is not const/16 p${slot + 1}, 0x1",
            )
        }

        for (getter in listOf(
            "isPremium", "getAdsFree", "getTipster", "getPlus", "getDelayedNotifications", "getNotificationSounds",
        )) {
            assertForcedBoolean(state.method(getter, emptyList()), expected = true, label = "EntitlementState.$getter()")
        }

        val removeAds = byType["Lcom/scores365/removeAds/RemoveAdsBasicActivity;"]
            ?: error("RemoveAdsBasicActivity not found")
        val strings = removeAds.method("onCreate", listOf("Landroid/os/Bundle;")).instructions().mapNotNull { it.stringOrNull() }
        assertTrue("iabc_fnrts" !in strings, "RemoveAdsBasicActivity.onCreate still reads \"iabc_fnrts\"")
        assertTrue("morphe_disabled_iabc_fnrts" in strings, "RemoveAdsBasicActivity.onCreate is missing the renamed key")
    }

    private fun assertBlockUpdateScreen(byType: Map<String, ClassDef>) {
        for (type in listOf(BASE_ACTIVITY, BASE_ACTION_BAR_ACTIVITY)) {
            val onCreate = (byType[type] ?: error("$type not found")).method("onCreate", listOf("Landroid/os/Bundle;"))
            val strings = onCreate.instructions().mapNotNull { it.stringOrNull() }
            for (key in listOf("ForceUpdateDialog", "NewVersionPopup")) {
                assertTrue(key !in strings, "$type.onCreate still reads the \"$key\" extra")
                assertTrue("morphe_disabled_$key" in strings, "$type.onCreate is missing the renamed \"$key\" key")
            }
        }

        // Verify MainDashboardActivity.onCreate defuses the Google Play Services update check
        val mainDashboard = byType[MAIN_DASHBOARD] ?: error("$MAIN_DASHBOARD not found")
        val onCreate = mainDashboard.method("onCreate", listOf("Landroid/os/Bundle;"))
        val insns = onCreate.instructions()
        val errorCodeIndex = insns.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string == "PLAY_SERVICES_ERROR_CODE"
        }
        assertTrue(errorCodeIndex >= 0, "PLAY_SERVICES_ERROR_CODE not found in $MAIN_DASHBOARD.onCreate")

        // Right before errorCodeIndex, the move-result was replaced with const/4 vX, 0x0
        val constZeroIndex = (errorCodeIndex - 1 downTo 0).firstOrNull {
            insns[it].opcode == Opcode.CONST_4 && (insns[it] as NarrowLiteralInstruction).narrowLiteral == 0
        }
        assertTrue(constZeroIndex != null, "const/4 vX, 0x0 not found before PLAY_SERVICES_ERROR_CODE")
    }

    private fun assertGmsCoreSupport(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        val splash = byType[SPLASH] ?: error("$SPLASH not found")
        val onCreate = splash.method("onCreate", listOf("Landroid/os/Bundle;"))
        val firstInsn = onCreate.instructions().firstOrNull()
        assertTrue(
            firstInsn?.opcode == Opcode.INVOKE_STATIC_RANGE,
            "Splash.onCreate does not start with invoke-static/range checkGmsCore; got ${firstInsn?.opcode}"
        )
        val check = (firstInsn as ReferenceInstruction).reference.toString()
        assertTrue(
            check.endsWith("GmsCoreSupport;->checkGmsCore(Landroid/app/Activity;)V"),
            "Splash.onCreate does not call checkGmsCore; got $check",
        )

        // Verify strings were rewritten to app.revanced
        val allStrings = classes.flatMap { cls ->
            cls.methods.flatMap { m -> m.instructions().mapNotNull { it.stringOrNull() } }
        }.toSet()
        assertTrue("app.revanced.android.gms" in allStrings, "GmsCore rewrite missing app.revanced.android.gms")
    }

    /**
     * The legacy Auth.GoogleSignInApi flow the app uses hands its intent to the app's own
     * SignInHubActivity, which targets "com.google.android.gms" by name. Both the action and that
     * package must point at MicroG RE, otherwise no activity is found and sign-in returns
     * status 17 without showing an account picker.
     */
    private fun assertGoogleSignInWiring(classes: List<ClassDef>) {
        val allStrings = classes.flatMap { cls ->
            cls.methods.flatMap { m -> m.instructions().mapNotNull { it.stringOrNull() } }
        }.toSet()
        for (expected in listOf(
            "app.revanced.android.gms.auth.GOOGLE_SIGN_IN",
            "app.revanced.android.gms.auth.api.signin.service.START",
        )) {
            assertTrue(expected in allStrings, "GmsCore rewrite missing \"$expected\"")
        }
        for (stale in listOf(
            "com.google.android.gms.auth.GOOGLE_SIGN_IN",
        )) {
            assertTrue(stale !in allStrings, "Google sign-in action was not rewritten: \"$stale\"")
        }

        // Spoof signature: the extension must hand the real Play certificate to Firebase.
        val spoof = classes.firstOrNull { it.type == "Lapp/template/extension/signature/SignatureSpoof;" }
            ?: error("SignatureSpoof extension class not found in emitted dexes")
        val certificate = spoof.method("getSpoofedCertificate", emptyList()).instructions()
            .mapNotNull { it.stringOrNull() }
            .firstOrNull { it.startsWith("MIIC") }
        assertTrue(certificate != null, "SignatureSpoof.getSpoofedCertificate does not return the real certificate")
    }
}
