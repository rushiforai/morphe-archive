import app.template.patches.shared.hevalcontrols.HEVAL_SETTINGS_CLASS
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.HevalRegistryCodec
import app.template.patches.sofascore.controls.SOFASCORE_CONTROLS
import app.template.patches.sofascore.controls.SOFASCORE_CONTROLS_ENTRY
import app.template.patches.sofascore.controls.SOFASCORE_SCREEN_CALM
import app.template.patches.sofascore.controls.SOFASCORE_SHARE_LINKS
import app.template.patches.sofascore.layout.HIDE_AI_INSIGHTS
import app.template.patches.sofascore.misc.lists.COMPACT_MATCH_LISTS
import app.template.patches.sofascore.misc.screen.KEEP_SCREEN_ON
import app.template.patches.sofascore.misc.screenshot.DISABLE_SCREENSHOT_PROMPT
import app.template.patches.sofascore.misc.sharing.CLEAN_SHARE_LINKS
import app.template.patches.sofascore.misc.theme.AMOLED_BLACK
import app.template.patches.sofascore.misc.video.TURN_OFF_VIDEO_AUTOPLAY
import app.template.patches.sofascore.layout.HIDE_MATCH_CHAT
import app.template.patches.sofascore.layout.MAIN_TAB_FEATURES
import app.template.patches.sofascore.layout.MATCH_TAB_FEATURES
import app.template.patches.sofascore.sports.SPORT_FEATURES
import app.template.patches.sofascore.misc.popups.PROMO_POPUP_FEATURES
import app.template.patches.sofascore.misc.rating.DISABLE_RATING_PROMPTS
import app.template.patches.sofascore.misc.notifications.BLOCK_MARKETING_NOTIFICATIONS
import app.template.patches.sofascore.betting.HIDE_BETTING_CONTENT
import app.template.patches.sofascore.misc.promo.PROMO_SECTION_FEATURES
import app.template.patches.sofascore.misc.animations.ANIMATION_FEATURES
import app.template.patches.sofascore.misc.widget.SLOWER_WIDGET_REFRESH
import app.template.patches.sofascore.controls.SOFASCORE_ANIMATION_SPEED
import app.template.patches.sofascore.competitions.HIDDEN_COMPETITIONS
import app.template.patches.sofascore.countries.COMPETITION_FILTER
import app.template.patches.sofascore.countries.COUNTRY_FILTER
import app.template.patches.sofascore.countries.HIDDEN_COUNTRIES
import app.template.patches.sofascore.countries.NETWORK_COROUTINE_API
import app.template.patches.sofascore.spoiler.EVENT_ACTIVITY
import app.template.patches.sofascore.spoiler.LEAGUE_ACTIVITY
import app.template.patches.sofascore.spoiler.SCORE_TEXT_VIEW
import app.template.patches.sofascore.spoiler.SPOILER_FEATURES
import app.template.patches.sofascore.spoiler.SPOILER_FREE
import app.template.patches.sofascore.spoiler.SPOILER_FREE_MODE
import app.template.patches.sofascore.spoiler.SPOILER_KEEP_FINAL_HIDDEN
import app.template.patches.sofascore.spoiler.SPOILER_LISTS
import app.template.patches.sofascore.spoiler.SPOILER_MATCH_PAGE
import app.template.patches.sofascore.spoiler.SPOILER_NOTIFICATIONS
import app.template.patches.sofascore.spoiler.SPOILER_WIDGET
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Element

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
private const val CRASHLYTICS_KEY = "firebase_crashlytics_collection_enabled"
private val PROMO_BANNERS = listOf(
    "Lcom/sofascore/results/event/details/view/promotion/PromotionBannerView;",
    "Lcom/sofascore/results/featuredtournament/view/PromotionalOffersBannerView;",
)

private const val CONTEXT = "Landroid/content/Context;"
private const val SHARED_PREFERENCES = "Landroid/content/SharedPreferences;"
private const val EVENT_HEAD_FLAGS = "Lcom/sofascore/model/mvvm/model/EventHeadFlags;"
private const val BET365_SIGN_UP_PREFIX = "https://www.bet365.com/olp/open-account?affiliate="

private const val EVENT_ACTIVITY_TYPE = "Lcom/sofascore/results/event/EventActivity;"
private const val RELEASE_APP = "Lcom/sofascore/results/ReleaseApp;"
private const val FIREBASE_BUNDLE = "Lcom/sofascore/model/FirebaseBundle;"
private val CONSENT_TYPES = listOf("ad_personalization", "ad_user_data", "analytics_storage", "ad_storage")

private const val START_ACTIVITY = "Lcom/sofascore/results/main/MainActivity;"
private const val SIGNATURE_SHA1 = "e235776bc0ad3837b01359177c438658b1424d23"

private val SOFASCORE_PATCHES = setOf(
    "AMOLED black",
    "Animation speed",
    "Block marketing notifications",
    "Clean shared links",
    "Compact match lists",
    "Disable screenshot prompt",
    "Keep screen on",
    "Disable Facebook SDK",
    "Disable ads",
    "Disable rating prompts",
    "Disable telemetry",
    "Disable update prompts",
    "Enable Premium",
    "GmsCore support",
    "Patch settings",
    "Hide AI insights",
    "Hide betting content",
    "Hide competitions",
    "Hide countries",
    "Hide main tabs",
    "Hide match chat",
    "Hide match tabs",
    "Hide promo pop-ups",
    "Hide promo sections",
    "Hide sports",
    "Slower widget refresh",
    "Spoiler-free mode",
    "Spoof signature",
    "Turn off video autoplay",
    "Unlock developer options",
)

private val AD_SDK_PROVIDERS = listOf(
    "Lcom/ironsource/lifecycle/IronsourceLifecycleProvider;",
    "Lcom/ironsource/lifecycle/LevelPlayActivityLifecycleProvider;",
    "Lcom/mbridge/msdk/config/component/status/MBComponentLifecycleProvider;",
    "Lcom/vungle/ads/VungleProvider;",
)
private const val UNITY_ADS_INITIALIZER = "Lcom/unity3d/services/core/configuration/AdsSdkInitializer;"
private const val PICASSO_PROVIDER = "Lcom/squareup/picasso/PicassoProvider;"
private const val EMOJI_COMPAT_INITIALIZER = "Landroidx/emoji2/text/EmojiCompatInitializer;"
private const val FIAM_DATA_COLLECTION_KEY = "firebase_inapp_messaging_auto_data_collection_enabled"
private const val GLOBAL_SETTINGS = "Landroid/provider/Settings\$Global;"
private const val WIDGET_REFRESH_WORKER = "Lcom/sofascore/results/service/WidgetPeriodicRefreshWorker;"

private const val SETTINGS_FRAGMENT = "Lcom/sofascore/results/settings/SettingsFragment;"
private const val HEVAL_EXTENSION = "Lapp/template/extension/hevalcontrols/"

/**
 * Every Sofascore Heval Controls feature, as the patches register it (id, name, category, default,
 * restartRequired). Ids name the user's saved choices, so a shipped id never changes.
 */
