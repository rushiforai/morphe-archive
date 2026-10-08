import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.sofascore.results"
private const val USER_ACCOUNT = "Lcom/sofascore/local_persistance/UserAccount;"
private const val PROFILE_DATA = "Lcom/sofascore/model/profile/ProfileData;"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private const val GMS_MEASUREMENT = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;"
private const val FACEBOOK_PROVIDER = "Lcom/facebook/internal/FacebookInitProvider;"
private const val AUDIENCE_PROVIDER = "Lcom/facebook/ads/AudienceNetworkContentProvider;"
private const val PROMOTION_MODAL = "Lcom/sofascore/results/event/details/view/promotion/PromotionModal;"
private const val TENNIS_PROMO_SHEET = "Lcom/sofascore/results/event/aiInsights/SofascoreAnalystTennisPromoBottomSheet;"
private const val CRASHLYTICS_KEY = "firebase_crashlytics_collection_enabled"
private val PROMO_BANNERS = listOf(
    "Lcom/sofascore/results/event/details/view/promotion/PromotionBannerView;",
    "Lcom/sofascore/results/featuredtournament/view/PromotionalOffersBannerView;",
)

private val SOFASCORE_PATCHES = setOf(
    "Block marketing notifications",
    "Disable Facebook SDK",
    "Disable ads",
    "Disable telemetry",
    "Enable Premium",
)

class SofascoreSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun ClassDef.methodsNamed(name: String): List<Method> = methods.filter { it.name == name }

    private fun ClassDef.referencesString(value: String): Boolean = methods.any { method ->
        method.instructions().any { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference
            ref is StringReference && ref.string == value
        }
    }

    private fun assertForcedBoxedTrue(method: Method, label: String, diagnostics: String) {
        val insns = method.instructions()
        val first = insns.getOrNull(0) as? ReferenceInstruction
        val ref = first?.reference as? FieldReference
        assertTrue(
            first != null &&
                first.opcode == Opcode.SGET_OBJECT &&
                ref != null &&
                ref.definingClass == "Ljava/lang/Boolean;" &&
                ref.name == "TRUE",
            "$label was not forced to Boolean.TRUE; first instruction is ${insns.getOrNull(0)?.opcode}\n$diagnostics"
        )
        assertTrue(
            insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
            "$label does not return immediately; second instruction is ${insns.getOrNull(1)?.opcode}\n$diagnostics"
        )
    }

    private fun assertDismissesEarly(method: Method, label: String, diagnostics: String) {
        val insns = method.instructions()
        val first = insns.getOrNull(0) as? ReferenceInstruction
        val ref = first?.reference as? MethodReference
        assertTrue(
            ref != null &&
                ref.definingClass == "Landroidx/fragment/app/DialogFragment;" &&
                ref.name == "dismiss",
            "$label does not dismiss the dialog first; first instruction is ${first?.opcode} ${ref}\n$diagnostics"
        )
        assertTrue(
            insns.getOrNull(1)?.opcode == Opcode.RETURN_VOID,
            "$label does not return after dismissing; second instruction is ${insns.getOrNull(1)?.opcode}\n$diagnostics"
        )
    }

    @Test
    fun `all Sofascore patches apply and mutate the expected bytecode`() {
        val root = repoRoot()
        val apk = File(root, "apks/sofascore/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "26.09.07",
            patchNames = SOFASCORE_PATCHES,
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        val diagnostics = "emitted classes=${classes.size}"

        fun require(type: String): ClassDef =
            byType[type] ?: error("$type not found in emitted dexes\n$diagnostics")

        // Disable ads: the three UserAccount flags the ad logic consults.
        assertForcedBoolean(
            require(USER_ACCOUNT).methodsNamed("getForceAds").single(),
            expected = false, label = "UserAccount.getForceAds()", diagnostics
        )
        assertForcedBoolean(
            require(USER_ACCOUNT).methodsNamed("getForceHideAds").single(),
            expected = true, label = "UserAccount.getForceHideAds()", diagnostics
        )
        assertForcedBoolean(
            require(USER_ACCOUNT).methodsNamed("getHasServerAds").single(),
            expected = false, label = "UserAccount.getHasServerAds()", diagnostics
        )

        // Enable Premium: both boxed-Boolean premium flags.
        assertForcedBoxedTrue(
            require(USER_ACCOUNT).methodsNamed("getHasPremium").single(),
            label = "UserAccount.getHasPremium()", diagnostics
        )
        assertForcedBoxedTrue(
            require(PROFILE_DATA).methodsNamed("getHasPremium").single(),
            label = "ProfileData.getHasPremium()", diagnostics
        )

        // Disable telemetry: AppsFlyer implementation + GMS measurement.
        val appsFlyer = classes.firstOrNull { it.superclass == APPSFLYER_LIB }
            ?: error("AppsFlyerLib subclass not found in emitted dexes\n$diagnostics")
        val appsFlyerLogEvent = appsFlyer.methodsNamed("logEvent")
            .single { it.parameterTypes.size == 4 }
        assertReturnsEarlyVoid(
            appsFlyerLogEvent,
            label = "${appsFlyer.type}.logEvent(Context, String, Map, listener)",
            diagnostics
        )
        assertReturnsEarlyVoid(
            require(GMS_MEASUREMENT).methodsNamed("logEvent").single(),
            label = "AppMeasurementSdk.logEvent()", diagnostics
        )

        // Crashlytics is R8-renamed; locate its classes the same way the patch does.
        val crashlyticsClasses = classes.filter { it.referencesString(CRASHLYTICS_KEY) }
        assertTrue(
            crashlyticsClasses.isNotEmpty(),
            "no class referencing '$CRASHLYTICS_KEY' in emitted dexes\n$diagnostics"
        )
        val crashlyticsSettings = crashlyticsClasses.firstNotNullOfOrNull { cls ->
            cls.methods.firstOrNull { it.returnType == "Z" && it.parameterTypes.isEmpty() }
        } ?: error("Crashlytics settings getter not found\n$diagnostics")
        assertForcedBoolean(
            crashlyticsSettings, expected = false,
            label = "Crashlytics collection-enabled getter", diagnostics
        )
        val crashlyticsRecordException = crashlyticsClasses.firstNotNullOfOrNull { cls ->
            cls.methods.firstOrNull {
                it.returnType == "V" &&
                    it.parameterTypes.size == 1 &&
                    it.parameterTypes.first().toString() == "Ljava/lang/Throwable;"
            }
        } ?: error("Crashlytics recordException not found\n$diagnostics")
        assertReturnsEarlyVoid(
            crashlyticsRecordException,
            label = "Crashlytics recordException(Throwable)", diagnostics
        )

        // Disable Facebook SDK: only the Audience Network (ads) init provider is
        // neutered. FacebookInitProvider must keep initializing the SDK, otherwise
        // the login screen crashes with "SDK has not been initialized" (issue #24).
        assertForcedBoolean(
            require(AUDIENCE_PROVIDER).methodsNamed("onCreate").single(),
            expected = false, label = "AudienceNetworkContentProvider.onCreate()", diagnostics
        )
        val initOnCreate = require(FACEBOOK_PROVIDER).methodsNamed("onCreate").single()
        assertTrue(
            initOnCreate.instructions().firstOrNull()?.opcode != Opcode.CONST_4,
            "FacebookInitProvider.onCreate() must not be forced - login needs sdkInitialize() " +
                "(issue #24)\n$diagnostics"
        )

        // Disable Play Integrity is intentionally absent: the Play Integrity classes are not
        // bundled in this build (the AppsFlyer SDK only references them, behind a catch), so
        // there is nothing to patch. The patch was removed as part of the 26.09.07 update.

        // Block marketing notifications: both promo sheets dismiss before rendering.
        assertDismissesEarly(
            require(PROMOTION_MODAL).methodsNamed("onViewCreated").single(),
            label = "PromotionModal.onViewCreated()", diagnostics
        )
        // The tennis promo sheet was removed in 26.09.28; assert it only where it exists.
        byType[TENNIS_PROMO_SHEET]?.let { sheet ->
            assertDismissesEarly(
                sheet.methodsNamed("onViewCreated").single(),
                label = "SofascoreAnalystTennisPromoBottomSheet.onViewCreated()", diagnostics
            )
        }
        // Promotion banners stay GONE.
        for (banner in PROMO_BANNERS) {
            val first = require(banner).method("setVisibility", listOf("I")).instructions().firstOrNull()
            assertTrue(
                first is NarrowLiteralInstruction && first.narrowLiteral == 8,
                "$banner.setVisibility does not force GONE; first instruction is ${first?.opcode}\n$diagnostics"
            )
        }
    }
}
