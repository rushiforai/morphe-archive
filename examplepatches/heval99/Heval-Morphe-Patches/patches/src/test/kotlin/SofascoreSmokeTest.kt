import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.sofascore.results"
private const val USER_ACCOUNT = "Lcom/sofascore/local_persistance/UserAccount;"
private const val PROFILE_DATA = "Lcom/sofascore/model/profile/ProfileData;"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private val APPSFLYER_METHODS = setOf("start", "logEvent", "logSession", "logAdRevenue")
private const val GMS_MEASUREMENT = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;"
private const val ANALYTICS_DEACTIVATED_KEY = "firebase_analytics_collection_deactivated"
private const val FACEBOOK_PROVIDER = "Lcom/facebook/internal/FacebookInitProvider;"
private const val AUDIENCE_PROVIDER = "Lcom/facebook/ads/AudienceNetworkContentProvider;"
private const val PROMOTION_MODAL = "Lcom/sofascore/results/event/details/view/promotion/PromotionModal;"
private const val TENNIS_PROMO_SHEET = "Lcom/sofascore/results/event/aiInsights/SofascoreAnalystTennisPromoBottomSheet;"
private const val CRASHLYTICS_KEY = "firebase_crashlytics_collection_enabled"
private val PROMO_BANNERS = listOf(
    "Lcom/sofascore/results/event/details/view/promotion/PromotionBannerView;",
    "Lcom/sofascore/results/featuredtournament/view/PromotionalOffersBannerView;",
)

private const val CONTEXT = "Landroid/content/Context;"
private const val SHARED_PREFERENCES = "Landroid/content/SharedPreferences;"
private const val EVENT_HEAD_FLAGS = "Lcom/sofascore/model/mvvm/model/EventHeadFlags;"
private const val BET365_SIGN_UP_PREFIX = "https://www.bet365.com/olp/open-account?affiliate="

private const val RELEASE_APP = "Lcom/sofascore/results/ReleaseApp;"
private const val FIREBASE_BUNDLE = "Lcom/sofascore/model/FirebaseBundle;"
private val CONSENT_TYPES = listOf("ad_personalization", "ad_user_data", "analytics_storage", "ad_storage")

private const val START_ACTIVITY = "Lcom/sofascore/results/main/start/StartActivity;"
private const val SIGNATURE_SHA1 = "e235776bc0ad3837b01359177c438658b1424d23"