private val HEVAL_FEATURES: List<HevalFeature> = listOf(HIDE_AI_INSIGHTS) +
    MATCH_TAB_FEATURES.map { it.second } +
    SPORT_FEATURES.map { it.second } +
    DISABLE_RATING_PROMPTS +
    BLOCK_MARKETING_NOTIFICATIONS +
    HIDE_BETTING_CONTENT +
    PROMO_POPUP_FEATURES.map { it.second } +
    PROMO_SECTION_FEATURES.map { it.second } +
    ANIMATION_FEATURES +
    SLOWER_WIDGET_REFRESH +
    HIDDEN_COUNTRIES +
    HIDDEN_COMPETITIONS +
    HIDE_MATCH_CHAT +
    MAIN_TAB_FEATURES +
    SPOILER_FEATURES +
    AMOLED_BLACK +
    TURN_OFF_VIDEO_AUTOPLAY +
    COMPACT_MATCH_LISTS +
    KEEP_SCREEN_ON +
    CLEAN_SHARE_LINKS +
    DISABLE_SCREENSHOT_PROMPT

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

    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    /** Index of the instruction the branch at [index] jumps to. */
    private fun List<Instruction>.branchTarget(index: Int): Int {
        val offsets = runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        val target = offsets[index] + (this[index] as OffsetInstruction).codeOffset
        return offsets.indexOf(target)
    }

    /**
     * The instructions at [at] are the Heval Controls gate for [featureId]: const-string vX, the
     * /range isEnabled call on vX, move-result vX and if-eqz vX. Returns the index it jumps to.
     */
    private fun assertGate(method: Method, featureId: String, label: String, at: Int = 0): Int {
        val insns = method.instructions()
        val id = insns.getOrNull(at)
        check(id?.opcode == Opcode.CONST_STRING && id.stringOrNull() == featureId) {
            "$label does not start its Heval Controls gate with \"$featureId\"; got ${id?.opcode} ${id?.stringOrNull()}"
        }
        val register = (id as OneRegisterInstruction).registerA
        val call = insns.getOrNull(at + 1)
        check(call?.opcode == Opcode.INVOKE_STATIC_RANGE && call.call()?.definingClass == HEVAL_SETTINGS_CLASS &&
            call.call()?.name == "isEnabled" && (call as RegisterRangeInstruction).startRegister == register && call.registerCount == 1
        ) { "$label does not ask HevalSettings.isEnabled(v$register); got ${call?.opcode} ${call?.call()}" }
        val result = insns.getOrNull(at + 2)
        val test = insns.getOrNull(at + 3)
        check(result?.opcode == Opcode.MOVE_RESULT && (result as OneRegisterInstruction).registerA == register &&
            test?.opcode == Opcode.IF_EQZ && (test as OneRegisterInstruction).registerA == register
        ) { "$label: the gate does not branch on the isEnabled result; got ${result?.opcode} ${test?.opcode}" }
        return insns.branchTarget(at + 3)
    }

    /**
     * [method] starts with the Heval Controls gate for [featureId], whose enabled path is [body]
     * (opcodes) and then jumps over it into the stock code; [literal] checks the body's first
     * instruction when it is a constant.
     */
    private fun assertGatedPath(method: Method, featureId: String, label: String, body: List<Opcode>, literal: Int? = null) {
        val target = assertGate(method, featureId, label)
        val insns = method.instructions()
        val path = insns.subList(4, minOf(insns.size, 4 + body.size))
        check(path.map { it.opcode } == body) { "$label: the gated path is ${path.map { it.opcode }}, expected $body" }
        if (literal != null) {
            check((path[0] as? NarrowLiteralInstruction)?.narrowLiteral == literal) { "$label: the gated path does not load $literal" }
        }
        check(target == 4 + body.size || body.last() !in setOf(Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_VOID)) {
            "$label: the gate does not jump past the gated path"
        }
    }

    /**
     * The boolean getter answers `flag && !isEnabled(featureId)`: right before its single return
     * vX come if-eqz vX (to the return), const-string vX, the isEnabled call, move-result vX and
     * xor-int/lit8 vX, vX, 1.
     */
    private fun assertFlagGate(method: Method, featureId: String, label: String) {
        val insns = method.instructions()
        val returns = insns.indices.filter { insns[it].opcode == Opcode.RETURN }
        check(returns.size == 1) { "$label has ${returns.size} returns" }
        val ret = returns.single()
        check(ret >= 5) { "$label has no gate before its return" }
        val gate = insns.subList(ret - 5, ret)
        val register = (insns[ret] as OneRegisterInstruction).registerA
        check(
            gate[0].opcode == Opcode.IF_EQZ && (gate[0] as OneRegisterInstruction).registerA == register &&
                insns.branchTarget(ret - 5) == ret &&
                gate[1].opcode == Opcode.CONST_STRING && gate[1].stringOrNull() == featureId &&
                gate[2].opcode == Opcode.INVOKE_STATIC_RANGE && gate[2].call()?.definingClass == HEVAL_SETTINGS_CLASS &&
                gate[2].call()?.name == "isEnabled" && (gate[2] as RegisterRangeInstruction).startRegister == register &&
                gate[3].opcode == Opcode.MOVE_RESULT && (gate[3] as OneRegisterInstruction).registerA == register &&
                gate[4].opcode == Opcode.XOR_INT_LIT8 && (gate[4] as NarrowLiteralInstruction).narrowLiteral == 1
        ) { "$label is not gated by \"$featureId\" before its return; got ${gate.map { it.opcode }}" }
    }

    private fun assertHevalControls(byType: Map<String, ClassDef>) {
        // 1. The extension classes (core, screen, init provider, the Sofascore helpers) are merged.
        for (type in listOf(HEVAL_SETTINGS_CLASS, "${HEVAL_EXTENSION}Registry;", "${HEVAL_EXTENSION}InitProvider;",
            "${HEVAL_EXTENSION}ui/HevalControlsActivity;", SOFASCORE_CONTROLS_ENTRY, SOFASCORE_CONTROLS)) {
            check(type in byType) { "$type is not in the patched dex" }
        }
        // The screen title and the Settings row label use the UI name "Patch settings".
        for (type in listOf("${HEVAL_EXTENSION}ui/HevalControlsActivity;", SOFASCORE_CONTROLS_ENTRY)) {
            val strings = byType.getValue(type).methods.flatMap { it.strings() }
            check("Patch settings" in strings) { "$type does not use the \"Patch settings\" name" }
            check(strings.none { "Heval Controls" in it }) { "$type still shows \"Heval Controls\"" }
        }

        // 2. The registry lists exactly the Sofascore features. They are written in registration
        // (patch execution) order, so the records are compared as a set.
        val registry = byType.getValue("${HEVAL_EXTENSION}Registry;").methods.single { it.name == "encoded" }.instructions()
        check(registry.getOrNull(0)?.opcode == Opcode.CONST_STRING_JUMBO && registry.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT) {
            "Registry.encoded() was not rewritten"
        }
        val encoded = registry[0].stringOrNull()!!.split('\n')
        val wanted = HevalRegistryCodec.encode(HEVAL_FEATURES).split('\n')
        check(encoded.first() == wanted.first() && encoded.size == wanted.size && encoded.toSet() == wanted.toSet()) {
            "Registry.encoded() is\n${encoded.joinToString("\n")}\nexpected (any record order)\n${wanted.joinToString("\n")}"
        }

        // 3. Manifest: the non-exported init provider (initOrder 1000) and the non-exported screen.
        val manifestFile = workDir.walkTopDown()
            .firstOrNull { it.name == "AndroidManifest.xml" && it.readText().contains("hevalcontrols") }
            ?: error("no decoded AndroidManifest.xml with Heval Controls under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        fun elements(tag: String) = manifest.getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
        val provider = elements("provider").single { it.getAttribute("android:name") == "app.template.extension.hevalcontrols.InitProvider" }
        check(provider.getAttribute("android:authorities") == "$PKG.hevalcontrols" && provider.getAttribute("android:exported") == "false" &&
            provider.getAttribute("android:initOrder") == "1000"
        ) { "Heval Controls provider has the wrong authority, exported flag or initOrder" }
        val activity = elements("activity").single { it.getAttribute("android:name") == "app.template.extension.hevalcontrols.ui.HevalControlsActivity" }
        check(activity.getAttribute("android:exported") == "false") { "HevalControlsActivity is exported" }
        check(activity.getAttribute("android:label") == "Patch settings") { "HevalControlsActivity label is ${activity.getAttribute("android:label")}" }

        // 4. The Settings row: SettingsFragment's (View, Bundle)V onViewCreated work (R8-renamed,
        // found by shape like the fingerprint) passes its root view (p1) to addRow first.
        val onViewCreated = (byType[SETTINGS_FRAGMENT] ?: error("$SETTINGS_FRAGMENT not found")).methods.single {
            it.returnType == "V" && it.params() == listOf("Landroid/view/View;", "Landroid/os/Bundle;")
        }
        val p1 = onViewCreated.implementation!!.registerCount - 2 // this, view, state
        val entry = onViewCreated.instructions().first()
        check(entry.opcode == Opcode.INVOKE_STATIC_RANGE && entry.call()?.definingClass == SOFASCORE_CONTROLS_ENTRY &&
            entry.call()?.name == "addRow" && (entry as RegisterRangeInstruction).startRegister == p1 && entry.registerCount == 1
        ) { "SettingsFragment.${onViewCreated.name} does not call addRow(p1) first; got ${entry.opcode} ${entry.call()}" }
        check(onViewCreated.instructions().count { it.call()?.definingClass == SOFASCORE_CONTROLS_ENTRY } == 1) {
            "addRow is called more than once"
        }
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
            version = "26.11.09",
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
        // Every name must be present (the patch fails when one matches nothing): an anchor that
        // matched nothing must fail the test.
        for (name in APPSFLYER_METHODS) {
            assertTrue(
                appsFlyer.methods.any { it.name == name && it.returnType == "V" && it.implementation != null },
                "AppsFlyerLib subclass has no concrete $name()\n$diagnostics",
            )
        }
        val measurementEvents = require(GMS_MEASUREMENT).methodsNamed("logEvent")
            .filter { it.returnType == "V" && it.implementation != null }
        assertTrue(measurementEvents.isNotEmpty(), "AppMeasurementSdk has no concrete logEvent\n$diagnostics")
        for (event in measurementEvents) {
            assertReturnsEarlyVoid(
                event,
                label = "AppMeasurementSdk.logEvent(${event.parameterTypes.joinToString()})", diagnostics
            )
        }

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
        // Every concrete method the patch targets, not only the first (the patch throws when there is none).
        val crashlyticsGetters = crashlyticsClasses.flatMap { cls ->
            cls.methods.filter { it.implementation != null && it.returnType == "Z" && it.parameterTypes.isEmpty() }
        }
        assertTrue(crashlyticsGetters.isNotEmpty(), "Crashlytics settings getter not found\n$diagnostics")
        for (getter in crashlyticsGetters) {
            assertForcedBoolean(
                getter, expected = false,
                label = "Crashlytics ${getter.definingClass}.${getter.name}() getter", diagnostics
            )
        }
        val crashlyticsReports = crashlyticsClasses.flatMap { cls ->
            cls.methods.filter {
                it.implementation != null && it.returnType == "V" &&
                    it.parameterTypes.size == 1 &&
                    it.parameterTypes.first().toString() == "Ljava/lang/Throwable;"
            }
        }
        assertTrue(crashlyticsReports.isNotEmpty(), "Crashlytics recordException not found\n$diagnostics")
        for (report in crashlyticsReports) {
            assertReturnsEarlyVoid(
                report,
                label = "Crashlytics ${report.definingClass}.${report.name}(Throwable)", diagnostics
            )
        }

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
        // FacebookInitProvider.onCreate() keeps its stock start: getContext(), a null check, then the
        // synchronized SDK initialisation (static call taking the Context) before the final
        // `return false`. The class behind the init call is R8-renamed, so only its shape is checked.
        val initOnCreate = require(FACEBOOK_PROVIDER).methodsNamed("onCreate").single()
        val initInsns = initOnCreate.instructions()
        assertTrue(
            initInsns.take(8).map { it.opcode } == listOf(
                Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.SGET_OBJECT,
                Opcode.CONST_CLASS, Opcode.MONITOR_ENTER, Opcode.INVOKE_STATIC, Opcode.MONITOR_EXIT,
            ) && initInsns[0].call()?.let {
                it.definingClass == "Landroid/content/ContentProvider;" && it.name == "getContext"
            } == true && initInsns[6].call()?.let {
                it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT)
            } == true && initInsns.size == 19,
            "FacebookInitProvider.onCreate() is not the stock sdkInitialize() path - login needs it " +
                "(issue #24); got ${initInsns.map { it.opcode }}\n$diagnostics"
        )
        // The two manifest flags are present and false (overwritten when the stock manifest had one).
        val facebookManifest = workDir.walkTopDown()
            .firstOrNull { it.name == "AndroidManifest.xml" && it.readText().contains("hevalcontrols") }
            ?: error("no decoded AndroidManifest.xml under $workDir")
        val facebookApplication = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(facebookManifest)
            .documentElement.getElementsByTagName("application").item(0) as Element
        val facebookMeta = facebookApplication.getElementsByTagName("meta-data").let { list ->
            (0 until list.length).map { list.item(it) as Element }
        }
        for (flag in listOf("com.facebook.sdk.AutoLogAppEventsEnabled", "com.facebook.sdk.AdvertiserIDCollectionEnabled")) {
            val entries = facebookMeta.filter { it.getAttribute("android:name") == flag }
            assertTrue(entries.size == 1, "expected one $flag meta-data, found ${entries.size}")
            assertTrue(entries.single().getAttribute("android:value") == "false", "$flag is not false")
        }

        // Disable Play Integrity is intentionally absent: the Play Integrity classes are not
        // bundled in this build (the AppsFlyer SDK only references them, behind a catch), so
        // there is nothing to patch. The patch was removed as part of the 26.09.07 update.

        // Block marketing notifications (a Heval Controls switch): while it is on, the promo sheet
        // dismisses before rendering, the promotion banners stay GONE and every FIAM display returns.
        val marketing = BLOCK_MARKETING_NOTIFICATIONS.id
        val dismiss = listOf(Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID)
        assertGatedPath(require(PROMOTION_MODAL).methodsNamed("onViewCreated").single(), marketing, "PromotionModal.onViewCreated()", dismiss)
        check(require(PROMOTION_MODAL).methodsNamed("onViewCreated").single().instructions()[4].call()?.name == "dismiss") {
            "PromotionModal.onViewCreated() does not dismiss"
        }
        for (banner in PROMO_BANNERS) {
            // const/16 p1, 0x8, then the stock setVisibility (the gate falls through).
            assertGatedPath(require(banner).method("setVisibility", listOf("I")), marketing, "$banner.setVisibility", listOf(Opcode.CONST_16), literal = 8)
        }
        val fiamDisplays = classes.filter {
            "Lcom/google/firebase/inappmessaging/FirebaseInAppMessagingDisplay;" in it.interfaces
        }.map { it.methodsNamed("displayMessage").single() }.filter { it.instructions().first().opcode != Opcode.RETURN_VOID }
        assertTrue(fiamDisplays.isNotEmpty(), "no FirebaseInAppMessagingDisplay implementation with a body\n$diagnostics")
        for (display in fiamDisplays) {
            assertGatedPath(display, marketing, "${display.definingClass}.displayMessage()", listOf(Opcode.RETURN_VOID))
        }

        // Disable ads: the "Active subscription" upgrade sheet's queue predicate reads
        // getHasServerAds() as true, so the sheet is not queued for everyone.
        assertCallResultForced(
            modalPredicate(classes, "Active subscription", "PR_XAIST", diagnostics),
            expected = true, label = "Active subscription predicate getHasServerAds()", diagnostics
        ) { ref, _ -> ref.definingClass == USER_ACCOUNT && ref.name == "getHasServerAds" }

        // Disable ads: ReleaseApp's consent method (no-arg void holding the consent-type strings)
        // no longer starts the ad SDK start-up thread, and keeps its Firebase consent code. Since
        // 26.10.26 it is declared by ReleaseApp's R8-renamed superclass, so search the whole chain.
        val appChain = generateSequence(RELEASE_APP) { byType[it]?.superclass }.mapNotNull { byType[it] }.toList()
        val consentMethod = appChain.flatMap { it.methods }.filter { m ->
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

        // Disable rating prompts and Hide promo pop-ups: the modal queue's enqueue ((descriptor)Z
        // holding "last_shown_pop_up_timestamp") and its evaluator ((descriptor, ...)Serializable in
        // the same class) start with: if p1 != null && hideModal(p1.name) return false / FALSE.
        // The "Rating Info" predicate itself stays stock.
        val ratingPredicate = modalPredicate(classes, "Rating Info", "ask_review_v3", diagnostics)
        val ratingInsns = ratingPredicate.instructions()
        val askReviewLoad = ratingInsns.indexOfFirst { it.stringOrNull() == "ask_review_v3" }
        val askReviewCall = (askReviewLoad + 1 until ratingInsns.size).first { ratingInsns[it].call() != null }
        check(ratingInsns.getOrNull(askReviewCall + 2)?.opcode !in setOf(Opcode.CONST_4, Opcode.CONST_16)) {
            "the Rating Info predicate still forces getBoolean(\"ask_review_v3\")"
        }
        val modalBase = classes.single { cls -> cls.methods.any { it.name == "<clinit>" && "Rating Info" in it.strings() } }.superclass!!
        val enqueue = classes.flatMap { it.methods }.single { m ->
            m.returnType == "Z" && m.params() == listOf(modalBase) && "last_shown_pop_up_timestamp" in m.strings()
        }
        val evaluator = byType.getValue(enqueue.definingClass).methods.single {
            it.returnType == "Ljava/io/Serializable;" && it.params().firstOrNull() == modalBase
        }
        for ((method, dropped) in listOf(enqueue to listOf(Opcode.CONST_4, Opcode.RETURN), evaluator to listOf(Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT))) {
            val insns = method.instructions()
            val p1 = method.implementation!!.registerCount - method.parameterTypes.size
            check(
                insns[0].opcode == Opcode.IF_EQZ && (insns[0] as OneRegisterInstruction).registerA == p1 &&
                    insns[1].opcode == Opcode.IGET_OBJECT && insns[2].call()?.let { it.definingClass == SOFASCORE_CONTROLS && it.name == "hideModal" } == true &&
                    insns[3].opcode == Opcode.MOVE_RESULT && insns[4].opcode == Opcode.IF_EQZ &&
                    insns.subList(5, 7).map { it.opcode } == dropped &&
                    insns.branchTarget(0) == 7 && insns.branchTarget(4) == 7
            ) { "modal queue hook in ${method.definingClass}.${method.name} is malformed: ${insns.take(8).map { it.opcode }}" }
        }

        // Hide betting content. The helpers are R8-renamed; find them by key plus shape, like
        // the fingerprints, and check each shape is unique.
        fun staticWith(returnType: String, params: List<String>, string: (String) -> Boolean): Method {
            val found = classes.flatMap { it.methods }.filter { m ->
                m.isStatic() && m.returnType == returnType && m.params() == params && m.strings().any(string)
            }
            assertTrue(found.size == 1, "expected one static ($params)$returnType, found ${found.size}\n$diagnostics")
            return found.single()
        }
        // Hide betting content is a Heval Controls switch: each site answers its forced value
        // only while it is on.
        val betting = HIDE_BETTING_CONTENT.id
        val forcedBody = { value: Int -> listOf(Opcode.CONST_4, Opcode.RETURN) to value }
        for ((label, site) in listOf(
            "odds decision (PREF_PROVIDER_ODDS_ENABLE)" to staticWith("Z", listOf(CONTEXT, SHARED_PREFERENCES)) { it == "PREF_PROVIDER_ODDS_ENABLE" },
            "promotions setting (PREF_PROMOTIONS_ENABLE)" to staticWith("Z", listOf(CONTEXT)) { it == "PREF_PROMOTIONS_ENABLE" },
        )) {
            val (body, value) = forcedBody(0)
            assertGatedPath(site, betting, label, body, literal = value)
        }
        val (trueBody, trueValue) = forcedBody(1)
        assertGatedPath(staticWith("Z", listOf(CONTEXT)) { it == "ODDS_PROVIDERS_DISABLED" }, betting,
            "odds providers disabled (ODDS_PROVIDERS_DISABLED)", trueBody, literal = trueValue)
        for (getter in listOf("getAdditionalOdds", "getAdditionalOddsComparison", "getRecommendedPrematchOdds")) {
            assertFlagGate(require(EVENT_HEAD_FLAGS).method(getter, emptyList()), betting, "EventHeadFlags.$getter()")
        }
        assertGatedPath(staticWith("Ljava/lang/String;", listOf(CONTEXT)) { it.startsWith(BET365_SIGN_UP_PREFIX) }, betting,
            "Bet365 sign-up link", listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT), literal = 0)

        // GmsCore support + Spoof signature (MicroG RE push and Google login). The shared
        // assertion also checks ensurePlayServicesAvailable, here a(Context)V.
        assertGmsCoreSupport(classes, workDir, PKG, START_ACTIVITY, SIGNATURE_SHA1, expectCredentialRouting = true)
        assertSpoofSignature(classes, PKG, SIGNATURE_SHA1)

        // Unlock developer options: the About password gate pins the Set.contains result to true.
        val developerDialog = "Lcom/sofascore/results/settings/developer/DeveloperOptionsFullScreenDialog;"
        fun Instruction.isDeveloperDialog() = opcode == Opcode.NEW_INSTANCE &&
            ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type == developerDialog
        val gateHandlers = classes.flatMap { it.methods }.filter { method ->
            val insns = method.implementation?.instructions?.toList() ?: return@filter false
            insns.any { it.isDeveloperDialog() } && insns.any { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Ljava/util/Set;" && ref.name == "contains"
            } && insns.any { insn ->
                // The password gate hashes the typed value; since 26.11.03 a Compose lambda also
                // opens the dialog behind an unrelated Set.contains.
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Ljava/lang/String;" && ref.name == "getBytes"
            }
        }
        check(gateHandlers.size == 1) {
            "developer dialog handlers: ${gateHandlers.map { "${it.definingClass}->${it.name}" }}"
        }
        val handler = gateHandlers.single()
        val handlerInsns = handler.instructions()
        val dialogIndex = handlerInsns.indexOfFirst { it.isDeveloperDialog() }
        val containsIndex = (0 until dialogIndex).last { index ->
            val ref = (handlerInsns[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/util/Set;" && ref.name == "contains"
        }
        val gateRegister = (handlerInsns[containsIndex + 1] as OneRegisterInstruction).registerA
        val gateBranch = (containsIndex + 2..minOf(containsIndex + 4, handlerInsns.lastIndex)).first { index ->
            (handlerInsns[index].opcode == Opcode.IF_EQZ || handlerInsns[index].opcode == Opcode.IF_NEZ) &&
                (handlerInsns[index] as OneRegisterInstruction).registerA == gateRegister
        }
        val pinned = handlerInsns[gateBranch - 1]
        check(
            pinned is NarrowLiteralInstruction && pinned.opcode == Opcode.CONST_16 &&
                pinned.narrowLiteral == 1 && (pinned as OneRegisterInstruction).registerA == gateRegister,
        ) { "${handler.definingClass}->${handler.name}: the password gate is not pinned true" }
        check(handlerInsns[gateBranch].opcode == Opcode.IF_EQZ) { "the password branch changed shape" }

        // Hide AI insights: EventHeadFlags.getAiInsights answers flag && !isEnabled.
        assertFlagGate(require(EVENT_HEAD_FLAGS).method("getAiInsights", emptyList()), HIDE_AI_INSIGHTS.id, "EventHeadFlags.getAiInsights()")

        // Hide match tabs: each tab's EventHeadFlags getter is gated by its own switch.
        for ((getter, feature) in MATCH_TAB_FEATURES) {
            assertFlagGate(require(EVENT_HEAD_FLAGS).method(getter, emptyList()), feature.id, "EventHeadFlags.$getter()")
        }
        check(MATCH_TAB_FEATURES.map { it.second.id }.toSet() == setOf(
            "sofascore.hide_tab_commentary", "sofascore.hide_tab_crowdsourcing", "sofascore.hide_tab_media",
            "sofascore.hide_tab_graphs", "sofascore.hide_tab_standings", "sofascore.hide_tab_cup_tree", "sofascore.hide_tab_matches",
        )) { "match tab feature ids changed: ${MATCH_TAB_FEATURES.map { it.second.id }}" }

        // Hide sports: every sport_order query result and the home sport pass through the
        // extension right before they are returned: vX = helper(vX); return-object vX.
        check(SPORT_FEATURES.size == 25 && SPORT_FEATURES.all { (slug, f) -> f.id == "sofascore.hide_sport_" + slug.replace('-', '_') }) {
            "sport feature ids changed"
        }
        // The selected-sport setter (2026-11-22), found like SelectSportFingerprint: the final
        // (String, Z)V calling Sports.getEntries and List.contains that stores the String cache the
        // PREF_HOME_SPORT_V2 getter reads. It starts with p1 = visibleSport(p1), then the stock getClass.
        val homeGetter = classes.flatMap { it.methods }.single { m ->
            m.isStatic() && m.returnType == "Ljava/lang/String;" && m.params() == listOf(CONTEXT) && "PREF_HOME_SPORT_V2" in m.strings()
        }
        fun Instruction.stringField() = ((this as? ReferenceInstruction)?.reference as? FieldReference)
            ?.takeIf { it.type == "Ljava/lang/String;" }?.let { "${it.definingClass}->${it.name}" }
        val homeCache = homeGetter.instructions().filter { it.opcode == Opcode.SGET_OBJECT }.mapNotNull { it.stringField() }.distinct().single()
        val setters = classes.flatMap { it.methods }.filter { m ->
            !m.isStatic() && AccessFlags.FINAL.isSet(m.accessFlags) && m.returnType == "V" && m.params() == listOf("Ljava/lang/String;", "Z") &&
                m.instructions().any { it.call()?.let { c -> c.definingClass == "Lcom/sofascore/model/Sports;" && c.name == "getEntries" } == true } &&
                m.instructions().any { it.opcode == Opcode.SPUT_OBJECT && it.stringField() == homeCache }
        }
        check(setters.size == 1) { "expected one selected-sport setter, found ${setters.map { "${it.definingClass}->${it.name}" }}" }
        val setter = setters.single()
        val setterInsns = setter.instructions()
        val slug = setter.implementation!!.registerCount - 2
        check(setterInsns[0].opcode == Opcode.INVOKE_STATIC_RANGE && setterInsns[0].call()?.definingClass == SOFASCORE_CONTROLS &&
            setterInsns[0].call()?.name == "visibleSport" && (setterInsns[0] as RegisterRangeInstruction).startRegister == slug &&
            (setterInsns[0] as RegisterRangeInstruction).registerCount == 1 &&
            setterInsns[1].opcode == Opcode.MOVE_RESULT_OBJECT && (setterInsns[1] as OneRegisterInstruction).registerA == slug &&
            setterInsns[2].call()?.name == "getClass" && (setterInsns[2] as FiveRegisterInstruction).registerC == slug
        ) { "${setter.definingClass}->${setter.name} does not start with p1 = visibleSport(p1); got ${setterInsns.take(3).map { it.opcode }}" }
        check(setterInsns.count { it.call()?.name == "visibleSport" } == 1) { "the selected-sport setter calls visibleSport more than once" }
        // Every other visibleSport site is a return filter (below).

        fun assertReturnFilter(helper: String, expected: Map<String, Int>) {
            val sites = classes.flatMap { it.methods }.filterNot {
                it.definingClass == setter.definingClass && it.name == setter.name && it.params() == setter.params()
            }.flatMap { m ->
                val insns = m.instructions()
                insns.indices.filter { insns[it].call()?.let { c -> c.definingClass == SOFASCORE_CONTROLS && c.name == helper } == true }
                    .map { m to it }
            }
            val byQuery = sites.groupingBy { (m, _) ->
                listOf("SELECT * FROM sport_order ORDER BY sportOrder ASC", "SELECT sportName FROM sport_order ORDER BY sportOrder ASC",
                    "SELECT sportName FROM sport_order WHERE isSelected = 1", "PREF_HOME_SPORT_V2").filter { it in m.strings() }.joinToString()
            }.eachCount()
            check(byQuery == expected) { "$helper is called from $byQuery, expected $expected" }
            for ((m, i) in sites) {
                val insns = m.instructions()
                val register = (insns[i] as RegisterRangeInstruction).startRegister
                check(insns[i].opcode == Opcode.INVOKE_STATIC_RANGE && (insns[i] as RegisterRangeInstruction).registerCount == 1 &&
                    insns[i + 1].opcode == Opcode.MOVE_RESULT_OBJECT && (insns[i + 1] as OneRegisterInstruction).registerA == register &&
                    insns[i + 2].opcode == Opcode.RETURN_OBJECT && (insns[i + 2] as OneRegisterInstruction).registerA == register
                ) { "$helper in ${m.definingClass}.${m.name} is not vX = $helper(vX); return vX" }
            }
        }
        // 26.11.09: the rows and the selected-sport case share one lambda class; the names query
        // sits alone in another, loaded once above a switch and prepared by two of its cases.
        val rowsAndSelected = "SELECT * FROM sport_order ORDER BY sportOrder ASC, SELECT sportName FROM sport_order WHERE isSelected = 1"
        val namesOnly = "SELECT sportName FROM sport_order ORDER BY sportOrder ASC"
        assertReturnFilter("filterSportOrders", mapOf(rowsAndSelected to 1))
        assertReturnFilter("filterSportNames", mapOf(namesOnly to 2))
        // Two selected-sport cases (the former rows+selected and names+selected lambdas, one class
        // since 26.11.09), and the three returns of the PREF_HOME_SPORT_V2 getter.
        assertReturnFilter("visibleSport", mapOf(rowsAndSelected to 2, "PREF_HOME_SPORT_V2" to 3))

        // Hide promo sections: Remote Config getBoolean (the instance (String)Z reading the value
        // handler's Patterns; the handler is found by its TRUE regex) asks hidePromoSection(key)
        // first and answers false for a hidden section.
        val configHandler = classes.single { cls ->
            cls.methods.any { it.name == "<clinit>" && "^(1|true|t|yes|y|on)$" in it.strings() }
        }.type
        val getBoolean = classes.flatMap { it.methods }.single { m ->
            !m.isStatic() && m.returnType == "Z" && m.params() == listOf("Ljava/lang/String;") &&
                m.instructions().any { (it as? ReferenceInstruction)?.reference.let { r -> r is FieldReference && r.definingClass == configHandler } }
        }
        val configInsns = getBoolean.instructions()
        val p1 = getBoolean.implementation!!.registerCount - 1
        check(
            configInsns[0].opcode == Opcode.INVOKE_STATIC_RANGE && configInsns[0].call()?.name == "hidePromoSection" &&
                configInsns[0].call()?.definingClass == SOFASCORE_CONTROLS && (configInsns[0] as RegisterRangeInstruction).startRegister == p1 &&
                configInsns.subList(1, 5).map { it.opcode } == listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN) &&
                (configInsns[3] as NarrowLiteralInstruction).narrowLiteral == 0 && configInsns.branchTarget(2) == 5
        ) { "Remote Config getBoolean is not gated: ${configInsns.take(6).map { it.opcode }}" }

        // The shared navigateToTab guard: right after the cast to the match page tab enum (found
        // like the patch, by its <clinit> names), isEventTabHidden(tab) returns Boolean.FALSE.
        val tabEnum = classes.single { cls ->
            cls.superclass == "Ljava/lang/Enum;" && cls.methods.any { m ->
                m.name == "<clinit>" && m.strings().containsAll(listOf("DETAILS", "AI_INSIGHTS", "COMMENTARY", "CUP_TREE"))
            }
        }.type
        val guards = classes.flatMap { it.methods }.filter { m -> m.instructions().any { it.call()?.name == "isEventTabHidden" } }
        check(guards.size == 1) { "expected one navigateToTab guard, found ${guards.map { it.definingClass }}" }
        val guardInsns = guards.single().instructions()
        val guard = guardInsns.indexOfFirst { it.call()?.name == "isEventTabHidden" }
        val cast = guardInsns[guard - 1]
        check(
            cast.opcode == Opcode.CHECK_CAST && ((cast as ReferenceInstruction).reference as TypeReference).type == tabEnum &&
                (guardInsns[guard] as RegisterRangeInstruction).startRegister == (cast as OneRegisterInstruction).registerA &&
                guardInsns[guard].call()?.definingClass == SOFASCORE_CONTROLS &&
                guardInsns[guard + 1].opcode == Opcode.MOVE_RESULT && guardInsns[guard + 2].opcode == Opcode.IF_EQZ &&
                (guardInsns[guard + 3] as? ReferenceInstruction)?.reference.let { it is FieldReference && it.name == "FALSE" } &&
                guardInsns[guard + 4].opcode == Opcode.RETURN_OBJECT
        ) { "the navigateToTab guard is malformed: ${guardInsns.subList(guard - 1, guard + 5).map { it.opcode }}" }

        // Start-up work, animation speed and widget refresh (2026-11-03).
        assertStartupAndSpeed(classes, byType, diagnostics)

        // Hide countries (2026-11-03): getter filters, request lambda filters and picker seeds.
        assertHideCountries(classes, byType, diagnostics)

        // Update prompts, match chat and main tabs (2026-11-06).
        assertUpdateChatAndTabs(classes, byType)

        // Spoiler-free mode (2026-11-08): push gate, menu items, list rows and widget.
        assertSpoilerFree(byType, originalClasses(apk))

        // AMOLED black (2026-11-09): the night cards and elevated surfaces are near black.
        assertAmoledBlack()

        // Comfort batch (2026-11-12): compact match rows, keep screen on, clean shared links, screenshot prompt.
        assertCompactMatchLists()
        assertComfortHooks(classes, byType, diagnostics)

        // Heval Controls: extension, registry, manifest components and the Settings row.
        assertHevalControls(byType)
    }

    /** The unpatched classes, read straight from the APK's dex files. */
    private fun originalClasses(apk: File): List<ClassDef> = ZipFile(apk).use { zip ->
        zip.entries().toList()
            .filter { Regex("classes\\d*\\.dex").matches(it.name) }
            .flatMap { entry ->
                val bytes = zip.getInputStream(entry).use { it.readBytes() }
                DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.toList()
            }
    }

    private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference

    // Spoiler-free mode: every hook starts with the gate of its own switch (the master for the menu
    // items, one switch per surface for the rest), the gate jumps straight into the unchanged stock
    // code when that switch is off, and the enabled path calls the SpoilerFree helper.
    /** AMOLED black: surface_1 and surface_P of the decoded values-night/colors.xml carry the AMOLED values. */
    private fun assertAmoledBlack() {
        val colors = workDir.walkTopDown().singleOrNull { it.name == "colors.xml" && it.parentFile.name == "values-night" }
            ?: error("res/values-night/colors.xml was not decoded under $workDir")
        val doc = javax.xml.parsers.DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(colors)
        val nodes = doc.getElementsByTagName("color")
        val values = (0 until nodes.length).associate { index ->
            val node = nodes.item(index) as org.w3c.dom.Element
            node.getAttribute("name") to node.textContent.trim().lowercase().let { if (it.length == 9 && it.startsWith("#ff")) "#" + it.substring(3) else it }
        }
        org.junit.jupiter.api.Assertions.assertEquals("#0a0a0a", values["surface_1"], "AMOLED black: surface_1")
        org.junit.jupiter.api.Assertions.assertEquals("#141414", values["surface_P"], "AMOLED black: surface_P")
        // The page background stays pure black.
        org.junit.jupiter.api.Assertions.assertEquals("#000000", values["surface_0"], "surface_0")
    }

    /** Compact match lists: the decoded list_event_row.xml carries the compact dp values (and the checked ones are unchanged). */
    private fun assertCompactMatchLists() {
        val layouts = workDir.walkTopDown().filter { it.name == "list_event_row.xml" }.toList()
        check(layouts.size == 1) { "expected one decoded list_event_row.xml under $workDir, found ${layouts.size}" }
        val doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(layouts.single())
        val all = doc.getElementsByTagName("*")
        val elements = (0 until all.length).map { all.item(it) as Element }
        fun value(owner: String?, attribute: String): String {
            val element = if (owner == null) doc.documentElement else elements.single { it.getAttribute("android:id").substringAfterLast('/') == owner }
            return element.getAttribute(attribute)
        }
        val expected = listOf(
            Triple(null, "android:minHeight", "44.0dp"), Triple(null, "android:paddingVertical", "2.0dp"),
            Triple("first_team_name", "android:layout_marginTop", "3.0dp"),
            Triple("second_team_name", "android:layout_marginTop", "2.0dp"),
            Triple("second_team_name", "android:layout_marginBottom", "3.0dp"),
            Triple("second_team_name", "app:layout_goneMarginBottom", "3.0dp"),
            Triple("action_layout", "android:layout_height", "40.0dp"),
            // Unchanged on purpose.
            Triple("time_lower", "android:layout_marginTop", "4.0dp"),
            Triple("vertical_guideline_start", "app:layout_constraintGuide_begin", "72.0dp"),
            Triple("action_layout", "android:layout_width", "56.0dp"),
        )
        expected.forEach { (owner, attribute, want) ->
            org.junit.jupiter.api.Assertions.assertEquals(want, value(owner, attribute), "Compact match lists: ${owner ?: "root"} $attribute")
        }
    }

    /** The registers of an instance method's parameters: this is p0, the first parameter p1. */
    private fun Method.parameterRegister(index: Int) = implementation!!.registerCount - (parameterTypes.size + 1) + index

    /** Keep screen on, Clean shared links and Disable screenshot prompt: the hooks in the emitted bytecode. */
    private fun assertComfortHooks(classes: List<ClassDef>, byType: Map<String, ClassDef>, diagnostics: String) {
        fun require(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes\n$diagnostics")
        require(SOFASCORE_SCREEN_CALM)
        require(SOFASCORE_SHARE_LINKS)
        val allMethods = classes.flatMap { it.methods }

        fun assertRangeCallFirst(method: Method, owner: String, name: String, register: Int, label: String): Int {
            val first = method.instructions().firstOrNull()
            check(first != null && first.opcode == Opcode.INVOKE_STATIC_RANGE && first.call()?.definingClass == owner &&
                first.call()?.name == name && (first as RegisterRangeInstruction).startRegister == register && first.registerCount == 1
            ) { "$label does not start with $owner->$name(v$register); got ${first?.opcode} ${first?.call()}" }
            return register
        }

        // Keep screen on: EventActivity.onResume()V starts with ScreenCalm.keepScreenOn(this), onPause()V with releaseScreen(this).
        val eventActivity = require(EVENT_ACTIVITY_TYPE)
        val onResume = eventActivity.methods.single { it.name == "onResume" && it.params().isEmpty() && it.returnType == "V" }
        assertRangeCallFirst(onResume, SOFASCORE_SCREEN_CALM, "keepScreenOn", onResume.parameterRegister(0), "EventActivity.onResume()")
        val onPause = eventActivity.methods.single { it.name == "onPause" && it.params().isEmpty() && it.returnType == "V" }
        assertRangeCallFirst(onPause, SOFASCORE_SCREEN_CALM, "releaseScreen", onPause.parameterRegister(0), "EventActivity.onPause()")
        // The stock super call is still there, right after the hook.
        check(onResume.instructions()[1].call()?.name == "onResume" && onPause.instructions()[1].call()?.name == "onPause") {
            "EventActivity onResume/onPause lost their super call after the hook"
        }

        // Clean shared links, image shares: the (Context, Bitmap, String, ?) share helper holding the three
        // intent strings passes its String argument (p3) through ShareLinks.cleanShareText before anything else.
        val shareHelpers = allMethods.filter { m ->
            !m.isStatic() && m.returnType == "Ljava/lang/Object;" && m.params().let { p ->
                p.size == 4 && p[0] == CONTEXT && p[1] == "Landroid/graphics/Bitmap;" && p[2] == "Ljava/lang/String;"
            } && m.strings().containsAll(listOf("android.intent.action.SEND", "image/*", "android.intent.extra.STREAM"))
        }
        check(shareHelpers.size == 1) { "expected one image share helper, found ${shareHelpers.size}\n$diagnostics" }
        val share = shareHelpers.single()
        val text = share.parameterRegister(3)
        val shareFirst = share.instructions()
        assertRangeCallFirst(share, SOFASCORE_SHARE_LINKS, "cleanShareText", text, "image share helper")
        check(shareFirst[0].call()?.returnType == "Ljava/lang/String;" &&
            shareFirst[1].opcode == Opcode.MOVE_RESULT_OBJECT && (shareFirst[1] as OneRegisterInstruction).registerA == text
        ) { "the share helper does not store the cleaned text back into p3; got ${shareFirst[1].opcode}" }
        check(share.strings().containsAll(listOf("android.intent.extra.TEXT"))) { "the share helper lost EXTRA_TEXT" }

        // Clean shared links, highlight links: the link builder (utm_source + "app referrals") calls the
        // extension for all four appendQueryParameter calls and the framework one nowhere.
        val linkBuilders = allMethods.filter { "utm_source" in it.strings() && "app referrals" in it.strings() }
        check(linkBuilders.size == 1) { "expected one highlight link builder, found ${linkBuilders.size}\n$diagnostics" }
        val builder = linkBuilders.single()
        val extensionCalls = builder.instructions().filter { it.call()?.let { c -> c.definingClass == SOFASCORE_SHARE_LINKS && c.name == "appendQueryParameter" } == true }
        check(extensionCalls.size == 4 && extensionCalls.all { it.opcode == Opcode.INVOKE_STATIC }) {
            "the link builder calls ShareLinks.appendQueryParameter ${extensionCalls.size} times, expected 4"
        }
        check(builder.instructions().none { it.call()?.let { c -> c.definingClass == "Landroid/net/Uri\$Builder;" && c.name == "appendQueryParameter" } == true }) {
            "the link builder still calls Uri.Builder.appendQueryParameter"
        }

        // Disable screenshot prompt: in every method that holds PREF_SCREENSHOT_DO_NOT_SHOW_AGAIN, every
        // SharedPreferences.getBoolean call (counted over the whole method, not a window after the literal)
        // is followed by move-result vX, ScreenCalm.screenshotPromptHidden(vX), move-result vX. 26.11.03 has
        // exactly 4 reads: EventActivity.onStart 1, LeagueActivity.onStart 1, the capture callback 2; the
        // two other holders only write the key and call no getBoolean.
        val readsByOwner = sortedMapOf<String, Int>()
        for (cls in classes.filterNot { it.type.startsWith("Lapp/template/extension/") }) {
            for (m in cls.methods) {
                val insns = m.instructions()
                if (insns.none { it.stringOrNull() == "PREF_SCREENSHOT_DO_NOT_SHOW_AGAIN" }) continue
                val owner = "${cls.type}->${m.name}"
                insns.indices.filter { i ->
                    insns[i].call()?.let { it.name == "getBoolean" && it.definingClass == SHARED_PREFERENCES } == true
                }.forEach { getBoolean ->
                    readsByOwner.merge(owner, 1, Int::plus)
                    val result = insns[getBoolean + 1] as OneRegisterInstruction
                    val hook = insns[getBoolean + 2]
                    check(insns[getBoolean + 1].opcode == Opcode.MOVE_RESULT && hook.opcode == Opcode.INVOKE_STATIC_RANGE &&
                        hook.call()?.let { it.definingClass == SOFASCORE_SCREEN_CALM && it.name == "screenshotPromptHidden" } == true &&
                        (hook as RegisterRangeInstruction).startRegister == result.registerA && hook.registerCount == 1 &&
                        insns[getBoolean + 3].opcode == Opcode.MOVE_RESULT && (insns[getBoolean + 3] as OneRegisterInstruction).registerA == result.registerA
                    ) { "$owner: the screenshot preference read is not filtered; got ${hook.opcode}" }
                }
            }
        }
        check(readsByOwner.values.sum() == 4) { "expected 4 screenshot preference reads, found $readsByOwner" }
        check(readsByOwner["$EVENT_ACTIVITY_TYPE->onStart"] == 1 && readsByOwner["Lcom/sofascore/results/league/LeagueActivity;->onStart"] == 1) {
            "the onStart screenshot reads are not hooked once each: $readsByOwner"
        }
        check(readsByOwner.filter { it.key.endsWith("->onScreenCaptured") }.values.sum() == 2) {
            "the capture callback's two reads are not hooked: $readsByOwner"
        }
        // The hook is called exactly once per read, nowhere else.
        val hookCalls = classes.flatMap { it.methods }.sumOf { m ->
            m.instructions().count { it.call()?.let { c -> c.definingClass == SOFASCORE_SCREEN_CALM && c.name == "screenshotPromptHidden" } == true }
        }
        check(hookCalls == 4) { "screenshotPromptHidden is called $hookCalls times, expected 4" }
    }

    private fun assertSpoilerFree(byType: Map<String, ClassDef>, stock: List<ClassDef>) {
        check(SPOILER_FREE in byType) { "SpoilerFree is not in the patched dex" }
        val stockByType = stock.associateBy { it.type }
        fun List<Instruction>.opcodesWithoutNops() = map { it.opcode }.filter { it != Opcode.NOP }
        fun Instruction.callsHelper(name: String) = call()?.let { it.definingClass == SPOILER_FREE && it.name == name } == true

        /** The gate of [featureId] at [at], then [body] (calling [helper]); returns the gate's target. */
        fun assertHook(method: Method, stockMethod: Method?, featureId: String, body: List<Opcode>, helper: String, at: Int = 0): Int {
            val label = "${method.definingClass}->${method.name}"
            val target = assertGate(method, featureId, label, at)
            val insns = method.instructions()
            val path = insns.subList(at + 4, target)
            check(path.map { it.opcode } == body) { "$label: spoiler path is ${path.map { it.opcode }}, expected $body" }
            check(path.any { it.callsHelper(helper) }) { "$label does not call SpoilerFree.$helper" }
            if (stockMethod != null) {
                check(insns.drop(target).opcodesWithoutNops() == stockMethod.instructions().opcodesWithoutNops()) {
                    "$label: the stock code after the gate changed"
                }
            }
            return target
        }
        fun pair(type: String, select: (Method) -> Boolean): Pair<Method, Method> {
            val patched = byType.getValue(type).methods.filter(select)
            val original = stockByType.getValue(type).methods.filter(select)
            check(patched.size == 1 && original.size == 1) { "$type: ${patched.size}/${original.size} matching methods" }
            return patched.single() to original.single()
        }

        // 1. Notifications: the message Bundle goes to blocksPush; a blocked push returns.
        val (push, stockPush) = pair("Lcom/sofascore/results/firebase/push/FCMListenerService;") { it.name == "onMessageReceived" }
        val pushTarget = assertHook(
            push, stockPush, SPOILER_NOTIFICATIONS.id,
            listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
            "blocksPush",
        )
        val pushInsns = push.instructions()
        check(pushInsns[5].field()?.let { it.definingClass == "Lcom/google/firebase/messaging/RemoteMessage;" && it.type == "Landroid/os/Bundle;" } == true) {
            "onMessageReceived does not read the RemoteMessage Bundle"
        }
        check(pushInsns.branchTarget(8) == pushTarget) { "a push that is not blocked does not reach the stock code" }

        // 2. and 3. The menu items and the page subjects (master switch).
        val menu = listOf("Landroid/view/Menu;")
        for ((type, subject, helpers) in listOf(
            Triple(EVENT_ACTIVITY, "Lcom/sofascore/model/mvvm/model/Event;", "addMatchItem" to "onMatch"),
            Triple(LEAGUE_ACTIVITY, "Lcom/sofascore/model/mvvm/model/UniqueTournament;", "addCompetitionItem" to "onCompetition"),
        )) {
            val (onMenu, stockMenu) = pair(type) { it.name == "onCreateOptionsMenu" && it.params() == menu }
            assertHook(onMenu, stockMenu, SPOILER_FREE_MODE.id, listOf(Opcode.INVOKE_STATIC_RANGE), helpers.first)
            val (setter, stockSetter) = pair(type) { it.returnType == "V" && it.params() == listOf(subject) && !it.isStatic() }
            assertHook(setter, stockSetter, SPOILER_FREE_MODE.id, listOf(Opcode.INVOKE_STATIC_RANGE), helpers.second)
        }

        // 4. List rows: setText filters its text through scoreText into p1, and the row binder marks
        // every score cell the stock binder reads for the row's Event.
        val (setText, stockSetText) = pair(SCORE_TEXT_VIEW) { it.name == "setText" && it.params() == listOf("Ljava/lang/String;") }
        assertHook(setText, stockSetText, SPOILER_LISTS.id, listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT), "scoreText")
        val p1 = setText.implementation!!.registerCount - 1
        check((setText.instructions()[5] as OneRegisterInstruction).registerA == p1) { "scoreText's result does not replace p1" }

        val binders = byType.values.flatMap { it.methods }.filter { m -> m.instructions().any { it.callsHelper("markRow") } }
        check(binders.size == 1) { "${binders.size} methods call SpoilerFree.markRow, expected one (the row binder)" }
        val binder = binders.single()
        val stockBinder = stockByType.getValue(binder.definingClass).methods.single { it.name == binder.name && it.params() == binder.params() }
        val cells = stockBinder.instructions().filter { it.opcode == Opcode.IGET_OBJECT }
            .mapNotNull { it.field() }.filter { it.type == SCORE_TEXT_VIEW }.distinctBy { it.name }
        check(cells.size >= 5) { "the stock row binder reads ${cells.size} score cells" }
        val rowTarget = assertHook(
            binder, stockBinder, SPOILER_LISTS.id,
            listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT) +
                cells.flatMap { listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC) },
            "markRow",
        )
        val marked = binder.instructions().subList(4, rowTarget).windowed(2)
            .filter { it[1].opcode == Opcode.INVOKE_STATIC && it[1].call()?.name == "markRow" }.map { it[0].field()!!.name }
        check(marked.toSet() == cells.map { it.name }.toSet()) { "markRow covers $marked, the binder's score cells are ${cells.map { it.name }}" }

        // 5. Widget: the gate sits before the single return-object, a nop holds the return's old
        // labels (so no branch skips the gate), and maskWidgetRow gets the returned RemoteViews.
        val widgets = byType.values.flatMap { it.methods }.filter { m -> m.instructions().any { it.callsHelper("maskWidgetRow") } }
        check(widgets.size == 1) { "${widgets.size} methods call SpoilerFree.maskWidgetRow, expected one" }
        val widget = widgets.single()
        val w = widget.instructions()
        val gateAt = w.indexOfFirst { it.opcode == Opcode.CONST_STRING && it.stringOrNull() == SPOILER_WIDGET.id }
        val widgetTarget = assertHook(
            widget, null, SPOILER_WIDGET.id,
            listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC),
            "maskWidgetRow", at = gateAt,
        )
        check(w[gateAt - 1].opcode == Opcode.NOP) { "the widget gate is not preceded by the label-holding nop" }
        check(w[widgetTarget].opcode == Opcode.RETURN_OBJECT) { "the widget gate does not jump to the return" }
        val mask = w[widgetTarget - 1] as FiveRegisterInstruction
        check(mask.registerD == (w[widgetTarget] as OneRegisterInstruction).registerA) { "maskWidgetRow does not get the returned RemoteViews" }
        val switches = setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH)
        val toReturn = w.indices.filter { w[it] is OffsetInstruction && w[it].opcode !in switches && w.branchTarget(it) == widgetTarget }
        check(toReturn == listOf(gateAt + 3)) { "branches skip the widget gate: $toReturn" }
        val stockWidget = stockByType.getValue(widget.definingClass).methods.single { it.name == widget.name && it.params() == widget.params() }
        check(w.filterIndexed { i, _ -> i < gateAt - 1 || i >= widgetTarget }.opcodesWithoutNops() == stockWidget.instructions().opcodesWithoutNops()) {
            "the widget row builder changed outside the gate"
        }

        // 4b. Compose rows: found like the patch does, by the toString constant of the row model.
        val rowModels = byType.values.filter { c ->
            c.methods.any { m -> m.name == "toString" && m.params().isEmpty() && m.strings().any { it.startsWith("EventRowModel(eventId=") } }
        }
        check(rowModels.size == 1) { "${rowModels.size} classes with an EventRowModel toString, expected one" }
        val rowModel = rowModels.single()
        val ctor = rowModel.methods.single { it.name == "<init>" }
        val ctorInsns = ctor.instructions()
        val ctorStock = stockByType.getValue(rowModel.type).methods.single { it.name == "<init>" }.instructions()
        val maskCall = ctorInsns[0]
        check(maskCall.opcode == Opcode.INVOKE_STATIC_RANGE && maskCall.callsHelper("maskRow") &&
            maskCall.call()!!.let { it.returnType == "Ljava/lang/Object;" && it.parameterTypes.map(CharSequence::toString) == listOf("I") + List(4) { "Ljava/lang/Object;" } } &&
            (maskCall as RegisterRangeInstruction).startRegister == ctor.parameterRegister(1) && maskCall.registerCount == 5
        ) { "the row model constructor does not start with maskRow(p1 .. p5); got ${maskCall.opcode} ${maskCall.call()}" }
        val statusReg = ctor.parameterRegister(3)
        check(ctorInsns[1].opcode == Opcode.MOVE_RESULT_OBJECT && (ctorInsns[1] as OneRegisterInstruction).registerA == statusReg) {
            "maskRow's result does not go to p3 (the status text)"
        }
        val cast = ctorInsns[2]
        check(cast.opcode == Opcode.CHECK_CAST && (cast as OneRegisterInstruction).registerA == statusReg &&
            ((cast as ReferenceInstruction).reference as TypeReference).type == ctor.parameterTypes[2].toString()
        ) { "p3 is not cast back to the RowText type: ${cast.opcode}" }
        check(ctorInsns.drop(3).opcodesWithoutNops() == ctorStock.opcodesWithoutNops()) { "the row model constructor changed after the hook" }
        check(ctor.params().let { it.size == 11 && it[0] == "I" && it[1] == it[2] && it[3] == it[4] }) { "row model constructor shape: ${ctor.params()}" }

        // The mapper notes the Event right before the row model's new-instance (a branch target: the
        // note takes over its labels, so every path runs it), in the register that held the Event.
        val notes = byType.values.flatMap { it.methods }.filter { m -> m.instructions().any { it.callsHelper("noteEvent") } }
        check(notes.size == 1) { "${notes.size} methods call SpoilerFree.noteEvent, expected one (the row mapper)" }
        val mapper = notes.single()
        val m = mapper.instructions()
        val noteAt = m.indexOfFirst { it.callsHelper("noteEvent") }
        check(m.count { it.callsHelper("noteEvent") } == 1) { "the mapper calls noteEvent more than once" }
        val note = m[noteAt]
        val created = m[noteAt + 1]
        check(note.opcode == Opcode.INVOKE_STATIC && (note as FiveRegisterInstruction).registerCount == 1 &&
            created.opcode == Opcode.NEW_INSTANCE && ((created as ReferenceInstruction).reference as TypeReference).type == rowModel.type &&
            note.registerC == (created as OneRegisterInstruction).registerA
        ) { "noteEvent is not right before the row model's new-instance: ${created.opcode}" }
        val eventUse = (noteAt - 1 downTo 0).first { m[it].call() != null && (m[it] as? FiveRegisterInstruction)?.let { c -> c.registerCount > 0 && c.registerC == note.registerC } == true }
        check(m[eventUse].call()!!.let { it.definingClass == "Lcom/sofascore/model/mvvm/model/Event;" || it.parameterTypes.firstOrNull()?.toString() == "Lcom/sofascore/model/mvvm/model/Event;" }) {
            "the register noteEvent reads does not carry an Event (last use ${m[eventUse].call()})"
        }
        check(m.drop(noteAt + 1).any { it.opcode == Opcode.INVOKE_DIRECT_RANGE && it.call()?.let { c -> c.definingClass == rowModel.type && c.name == "<init>" } == true }) {
            "the mapper no longer calls the row model constructor after noteEvent"
        }
        val jumpsTo = { target: Int -> m.indices.filter { m[it] is OffsetInstruction && m[it].opcode !in switches && m.branchTarget(it) == target } }
        check(jumpsTo(noteAt).isNotEmpty() && jumpsTo(noteAt + 1).isEmpty()) {
            "branches into the row model's new-instance skip the noteEvent hook: ${jumpsTo(noteAt)} / ${jumpsTo(noteAt + 1)}"
        }
        // The stock mapper is otherwise unchanged (one added instruction).
        val stockMapper = stockByType.getValue(mapper.definingClass).methods.single { it.name == mapper.name && it.params() == mapper.params() }
        check(m.filterIndexed { i, _ -> i != noteAt }.opcodesWithoutNops() == stockMapper.instructions().opcodesWithoutNops()) { "the row mapper changed outside the noteEvent hook" }
        // The legacy list_event_row hooks stay (asserted above): the binder still marks every score cell.
        check(binders.size == 1 && setText.instructions().any { it.callsHelper("scoreText") }) { "the legacy list row hooks are gone" }

        // Full time (2026-11-22): the merged extension routes every score hook through the shared
        // decision, which reads the status type and the keep-final-hidden option.
        val helper = byType.getValue(SPOILER_FREE)
        fun helperMethod(name: String, params: List<String>, returnType: String) =
            helper.methods.singleOrNull { it.name == name && it.params() == params && it.returnType == returnType }
                ?: error("SpoilerFree.$name$params$returnType is missing")
        val decision = helperMethod("hidesScore", listOf("Ljava/lang/Object;"), "Z")
        val pure = helperMethod("hidesScore", listOf("Z", "Z", "Ljava/lang/String;", "Z"), "Z")
        val statusType = helperMethod("statusType", listOf("Ljava/lang/Object;"), "Ljava/lang/String;")
        fun Method.callsMethod(target: Method) = instructions().any { insn ->
            insn.call()?.let { it.definingClass == SPOILER_FREE && it.name == target.name && it.returnType == target.returnType &&
                it.parameterTypes.map(CharSequence::toString) == target.params() } == true
        }
        check(decision.callsMethod(pure) && decision.callsMethod(statusType)) { "hidesScore(Object) does not use the pure decision and the status" }
        check(decision.strings().contains(SPOILER_KEEP_FINAL_HIDDEN.id)) { "hidesScore(Object) does not read ${SPOILER_KEEP_FINAL_HIDDEN.id}" }
        check("getStatusType" in statusType.strings()) { "statusType does not call Event.getStatusType" }
        val noteEvent = helperMethod("noteEvent", listOf("Ljava/lang/Object;"), "V")
        check(noteEvent.callsMethod(pure) && noteEvent.callsMethod(statusType) && SPOILER_KEEP_FINAL_HIDDEN.id in noteEvent.strings()) {
            "noteEvent does not decide with the status and the keep-final-hidden option"
        }
        check(helperMethod("markRow", listOf("Landroid/view/View;", "Ljava/lang/Object;"), "V").callsMethod(decision)) { "markRow does not use hidesScore(Object)" }
        check(helperMethod("maskWidgetRow", listOf(CONTEXT, "Landroid/widget/RemoteViews;", "Ljava/lang/Object;"), "V").callsMethod(decision)) {
            "maskWidgetRow does not use hidesScore(Object)"
        }
        check(byType.getValue("Lcom/sofascore/model/mvvm/model/Event;").methods.any { it.name == "getStatusType" && it.params().isEmpty() && it.returnType == "Ljava/lang/String;" }) {
            "Event.getStatusType()String is gone"
        }

        // 1. Pushes (2026-11-22): the Bundle entry point uses the pure push rule with the keep-final option.
        val pushRule = helperMethod("blocksPush", listOf("Ljava/lang/String;", "${SPOILER_FREE.removeSuffix(";")}\$Marks;", "Z"), "Z")
        val pushEntry = helperMethod("blocksPush", listOf("Landroid/os/Bundle;"), "Z")
        check(pushEntry.callsMethod(pushRule) && SPOILER_KEEP_FINAL_HIDDEN.id in pushEntry.strings()) { "blocksPush(Bundle) does not use the push rule and the keep-final option" }
        check("finish" in helper.methods.flatMap { it.strings() } && "icon" in pushRule.strings()) { "the push rule does not read the icon" }

        // 6. Match page header (2026-11-22): found like the patch does, the FrameLayout base with setResultView and
        // the abstract setEvent(Event). Every concrete setEvent below it starts with onHeader(p0, p1), the base's
        // setResultView with onResultView(p0, p1), and setFootballGoals with its gate and hidesHeaderGoals.
        val event = "Lcom/sofascore/model/mvvm/model/Event;"
        val bases = byType.values.filter { c ->
            c.superclass == "Landroid/widget/FrameLayout;" &&
                c.methods.any { it.name == "setResultView" && it.params() == listOf("Landroid/view/ViewGroup;") } &&
                c.methods.any { it.name == "setEvent" && it.params() == listOf(event) && AccessFlags.ABSTRACT.isSet(it.accessFlags) }
        }
        check(bases.size == 1) { "${bases.size} match header base classes, expected one" }
        val base = bases.single()
        fun below(type: String): Boolean {
            var current = byType[type]?.superclass
            while (current != null) {
                if (current == base.type) return true
                current = byType[current]?.superclass
            }
            return false
        }
        fun assertRangeHook(method: Method, helperName: String, count: Int) {
            val first = method.instructions().first()
            check(first.opcode == Opcode.INVOKE_STATIC_RANGE && first.callsHelper(helperName) &&
                (first as RegisterRangeInstruction).startRegister == method.parameterRegister(0) && first.registerCount == count
            ) { "${method.definingClass}->${method.name} does not start with SpoilerFree.$helperName(p0..); got ${first.opcode} ${first.call()}" }
            val stockMethod = stockByType.getValue(method.definingClass).methods.single { it.name == method.name && it.params() == method.params() }
            check(method.instructions().drop(1).opcodesWithoutNops() == stockMethod.instructions().opcodesWithoutNops()) {
                "${method.definingClass}->${method.name} changed after the $helperName hook"
            }
        }
        val headerSetEvents = byType.values.filter { below(it.type) }.flatMap { c ->
            c.methods.filter { it.name == "setEvent" && it.params() == listOf(event) && it.returnType == "V" && it.implementation != null }
        }
        // 26.11.09: uq1 (football and the generic sports), fvm (tennis), gzo (volleyball), ss3 (chat).
        check(headerSetEvents.size == 4) { "${headerSetEvents.size} concrete header setEvent methods, expected 4: ${headerSetEvents.map { it.definingClass }}" }
        headerSetEvents.forEach { assertRangeHook(it, "onHeader", 2) }
        assertRangeHook(base.methods.single { it.name == "setResultView" }, "onResultView", 2)
        val (goals, stockGoals) = byType.values.filter { below(it.type) }.flatMap { c -> c.methods.filter { it.name == "setFootballGoals" } }.single().let { m ->
            m to stockByType.getValue(m.definingClass).methods.single { it.name == m.name && it.params() == m.params() }
        }
        assertHook(goals, stockGoals, SPOILER_MATCH_PAGE.id, listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), "hidesHeaderGoals")
        val onHeader = helperMethod("onHeader", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")
        check(onHeader.callsMethod(decision) && SPOILER_MATCH_PAGE.id in onHeader.strings() && "getResultView" in onHeader.strings()) {
            "onHeader does not use hidesScore(Object), its switch and the result view"
        }
        check(base.methods.any { it.name == "getResultView" && it.params().isEmpty() && it.returnType == "Landroid/view/ViewGroup;" }) { "getResultView() is gone" }

        // 7. Details tab (2026-11-22): the module base's setVisibility starts with moduleVisibility(p0, p1) into
        // p1; the three period score tables' (Event)V binders and the period points graph start with maskModule.
        val appMethods = byType.values.filterNot { it.type.startsWith("Lapp/template/extension/") }.flatMap { it.methods }
        val maskers = appMethods.filter { m -> m.instructions().firstOrNull()?.callsHelper("maskModule") == true }
        // 26.11.09: vhm.a, mk5.a, u75.a (one interface method) and szo.l (the graph).
        check(maskers.size == 4) { "${maskers.size} methods start with maskModule, expected 4: ${maskers.map { "${it.definingClass}->${it.name}" }}" }
        maskers.forEach { assertRangeHook(it, "maskModule", 2) }
        val tables = maskers.filter { it.params() == listOf(event) }
        check(tables.size == 3 && tables.map { byType.getValue(it.definingClass).superclass }.distinct().size == 1) { "the score tables do not share one module base" }
        check(maskers.single { it !in tables }.params() == listOf(event, "Ljava/util/List;")) { "the graph hook is not on an (Event, List) method" }
        val moduleBase = byType.getValue(byType.getValue(tables.first().definingClass).superclass!!)
        val setVisibility = moduleBase.methods.single { it.name == "setVisibility" && it.params() == listOf("I") }
        val visibilityInsns = setVisibility.instructions()
        check(visibilityInsns[0].opcode == Opcode.INVOKE_STATIC_RANGE && visibilityInsns[0].callsHelper("moduleVisibility") &&
            (visibilityInsns[0] as RegisterRangeInstruction).startRegister == setVisibility.parameterRegister(0) &&
            visibilityInsns[1].opcode == Opcode.MOVE_RESULT && (visibilityInsns[1] as OneRegisterInstruction).registerA == setVisibility.parameterRegister(1)
        ) { "the module base's setVisibility does not filter p1 through moduleVisibility" }
        val stockVisibility = stockByType.getValue(moduleBase.type).methods.single { it.name == "setVisibility" && it.params() == listOf("I") }
        check(visibilityInsns.drop(2).opcodesWithoutNops() == stockVisibility.instructions().opcodesWithoutNops()) { "setVisibility changed after the hook" }
        val maskModule = helperMethod("maskModule", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")
        check(maskModule.callsMethod(decision) && SPOILER_MATCH_PAGE.id in maskModule.strings()) {
            "maskModule does not use hidesScore(Object) and its switch"
        }
        // 8. Share modal header: a module of the same base whose (?, Event) bind starts with maskShareHeader(p0 .. p2).
        val shares = appMethods.filter { m -> m.instructions().firstOrNull()?.callsHelper("maskShareHeader") == true }
        check(shares.size == 1 && byType.getValue(shares.single().definingClass).superclass == moduleBase.type && shares.single().params().last() == event) {
            "expected one share header bind starting with maskShareHeader, found ${shares.map { it.definingClass }}"
        }
        assertRangeHook(shares.single(), "maskShareHeader", 3)
        check(helperMethod("maskShareHeader", List(3) { "Ljava/lang/Object;" }, "V").callsMethod(maskModule)) { "maskShareHeader does not use maskModule" }
    }

    private fun assertUpdateChatAndTabs(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        fun Method.calls(owner: String, name: String) = instructions().any { it.call()?.let { c -> c.definingClass == owner && c.name == name } == true }

        // Disable update prompts: the in-app update helper's check and flow return at once.
        val helpers = classes.filter { c ->
            c.methods.any { it.name == "<init>" && it.params() == listOf("Landroidx/activity/ComponentActivity;", "I") } &&
                c.methods.any { it.returnType == "V" && it.params().size == 2 && it.calls("Landroid/app/PendingIntent;", "getIntentSender") }
        }
        check(helpers.size == 1) { "expected one in-app update helper, found ${helpers.map { it.type }}" }
        val helper = helpers.single()
        val check = helper.methods.single { it.returnType == "V" && it.params().size == 2 && it.params()[0] == CONTEXT && it.calls("Lcom/google/android/gms/tasks/Task;", "addOnSuccessListener") }
        val flow = helper.methods.single { it.returnType == "V" && it.params().size == 2 && it.calls("Landroid/app/PendingIntent;", "getIntentSender") }
        for ((label, method) in listOf("update check" to check, "update flow" to flow)) {
            check(method.instructions().first().opcode == Opcode.RETURN_VOID) { "$label ${helper.type}->${method.name} does not return at once" }
        }
        // The Feed's update card (2026-11-22): the static (Context)Z holding "feed_min_version" and
        // "PREF_FEED_UPDATE_ON_VERSION" answers false at once.
        val feedCards = classes.flatMap { it.methods }.filter { m ->
            m.isStatic() && m.returnType == "Z" && m.params() == listOf(CONTEXT) &&
                m.strings().containsAll(listOf("feed_min_version", "PREF_FEED_UPDATE_ON_VERSION"))
        }
        check(feedCards.size == 1) { "expected one Feed update card check, found ${feedCards.size}" }
        assertForcedBoolean(feedCards.single(), expected = false, label = "Feed update card ${feedCards.single().definingClass}->${feedCards.single().name}")

        // Hide match chat: the chat button helper and the button's motion method ask
        // hideChatButton(p0) first and return when it answers true.
        val fab = "Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;"
        val chatHelpers = classes.flatMap { c ->
            c.methods.filter { it.isStatic() && it.returnType == "V" && it.params() == listOf(fab, "Lkotlin/jvm/functions/Function0;") &&
                "PREF_CHAT_SHOW_ANIMATED_CHAT_ICON" in it.strings() }
        }
        check(chatHelpers.size == 1) { "expected one chat button helper, found ${chatHelpers.size}" }
        val chatHelper = chatHelpers.single()
        val motionName = chatHelper.instructions().mapNotNull { it.call() }
            .single { it.definingClass == fab && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("I") }.name
        val motion = byType.getValue(fab).methods.single { it.name == motionName && it.params() == listOf("I") }
        for ((label, method) in listOf("chat button helper" to chatHelper, "chat button motion" to motion)) {
            val insns = method.instructions()
            val p0 = method.implementation!!.registerCount - method.params().size - (if (method.isStatic()) 0 else 1)
            val call = insns[0]
            check(call.opcode == Opcode.INVOKE_STATIC_RANGE && call.call()?.definingClass == SOFASCORE_CONTROLS &&
                call.call()?.name == "hideChatButton" && (call as RegisterRangeInstruction).startRegister == p0 && call.registerCount == 1
            ) { "$label does not start with hideChatButton(p0); got ${call.opcode} ${call.call()}" }
            val result = (insns[1] as? OneRegisterInstruction)?.registerA
            check(insns[1].opcode == Opcode.MOVE_RESULT && insns[2].opcode == Opcode.IF_EQZ &&
                (insns[2] as OneRegisterInstruction).registerA == result && insns[3].opcode == Opcode.RETURN_VOID
            ) { "$label: the hideChatButton gate is malformed: ${insns.take(4).map { it.opcode }}" }
            check(insns.branchTarget(2) == 4) { "$label: the gate does not fall through to the stock code" }
        }

        // Hide main tabs: every return of the tab list builder passes the list through filterMainTabs.
        val builders = classes.flatMap { c ->
            c.methods.filter { it.isStatic() && it.returnType == "Ljava/util/ArrayList;" && it.params() == listOf(CONTEXT, "Ljava/lang/String;") &&
                "should_show_world_cup" in it.strings() && "DEV_MODE_SHOW_WORLD_CUP" in it.strings() }
        }
        check(builders.size == 1) { "expected one main tab list builder, found ${builders.size}" }
        val insns = builders.single().instructions()
        val returns = insns.indices.filter { insns[it].opcode == Opcode.RETURN_OBJECT }
        check(returns.isNotEmpty()) { "the main tab list builder has no return-object" }
        for (ret in returns) {
            val register = (insns[ret] as OneRegisterInstruction).registerA
            val call = insns[ret - 2]
            check(call.opcode == Opcode.INVOKE_STATIC_RANGE && call.call()?.definingClass == SOFASCORE_CONTROLS &&
                call.call()?.name == "filterMainTabs" && (call as RegisterRangeInstruction).startRegister == register &&
                insns[ret - 1].opcode == Opcode.MOVE_RESULT_OBJECT && (insns[ret - 1] as OneRegisterInstruction).registerA == register
            ) { "main tab list return at $ret is not filtered; got ${call.opcode} ${call.call()} ${insns[ret - 1].opcode}" }
        }
        // No jump may skip the filter: nothing branches straight to a return.
        val targets = insns.indices.filter { insns[it] is OffsetInstruction }.map { insns.branchTarget(it) }.toSet()
        check(returns.none { it in targets }) { "a branch skips the main tab filter" }
    }

    private fun assertHideCountries(classes: List<ClassDef>, byType: Map<String, ClassDef>, diagnostics: String) {
        fun require(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes\n$diagnostics")
        val filter = require(COUNTRY_FILTER)
        check(HIDDEN_COUNTRIES.id == "sofascore.hidden_countries") { "the Hidden countries list id changed" }

        // Seeds: CountryFilter.seeds() returns the app's country list ("code TAB name" lines).
        val seeds = filter.methods.single { it.name == "seeds" }.instructions()
        check(seeds.getOrNull(0)?.opcode == Opcode.CONST_STRING_JUMBO && seeds.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT) {
            "CountryFilter.seeds() was not rewritten; got ${seeds.take(2).map { it.opcode }}"
        }
        val lines = ((seeds[0] as ReferenceInstruction).reference as StringReference).string.split('\n')
        check(lines.size >= 200 && lines.all { it.count { c -> c == '\t' } == 1 } &&
            listOf("AF\tAfghanistan", "EN\tEngland", "SX\tScotland", "WA\tWales", "NX\tNorthern Ireland", "XK\tKosovo").all { it in lines }
        ) { "CountryFilter.seeds() has ${lines.size} lines: ${lines.take(5)}" }

        // ReleaseApp.onCreate registers them: every return-void is preceded by CountryFilter.init().
        val onCreate = require(RELEASE_APP).methods.single { it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.isEmpty() }
        val onCreateInsns = onCreate.instructions()
        val returns = onCreateInsns.indices.filter { onCreateInsns[it].opcode == Opcode.RETURN_VOID }
        check(returns.isNotEmpty() && returns.all { i ->
            onCreateInsns.getOrNull(i - 1)?.call()?.let { it.definingClass == COUNTRY_FILTER && it.name == "init" } == true
        }) { "ReleaseApp.onCreate does not call CountryFilter.init() before every return-void" }
        check(onCreateInsns.count { it.call()?.definingClass == COUNTRY_FILTER } == returns.size) { "CountryFilter.init() called off a return" }

        // Picker flags (2026-11-03): CountryFilter.init registers CountryIcons. Codes outside ISO
        // alpha-2 need their own case in CountryIcons (SX is ISO, Sint Maarten, but Scotland here).
        // With images (2026-11-03): CountryIcons also names Sofascore's flag image per alpha2 key.
        assertOptionIconsWired(byType, filter.methods.single { it.name == "init" }, "Lapp/template/extension/sofascore/CountryIcons;", images = true)
        val iso = java.util.Locale.getISOCountries().toSet() + "XK"
        val nonIso = lines.map { it.substringBefore('\t') }.filterNot { it in iso }.toSet()
        check((nonIso - setOf("EN", "WA", "NX", "TU", "SW")).isEmpty()) {
            "Sofascore codes outside ISO alpha-2: $nonIso; give the new ones a flag in CountryIcons"
        }

        // Each feature patch turns its part of the shared hooks on: patched() returns true.
        for (type in listOf(COUNTRY_FILTER, COMPETITION_FILTER)) {
            val patched = require(type).methods.single { it.name == "patched" && it.returnType == "Z" && it.parameterTypes.isEmpty() }
            assertForcedBoolean(patched, expected = true, label = "$type.patched()", diagnostics = diagnostics)
        }

        // Hide competitions (2026-11-03): CountryFilter.init also registers the competition logos
        // (CompetitionIcons: Sofascore's unique-tournament image, the country's flag or a trophy).
        check(HIDDEN_COMPETITIONS.id == "sofascore.hidden_competitions") { "the Hidden competitions list id changed" }
        check(require(COMPETITION_FILTER).methods.flatMap { it.strings() }
            .contains("https://img.sofascore.com/api/v1/unique-tournament/%s/image")) { "CompetitionFilter lost its logo URL" }
        check(filter.methods.single { it.name == "init" }.instructions().any {
            it.call()?.let { c -> c.definingClass == COMPETITION_FILTER && c.name == "init" } == true
        }) { "CountryFilter.init() does not call CompetitionFilter.init()" }
        assertOptionIconsWired(byType, require(COMPETITION_FILTER).methods.single { it.name == "init" },
            "Lapp/template/extension/sofascore/CompetitionIcons;", images = true)

        // Getters: iget-object vX; vX = CountryFilter.<helper>(vX); return-object vX.
        for ((type, getter, helper) in listOf(
            Triple("Lcom/sofascore/model/newNetwork/SportCategoriesResponse;", "getCategories", "filterCategories"),
            Triple("Lcom/sofascore/model/newNetwork/CategoriesForDateResponse;", "getCategories", "filterCategoryWrappers"),
            Triple("Lcom/sofascore/model/network/response/SearchResponse;", "getResults", "filterSearchResults"),
            // A country's competitions in Leagues (Hide competitions).
            Triple("Lcom/sofascore/model/newNetwork/UniqueTournamentGroupResponse;", "getUniqueTournaments", "filterUniqueTournaments"),
        )) {
            val insns = require(type).methods.single { it.name == getter && it.parameterTypes.isEmpty() }.instructions()
            val register = (insns[0] as OneRegisterInstruction).registerA
            check(insns.size == 4 && insns[0].opcode == Opcode.IGET_OBJECT &&
                insns[1].opcode == Opcode.INVOKE_STATIC_RANGE && insns[1].call()?.definingClass == COUNTRY_FILTER &&
                insns[1].call()?.name == helper && (insns[1] as RegisterRangeInstruction).startRegister == register &&
                (insns[1] as RegisterRangeInstruction).registerCount == 1 &&
                insns[2].opcode == Opcode.MOVE_RESULT_OBJECT && (insns[2] as OneRegisterInstruction).registerA == register &&
                insns[3].opcode == Opcode.RETURN_OBJECT && (insns[3] as OneRegisterInstruction).registerA == register
            ) { "$type.$getter is not filtered through $helper: ${insns.map { it.opcode }}" }
        }

        // Live tab, chronological view and an expanded country of the date feed: in the lambda
        // calling the request, the register returning the request's result (the result register, or
        // a move-object copy of it: categoryScheduledEvents in ro3) goes through the filter right
        // before its return, and every branch that returned it now jumps to the filter.
        // A date's popular matches in the Matches tab (2026-11-22): getPopularEvents(sport,
        // countryCode, date, continuation); its (continuation) overload is a head-to-head request.
        fun MethodReference.isApi(api: String) = definingClass == NETWORK_COROUTINE_API && name == api &&
            (api != "getPopularEvents" || (parameterTypes.size == 4 && parameterTypes.take(3).all { it.toString() == "Ljava/lang/String;" }))
        for ((api, helper) in listOf(
            "sportLiveEvents" to "filterEventList",
            "getIndexedEventsPage" to "filterEventList",
            "categoryScheduledEvents" to "filterCategoryEvents",
            "getPopularEvents" to "filterEventList",
        )) {
            val callers = classes.flatMap { it.methods }.filter { m ->
                m.instructions().any { it.call()?.isApi(api) == true }
            }
            check(callers.size == 1) { "expected one caller of $api, found ${callers.map { it.definingClass }}" }
            val insns = callers.single().instructions()
            val call = insns.indexOfFirst { it.call()?.isApi(api) == true }
            val result = (insns[call + 1] as OneRegisterInstruction).registerA
            val hook = (call + 2 until insns.size).first {
                insns[it].opcode == Opcode.RETURN_OBJECT || insns[it].call()?.definingClass == COUNTRY_FILTER
            }
            val returned = (insns.getOrNull(hook + 2) as? OneRegisterInstruction)?.registerA
            check(insns[hook].opcode == Opcode.INVOKE_STATIC_RANGE && insns[hook].call()?.name == helper &&
                (insns[hook] as RegisterRangeInstruction).startRegister == returned &&
                (insns[hook] as RegisterRangeInstruction).registerCount == 1 &&
                insns[hook + 1].opcode == Opcode.MOVE_RESULT_OBJECT && (insns[hook + 1] as OneRegisterInstruction).registerA == returned &&
                insns[hook + 2].opcode == Opcode.RETURN_OBJECT
            ) { "$api's result is not passed through $helper before its return" }
            check(returned == result || (call + 2 until hook).any { i ->
                insns[i].opcode == Opcode.MOVE_OBJECT && (insns[i] as TwoRegisterInstruction).let { it.registerA == returned && it.registerB == result }
            }) { "$api: the filtered register v$returned does not hold the result v$result" }
            val targets = insns.indices.filter { i ->
                insns[i] is OffsetInstruction &&
                    insns[i].opcode !in setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.FILL_ARRAY_DATA)
            }.map { insns.branchTarget(it) }
            check(hook in targets && (hook + 2) !in targets) { "$api: a branch skips $helper" }
            check(insns.count { it.call()?.definingClass == COUNTRY_FILTER } == 1) { "$api's lambda calls CountryFilter more than once" }
        }
        // Pinned leagues stay (the rows say so): the per-league request behind the Matches tab's
        // pinned section and a league's page is not filtered.
        val pinnedCallers = classes.flatMap { it.methods }.filter { m ->
            m.instructions().any { it.call()?.isApi("uniqueTournamentScheduledEvents") == true }
        }
        check(pinnedCallers.isNotEmpty() && pinnedCallers.none { m -> m.instructions().any { it.call()?.definingClass == COUNTRY_FILTER } }) {
            "uniqueTournamentScheduledEvents callers ${pinnedCallers.map { it.definingClass }} are missing or filtered"
        }
    }

    /** `sget-object Boolean.FALSE` into some register, then `return-object` of that register. */
    private fun assertReturnsBooleanFalse(method: Method, label: String) {
        val insns = method.instructions()
        val load = insns.getOrNull(0)
        val field = (load as? ReferenceInstruction)?.reference as? FieldReference
        check(
            load?.opcode == Opcode.SGET_OBJECT && field?.definingClass == "Ljava/lang/Boolean;" && field.name == "FALSE" &&
                insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
                (insns[1] as OneRegisterInstruction).registerA == (load as OneRegisterInstruction).registerA
        ) { "$label does not return Boolean.FALSE first; got ${insns.take(2).map { it.opcode }}" }
    }

    private fun assertStartupAndSpeed(classes: List<ClassDef>, byType: Map<String, ClassDef>, diagnostics: String) {
        fun require(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes\n$diagnostics")
        fun ClassDef.single(name: String, returnType: String, params: List<String>) =
            methods.single { it.name == name && it.returnType == returnType && it.params() == params }

        // Disable ads: the ad SDK lifecycle providers report success without starting anything,
        // and Unity's androidx.startup Initializer returns at once. PicassoProvider stays stock.
        for (provider in AD_SDK_PROVIDERS) {
            assertForcedBoolean(require(provider).single("onCreate", "Z", emptyList()), expected = true, label = "$provider.onCreate()", diagnostics)
        }
        assertReturnsBooleanFalse(require(UNITY_ADS_INITIALIZER).single("create", "Ljava/lang/Object;", listOf(CONTEXT)), "AdsSdkInitializer.create(Context)")
        check(require(PICASSO_PROVIDER).single("onCreate", "Z", emptyList()).instructions().first().opcode != Opcode.CONST_4) {
            "PicassoProvider.onCreate() must stay stock (Picasso.get() needs its context)"
        }

        // Disable telemetry: FIAM's data-collection getter (the no-arg boolean holding the manifest
        // key and "auto_init") answers false; the EmojiCompat Initializer returns at once.
        val fiam = classes.flatMap { it.methods }.filter { m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() && m.strings().containsAll(listOf(FIAM_DATA_COLLECTION_KEY, "auto_init"))
        }
        check(fiam.size == 1) { "expected one FIAM data-collection getter, found ${fiam.size}\n$diagnostics" }
        assertForcedBoolean(fiam.single(), expected = false, label = "FIAM isAutomaticDataCollectionEnabled()", diagnostics)
        assertReturnsBooleanFalse(require(EMOJI_COMPAT_INITIALIZER).single("create", "Ljava/lang/Object;", listOf(CONTEXT)), "EmojiCompatInitializer.create(Context)")

        // Animation speed: the extension is merged; ReleaseApp.onCreate starts with init(p0).
        val speed = require(SOFASCORE_ANIMATION_SPEED)
        val onCreate = require(RELEASE_APP).single("onCreate", "V", emptyList())
        val p0 = onCreate.implementation!!.registerCount - 1
        val init = onCreate.instructions().first()
        check(init.opcode == Opcode.INVOKE_STATIC_RANGE && init.call()?.definingClass == SOFASCORE_ANIMATION_SPEED &&
            init.call()?.name == "init" && (init as RegisterRangeInstruction).startRegister == p0 && init.registerCount == 1
        ) { "ReleaseApp.onCreate() does not call AnimationSpeed.init(p0) first; got ${init.opcode} ${init.call()}" }

        // Every app call to Settings.Global.getFloat(ContentResolver, String, F) now goes to the
        // extension's getFloat with the same signature; only the extension still calls the framework.
        fun Method.isGlobalGetFloat(owner: String) = instructions().count { insn ->
            insn.call()?.let { it.definingClass == owner && it.name == "getFloat" && it.returnType == "F" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/ContentResolver;", "Ljava/lang/String;", "F") } == true
        }
        val leftover = classes.filterNot { it.type.startsWith("Lapp/template/extension/") }.flatMap { it.methods }
            .filter { it.isGlobalGetFloat(GLOBAL_SETTINGS) > 0 }
        check(leftover.isEmpty()) { "Settings.Global.getFloat is still called from ${leftover.map { "${it.definingClass}->${it.name}" }}" }
        val redirected = classes.flatMap { it.methods }.filter { it.isGlobalGetFloat(SOFASCORE_ANIMATION_SPEED) > 0 }
        check(redirected.size >= 10) { "AnimationSpeed.getFloat is called from only ${redirected.size} methods" }
        // Every caller is one of the "animator_duration_scale" readers.
        check(redirected.all { "animator_duration_scale" in it.strings() }) {
            "a redirected getFloat caller does not read animator_duration_scale: " +
                redirected.filterNot { "animator_duration_scale" in it.strings() }.map { "${it.definingClass}->${it.name}" }
        }
        check(speed.single("getFloat", "F", listOf("Landroid/content/ContentResolver;", "Ljava/lang/String;", "F")).isGlobalGetFloat(GLOBAL_SETTINGS) == 1) {
            "AnimationSpeed.getFloat no longer calls through to Settings.Global.getFloat"
        }

        // Turn off video autoplay: the YouTube player's load-or-cue helper (static (?, Z, String, F)V
        // holding "loadVideo" and "cueVideo", 4 registers = all parameters, so no scratch register)
        // starts with invoke-static/range {p1 .. p1}, <class>->morpheVideoAutoplay(Z)Z; move-result p1.
        // That (Z)Z helper (added to the same class) runs the Patch settings gate on v0 and, only
        // while the switch is on, answers false (const/4 v0, 0x0; return v0) instead of its
        // argument, so the helper cues the video instead of loading it. The extension is merged.
        require(HEVAL_SETTINGS_CLASS)
        val loadOrCue = classes.flatMap { it.methods }.filter { m ->
            m.isStatic() && m.returnType == "V" && m.params().let { p ->
                p.size == 4 && p[1] == "Z" && p[2] == "Ljava/lang/String;" && p[3] == "F"
            } && m.strings().containsAll(listOf("loadVideo", "cueVideo"))
        }
        check(loadOrCue.size == 1) { "expected one load-or-cue helper, found ${loadOrCue.size}\n$diagnostics" }
        val cueMethod = loadOrCue.single()
        val cueInsns = cueMethod.instructions()
        // p1 = the second parameter of a static method, i.e. register (registers - 4 + 1).
        val autoPlay = cueMethod.implementation!!.registerCount - 4 + 1
        val filter = cueInsns[0] as? RegisterRangeInstruction
        check(filter != null && filter.opcode == Opcode.INVOKE_STATIC_RANGE && filter.startRegister == autoPlay &&
            filter.registerCount == 1 && filter.call()?.definingClass == cueMethod.definingClass &&
            filter.call()?.name == "morpheVideoAutoplay" && filter.call()?.returnType == "Z" &&
            cueInsns[1].opcode == Opcode.MOVE_RESULT && (cueInsns[1] as OneRegisterInstruction).registerA == autoPlay
        ) { "load-or-cue helper does not pass autoPlay (v$autoPlay) through morpheVideoAutoplay first; got ${cueInsns[0].opcode} ${cueInsns[0].call()}" }
        // The stock calls are still there.
        check(cueMethod.strings().containsAll(listOf("loadVideo", "cueVideo"))) { "load-or-cue helper lost its player commands" }
        val autoPlayHelper = classes.single { it.type == cueMethod.definingClass }.methods.single {
            it.name == "morpheVideoAutoplay" && it.returnType == "Z" && it.params() == listOf("Z") && it.isStatic()
        }
        assertGatedPath(autoPlayHelper, TURN_OFF_VIDEO_AUTOPLAY.id, "morpheVideoAutoplay(Z)Z", listOf(Opcode.CONST_4, Opcode.RETURN), literal = 0)
        check(autoPlayHelper.instructions().last().opcode == Opcode.RETURN) { "morpheVideoAutoplay must end by returning its argument" }
        // Slower widget refresh: in the widget scheduler (static (Context)V holding the unique work
        // label and the worker class), the 30-minute interval passes through widgetRefreshMinutes
        // before PeriodicWorkRequest.Builder(Class, long, TimeUnit.MINUTES) gets it (26.11.09):
        // const-wide vX, 30; invoke-static/range {vX .. vX+1}; move-result-wide vX.
        val scheduler = classes.flatMap { it.methods }.filter { m ->
            m.isStatic() && m.returnType == "V" && m.params() == listOf(CONTEXT) &&
                "widget_periodic_refresh" in m.strings() &&
                m.instructions().any { (it as? ReferenceInstruction)?.reference.let { r -> r is TypeReference && r.type == WIDGET_REFRESH_WORKER } }
        }
        check(scheduler.size == 1) { "expected one widget refresh scheduler, found ${scheduler.size}\n$diagnostics" }
        val wInsns = scheduler.single().instructions()
        val hook = wInsns.indexOfFirst { it.call()?.let { c -> c.definingClass == SOFASCORE_CONTROLS && c.name == "widgetRefreshMinutes" } == true }
        check(hook > 0) { "the widget scheduler does not call widgetRefreshMinutes" }
        val load = wInsns[hook - 1]
        val register = (load as OneRegisterInstruction).registerA
        check(
            (load as? com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction)?.wideLiteral == 30L &&
                wInsns[hook].opcode == Opcode.INVOKE_STATIC_RANGE && (wInsns[hook] as RegisterRangeInstruction).startRegister == register &&
                (wInsns[hook] as RegisterRangeInstruction).registerCount == 2 &&
                wInsns[hook + 1].opcode == Opcode.MOVE_RESULT_WIDE && (wInsns[hook + 1] as OneRegisterInstruction).registerA == register &&
                wInsns.subList(hook + 2, wInsns.size).first { it.opcode == Opcode.INVOKE_DIRECT }.call()
                    .let { it?.definingClass == "Landroidx/work/PeriodicWorkRequest\$Builder;" && it.name == "<init>" }
        ) { "the widget interval hook is malformed: ${wInsns.subList(hook - 1, hook + 3).map { it.opcode }}" }
        check(wInsns.count { it.call()?.name == "widgetRefreshMinutes" } == 1) { "widgetRefreshMinutes is called more than once" }
    }
}
