import app.template.patches.shared.hevalcontrols.HEVAL_SETTINGS_CLASS
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.HevalRegistryCodec
import app.template.patches.sofascore.controls.SOFASCORE_CONTROLS
import app.template.patches.sofascore.controls.SOFASCORE_CONTROLS_ENTRY
import app.template.patches.sofascore.layout.HIDE_AI_INSIGHTS
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
import app.template.patches.sofascore.spoiler.SPOILER_LISTS
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

private const val RELEASE_APP = "Lcom/sofascore/results/ReleaseApp;"
private const val FIREBASE_BUNDLE = "Lcom/sofascore/model/FirebaseBundle;"
private val CONSENT_TYPES = listOf("ad_personalization", "ad_user_data", "analytics_storage", "ad_storage")

private const val START_ACTIVITY = "Lcom/sofascore/results/main/MainActivity;"
private const val SIGNATURE_SHA1 = "e235776bc0ad3837b01359177c438658b1424d23"

private val SOFASCORE_PATCHES = setOf(
    "AMOLED black",
    "Animation speed",
    "Block marketing notifications",
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
    TURN_OFF_VIDEO_AUTOPLAY

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
            version = "26.11.03",
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
        fun assertReturnFilter(helper: String, expected: Map<String, Int>) {
            val sites = classes.flatMap { it.methods }.flatMap { m ->
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
        // 26.11.03 split the old shared lambda: the rows and one selected-sport case share one
        // lambda class, the names query and the other selected-sport case another, and a third
        // lambda class holds the names query alone.
        val rowsAndSelected = "SELECT * FROM sport_order ORDER BY sportOrder ASC, SELECT sportName FROM sport_order WHERE isSelected = 1"
        val namesAndSelected = "SELECT sportName FROM sport_order ORDER BY sportOrder ASC, SELECT sportName FROM sport_order WHERE isSelected = 1"
        val namesOnly = "SELECT sportName FROM sport_order ORDER BY sportOrder ASC"
        assertReturnFilter("filterSportOrders", mapOf(rowsAndSelected to 1))
        assertReturnFilter("filterSportNames", mapOf(namesAndSelected to 1, namesOnly to 1))
        // Two selected-sport cases, and the three returns of the PREF_HOME_SPORT_V2 getter.
        assertReturnFilter("visibleSport", mapOf(rowsAndSelected to 1, namesAndSelected to 1, "PREF_HOME_SPORT_V2" to 3))

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
        for ((api, helper) in listOf(
            "sportLiveEvents" to "filterEventList",
            "getIndexedEventsPage" to "filterEventList",
            "categoryScheduledEvents" to "filterCategoryEvents",
        )) {
            val callers = classes.flatMap { it.methods }.filter { m ->
                m.instructions().any { it.call()?.let { c -> c.definingClass == NETWORK_COROUTINE_API && c.name == api } == true }
            }
            check(callers.size == 1) { "expected one caller of $api, found ${callers.map { it.definingClass }}" }
            val insns = callers.single().instructions()
            val call = insns.indexOfFirst { it.call()?.let { c -> c.definingClass == NETWORK_COROUTINE_API && c.name == api } == true }
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
        // label and the worker class), the 30-minute interval passes through widgetRefreshInterval
        // before it is stored: const-wide vX, 1800000; invoke-static/range {vX .. vX+1}; move-result-wide vX; iput-wide vX.
        val scheduler = classes.flatMap { it.methods }.filter { m ->
            m.isStatic() && m.returnType == "V" && m.params() == listOf(CONTEXT) &&
                "enqueueUniquePeriodic_widget_periodic_refresh" in m.strings() &&
                m.instructions().any { (it as? ReferenceInstruction)?.reference.let { r -> r is TypeReference && r.type == WIDGET_REFRESH_WORKER } }
        }
        check(scheduler.size == 1) { "expected one widget refresh scheduler, found ${scheduler.size}\n$diagnostics" }
        val wInsns = scheduler.single().instructions()
        val hook = wInsns.indexOfFirst { it.call()?.let { c -> c.definingClass == SOFASCORE_CONTROLS && c.name == "widgetRefreshInterval" } == true }
        check(hook > 0) { "the widget scheduler does not call widgetRefreshInterval" }
        val load = wInsns[hook - 1]
        val register = (load as OneRegisterInstruction).registerA
        check(
            (load as? com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction)?.wideLiteral == 1_800_000L &&
                wInsns[hook].opcode == Opcode.INVOKE_STATIC_RANGE && (wInsns[hook] as RegisterRangeInstruction).startRegister == register &&
                (wInsns[hook] as RegisterRangeInstruction).registerCount == 2 &&
                wInsns[hook + 1].opcode == Opcode.MOVE_RESULT_WIDE && (wInsns[hook + 1] as OneRegisterInstruction).registerA == register &&
                wInsns[hook + 2].opcode == Opcode.IPUT_WIDE && (wInsns[hook + 2] as OneRegisterInstruction).registerA == register
        ) { "the widget interval hook is malformed: ${wInsns.subList(hook - 1, hook + 3).map { it.opcode }}" }
        check(wInsns.count { it.call()?.name == "widgetRefreshInterval" } == 1) { "widgetRefreshInterval is called more than once" }
    }
}