private val SOFASCORE_PATCHES = setOf(
    "Block marketing notifications",
    "Disable Facebook SDK",
    "Disable ads",
    "Disable rating prompts",
    "Disable telemetry",
    "Enable Premium",
    "GmsCore support",
    "Hide betting content",
    "Spoof signature",
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

    private fun Method.strings(): List<String> =
        instructions().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

    private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

    private fun Method.params() = parameterTypes.map(CharSequence::toString)

    /** The modal-queue predicate, found like sofascore/shared/ModalQueue.kt finds it. */
    private fun modalPredicate(classes: List<ClassDef>, modalName: String, anchor: String, diagnostics: String): Method {
        val byType = classes.associateBy { it.type }
        val descriptor = classes.filter { cls ->
            cls.methods.any { it.name == "<clinit>" && modalName in it.strings() }
        }.singleOrNull() ?: error("no single modal descriptor named \"$modalName\"\n$diagnostics")
        val created = descriptor.methods.single { it.name == "<clinit>" }.instructions()
            .filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }
        return created.mapNotNull { byType[it] }
            .filter { "Lkotlin/jvm/functions/Function1;" in it.interfaces }
            .mapNotNull { cls -> cls.methods.firstOrNull { it.name == "invoke" && anchor in it.strings() } }
            .singleOrNull() ?: error("no single \"$modalName\" predicate holding \"$anchor\"\n$diagnostics")
    }

    /** The call [call] selects (exactly one) is followed by move-result vX, then const vX, [expected]. */
    private fun assertCallResultForced(
        method: Method,
        expected: Boolean,
        label: String,
        diagnostics: String,
        call: (MethodReference, Int) -> Boolean,
    ) {
        val insns = method.instructions()
        val index = insns.indices.singleOrNull { i ->
            val ref = (insns[i] as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && call(ref, i) // only invoke-* carry a MethodReference
        } ?: error("$label: call not found exactly once\n$diagnostics")
        val moveResult = insns.getOrNull(index + 1) as? OneRegisterInstruction
        val forced = insns.getOrNull(index + 2)
        assertTrue(
            insns.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT && moveResult != null &&
                forced is NarrowLiteralInstruction && forced is OneRegisterInstruction &&
                (forced.opcode == Opcode.CONST_4 || forced.opcode == Opcode.CONST_16) &&
                forced.registerA == moveResult.registerA &&
                forced.narrowLiteral == if (expected) 1 else 0,
            "$label is not forced to $expected after its move-result; got ${forced?.opcode}\n$diagnostics"
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
            version = "26.10.12",
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

        // Disable telemetry: AppsFlyer (start, both logEvent overloads, logSession and
        // logAdRevenue, found like the patch by the AppsFlyerLib superclass), the measurement
        // logEvent entry point, and the Firebase Analytics manifest switch.
        val appsFlyer = classes.firstOrNull { it.superclass == APPSFLYER_LIB }
            ?: error("AppsFlyerLib subclass not found in emitted dexes\n$diagnostics")
        for (method in appsFlyer.methods.filter {
            it.name in APPSFLYER_METHODS && it.returnType == "V" && it.implementation != null
        }) {
            assertReturnsEarlyVoid(
                method,
                label = "${appsFlyer.type}.${method.name}(${method.parameterTypes.joinToString()})",
                diagnostics,
            )
        }
        // start() must be among them: an anchor that matched nothing must fail the test.
        assertTrue(
            appsFlyer.methods.any { it.name == "start" && it.returnType == "V" && it.implementation != null },
            "AppsFlyerLib subclass has no concrete start()\n$diagnostics",
        )
        assertReturnsEarlyVoid(
            require(GMS_MEASUREMENT).methodsNamed("logEvent").single(),
            label = "AppMeasurementSdk.logEvent()", diagnostics
        )

        // The "firebase_analytics_collection_deactivated" read (the R8-renamed measurement
        // config, found like the patch: the single method holding the string) answers
        // Boolean.TRUE right after its move-result-object, so measurement never starts and
        // the automatic first_open / session_start / screen_view events never fire.
        val analyticsReaders = classes.flatMap { cls -> cls.methods }
            .filter { method -> ANALYTICS_DEACTIVATED_KEY in method.strings() }
        assertTrue(
            analyticsReaders.size == 1,
            "expected one $ANALYTICS_DEACTIVATED_KEY reader, found " +
                "${analyticsReaders.map { "${it.definingClass}.${it.name}" }}\n$diagnostics",
        )
        val readInsns = analyticsReaders.single().instructions()
        val keyIndex = readInsns.indexOfFirst { it.stringOrNull() == ANALYTICS_DEACTIVATED_KEY }
        assertTrue(keyIndex >= 0, "the $ANALYTICS_DEACTIVATED_KEY string vanished\n$diagnostics")
        val keyRegister = (readInsns[keyIndex] as OneRegisterInstruction).registerA
        val invoke = readInsns.getOrNull(keyIndex + 1)
        val call = (invoke as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            invoke is FiveRegisterInstruction && invoke.registerCount == 2 &&
                call?.returnType == "Ljava/lang/Boolean;" &&
                call.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
                invoke.registerD == keyRegister,
            "the $ANALYTICS_DEACTIVATED_KEY string is not read through a Boolean get(String) " +
                "instance call taking it as the key; got ${invoke?.opcode} $call\n$diagnostics",
        )
        val move = readInsns.getOrNull(keyIndex + 2) as? OneRegisterInstruction
        val forced = readInsns.getOrNull(keyIndex + 3) as? ReferenceInstruction
        val forcedField = forced?.reference as? FieldReference
        assertTrue(
            readInsns.getOrNull(keyIndex + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT && move != null &&
                forced?.opcode == Opcode.SGET_OBJECT &&
                forcedField?.definingClass == "Ljava/lang/Boolean;" && forcedField.name == "TRUE" &&
                (forced as OneRegisterInstruction).registerA == move.registerA,
            "the $ANALYTICS_DEACTIVATED_KEY read is not overwritten with Boolean.TRUE; got " +
                "${readInsns.drop(keyIndex).take(4).map { it.opcode }}\n$diagnostics",
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

        // Sofascore's own analytics sender, found like the fingerprint: the (String,
        // FirebaseBundle)V method holding "event_date" and "event_timestamp". It returns at once.
        val analyticsSenders = classes.flatMap { it.methods }.filter { m ->
            m.returnType == "V" && m.params() == listOf("Ljava/lang/String;", FIREBASE_BUNDLE) &&
                m.strings().containsAll(listOf("event_date", "event_timestamp"))
        }
        assertTrue(
            analyticsSenders.size == 1,
            "expected one Sofascore analytics sender, found ${analyticsSenders.size}\n$diagnostics"
        )
        assertReturnsEarlyVoid(
            analyticsSenders.single(),
            label = "Sofascore analytics sender ${analyticsSenders.single().definingClass}", diagnostics
        )

        // Firebase Performance: isPerformanceMonitoringEnabled (R8-renamed; the no-arg boolean
        // holding the "fpr_*" keys and "com.google.firebase.perf.SdkEnabled") returns false.
        val perfEnabled = classes.flatMap { it.methods }.filter { m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() &&
                m.strings().containsAll(
                    listOf("fpr_enabled", "fpr_disabled_android_versions", "com.google.firebase.perf.SdkEnabled")
                )
        }
        assertTrue(
            perfEnabled.size == 1,
            "expected one isPerformanceMonitoringEnabled, found ${perfEnabled.size}\n$diagnostics"
        )
        assertForcedBoolean(
            perfEnabled.single(), expected = false,
            label = "Firebase Performance isPerformanceMonitoringEnabled()", diagnostics
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

        // Firebase In-App Messaging: every display implementation returns at once.
        val fiamDisplays = classes.filter {
            "Lcom/google/firebase/inappmessaging/FirebaseInAppMessagingDisplay;" in it.interfaces
        }
        assertTrue(fiamDisplays.isNotEmpty(), "no FirebaseInAppMessagingDisplay implementation found\n$diagnostics")
        for (display in fiamDisplays) {
            assertReturnsEarlyVoid(
                display.methodsNamed("displayMessage").single(),
                label = "${display.type}.displayMessage()", diagnostics
            )
        }

        // Disable ads: the "Active subscription" upgrade sheet's queue predicate reads
        // getHasServerAds() as true, so the sheet is not queued for everyone.
        assertCallResultForced(
            modalPredicate(classes, "Active subscription", "PR_XAIST", diagnostics),
            expected = true, label = "Active subscription predicate getHasServerAds()", diagnostics
        ) { ref, _ -> ref.definingClass == USER_ACCOUNT && ref.name == "getHasServerAds" }

        // Disable ads: ReleaseApp's consent method (no-arg void holding the consent-type strings)
        // no longer starts the ad SDK start-up thread, and keeps its Firebase consent code.
        val consentMethod = require(RELEASE_APP).methods.filter { m ->
            m.returnType == "V" && m.parameterTypes.isEmpty() &&
                m.strings().containsAll(listOf("ad_personalization", "analytics_storage"))
        }.singleOrNull() ?: error("no single ReleaseApp consent method\n$diagnostics")
        val consentInsns = consentMethod.instructions()
        fun Method.calls(owner: String, name: String) = instructions().count { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.definingClass == owner && ref.name == name
        }
        assertTrue(
            consentMethod.calls("Ljava/lang/Thread;", "start") == 0,
            "ReleaseApp.${consentMethod.name}() still calls Thread.start()\n$diagnostics"
        )
        assertTrue(
            consentMethod.strings().containsAll(CONSENT_TYPES) &&
                consentMethod.calls("Landroid/os/BaseBundle;", "putString") >= CONSENT_TYPES.size &&
                consentMethod.calls("Lcom/google/firebase/analytics/FirebaseAnalytics;", "getInstance") == 1,
            "ReleaseApp.${consentMethod.name}() lost its Firebase consent code\n$diagnostics"
        )
        // The thread is still built but never started: its constructor is followed by return-void.
        val threadInit = consentInsns.indexOfLast { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/lang/Thread;" && ref.name == "<init>"
        }
        assertTrue(
            threadInit >= 0 && consentInsns.getOrNull(threadInit + 1)?.opcode == Opcode.RETURN_VOID,
            "ReleaseApp.${consentMethod.name}(): Thread.<init> is not followed by return-void; got " +
                "${consentInsns.getOrNull(threadInit + 1)?.opcode}\n$diagnostics"
        )

        // Disable ads, rule 9: with init skipped, every MobileAds static void returns at once
        // (openDebugMenu is reachable from the hidden developer options).
        val mobileAds = require("Lcom/google/android/gms/ads/MobileAds;")
        for (name in listOf("initialize", "openDebugMenu", "setAppVolume", "setAppMuted")) {
            val statics = mobileAds.methods.filter { it.name == name && it.returnType == "V" && it.implementation != null }
            assertTrue(statics.isNotEmpty(), "MobileAds.$name not found\n$diagnostics")
            statics.forEach { assertReturnsEarlyVoid(it, label = "MobileAds.$name(${it.parameterTypes.joinToString()})") }
        }

        // Disable rating prompts: the "Rating Info" predicate reads "ask_review_v3" as false.
        val ratingPredicate = modalPredicate(classes, "Rating Info", "ask_review_v3", diagnostics)
        val ratingInsns = ratingPredicate.instructions()
        val askReviewLoad = ratingInsns.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "ask_review_v3"
        }
        val askReviewCall = (askReviewLoad + 1 until ratingInsns.size).first {
            (ratingInsns[it] as? ReferenceInstruction)?.reference is MethodReference
        }
        assertCallResultForced(
            ratingPredicate, expected = false, label = "Rating Info predicate getBoolean(\"ask_review_v3\")", diagnostics
        ) { ref, i -> i == askReviewCall && ref.name == "getBoolean" }

        // Hide betting content. The helpers are R8-renamed; find them by key plus shape, like
        // the fingerprints, and check each shape is unique.
        fun staticWith(returnType: String, params: List<String>, string: (String) -> Boolean): Method {
            val found = classes.flatMap { it.methods }.filter { m ->
                m.isStatic() && m.returnType == returnType && m.params() == params && m.strings().any(string)
            }
            assertTrue(found.size == 1, "expected one static ($params)$returnType, found ${found.size}\n$diagnostics")
            return found.single()
        }
        assertForcedBoolean(
            staticWith("Z", listOf(CONTEXT, SHARED_PREFERENCES)) { it == "PREF_PROVIDER_ODDS_ENABLE" },
            expected = false, label = "odds decision (PREF_PROVIDER_ODDS_ENABLE)", diagnostics
        )
        for (getter in listOf("getAdditionalOdds", "getAdditionalOddsComparison", "getRecommendedPrematchOdds")) {
            assertForcedBoolean(
                require(EVENT_HEAD_FLAGS).method(getter, emptyList()),
                expected = false, label = "EventHeadFlags.$getter()", diagnostics
            )
        }
        val signUpLink = staticWith("Ljava/lang/String;", listOf(CONTEXT)) { it.startsWith(BET365_SIGN_UP_PREFIX) }
        val linkInsns = signUpLink.instructions()
        assertTrue(
            (linkInsns.getOrNull(0) as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
                linkInsns[0].opcode == Opcode.CONST_4 &&
                linkInsns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
                (linkInsns[0] as OneRegisterInstruction).registerA ==
                (linkInsns[1] as OneRegisterInstruction).registerA,
            "Bet365 sign-up link does not return null first; got ${linkInsns.getOrNull(0)?.opcode}\n$diagnostics"
        )
        assertForcedBoolean(
            staticWith("Z", listOf(CONTEXT)) { it == "PREF_PROMOTIONS_ENABLE" },
            expected = false, label = "promotions setting (PREF_PROMOTIONS_ENABLE)", diagnostics
        )
        assertForcedBoolean(
            staticWith("Z", listOf(CONTEXT)) { it == "ODDS_PROVIDERS_DISABLED" },
            expected = true, label = "odds providers disabled (ODDS_PROVIDERS_DISABLED)", diagnostics
        )

        // GmsCore support + Spoof signature (MicroG RE push and Google login). The shared
        // assertion also checks ensurePlayServicesAvailable, here a(Context)V.
        assertGmsCoreSupport(classes, workDir, PKG, START_ACTIVITY, SIGNATURE_SHA1, expectCredentialRouting = true)
        assertSpoofSignature(classes, PKG, SIGNATURE_SHA1)
    }
}
