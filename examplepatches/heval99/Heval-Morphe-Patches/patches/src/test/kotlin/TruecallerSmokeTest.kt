import app.morphe.patcher.patch.Patch
import app.template.patches.shared.hevalcontrols.HEVAL_SETTINGS_CLASS
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.HevalRegistryCodec
import app.template.patches.truecaller.controls.TRUECALLER_CONTROLS_ENTRY
import app.template.patches.truecaller.layout.BRAND_MEDIA_HELPER
import app.template.patches.truecaller.layout.CALL_LOG_NUMBER_SEPARATOR
import app.template.patches.truecaller.layout.CALL_LOG_SUBTITLE_HELPER
import app.template.patches.truecaller.shared.toStringFields
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Format
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.util.ReferenceUtil
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val PKG = "com.truecaller"
private const val TRUECALLER_INIT = "Lcom/truecaller/ui/TruecallerInit;"
private const val SIGNATURE_SHA1 = "0ac1169ae6cead75264c725febd8e8d941f25e31"

private const val PREMIUM_TIER_TYPE = "Lcom/truecaller/premium/data/tier/PremiumTierType;"
private const val PREMIUM_FEATURE = "Lcom/truecaller/premium/data/feature/PremiumFeature;"
private const val PREMIUM_FEATURE_STATUS = "Lcom/truecaller/premium/data/feature/PremiumFeatureStatus;"
private const val SUBSCRIPTION_WORKER = "Lcom/truecaller/premium/PremiumSubscriptionStatusNotificationWorker;"
private const val OTP_SMS_API = "Lcom/truecaller/wizard/verification/otp/sms/OtpSmsApi;"
private const val UPDATE_TRIGGER = "Lcom/truecaller/inappupdate/UpdateTrigger;"
private const val ADS_CONTAINER = "Lcom/truecaller/ads/ui/AdsContainer;"
private const val ADS_CONTAINER_LIGHT = "Lcom/truecaller/ads/ui/AdsContainerLight;"
private const val ADS_SWITCH_VIEW = "Lcom/truecaller/ads/ui/AdsSwitchView;"
private const val AD_LAYOUT_TYPE = "Lcom/truecaller/ads/AdLayoutTypeX;"
private const val BOTTOM_BAR_BUTTON_TYPE = "Lcom/truecaller/bottombar/BottomBarButtonType;"
private const val BOTTOM_BAR_VIEW = "Lcom/truecaller/bottombar/BottomBarView;"
private const val RECYCLER_VIEW = "Landroidx/recyclerview/widget/RecyclerView;"
private const val AD_PLACEMENT = "Lcom/truecaller/ads/api/model/ad/AdPlacement;"
private const val FEATURE_STATE = "Lcom/truecaller/featuretoggles/FeatureState;"
private const val T9_REBUILD_ALL_KEY = "RefreshT9MappingWorker.RebuildAll"
private const val T9_INCREMENTAL_HELPER = "morpheRefreshT9Incremental"
private const val CLEVERTAP_FEATURE_KEY = "featureCleverTap"
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"
private const val CONTACT_TYPE = "Lcom/truecaller/enterpriseinfo/api/model/ContactType;"
private const val CALL_LOG_FILTER_TYPE = "Lcom/truecaller/calllog/api/FilterType;"
private const val CALL_UI_HAPTIC = "Lcom/truecaller/callui/presentation/ui/CallUIHaptic;"
private const val SWIPE_DRAGGING_STATE = "Lcom/truecaller/callui/presentation/ui/components/CallUISwipeButtonDraggingState;"
private val BLOCK_END_OPCODES = setOf(
    Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW,
    Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32, Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH,
)
private const val MOBILE_NUMBERS_SELECTION ="data_type = ? AND data_phonebook_id NOT NULL AND data8 = ?"
private const val HEVAL_EXTENSION = "Lapp/template/extension/hevalcontrols/"
private const val CATEGORIES_FRAGMENT = "Lcom/truecaller/settings/impl/ui/categories/CategoriesFragment;"

// Heval Controls feature ids. They name the user's saved choices, so a shipped id never changes.
private const val HIDE_PROMOTIONS = "truecaller.hide_promotions"
private const val DISABLE_NAGS = "truecaller.disable_nags"
private const val DISABLE_AUTO_LAUNCH = "truecaller.disable_auto_launch"
private const val DISABLE_UPDATE_PROMPTS = "truecaller.disable_update_prompts"
private const val HIDE_AFTER_CALL_CONTACTS = "truecaller.hide_after_call_contacts"
private const val HIDE_FAMILY_BUTTON = "truecaller.hide_family_button"
private const val HIDE_BUSINESS_MEDIA = "truecaller.hide_business_media"
private const val HIDE_ASSISTANT_TAB = "truecaller.hide_assistant_tab"
private const val HIDE_SCAM_FEED = "truecaller.hide_scam_feed"
private const val HIDE_BLOCKING_TAB = "truecaller.hide_blocking_tab"
private const val SHOW_CALLER_NUMBER = "truecaller.show_caller_number"
private const val FIX_T9_SEARCH = "truecaller.fix_t9_search"
private const val HIDE_MESSAGES_TAB = "truecaller.hide_messages_tab"
private const val HIDE_PREMIUM_TAB = "truecaller.hide_premium_tab"
private const val RESTORE_CLASSIC_CALL_LOG = "truecaller.restore_classic_call_log"
private const val HIDE_CALL_LOG_FILTERS = "truecaller.hide_call_log_filters"
private const val HIDE_FREQUENT_CONTACTS = "truecaller.hide_frequent_contacts"
private const val HIDE_IMPORTANT_SENDERS = "truecaller.hide_important_senders"
private const val DISABLE_CALL_HAPTICS = "truecaller.disable_call_button_haptics"
private const val SWAP_CALL_BUTTONS = "truecaller.swap_call_buttons"
private const val SWAP_CALL_LAYOUTS = "Lapp/template/extension/truecaller/SwapCallButtons;"

/** Patch name, feature id, category and restartRequired of every Truecaller Heval Controls feature. */
private val HEVAL_FEATURES = listOf(
    Triple("Hide promotions", HIDE_PROMOTIONS, "Promotions & nags" to true),
    Triple("Disable nags", DISABLE_NAGS, "Promotions & nags" to false),
    Triple("Disable auto-launch", DISABLE_AUTO_LAUNCH, "Promotions & nags" to false),
    Triple("Disable update prompts", DISABLE_UPDATE_PROMPTS, "Promotions & nags" to false),
    Triple("Hide Assistant tab", HIDE_ASSISTANT_TAB, "Tabs & buttons" to true),
    Triple("Hide Scam feed", HIDE_SCAM_FEED, "Tabs & buttons" to true),
    Triple("Hide Blocking tab", HIDE_BLOCKING_TAB, "Tabs & buttons" to true),
    Triple("Hide family button", HIDE_FAMILY_BUTTON, "Tabs & buttons" to true),
    Triple("Show caller number in call log", SHOW_CALLER_NUMBER, "Call log & search" to false),
    Triple("Fix T9 contact search", FIX_T9_SEARCH, "Call log & search" to true),
    Triple("Hide after-call screen for contacts", HIDE_AFTER_CALL_CONTACTS, "Contacts & business" to false),
    Triple("Hide business media", HIDE_BUSINESS_MEDIA, "Contacts & business" to false),
    Triple("Hide Messages tab", HIDE_MESSAGES_TAB, "Tabs & buttons" to true),
    Triple("Hide Premium tab", HIDE_PREMIUM_TAB, "Tabs & buttons" to true),
    Triple("Restore classic call log", RESTORE_CLASSIC_CALL_LOG, "Call log & search" to true),
    Triple("Hide call log filters", HIDE_CALL_LOG_FILTERS, "Call log & search" to true),
    Triple("Hide frequently called contacts", HIDE_FREQUENT_CONTACTS, "Call log & search" to false),
    Triple("Hide important senders", HIDE_IMPORTANT_SENDERS, "Contacts & business" to false),
    Triple("Disable call button haptics", DISABLE_CALL_HAPTICS, "Call screen" to false),
    Triple("Swap call answer and decline buttons", SWAP_CALL_BUTTONS, "Call screen" to false),
)

// "Hide profile menu items" (#120): five switches in one patch, all off by default, no restart.
private const val PROFILE_MENU_PATCH = "Hide profile menu items"
private const val HIDE_PROFILE_PREMIUM_BANNER = "truecaller.hide_profile_premium_banner"
private const val PROFILE_MENU_ITEM = "Lcom/truecaller/usershome/presentaion/ui/components/menuitems/MenuItem;"

/** Feature id, MenuItem constant and row title of each profile menu row switch. */
private val PROFILE_MENU_ROWS = listOf(
    Triple("truecaller.hide_profile_watch", "ANDROID_WATCH", "Android watch"),
    Triple("truecaller.hide_profile_invite", "INVITE_FRIENDS", "Invite friends"),
    Triple("truecaller.hide_profile_connect", "CONNECT_WITH_US", "Connect with us"),
    Triple("truecaller.hide_profile_help", "HELP", "Help"),
)

/** The registry records of the profile menu switches. */
private val PROFILE_MENU_FEATURES = listOf(
    HevalFeature(
        HIDE_PROFILE_PREMIUM_BANNER, "Hide Premium banner", "Hides the Premium banner at the top of the profile menu.",
        "Profile menu", default = false,
    ),
) + PROFILE_MENU_ROWS.map { (id, _, title) ->
    HevalFeature(id, "Hide $title", "Hides $title in the profile menu.", "Profile menu", default = false)
}

class TruecallerSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.params() = parameterTypes.map(CharSequence::toString)

    private fun Method.strings() = instructions().mapNotNull { it.stringOrNull() }

    private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun List<ClassDef>.methodsWhere(predicate: (ClassDef, Method) -> Boolean): List<Pair<ClassDef, Method>> =
        flatMap { cls -> cls.methods.filter { predicate(cls, it) }.map { cls to it } }

    private fun List<ClassDef>.singleMethod(label: String, predicate: (ClassDef, Method) -> Boolean): Pair<ClassDef, Method> {
        val found = methodsWhere(predicate)
        check(found.size == 1) { "expected one $label, found ${found.map { (c, m) -> "${c.type}.${m.name}" }}" }
        return found.single()
    }

    /** Index of the instruction the branch at [index] jumps to. */
    private fun List<Instruction>.branchTarget(index: Int): Int {
        val offsets = runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        val target = offsets[index] + (this[index] as OffsetInstruction).codeOffset
        return offsets.indexOf(target)
    }

    private fun assertReturnsGold(method: Method, label: String) {
        val insns = method.instructions()
        val gold = insns.getOrNull(0)?.field()
        check(insns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT && gold?.definingClass == PREMIUM_TIER_TYPE && gold.name == "GOLD") {
            "$label does not load PremiumTierType.GOLD first; got ${insns.getOrNull(0)?.opcode} $gold"
        }
        check(insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT) { "$label does not return GOLD at once" }
    }

    /**
     * The instructions at [at] are the Heval Controls gate for [featureId]: const-string vX, the
     * /range isEnabled call on vX, move-result vX and [branch] vX (IF_EQZ for addHevalGate, IF_NEZ for
     * addHevalStockPath). Returns the index the branch jumps to (the original code).
     */
    private fun assertGate(method: Method, featureId: String, label: String, branch: Opcode = Opcode.IF_EQZ, at: Int = 0): Int {
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
            test?.opcode == branch && (test as OneRegisterInstruction).registerA == register
        ) { "$label: the gate does not branch on the isEnabled result with $branch; got ${result?.opcode} ${test?.opcode}" }
        return insns.branchTarget(at + 3)
    }

    /**
     * Instructions [at] and [at] + 1 pass v[register] through a Heval Controls value helper of
     * [type] (`invoke-static/range {vR .. vR}`, `move-result vR`): a static (T)T that starts with the
     * [featureId] gate and returns its argument unchanged at the gate's stock target. Returns the
     * helper's patched path (the instructions between the gate and that `return p0`).
     */
    private fun assertThroughValueHelper(
        insns: List<Instruction>, at: Int, register: Int, byType: Map<String, ClassDef>,
        featureId: String, type: String, label: String,
    ): List<Instruction> {
        val call = insns.getOrNull(at)
        val ref = call?.call()
        check(call?.opcode == Opcode.INVOKE_STATIC_RANGE && ref?.params() == listOf(type) && ref.returnType == type &&
            (call as RegisterRangeInstruction).startRegister == register && call.registerCount == 1
        ) { "$label does not pass v$register through a ($type)$type helper; got ${call?.opcode} $ref" }
        val result = insns.getOrNull(at + 1)
        check(result?.opcode == Opcode.MOVE_RESULT && (result as OneRegisterInstruction).registerA == register) {
            "$label does not keep the helper's result in v$register; got ${result?.opcode}"
        }
        val helper = (byType[ref.definingClass] ?: error("${ref.definingClass} not found")).method(ref.name, listOf(type))
        val helperLabel = "${ref.definingClass}.${ref.name}($type)"
        check(AccessFlags.STATIC.isSet(helper.accessFlags)) { "$helperLabel is not static" }
        val stock = assertGate(helper, featureId, helperLabel)
        val body = helper.instructions()
        val p0 = helper.implementation!!.registerCount - 1
        check(stock == body.lastIndex && body[stock].opcode == Opcode.RETURN && (body[stock] as OneRegisterInstruction).registerA == p0) {
            "$helperLabel does not return its argument unchanged while $featureId is off"
        }
        return body.subList(4, stock)
    }

    /** [path] is `const/4 vX, 0` then `return vX`: the helper answers false / 0 while its feature is on. */
    private fun List<Instruction>.isReturnZero() = size == 2 && this[0].opcode == Opcode.CONST_4 &&
        (this[0] as NarrowLiteralInstruction).narrowLiteral == 0 && this[1].opcode == Opcode.RETURN &&
        (this[1] as OneRegisterInstruction).registerA == (this[0] as OneRegisterInstruction).registerA

    /**
     * The four instructions before [at] are the Heval Controls skip gate for [featureId]
     * (`if-nez` on the isEnabled result), jumping to [target].
     */
    private fun assertSkipGate(method: Method, featureId: String, at: Int, target: Int, label: String) {
        check(at >= 4) { "$label has no room for a skip gate before $at" }
        val jump = assertGate(method, featureId, label, branch = Opcode.IF_NEZ, at = at - 4)
        check(jump == target) { "$label: the $featureId skip gate jumps to $jump, expected $target" }
    }

    private fun assertHevalControls(byType: Map<String, ClassDef>, allPatches: Set<Patch<*>>) {
        // 1. The extension classes (core, screen, init provider, the Settings row helper) are merged.
        for (type in listOf(HEVAL_SETTINGS_CLASS, "${HEVAL_EXTENSION}Registry;", "${HEVAL_EXTENSION}InitProvider;",
            "${HEVAL_EXTENSION}ui/HevalControlsActivity;", TRUECALLER_CONTROLS_ENTRY)) {
            check(type in byType) { "$type is not in the patched dex" }
        }
        // The screen title and the Settings row label use the UI name "Patch settings".
        for (type in listOf("${HEVAL_EXTENSION}ui/HevalControlsActivity;", TRUECALLER_CONTROLS_ENTRY)) {
            val strings = byType.getValue(type).methods.flatMap { it.strings() }
            check("Patch settings" in strings) { "$type does not use the \"Patch settings\" name" }
            check(strings.none { "Heval Controls" in it }) { "$type still shows \"Heval Controls\"" }
        }

        // 2. The registry lists exactly the twenty converted features, with each patch's Manager name
        // and description, default on, plus the five profile menu switches (default off). They are
        // written in registration (patch execution) order, so the records are compared as a set.
        val expected = HEVAL_FEATURES.map { (name, id, rest) ->
            val patch = allPatches.single { p -> p.name == name && p.compatibility.orEmpty().any { it.packageName == PKG } }
            HevalFeature(id, name, patch.description!!, rest.first, default = true, restartRequired = rest.second)
        } + PROFILE_MENU_FEATURES
        val registry = byType.getValue("${HEVAL_EXTENSION}Registry;").methods.single { it.name == "encoded" }.instructions()
        check(registry.getOrNull(0)?.opcode == Opcode.CONST_STRING_JUMBO && registry.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT) {
            "Registry.encoded() was not rewritten"
        }
        val encoded = registry[0].stringOrNull()!!.split('\n')
        val wanted = HevalRegistryCodec.encode(expected).split('\n')
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

        // 4. The Settings row: CategoriesFragment.onViewCreated passes its root view (p1) to
        // HevalControlsEntry.addRow right after super.onViewCreated.
        val onViewCreated = (byType[CATEGORIES_FRAGMENT] ?: error("$CATEGORIES_FRAGMENT not found"))
            .method("onViewCreated", listOf("Landroid/view/View;", "Landroid/os/Bundle;"))
        val insns = onViewCreated.instructions()
        val superCall = insns.indexOfFirst {
            (it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE) && it.call()?.name == "onViewCreated"
        }
        check(superCall >= 0) { "CategoriesFragment.onViewCreated does not call super.onViewCreated" }
        val p1 = onViewCreated.implementation!!.registerCount - 2 // this, view, state
        val entry = insns.getOrNull(superCall + 1)
        check(entry?.opcode == Opcode.INVOKE_STATIC_RANGE && entry.call()?.definingClass == TRUECALLER_CONTROLS_ENTRY &&
            entry.call()?.name == "addRow" && entry.call()?.parameterTypes?.map(CharSequence::toString) == listOf("Landroid/view/View;") &&
            (entry as RegisterRangeInstruction).startRegister == p1 && entry.registerCount == 1
        ) { "CategoriesFragment.onViewCreated does not call addRow(p1) after super.onViewCreated; got ${entry?.opcode} ${entry?.call()}" }
        check(insns.count { it.call()?.definingClass == TRUECALLER_CONTROLS_ENTRY } == 1) { "addRow is called more than once" }
    }

    @Test
    fun `Truecaller patches unlock premium, remove ads, telemetry, contact upload, update prompts, auto-launch, nags, promotions and optional UI, show caller numbers in the call log, hide its filters, frequent contacts and important senders, and route GMS to MicroG RE`() {
        val root = repoRoot()
        val apk = File(root, "apks/truecaller/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val allPatches = loadAllPatches(newestPatchBundle(root))
        // No Clone package name option (#50): a com.truecaller clone cannot install next to stock.
        val gmsCore = allPatches.single { p ->
            p.name == "GmsCore support" && p.compatibility.orEmpty().any { it.packageName == PKG }
        }
        check("packageName" !in gmsCore.options.keys) { "Truecaller GmsCore support still offers the packageName option" }

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "26.43.5",
            patchNames = setOf(
                "Enable Premium",
                "Disable ads",
                "Disable telemetry",
                "Disable update prompts",
                "Hide Assistant tab",
                "Hide Scam feed",
                "Hide Premium tab",
                "Hide Blocking tab",
                "Hide Messages tab",
                "Hide family button",
                "Restore classic call log",
                "Use SMS for verification codes",
                "Fix T9 contact search",
                "Hide Wear OS settings",
                "Hide business media",
                "Disable contact upload",
                "Disable auto-launch",
                "Disable nags",
                "Hide promotions",
                "Hide after-call screen for contacts",
                "Show caller number in call log",
                "Hide call log filters",
                "Hide frequently called contacts",
                "Hide important senders",
                "Swap call answer and decline buttons",
                "Disable call button haptics",
                PROFILE_MENU_PATCH,
                "GmsCore support",
                "Spoof signature",
                "Patch settings",
            ),
            allPatches = allPatches,
        )
        val byType = classes.associateBy { it.type }

        assertHevalControls(byType, allPatches)
        assertEnablePremium(classes, byType)
        assertDisableAds(classes, byType)
        assertDisableTelemetry(classes, byType)
        assertDisableUpdatePrompts(classes)
        assertFeatureToggles(classes)
        assertHiddenTabs(classes)
        assertHideMessagesTab(classes)
        assertHiddenSettingsRows(classes)
        assertToggleOverrides(classes)
        assertClassicCallLogSwipe(classes, byType)
        assertUseSmsVerification(classes)
        assertFixT9ContactSearch(classes, byType)
        assertHideBusinessMedia(classes)
        assertDisableContactUpload(classes)
        assertShowCallerNumber(classes, byType, apk)
        assertHideCallLogFilters(classes, byType)
        assertHideListItems(classes)
        assertSwapCallButtons(classes, byType)
        assertDisableCallButtonHaptics(classes, byType)
        assertHideProfileMenuItems(classes, byType, allPatches)
        // onGetCredential tests isAvailableOnDevice(int) in this build, so the routing applies.
        assertGmsCoreSupport(classes, workDir, PKG, TRUECALLER_INIT, SIGNATURE_SHA1, expectCredentialRouting = true)
        assertSpoofSignature(classes, PKG, SIGNATURE_SHA1)
    }

    private fun assertEnablePremium(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        // 1. Tier getter ("premiumLevel") returns GOLD.
        val (store, tier) = classes.singleMethod("premiumLevel tier getter") { _, m ->
            m.returnType == PREMIUM_TIER_TYPE && m.parameterTypes.isEmpty() && "premiumLevel" in m.strings()
        }
        assertReturnsGold(tier, "${store.type}.${tier.name}() (tier)")

        // 2. The plain isPremium getter in the same class; the grace-period getter is untouched.
        val isPremium = store.methods.single {
            it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                "isPremiumExpired" in it.strings() && "isInGracePeriod" !in it.strings()
        }
        assertForcedBoolean(isPremium, expected = true, label = "${store.type}.${isPremium.name}() (isPremium)")
        val grace = store.methods.single { "isInGracePeriod" in it.strings() && it.returnType == "Z" }
        check(grace.instructions().first().opcode != Opcode.CONST_4) { "${store.type}.${grace.name}() (grace period) was changed" }

        // 3. Static PremiumFeatureStatus == INCLUDED check.
        val (gateClass, gate) = classes.singleMethod("PremiumFeatureStatus gate") { _, m ->
            m.returnType == "Z" && m.params() == listOf(PREMIUM_FEATURE_STATUS) && AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.instructions().any { it.opcode == Opcode.SGET_OBJECT && it.field()?.name == "INCLUDED" }
        }
        assertForcedBoolean(gate, expected = true, label = "${gateClass.type}.${gate.name}(PremiumFeatureStatus)")

        // 4. isFeatureAvailable(feature, refresh): true at once for the device-checked features;
        // CALL_ASSISTANT and FAMILY_SHARING (both only work through Truecaller's servers) return
        // false at once, so the premium UI does not offer them as unlocked. The stock check
        // (with the server's kill-switch list) stays below the early returns, unreached.
        val (featureClass, feature) = classes.singleMethod("feature availability check") { _, m ->
            m.returnType == "Z" && m.params() == listOf(PREMIUM_FEATURE, "Z") && "disabledPremiumFeatures" in m.strings()
        }
        val featureLabel = "${featureClass.type}.${feature.name}(PremiumFeature, Z)"
        val featureInsns = feature.instructions()
        val featureP1 = feature.implementation!!.registerCount - 2 // this + feature + Z
        for ((index, constant) in listOf(0 to "CALL_ASSISTANT", 2 to "FAMILY_SHARING")) {
            val get = featureInsns.getOrNull(index)
            check(get?.opcode == Opcode.SGET_OBJECT && get.field()?.definingClass == PREMIUM_FEATURE && get.field()?.name == constant) {
                "$featureLabel does not load PremiumFeature.$constant at $index; got ${get?.opcode} ${get?.field()}"
            }
            val branch = featureInsns[index + 1]
            check(branch.opcode == Opcode.IF_EQ && (branch as TwoRegisterInstruction).registerA == featureP1 &&
                branch.registerB == (get as OneRegisterInstruction).registerA) {
                "$featureLabel does not compare p1 with PremiumFeature.$constant"
            }
            // Both server-backed branches reach the false return at 6, before the stock code.
            check(featureInsns.branchTarget(index + 1) == 6) { "$featureLabel: the $constant branch does not reach the server-backed false return" }
        }
        val forced = featureInsns.getOrNull(4)
        check(forced?.opcode == Opcode.CONST_4 && (forced as NarrowLiteralInstruction).narrowLiteral == 1 &&
            featureInsns.getOrNull(5)?.opcode == Opcode.RETURN &&
            (featureInsns[5] as OneRegisterInstruction).registerA == (forced as OneRegisterInstruction).registerA
        ) { "$featureLabel does not return true for the other features" }
        val unavailable = featureInsns.getOrNull(6)
        check(unavailable?.opcode == Opcode.CONST_4 && (unavailable as NarrowLiteralInstruction).narrowLiteral == 0 &&
            featureInsns.getOrNull(7)?.opcode == Opcode.RETURN &&
            (featureInsns[7] as OneRegisterInstruction).registerA == (unavailable as OneRegisterInstruction).registerA
        ) { "$featureLabel does not return false for the server-backed features" }
        check(featureInsns.drop(8).any { it.stringOrNull() == "disabledPremiumFeatures" }) { "$featureLabel lost its stock check" }

        // 5. PremiumState constructor: const/16 p1, 0x1 and sget-object p2, GOLD before anything else.
        val stateClass = classes.single { cls -> cls.methods.any { m -> m.strings().any { it.startsWith("PremiumState(isPremium=") } } }
        val constructor = stateClass.method(
            "<init>",
            listOf(
                "Z", PREMIUM_TIER_TYPE, "Lcom/truecaller/premium/data/ProductKind;",
                "Lcom/truecaller/premium/data/PremiumScope;", "Lcom/truecaller/premium/data/InsuranceState;",
            ),
        )
        val p1 = constructor.implementation!!.registerCount - 5 // this + 5 single-register parameters
        val insns = constructor.instructions()
        val first = insns.getOrNull(0)
        check(
            first?.opcode == Opcode.CONST_16 && (first as OneRegisterInstruction).registerA == p1 &&
                (first as NarrowLiteralInstruction).narrowLiteral == 1
        ) { "${stateClass.type}.<init> does not start with const/16 p1, 0x1; got ${first?.opcode}" }
        val second = insns.getOrNull(1)
        check(
            second?.opcode == Opcode.SGET_OBJECT && (second as OneRegisterInstruction).registerA == p1 + 1 &&
                second.field()?.definingClass == PREMIUM_TIER_TYPE && second.field()?.name == "GOLD"
        ) { "${stateClass.type}.<init> does not set p2 to GOLD second; got ${second?.opcode} ${second?.field()}" }

        // 6. The subscription worker returns a fresh no-arg Result (Failure in this build) at once.
        val result = listOf("Success {mOutputData=", "Failure {mOutputData=").map { text ->
            classes.single { cls -> cls.methods.any { m -> m.name == "toString" && text in m.strings() } }
        }.first { cls -> cls.methods.any { it.name == "<init>" && it.parameterTypes.isEmpty() } }
        val doWork = (byType[SUBSCRIPTION_WORKER] ?: error("$SUBSCRIPTION_WORKER not found")).methods.single { it.name == "doWork" }
        val work = doWork.instructions()
        check(work.getOrNull(0)?.opcode == Opcode.NEW_INSTANCE &&
            ((work[0] as ReferenceInstruction).reference as TypeReference).type == result.type) {
            "doWork does not start with new-instance ${result.type}; got ${work.getOrNull(0)?.opcode}"
        }
        val init = work.getOrNull(1)?.call()
        check(work.getOrNull(1)?.opcode == Opcode.INVOKE_DIRECT && init?.definingClass == result.type && init.name == "<init>" &&
            init.parameterTypes.isEmpty()) { "doWork does not construct ${result.type}; got $init" }
        check(work.getOrNull(2)?.opcode == Opcode.RETURN_OBJECT) { "doWork does not return the Result at once" }

        // 7. The premium status sync writer returns Unit before storing anything or sending the
        // PremiumStatusUpdate event.
        val (writerClass, writer) = classes.singleMethod("premium status writer") { _, m ->
            m.returnType == "Ljava/lang/Object;" && m.parameterTypes.size == 2 &&
                m.strings().containsAll(listOf("premiumHadPremiumBefore", "entitledCatalogItemIds"))
        }
        val writerInsns = writer.instructions()
        val unit = writerInsns.getOrNull(0)
        check(unit?.opcode == Opcode.SGET_OBJECT && unit.field()?.definingClass == "Lkotlin/Unit;" &&
            unit.field()?.type == "Lkotlin/Unit;") {
            "${writerClass.type}.${writer.name} does not load kotlin.Unit first; got ${unit?.opcode} ${unit?.field()}"
        }
        val ret = writerInsns.getOrNull(1)
        check(ret?.opcode == Opcode.RETURN_OBJECT && (ret as OneRegisterInstruction).registerA == (unit as OneRegisterInstruction).registerA) {
            "${writerClass.type}.${writer.name} does not return Unit at once"
        }

        // 8. Premium tab (#77): the tab's state chooser (builds the Entitled and Paywall states, reads
        // "isSubscriptionOnHoldOrPaused" and a PremiumLaunchContext.Static constant) overwrites its one
        // isPremium result with false right after the move-result, before the branch that reads it,
        // so the tab shows the plans. The isPremium getter itself stays forced true (step 2).
        fun stateType(prefix: String) = classes.single { cls ->
            cls.methods.any { m -> m.name == "toString" && m.strings().any { it.startsWith(prefix) } }
        }.type
        val states = listOf(stateType("Entitled(subscriptionFetchResult="), stateType("Paywall(subscriptionFetchResult="))
        val (chooserClass, chooser) = classes.singleMethod("Premium tab state chooser") { _, m ->
            m.returnType == "Ljava/lang/Object;" && m.parameterTypes.size == 1 && "isSubscriptionOnHoldOrPaused" in m.strings() &&
                m.instructions().any {
                    it.opcode == Opcode.SGET_OBJECT && it.field()?.type == "Lcom/truecaller/premium/PremiumLaunchContext\$Static;"
                } &&
                states.all { state ->
                    m.instructions().any { it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == state }
                }
        }
        val chooserLabel = "${chooserClass.type}.${chooser.name} (Premium tab state chooser)"
        val chooserInsns = chooser.instructions()
        val premiumReads = chooserInsns.indices.filter { index ->
            chooserInsns[index].call()?.let { it.definingClass == store.type && it.name == isPremium.name && it.parameterTypes.isEmpty() } == true
        }
        check(premiumReads.size == 1) { "$chooserLabel reads isPremium ${premiumReads.size} times, expected 1" }
        val read = premiumReads.single()
        val premiumResult = chooserInsns[read + 1]
        check(premiumResult.opcode == Opcode.MOVE_RESULT) { "$chooserLabel: no move-result after isPremium; got ${premiumResult.opcode}" }
        val premiumRegister = (premiumResult as OneRegisterInstruction).registerA
        val notPremium = chooserInsns.getOrNull(read + 2)
        check(notPremium?.opcode == Opcode.CONST_16 && (notPremium as OneRegisterInstruction).registerA == premiumRegister &&
            (notPremium as NarrowLiteralInstruction).narrowLiteral == 0) {
            "$chooserLabel does not overwrite the isPremium result v$premiumRegister with false; got ${notPremium?.opcode}"
        }
        val decision = chooserInsns.getOrNull(read + 3)
        check(decision?.opcode == Opcode.IF_EQZ && (decision as OneRegisterInstruction).registerA == premiumRegister) {
            "$chooserLabel: the isPremium branch does not follow the forced false; got ${decision?.opcode}"
        }
    }

    private fun assertDisableAds(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        fun require(type: String) = byType[type] ?: error("$type not found")

        // Banner and native binds: the holder types are derived the same way the patch does.
        val switchView = require(ADS_SWITCH_VIEW)
        val bannerHolder = switchView.methods.single {
            it.returnType == "V" && it.params().size == 2 && it.params()[1] == AD_LAYOUT_TYPE
        }.params().first()
        val container = require(ADS_CONTAINER)
        val light = require(ADS_CONTAINER_LIGHT)
        val layoutConfig = container.methods.first {
            it.returnType == "V" && it.params().size >= 2 && it.params().first() == bannerHolder
        }.params()[1]
        val nativeHolders = (container.methods + light.methods).map { it.params() }
            .filter { it.size >= 2 && it[1] == layoutConfig && it[0] != bannerHolder }.map { it.first() }.toSet()
        check(nativeHolders.isNotEmpty()) { "no native ad holder type found" }
        val adTypes = nativeHolders + bannerHolder + AD_LAYOUT_TYPE

        var banner = 0
        var native = 0
        for (cls in listOf(container, light, switchView)) {
            val binds = cls.methods.filter { m ->
                m.returnType == "V" && m.name != "<init>" && !AccessFlags.STATIC.isSet(m.accessFlags) &&
                    m.params().firstOrNull()?.startsWith("L") == true && m.params().any { it in adTypes }
            }
            check(binds.isNotEmpty()) { "no ad bind method in ${cls.type}" }
            for (bind in binds) {
                val label = "${cls.type}.${bind.name}(${bind.params().joinToString()})"
                val p0 = bind.implementation!!.registerCount - bind.params().sumOf { if (it == "J" || it == "D") 2 else 1 } - 1
                val insns = bind.instructions()
                val gone = insns.getOrNull(0)
                check(gone?.opcode == Opcode.CONST_16 && (gone as OneRegisterInstruction).registerA == p0 + 1 &&
                    (gone as NarrowLiteralInstruction).narrowLiteral == 8) { "$label does not start with const/16 p1, 0x8" }
                val set = insns.getOrNull(1)
                check(set?.opcode == Opcode.INVOKE_VIRTUAL_RANGE && set.call()?.name == "setVisibility" &&
                    (set as RegisterRangeInstruction).startRegister == p0 && set.registerCount == 2) {
                    "$label does not call setVisibility(p0, GONE); got ${set?.opcode} ${set?.call()}"
                }
                check(insns.getOrNull(2)?.opcode == Opcode.RETURN_VOID) { "$label does not return after hiding" }
                if (bannerHolder in bind.params()) banner++
                if (bind.params().any { it in nativeHolders }) native++
            }
        }
        check(banner >= 3 && native >= 4) { "only $banner banner and $native native bind methods patched" }
        // AdsSwitchView's position helper c(I)V is left alone.
        val position = switchView.methods.single { it.returnType == "V" && it.params() == listOf("I") }
        check(position.instructions().first().opcode != Opcode.CONST_16) { "AdsSwitchView.${position.name}(I) was changed" }

        // Interstitials: the manager's "featureInterstitialAd" check returns false, so placements
        // run the user's action at once.
        val (gateClass, gate) = classes.singleMethod("interstitial ads check") { _, m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() && "featureInterstitialAd" in m.strings()
        }
        assertForcedBoolean(gate, expected = false, label = "${gateClass.type}.${gate.name}() (featureInterstitialAd)")

        // Ads V2 placements: the (AdPlacement, continuation) check returns Boolean.FALSE at once, which
        // also drops the call log's "Upgrade for an ad-free experience" placeholder row.
        val (placementClass, placement) = classes.singleMethod("Ads V2 placement check") { _, m ->
            m.returnType == "Ljava/lang/Object;" && m.params().size == 2 && m.params().first() == AD_PLACEMENT &&
                "featureAdsV2OnClList" in m.strings()
        }
        val placementInsns = placement.instructions()
        val no = placementInsns.getOrNull(0)
        check(no?.opcode == Opcode.SGET_OBJECT && no.field()?.definingClass == "Ljava/lang/Boolean;" && no.field()?.name == "FALSE" &&
            placementInsns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
            (placementInsns[1] as OneRegisterInstruction).registerA == (no as OneRegisterInstruction).registerA
        ) { "${placementClass.type}.${placement.name}(AdPlacement, ...) does not return Boolean.FALSE at once; got ${no?.opcode} ${no?.field()}" }

        // The master "ads allowed" check (the only ()Z method reading both strings) returns false.
        val (allowedClass, allowed) = classes.singleMethod("ads allowed check") { _, m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() && m.strings().containsAll(listOf("qaForceAds", "adsDisabledUntil"))
        }
        assertForcedBoolean(allowed, expected = false, label = "${allowedClass.type}.${allowed.name}() (ads allowed)")

        // Only the app-open loading screen still finishes right after super.onCreate; the
        // interstitial activities, which deliver the pending action or reward, are untouched.
        for ((type, finishes) in listOf(
            "Lcom/truecaller/ads/interstitial/AdAppOpeningActivity;" to true,
            "Lcom/truecaller/ads/interstitial/AdInterstitialActivity;" to false,
            "Lcom/truecaller/ads/adsrouter/ui/interstitial/AdRouterInterstitialActivity;" to false,
        )) {
            val insns = require(type).method("onCreate", listOf("Landroid/os/Bundle;")).instructions()
            val superCall = insns.indexOfFirst { it.opcode == Opcode.INVOKE_SUPER && it.call()?.name == "onCreate" }
            check(superCall >= 0) { "$type.onCreate does not call super.onCreate" }
            val finish = insns.getOrNull(superCall + 1)
            val finished = finish?.opcode == Opcode.INVOKE_VIRTUAL_RANGE && finish.call()?.name == "finish" &&
                finish.call()?.definingClass == "Landroid/app/Activity;"
            check(finished == finishes) {
                "$type.onCreate ${if (finishes) "does not finish()" else "still finishes"} right after super.onCreate; got ${finish?.opcode} ${finish?.call()}"
            }
            if (finishes) {
                check(insns.getOrNull(superCall + 2)?.opcode == Opcode.RETURN_VOID) { "$type.onCreate does not return after finish()" }
            }
        }
    }

    private fun assertDisableTelemetry(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        val tracker = byType["Lcom/truecaller/analytics/technical/AppStartTracker;"] ?: error("AppStartTracker not found")
        assertReturnsEarlyVoid(tracker.method("enableTracking", emptyList()), label = "AppStartTracker.enableTracking()")

        val cleverTap = classes.filter { "Lcom/truecaller/clevertap/CleverTapManager;" in it.interfaces }
        check(cleverTap.isNotEmpty()) { "no CleverTapManager implementation found" }
        for (cls in cleverTap) {
            assertReturnsEarlyVoid(cls.method("push", listOf("Ljava/lang/String;")), label = "${cls.type}.push(String)")
            assertReturnsEarlyVoid(
                cls.method("push", listOf("Ljava/lang/String;", "Ljava/util/Map;")),
                label = "${cls.type}.push(String, Map)",
            )
        }

        val appsFlyer = classes.filter { it.superclass == "Lcom/appsflyer/AppsFlyerLib;" }
        check(appsFlyer.isNotEmpty()) { "no AppsFlyerLib subclass found" }
        for (cls in appsFlyer) {
            val starts = cls.methods.filter { it.name == "start" && it.params().firstOrNull() == "Landroid/content/Context;" }
            check(starts.any { it.params().size == 1 }) { "${cls.type} has no start(Context)" }
            starts.forEach { assertReturnsEarlyVoid(it, label = "${cls.type}.start(${it.params().joinToString()})") }
        }

        // Every getBoolean("featureCleverTap", ...) read outside the QA menu is zeroed right after
        // its move-result (SDK init + second gate, CRM push handler, refresh work action).
        val cleverTapReads = forcedReads(classes, CLEVERTAP_FEATURE_KEY, skipPrefix = "Lcom/truecaller/qa/", isRead = {
            it.definingClass == "Landroid/content/SharedPreferences;" && it.name == "getBoolean"
        }) { forced, result ->
            (forced.opcode == Opcode.CONST_4 || forced.opcode == Opcode.CONST_16) &&
                (forced as OneRegisterInstruction).registerA == result && (forced as NarrowLiteralInstruction).narrowLiteral == 0
        }
        check(cleverTapReads >= 4) { "only $cleverTapReads featureCleverTap reads forced to false, expected at least 4" }

        // Firebase Analytics: the measurement config's Boolean get(key) reads deactivated = TRUE and
        // advertising ID collection = FALSE right after its move-result-object.
        val isConfigRead: (MethodReference) -> Boolean = {
            it.returnType == "Ljava/lang/Boolean;" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
        }
        fun loadsBoolean(name: String): (Instruction, Int) -> Boolean = { forced, result ->
            forced.opcode == Opcode.SGET_OBJECT && (forced as OneRegisterInstruction).registerA == result &&
                forced.field()?.definingClass == "Ljava/lang/Boolean;" && forced.field()?.name == name
        }
        val deactivated = forcedReads(classes, "firebase_analytics_collection_deactivated", isRead = isConfigRead, isForced = loadsBoolean("TRUE"))
        check(deactivated >= 1) { "firebase_analytics_collection_deactivated is not forced to TRUE" }
        val adid = forcedReads(classes, "google_analytics_adid_collection_enabled", isRead = isConfigRead, isForced = loadsBoolean("FALSE"))
        check(adid >= 2) { "only $adid google_analytics_adid_collection_enabled reads forced to FALSE, expected 2" }

        // Crashlytics: every ()Z getter of the data collection arbiter returns false.
        val arbiters = classes.filter { cls ->
            cls.methods.any { CRASHLYTICS_COLLECTION_KEY in it.strings() } &&
                cls.methods.any { "Crashlytics automatic data collection " in it.strings() }
        }
        check(arbiters.size == 1) { "expected one Crashlytics data collection arbiter, found ${arbiters.map { it.type }}" }
        val getters = arbiters.single().methods.filter { it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null }
        check(getters.isNotEmpty()) { "${arbiters.single().type} has no ()Z getter" }
        getters.forEach { assertForcedBoolean(it, expected = false, label = "${arbiters.single().type}.${it.name}() (Crashlytics collection)") }

        // Firebase Sessions: the manifest override getter returns Boolean.FALSE at once.
        val (sessionsClass, sessions) = classes.singleMethod("Firebase Sessions enabled override") { _, m ->
            m.returnType == "Ljava/lang/Boolean;" && m.parameterTypes.isEmpty() && "firebase_sessions_enabled" in m.strings() &&
                m.instructions().any { it.call()?.definingClass == "Landroid/os/BaseBundle;" && it.call()?.name == "getBoolean" }
        }
        val sessionsInsns = sessions.instructions()
        check(sessionsInsns.getOrNull(0)?.let { loadsBoolean("FALSE")(it, (it as? OneRegisterInstruction)?.registerA ?: -1) } == true &&
            sessionsInsns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
            (sessionsInsns[1] as OneRegisterInstruction).registerA == (sessionsInsns[0] as OneRegisterInstruction).registerA
        ) { "${sessionsClass.type}.${sessions.name}() does not return Boolean.FALSE at once" }

        // The switches are bytecode-only: the manifest keeps its stock Crashlytics flag and gains none.
        val manifest = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" }
            .map { it.readText() }
            .firstOrNull { it.contains("package=\"$PKG\"") && it.contains("<application") }
            ?: error("no decoded $PKG AndroidManifest.xml under $workDir")
        check(Regex("""android:name="firebase_crashlytics_collection_enabled"\s+android:value="true"""").containsMatchIn(manifest) &&
            "firebase_analytics_collection_deactivated" !in manifest && "firebase_sessions_enabled" !in manifest
        ) { "Disable telemetry changed the Firebase manifest meta-data" }
    }

    /**
     * Counts the reads of [key] (a const-string whose register is next passed as the key, at
     * argument 1, to a call [isRead] accepts) whose result is overwritten right after its
     * move-result by an instruction [isForced] accepts; fails on any read that is not forced.
     */
    private fun forcedReads(
        classes: List<ClassDef>,
        key: String,
        skipPrefix: String? = null,
        isRead: (MethodReference) -> Boolean,
        isForced: (Instruction, Int) -> Boolean,
    ): Int {
        var forced = 0
        for ((cls, method) in classes.methodsWhere { cls, m -> (skipPrefix == null || !cls.type.startsWith(skipPrefix)) && key in m.strings() }) {
            val insns = method.instructions()
            for (index in insns.indices.filter { insns[it].stringOrNull() == key }) {
                val register = (insns[index] as OneRegisterInstruction).registerA
                val use = (index + 1 until insns.size).firstOrNull { insns[it].arguments()?.contains(register) == true } ?: continue
                val call = insns[use].call()
                if (call == null || !isRead(call) || insns[use].arguments()?.getOrNull(1) != register) continue
                val label = "${cls.type}.${method.name} ($key read)"
                val result = insns.getOrNull(use + 1)
                check(result?.opcode == Opcode.MOVE_RESULT || result?.opcode == Opcode.MOVE_RESULT_OBJECT) { "$label has no move-result" }
                val next = insns.getOrNull(use + 2)
                check(next != null && isForced(next, (result as OneRegisterInstruction).registerA)) {
                    "$label is not forced after its move-result; got ${next?.opcode}"
                }
                forced++
            }
        }
        return forced
    }

    private fun Instruction.arguments(): List<Int>? = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> null
    }

    private fun assertDisableUpdatePrompts(classes: List<ClassDef>) {
        val manager = classes.single { cls ->
            cls.methods.any {
                it.returnType == "Ljava/util/concurrent/CompletableFuture;" &&
                    it.params() == listOf("Landroid/app/Activity;", UPDATE_TRIGGER)
            }
        }
        val start = manager.methods.single {
            it.returnType == "Ljava/lang/Object;" && it.params().size == 3 &&
                it.params().take(2) == listOf("Landroid/app/Activity;", UPDATE_TRIGGER)
        }
        // Both start with the Disable update prompts gate; its patched path is the early return.
        val startLabel = "${manager.type}.${start.name}"
        check(assertGate(start, DISABLE_UPDATE_PROMPTS, startLabel) == 6) { "$startLabel: the gate does not skip the early return" }
        val insns = start.instructions()
        val value = insns.getOrNull(4)?.field()
        check(insns.getOrNull(4)?.opcode == Opcode.SGET_OBJECT && value?.definingClass == "Ljava/lang/Boolean;" && value.name == "FALSE") {
            "$startLabel does not load Boolean.FALSE after the gate; got ${insns.getOrNull(4)?.opcode} $value"
        }
        check(insns.getOrNull(5)?.opcode == Opcode.RETURN_OBJECT) { "$startLabel does not return after the gate" }

        // The stored server forced-update state always reads NONE.
        val (typeOwner, typeGetter) = classes.singleMethod("forced update type getter") { _, m ->
            m.returnType == "Lcom/truecaller/forcedupdate/UpdateType;" && m.parameterTypes.isEmpty() &&
                "forcedUpdate_updateType" in m.strings()
        }
        val typeLabel = "${typeOwner.type}.${typeGetter.name}()"
        check(assertGate(typeGetter, DISABLE_UPDATE_PROMPTS, typeLabel) == 6) { "$typeLabel: the gate does not skip the early return" }
        val typeInsns = typeGetter.instructions()
        val type = typeInsns.getOrNull(4)?.field()
        check(typeInsns.getOrNull(4)?.opcode == Opcode.SGET_OBJECT && type?.name == "NONE" &&
            type.definingClass == "Lcom/truecaller/forcedupdate/UpdateType;" &&
            typeInsns.getOrNull(5)?.opcode == Opcode.RETURN_OBJECT
        ) { "$typeLabel does not return UpdateType.NONE after the gate; got ${typeInsns.getOrNull(4)?.opcode} $type" }
    }

    private fun assertFeatureToggles(classes: List<ClassDef>) {
        // Each master switch starts with its feature's gate, whose patched path answers false.
        for ((key, feature) in listOf("featureCallAssistant" to HIDE_ASSISTANT_TAB, "featureScamFeed" to HIDE_SCAM_FEED)) {
            val (cls, toggle) = classes.singleMethod("$key toggle") { _, m ->
                m.returnType == "Z" && m.parameterTypes.isEmpty() && key in m.strings()
            }
            val label = "${cls.type}.${toggle.name}() ($key)"
            check(assertGate(toggle, feature, label) == 6) { "$label: the gate does not skip the forced value" }
            val insns = toggle.instructions()
            check(insns[4].opcode == Opcode.CONST_4 && (insns[4] as NarrowLiteralInstruction).narrowLiteral == 0 &&
                insns[5].opcode == Opcode.RETURN && (insns[5] as OneRegisterInstruction).registerA == (insns[4] as OneRegisterInstruction).registerA
            ) { "$label does not answer false after the gate" }
            check(key in insns.drop(6).mapNotNull { it.stringOrNull() }) { "$label lost its stock code" }
        }
    }

    private fun assertHiddenTabs(classes: List<ClassDef>) {
        // The bottom bar builder calls one helper per tab patch on the tab array right before
        // filterNotNull; together they null PREMIUM, BLOCKING, FAMILY_PROTECTION_CONFIG and MESSAGES.
        val (builderClass, builder) = classes.singleMethod("bottom bar builder") { _, m ->
            m.returnType == "V" && m.params() == listOf("Landroid/util/SparseIntArray;") &&
                m.instructions().any { it.opcode == Opcode.SGET_OBJECT && it.field()?.definingClass == BOTTOM_BAR_BUTTON_TYPE && it.field()?.name == "CALLS" }
        }
        val label = "${builderClass.type}.${builder.name}(SparseIntArray)"
        val insns = builder.instructions()
        val filter = insns.indexOfFirst {
            it.opcode == Opcode.INVOKE_STATIC && it.call()?.returnType == "Ljava/util/List;" &&
                it.call()?.parameterTypes?.map(CharSequence::toString) == listOf("[Ljava/lang/Object;")
        }
        check(filter >= 3) { "$label has no filterNotNull call after the helpers" }
        val array = (insns[filter] as FiveRegisterInstruction).registerC
        val arrayType = insns.take(filter).last { it.opcode == Opcode.NEW_ARRAY && (it as TwoRegisterInstruction).registerA == array }
            .let { ((it as ReferenceInstruction).reference as TypeReference).type }
        val hidden = mutableSetOf<String>()
        for (call in insns.subList(filter - 3, filter)) {
            val ref = call.call()
            check(call.opcode == Opcode.INVOKE_STATIC_RANGE && ref?.definingClass == builderClass.type &&
                ref.parameterTypes.map(CharSequence::toString) == listOf(arrayType) &&
                (call as RegisterRangeInstruction).startRegister == array && call.registerCount == 1
            ) { "$label does not pass the tab array v$array to a helper before filterNotNull; got ${call.opcode} $ref" }
            val helper = builderClass.method(ref.name, listOf(arrayType))
            val helperInsns = helper.instructions()
            check(helperInsns.any { it.opcode == Opcode.APUT_OBJECT }) { "${builderClass.type}.${helper.name} does not null array entries" }
            check(helperInsns.any { it.call()?.returnType == BOTTOM_BAR_BUTTON_TYPE && it.call()?.definingClass == arrayType.removePrefix("[") }) {
                "${builderClass.type}.${helper.name} does not read the tab type"
            }
            val types = helperInsns.filter { it.opcode == Opcode.SGET_OBJECT && it.field()?.definingClass == BOTTOM_BAR_BUTTON_TYPE }
                .map { it.field()!!.name }
            hidden += types
            // Each helper is gated by its own patch's Heval Controls feature: while it is off the
            // helper returns at once, so the other tab patches are not switched with it.
            val helperLabel = "${builderClass.type}.${helper.name}"
            val feature = when {
                "BLOCKING" in types -> HIDE_BLOCKING_TAB
                "PREMIUM" in types -> HIDE_PREMIUM_TAB
                "MESSAGES" in types -> HIDE_MESSAGES_TAB
                else -> error("$helperLabel hides $types")
            }
            val stock = assertGate(helper, feature, helperLabel, branch = Opcode.IF_NEZ)
            check(stock == 5 && helperInsns[4].opcode == Opcode.RETURN_VOID && helperInsns[5].opcode == Opcode.ARRAY_LENGTH) {
                "$helperLabel does not return at once while $feature is off"
            }
        }
        check(hidden == setOf("PREMIUM", "BLOCKING", "FAMILY_PROTECTION_CONFIG", "MESSAGES")) { "$label hides $hidden" }
    }

    private fun assertHideMessagesTab(classes: List<ClassDef>) {
        val (builderClass, builder) = classes.singleMethod("bottom bar builder") { _, m ->
            m.returnType == "V" && m.params() == listOf("Landroid/util/SparseIntArray;") &&
                m.instructions().any { it.opcode == Opcode.SGET_OBJECT && it.field()?.definingClass == BOTTOM_BAR_BUTTON_TYPE && it.field()?.name == "CALLS" }
        }
        fun Instruction.isTabType(name: String) =
            opcode == Opcode.SGET_OBJECT && field()?.definingClass == BOTTOM_BAR_BUTTON_TYPE && field()?.name == name

        // The "default_tab_on_launch" getter returns CALLS at once while the feature is on.
        val defaultTab = builderClass.methods.single {
            it.returnType == BOTTOM_BAR_BUTTON_TYPE && it.parameterTypes.isEmpty() && "default_tab_on_launch" in it.strings()
        }
        val defaultLabel = "${builderClass.type}.${defaultTab.name}() (default tab)"
        check(assertGate(defaultTab, HIDE_MESSAGES_TAB, defaultLabel) == 6) { "$defaultLabel: the gate does not skip the forced tab" }
        val defaultInsns = defaultTab.instructions()
        check(defaultInsns[4].isTabType("CALLS") && defaultInsns[5].opcode == Opcode.RETURN_OBJECT &&
            (defaultInsns[5] as OneRegisterInstruction).registerA == (defaultInsns[4] as OneRegisterInstruction).registerA
        ) { "$defaultLabel does not return CALLS after the gate" }
        check("default_tab_on_launch" in defaultInsns.drop(6).mapNotNull { it.stringOrNull() }) { "$defaultLabel lost its stock code" }

        // selectTab(type, Z) swaps MESSAGES for CALLS before its stock code while the feature is on.
        val select = builderClass.methods.single {
            it.returnType == "V" && it.params() == listOf(BOTTOM_BAR_BUTTON_TYPE, "Z") &&
                it.instructions().any { insn -> insn.call()?.name == "setSelectedItemId" }
        }
        val selectLabel = "${builderClass.type}.${select.name}(BottomBarButtonType, Z)"
        check(assertGate(select, HIDE_MESSAGES_TAB, selectLabel) == 7) { "$selectLabel: the gate does not skip the swap" }
        val selectInsns = select.instructions()
        val p1 = select.implementation!!.registerCount - 2 // the type, then Z
        check(selectInsns[4].isTabType("MESSAGES")) { "$selectLabel does not load MESSAGES after the gate" }
        val compare = selectInsns[5]
        check(compare.opcode == Opcode.IF_NE && (compare as TwoRegisterInstruction).registerA == p1 &&
            compare.registerB == (selectInsns[4] as OneRegisterInstruction).registerA && selectInsns.branchTarget(5) == 7
        ) { "$selectLabel does not skip the swap for other tabs" }
        check(selectInsns[6].isTabType("CALLS") && (selectInsns[6] as OneRegisterInstruction).registerA == p1) {
            "$selectLabel does not replace MESSAGES with CALLS"
        }
        check(selectInsns.drop(7).any { it.call()?.name == "setSelectedItemId" }) { "$selectLabel lost its stock code" }

        // Right after the BottomBarView cast, the builder passes the bar and the final tab list to a
        // helper that keeps the bar visible (it pads for the navigation bar, issue #61) and, with
        // fewer than two tabs, hides its tab menu and drops its minimum height (saved in a new field).
        val insns = builder.instructions()
        val take = insns.indexOfFirst {
            it.call()?.definingClass == "Lkotlin/collections/CollectionsKt;" &&
                it.call()?.parameterTypes?.map(CharSequence::toString) == listOf("Ljava/lang/Iterable;", "I")
        }
        val cast = insns.indexOfFirst {
            it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == BOTTOM_BAR_VIEW
        }
        check(take >= 0 && cast > take) { "bottom bar builder has no take() before its BottomBarView cast" }
        val list = (insns[take + 1] as OneRegisterInstruction).registerA
        val call = insns[cast + 1]
        val ref = call.call()
        check(call.opcode == Opcode.INVOKE_STATIC && ref?.definingClass == builderClass.type &&
            ref.parameterTypes.map(CharSequence::toString) == listOf(BOTTOM_BAR_VIEW, "Ljava/util/List;") &&
            (call as FiveRegisterInstruction).registerC == (insns[cast] as OneRegisterInstruction).registerA && call.registerD == list
        ) { "bottom bar builder does not pass the bar and the tab list to a helper after the cast; got ${call.opcode} $ref" }
        val helperLabel = "${builderClass.type}.${ref.name}"
        val helperMethod = builderClass.method(ref.name, listOf(BOTTOM_BAR_VIEW, "Ljava/util/List;"))
        val bar = 4 // p0 of the 6-register helper
        // While the feature is off the helper returns at once (stock), unless it collapsed the bar
        // earlier in this process: iget-object vX, bar.saved; if-nez vX, :heval_stock; return-void.
        check(assertGate(helperMethod, HIDE_MESSAGES_TAB, helperLabel, branch = Opcode.IF_NEZ) == 7) {
            "$helperLabel: the gate does not jump to the helper body"
        }
        val gateInsns = helperMethod.instructions()
        val saved = gateInsns[4]
        check(saved.opcode == Opcode.IGET_OBJECT && (saved as TwoRegisterInstruction).registerB == bar &&
            saved.field()?.definingClass == BOTTOM_BAR_VIEW && gateInsns[5].opcode == Opcode.IF_NEZ &&
            (gateInsns[5] as OneRegisterInstruction).registerA == saved.registerA && gateInsns.branchTarget(5) == 7 &&
            gateInsns[6].opcode == Opcode.RETURN_VOID
        ) { "$helperLabel does not return at once while Hide Messages tab is off and the bar is not collapsed" }
        val helper = gateInsns.drop(7)
        check(helper.getOrNull(0)?.opcode == Opcode.CONST_4 && (helper[0] as NarrowLiteralInstruction).narrowLiteral == 0 &&
            helper.getOrNull(1)?.call()?.name == "setVisibility" && (helper[1] as FiveRegisterInstruction).registerC == bar &&
            (helper[1] as FiveRegisterInstruction).registerD == (helper[0] as OneRegisterInstruction).registerA
        ) { "$helperLabel does not keep the bar VISIBLE first" }
        val barVisibility = helper.drop(2).filter { it.call()?.name == "setVisibility" }
        check(barVisibility.size == 1 && (barVisibility.single() as FiveRegisterInstruction).registerC != bar) {
            "$helperLabel changes the bar's visibility again instead of its children's"
        }
        check(helper.any { it.call()?.name == "size" && it.call()?.definingClass == "Ljava/util/List;" } &&
            helper.any { it.opcode == Opcode.IF_LT } &&
            helper.any { it.call()?.name == "getChildAt" && it.call()?.definingClass == "Landroid/view/ViewGroup;" } &&
            helper.any { it.opcode == Opcode.CONST_16 && (it as NarrowLiteralInstruction).narrowLiteral == 8 }
        ) { "$helperLabel does not hide the bar's children below two tabs" }
        check(helper.count { it.call()?.name == "setMinimumHeight" && (it as FiveRegisterInstruction).registerC == bar } == 2 &&
            helper.any { it.call()?.name == "getMinimumHeight" }
        ) { "$helperLabel does not drop and restore the bar's minimum height" }
        val savedField = helper.mapNotNull { it.field() }.distinct().singleOrNull()
        check(savedField?.definingClass == BOTTOM_BAR_VIEW && savedField.type == "Ljava/lang/Integer;" &&
            helper.any { it.opcode == Opcode.IPUT_OBJECT } && helper.any { it.opcode == Opcode.IGET_OBJECT }
        ) { "$helperLabel does not save the minimum height on the bar; got $savedField" }
        val barClass = classes.single { it.type == BOTTOM_BAR_VIEW }
        check(barClass.fields.any { it.name == savedField.name && it.type == savedField.type && AccessFlags.PUBLIC.isSet(it.accessFlags) }) {
            "$BOTTOM_BAR_VIEW has no public ${savedField.name} field"
        }
    }

    private fun assertHiddenSettingsRows(classes: List<ClassDef>) {
        // The Settings screen state's toString reads isPremiumItemVisible and isWatchItemVisible
        // first, in that order ("Hide Premium tab" and "Hide Wear OS settings" zero both).
        val (stateClass, toString) = classes.singleMethod("CategoriesSettingsState.toString") { _, m ->
            m.name == "toString" && m.parameterTypes.isEmpty() && m.strings().any { it.startsWith("CategoriesSettingsState(") }
        }
        check(toString.strings().containsAll(listOf("CategoriesSettingsState(isPremiumItemVisible=", ", isWatchItemVisible="))) {
            "${stateClass.type}.toString lost the premium/watch labels: ${toString.strings()}"
        }
        val flags = toString.instructions().filter { it.opcode == Opcode.IGET_BOOLEAN && it.field()?.definingClass == stateClass.type }
            .map { it.field()!!.name }
        check(flags.size >= 3) { "${stateClass.type}.toString reads only $flags" }
        val (premium, watch) = flags.take(2) // isPremiumItemVisible, isWatchItemVisible

        // "Hide Wear OS settings" stores const/16 0; "Hide Premium tab" (a Heval Controls feature)
        // passes the stored value through a (Z)Z helper that answers false while it is on.
        val byType = classes.associateBy { it.type }
        val constructors = stateClass.methods.filter { it.name == "<init>" && it.implementation != null }
        check(constructors.isNotEmpty()) { "${stateClass.type} has no constructor" }
        for (constructor in constructors) {
            val label = "${stateClass.type}.<init>(${constructor.params().joinToString()})"
            val insns = constructor.instructions()
            val stores = insns.indices.filter { insns[it].opcode == Opcode.IPUT_BOOLEAN && insns[it].field()?.definingClass == stateClass.type }
            val zeroed = stores.filter { index ->
                val store = insns[index] as TwoRegisterInstruction
                val previous = insns.getOrNull(index - 1)
                previous?.opcode == Opcode.CONST_16 && (previous as OneRegisterInstruction).registerA == store.registerA &&
                    (previous as NarrowLiteralInstruction).narrowLiteral == 0
            }.map { insns[it].field()!!.name }.toSet()
            check(zeroed == setOf(watch)) { "$label zeroes $zeroed, expected $watch" }
            val gated = stores.filter { insns[it].field()!!.name == premium }
            check(gated.isNotEmpty()) { "$label never stores $premium" }
            for (index in gated) {
                val register = (insns[index] as TwoRegisterInstruction).registerA
                val path = assertThroughValueHelper(insns, index - 2, register, byType, HIDE_PREMIUM_TAB, "Z", "$label ($premium)")
                check(path.isReturnZero()) { "$label: the $premium helper does not answer false while Hide Premium tab is on" }
            }
        }
    }

    private fun assertToggleOverrides(classes: List<ClassDef>) {
        // Every toggle resolver isEnabled(key, FeatureState) (three in 26.42.5: the SharedPreferences
        // store, the Firebase experiments and a default-only one) starts with one
        // "key.equals(p1) -> return value" block per override, each falling through to the next and
        // finally to the stock code. Hide family button and Restore classic call log add one each,
        // Disable ads five (incl. the Offer Hub), Hide business media the seven verified business
        // campaign toggles, Disable contact upload the Call Assistant number sync and the contact
        // editor name suggestion, Disable auto-launch one, Disable nags nine, Hide promotions four
        // plus the Firebase experiment "DisableWVMNotifications_65487" (on), and Hide after-call
        // screen for contacts two.
        val resolvers = classes.methodsWhere { _, m ->
            m.returnType == "Z" && m.params() == listOf("Ljava/lang/String;", FEATURE_STATE) && m.implementation != null
        }
        check(resolvers.size >= 2) { "expected the toggle resolvers, found ${resolvers.map { (c, m) -> "${c.type}.${m.name}" }}" }
        val expected = mapOf(
            "featureFamilyProtect" to 0,
            "featureCallLogRevamp" to 0,
            "featureAdsOptimisationOnListView" to 1,
            "featureAdsRestrictCampaignProcessing" to 1,
            "featureConfigManagementSystem" to 0,
            "featureEnableOfflineAds" to 0,
            "featureAdsOnOfferHub" to 0,
            "featureBizVerifiedCampaigns" to 0,
            "featureBizVerifiedCampaignForOutgoingCalls" to 0,
            "featureBizVerifiedCampaignInRevampedInCallUi" to 0,
            "featureBizVerifiedCampaignsCarouselACS" to 0,
            "featureBizVerifiedCampaignsDetailsView" to 0,
            "featureBizVerifiedCampaignsCarouselDetailsView" to 0,
            "featureBizVerifiedCampaignsDV3" to 0,
            "featureCallAssistantNumberSync" to 0,
            "featureContactEditorNameSuggestion" to 0,
            "featureAutoAppLaunchPassive" to 0,
            "featureDefaultDialerInterstitial" to 0,
            "featureDefaultDialerPermanentSpace" to 0,
            "featureNotificationsPermissionBanner" to 0,
            "featureDOOABanner" to 0,
            "featureDisableBatteryOptimizationBanner" to 0,
            "featurePeriodicallyCheckPermissions" to 0,
            "featureRatingsAndReviewsSurveys" to 0,
            "featureBlockSurveyFlow" to 0,
            "featureFeedbackSurvey" to 0,
            "featurePersonalSafetyPromo" to 0,
            "featureAcsWhoViewedMeBanner" to 0,
            "featureReferralNavDrawer" to 0,
            "featureRedeemPromo" to 0,
            "featureShowACSAllIncoming" to 0,
            "featureShowACSAllOutgoing" to 0,
            "DisableWVMNotifications_65487" to 1,
        )
        // The overrides of Heval Controls features apply only while their feature is on; the rest
        // (Disable ads, Disable contact upload) are unconditional.
        val gates = mapOf(
            "featureFamilyProtect" to HIDE_FAMILY_BUTTON,
            "featureCallLogRevamp" to RESTORE_CLASSIC_CALL_LOG,
            "featureAutoAppLaunchPassive" to DISABLE_AUTO_LAUNCH,
            "DisableWVMNotifications_65487" to HIDE_PROMOTIONS,
        ) + listOf(
            "featureBizVerifiedCampaigns", "featureBizVerifiedCampaignForOutgoingCalls", "featureBizVerifiedCampaignInRevampedInCallUi",
            "featureBizVerifiedCampaignsCarouselACS", "featureBizVerifiedCampaignsDetailsView",
            "featureBizVerifiedCampaignsCarouselDetailsView", "featureBizVerifiedCampaignsDV3",
        ).associateWith { HIDE_BUSINESS_MEDIA } + listOf(
            "featureDefaultDialerInterstitial", "featureDefaultDialerPermanentSpace", "featureNotificationsPermissionBanner",
            "featureDOOABanner", "featureDisableBatteryOptimizationBanner", "featurePeriodicallyCheckPermissions",
            "featureRatingsAndReviewsSurveys", "featureBlockSurveyFlow", "featureFeedbackSurvey",
        ).associateWith { DISABLE_NAGS } + listOf(
            "featurePersonalSafetyPromo", "featureAcsWhoViewedMeBanner", "featureReferralNavDrawer", "featureRedeemPromo",
        ).associateWith { HIDE_PROMOTIONS } + listOf(
            "featureShowACSAllIncoming", "featureShowACSAllOutgoing",
        ).associateWith { HIDE_AFTER_CALL_CONTACTS }
        for ((cls, resolver) in resolvers) assertOverrideBlocks(cls, resolver, expected, gates)
        // The Firebase experiment and the SharedPreferences toggles are each read through some resolver.
        assertResolverReads(classes, resolvers, expected.keys)
    }

    /** Some method other than a resolver loads each key and later calls one of the [resolvers] with it. */
    private fun assertResolverReads(classes: List<ClassDef>, resolvers: List<Pair<ClassDef, Method>>, keys: Set<String>) {
        val targets = resolvers.map { (cls, m) -> cls.type to m.name }.toSet()
        fun Instruction.isResolverCall() = call()?.let {
            (it.definingClass to it.name) in targets && it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", FEATURE_STATE)
        } == true
        val callers = classes.methodsWhere { _, m -> m.implementation != null && m.instructions().any { it.isResolverCall() } }
        for (key in keys) {
            check(callers.any { (_, m) ->
                val insns = m.instructions()
                val load = insns.indexOfFirst { it.stringOrNull() == key }
                load >= 0 && insns.drop(load + 1).any { it.isResolverCall() }
            }) { "no method passes $key to a toggle resolver" }
        }
    }

    /**
     * The [resolver] starts with "key.equals(p1) -> return value" blocks, each falling through to
     * the next and finally to the stock code; they are parsed until the pattern stops and must be
     * exactly [expected]. A key in [gates] has the 10-instruction gated shape (its Heval Controls
     * gate between the key match and the value, jumping to the same stock path); every other key the
     * plain 6-instruction one.
     */
    private fun assertOverrideBlocks(cls: ClassDef, resolver: Method, expected: Map<String, Int>, gates: Map<String, String>) {
        val label = "${cls.type}.${resolver.name}(String, FeatureState)"
        val insns = resolver.instructions()
        val keyRegister = resolver.implementation!!.registerCount - 2 // this + key + state
        val overrides = mutableMapOf<String, Int>()
        val gated = mutableMapOf<String, String>()
        var start = 0
        while (insns.getOrNull(start)?.opcode == Opcode.CONST_STRING && insns.getOrNull(start + 1)?.call()?.name == "equals") {
            val key = insns[start].stringOrNull()!!
            val equals = insns[start + 1]
            check(equals.opcode == Opcode.INVOKE_VIRTUAL && equals.call()?.definingClass == "Ljava/lang/String;" &&
                (equals as FiveRegisterInstruction).registerD == keyRegister
            ) { "$label: $key is not compared with p1" }
            check(insns[start + 2].opcode == Opcode.MOVE_RESULT && insns[start + 3].opcode == Opcode.IF_EQZ) { "$label: $key has no branch" }
            val isGated = insns[start + 4].opcode == Opcode.CONST_STRING && insns[start + 5].call()?.name == "isEnabled"
            val size = if (isGated) 10 else 6
            check(insns.branchTarget(start + 3) == start + size) { "$label: a non-matching $key does not fall through" }
            if (isGated) {
                check(assertGate(resolver, insns[start + 4].stringOrNull()!!, "$label ($key)", at = start + 4) == start + size) {
                    "$label: $key does not resolve as stock while its feature is off"
                }
                gated[key] = insns[start + 4].stringOrNull()!!
            }
            val value = insns[start + size - 2]
            check(value.opcode == Opcode.CONST_4 && insns[start + size - 1].opcode == Opcode.RETURN) { "$label: $key does not return a constant" }
            check(overrides.put(key, (value as NarrowLiteralInstruction).narrowLiteral) == null) { "$label overrides $key twice" }
            start += size
        }
        check(overrides == expected) { "$label overrides $overrides, expected $expected" }
        check(gated == gates) { "$label gates $gated, expected $gates" }
    }

    private fun assertSwapCallButtons(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        // The incoming call buttons composable loads the decline and then the answer test tag; the
        // offset(x, y) modifier call right before each now gets its x through a (F)F helper that
        // negates it while the feature is on (decline moves right, answer left) and passes it
        // through while it is off.
        val (cls, buttons) = classes.singleMethod("incoming call buttons composable") { _, m ->
            m.returnType == "V" && AccessFlags.STATIC.isSet(m.accessFlags) && m.implementation != null &&
                m.strings().containsAll(listOf("rejectCallButton", "answerCallButton"))
        }
        val label = "${cls.type}.${buttons.name}"
        val insns = buttons.instructions()
        val modifier = buttons.params().first()
        for (tag in listOf("rejectCallButton", "answerCallButton")) {
            val tagIndex = insns.indexOfFirst { it.opcode == Opcode.CONST_STRING && it.stringOrNull() == tag }
            check(tagIndex >= 0) { "$label does not load $tag" }
            val offset = (tagIndex - 1 downTo 0).first { index ->
                insns[index].opcode == Opcode.INVOKE_STATIC && insns[index].call()?.returnType == modifier &&
                    insns[index].call()?.parameterTypes?.map(CharSequence::toString) == listOf("F", "F", "I", modifier)
            }
            val x = (insns[offset] as FiveRegisterInstruction).registerC
            val path = assertThroughValueHelper(insns, offset - 2, x, byType, SWAP_CALL_BUTTONS, "F", "$label ($tag offset x)")
            check(path.size == 2 && path[0].opcode == Opcode.NEG_FLOAT && path[1].opcode == Opcode.RETURN &&
                (path[0] as TwoRegisterInstruction).let { it.registerA == it.registerB && it.registerA == (path[1] as OneRegisterInstruction).registerA }
            ) { "$label: the $tag offset helper does not negate x while the feature is on" }
        }

        // The incoming call notification builder: the ()Z call style check after the "Decline"
        // PendingIntent now has its result passed through a (Z)Z helper (false while the feature is
        // on) right after its move-result.
        val (notificationCls, notification) = classes.singleMethod("incoming call notification builder") { _, m ->
            m.returnType == "V" && AccessFlags.STATIC.isSet(m.accessFlags) && m.implementation != null &&
                m.strings().containsAll(listOf("incoming_calls", "Answer", "Decline"))
        }
        val notificationLabel = "${notificationCls.type}.${notification.name}"
        val body = notification.instructions()
        val decline = body.indexOfFirst { it.opcode == Opcode.CONST_STRING && it.stringOrNull() == "Decline" }
        val check = (decline + 1 until body.size).first { index ->
            body[index].opcode == Opcode.INVOKE_VIRTUAL && body[index].call()?.let { it.returnType == "Z" && it.parameterTypes.isEmpty() } == true
        }
        check(body[check + 1].opcode == Opcode.MOVE_RESULT) { "$notificationLabel does not keep the call style check" }
        val result = (body[check + 1] as OneRegisterInstruction).registerA
        val path = assertThroughValueHelper(body, check + 2, result, byType, SWAP_CALL_BUTTONS, "Z", "$notificationLabel (call style check)")
        check(path.isReturnZero()) { "$notificationLabel: the call style check is not false while the feature is on" }

        // The own layout notification class (the one whose constructor inflates RemoteViews from the
        // six incoming call layouts) passes each layout id through SwapCallButtons.layout(I)I right
        // before new RemoteViews(packageName, layout).
        val swapLayout = byType[SWAP_CALL_LAYOUTS] ?: error("$SWAP_CALL_LAYOUTS is not in the patched dex")
        check(SWAP_CALL_BUTTONS in swapLayout.methods.flatMap { it.strings() }) { "$SWAP_CALL_LAYOUTS does not read $SWAP_CALL_BUTTONS" }
        val inflations = classes.methodsWhere { _, m -> m.name == "<init>" && m.implementation != null }.flatMap { (c, m) ->
            val code = m.instructions()
            code.indices.filter { index ->
                code[index].opcode == Opcode.INVOKE_DIRECT && code[index].call()?.let {
                    it.definingClass == "Landroid/widget/RemoteViews;" && it.name == "<init>" && it.params() == listOf("Ljava/lang/String;", "I")
                } == true && code.getOrNull(index - 2)?.call()?.definingClass == SWAP_CALL_LAYOUTS
            }.map { Triple(c, m, it) }
        }
        check(inflations.size == 6 && inflations.map { it.first.type }.distinct().size == 1) {
            "expected six redirected RemoteViews in one notification class, found ${inflations.map { (c, m, i) -> "${c.type}.${m.name}@$i" }}"
        }
        for ((c, m, index) in inflations) {
            val code = m.instructions()
            val layoutRegister = (code[index] as FiveRegisterInstruction).registerE
            val call = code[index - 2]
            check(code[index - 3].opcode == Opcode.CONST && (code[index - 3] as OneRegisterInstruction).registerA == layoutRegister &&
                call.opcode == Opcode.INVOKE_STATIC_RANGE && call.call()?.name == "layout" && call.call()?.parameterTypes?.map(CharSequence::toString) == listOf("I") &&
                (call as RegisterRangeInstruction).startRegister == layoutRegister && call.registerCount == 1 &&
                code[index - 1].opcode == Opcode.MOVE_RESULT && (code[index - 1] as OneRegisterInstruction).registerA == layoutRegister
            ) { "${c.type}.<init>@$index does not pass its layout constant through SwapCallButtons.layout" }
        }

        assertSwappedNotificationLayouts()
    }

    // Swap call answer and decline buttons, resources. The stock layouts are untouched: decline right
    // before answer in one LinearLayout, the small row with marginEnd 16dp on both and the big row with
    // marginStart 8dp on answer only. Their <name>_heval_swapped copies have answer first, and the
    // margins stay with the slot, so answer takes the first slot's margins. The big copy's button
    // row is shorter (issue #116). The copies of the including layouts include the swapped copies.
    private fun assertSwappedNotificationLayouts() {
        fun Element.margins(): Map<String, Float> =
            (0 until attributes.length).map { attributes.item(it) }
                .filter { it.nodeName.startsWith("android:layout_margin") }
                .associate { it.nodeName to it.nodeValue.removeSuffix("dip").removeSuffix("dp").toFloat() }
        fun Element.previousElement(): Element? {
            var node: Node? = previousSibling
            while (node != null && node !is Element) node = node.previousSibling
            return node as? Element
        }
        fun layout(name: String) = workDir.walkTopDown().singleOrNull { it.name == "$name.xml" && it.parentFile.name == "layout" }
            ?.let { DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(it) }
            ?: error("no decoded layout/$name.xml under $workDir")
        val small = mapOf("android:layout_marginEnd" to 16f)
        val big = mapOf("android:layout_marginStart" to 8f)
        // Margins of the first and the second button, the same in the stock layout and its copy.
        val expected = mapOf(
            "notification_call_incoming" to listOf(small, small),
            "notification_call_incoming_big" to listOf(emptyMap(), big),
        )
        for ((name, margins) in expected) {
            for ((file, first, second) in listOf(
                Triple("${name}_heval_swapped", "button_answer", "button_decline"),
                Triple(name, "button_decline", "button_answer"),
            )) {
                val doc = layout(file)
                val all = doc.getElementsByTagName("*")
                fun view(id: String): Element {
                    val matches = (0 until all.length).map { all.item(it) as Element }
                        .filter { it.getAttribute("android:id").substringAfter('/') == id }
                    return matches.singleOrNull() ?: error("$file.xml: expected one view $id, found ${matches.size}")
                }
                val a = view(first)
                val b = view(second)
                check(b.previousElement() === a && b.parentNode === a.parentNode) { "$file.xml: $first is not right before $second in the same parent" }
                check(a.margins() == margins[0]) { "$file.xml: $first margins ${a.margins()}, expected ${margins[0]}" }
                check(b.margins() == margins[1]) { "$file.xml: $second margins ${b.margins()}, expected ${margins[1]}" }

                // Issue #116: the big copy's button row fits the Android 12+ height cap (8dp gap
                // above, 40dp buttons, 8dp below); the stock big layout keeps 16dp above, no
                // margin below and the 44dp dimen. The collapsed layout's 44dp icon buttons are
                // the same in both.
                val row = a.parentNode as Element
                val buttons = (0 until row.childNodes.length).mapNotNull { row.childNodes.item(it) as? Element }
                val heights = buttons.map { it.getAttribute("android:layout_height") }
                val rowMargins = row.margins()
                val swapped = file.endsWith("_heval_swapped")
                if (name == "notification_call_incoming_big") {
                    check(buttons.size == 3) { "$file.xml: ${buttons.size} views in the button row, expected 3" }
                    val (expectedHeights, expectedRow) = if (swapped) {
                        "40.0dp" to mapOf("android:layout_marginTop" to 8f, "android:layout_marginBottom" to 8f)
                    } else {
                        "@dimen/notification_call_button_big_height" to mapOf("android:layout_marginTop" to 16f)
                    }
                    check(heights.all { it == expectedHeights }) { "$file.xml: button heights $heights, expected $expectedHeights" }
                    check(rowMargins == expectedRow) { "$file.xml: button row margins $rowMargins, expected $expectedRow" }
                } else {
                    check(heights.all { it == "@dimen/notification_call_button_size" }) { "$file.xml: button heights $heights" }
                    check(rowMargins.isEmpty()) { "$file.xml: button row margins $rowMargins, expected none" }
                }
            }
        }
        val includes = mapOf(
            "notification_call_incoming_big_new" to "notification_call_incoming",
            "notification_call_incoming_dark" to "notification_call_incoming",
            "notification_call_incoming_default" to "notification_call_incoming",
            "notification_call_incoming_big_dark" to "notification_call_incoming_big",
            "notification_call_incoming_big_default" to "notification_call_incoming_big",
            "notification_call_incoming_big_dark_new" to "notification_call_incoming_big_new",
            "notification_call_incoming_big_default_new" to "notification_call_incoming_big_new",
        )
        for ((name, inner) in includes) {
            for ((file, target) in listOf("${name}_heval_swapped" to "${inner}_heval_swapped", name to inner)) {
                val layouts = layout(file).getElementsByTagName("include").let { list ->
                    (0 until list.length).map { (list.item(it) as Element).getAttribute("layout") }
                }
                check(layouts == listOf("@layout/$target")) { "$file.xml includes $layouts, expected @layout/$target" }
            }
        }
    }

    /** Indices that a branch, a switch case or an exception handler jumps to. */
    private fun List<Instruction>.jumpTargets(method: Method): Set<Int> {
        val addresses = runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        val targets = mutableSetOf<Int>()
        forEachIndexed { index, instruction ->
            if (instruction is OffsetInstruction) {
                val target = addresses.indexOf(addresses[index] + instruction.codeOffset)
                val payload = getOrNull(target)
                if (payload is SwitchPayload) {
                    payload.switchElements.forEach { targets += addresses.indexOf(addresses[index] + it.offset) }
                } else {
                    targets += target
                }
            }
        }
        method.implementation?.tryBlocks?.forEach { block ->
            block.exceptionHandlers.forEach { targets += addresses.indexOf(it.handlerCodeAddress) }
        }
        return targets
    }

    private fun Instruction.isCallUiHaptic() = opcode == Opcode.SGET_OBJECT && field()?.definingClass == CALL_UI_HAPTIC

    /**
     * True when the haptic event built from the CallUIHaptic read at [haptic] is dispatched right
     * away, false when nothing dispatches it, and null when the dispatch sits behind the Disable
     * call button haptics skip gate (dispatched only while that feature is off).
     */
    private fun List<Instruction>.hapticDispatched(method: Method, haptic: Int, label: String): Boolean? {
        val create = this[haptic - 1]
        val init = this[haptic + 1]
        check(create.opcode == Opcode.NEW_INSTANCE && init.opcode == Opcode.INVOKE_DIRECT &&
            init.call()?.params() == listOf(CALL_UI_HAPTIC)
        ) { "$label: the CallUIHaptic at $haptic is not passed to a new haptic event" }
        val event = (create as OneRegisterInstruction).registerA
        fun dispatchAt(index: Int) = getOrNull(index).let { next ->
            (next?.opcode == Opcode.INVOKE_VIRTUAL || next?.opcode == Opcode.INVOKE_INTERFACE) &&
                next.call()?.returnType == "V" && (next as FiveRegisterInstruction).registerCount == 2 && next.registerD == event
        }
        if (getOrNull(haptic + 2)?.stringOrNull() == DISABLE_CALL_HAPTICS) {
            assertSkipGate(method, DISABLE_CALL_HAPTICS, haptic + 6, haptic + 7, label)
            check(dispatchAt(haptic + 6)) { "$label: the skip gate does not guard the haptic dispatch" }
            return null
        }
        return dispatchAt(haptic + 2)
    }

    private fun MethodReference.params() = parameterTypes.map(CharSequence::toString)

    /**
     * The R8-merged lambda behind the function reference [handler] the incoming call screen builds,
     * and the instruction range of its switch case (switch target to first return or throw).
     */
    private fun swipeHandlerCase(classes: List<ClassDef>, byType: Map<String, ClassDef>, handler: String): Triple<String, Method, IntRange> {
        val (cls, composable) = classes.singleMethod("incoming call screen with the swipe handlers") { _, m ->
            m.strings().containsAll(listOf("onCallUiSwipeButtonDraggingStateChanged", "onDraggingProgressChanged"))
        }
        val insns = composable.instructions()
        val name = insns.indexOfFirst { it.opcode == Opcode.CONST_STRING && it.stringOrNull() == handler }
        val constructor = (name + 1 until insns.size).first { insns[it].call()?.name == "<init>" }
        val call = insns[constructor].call()!!
        check(call.params() == listOf("I", "Ljava/lang/Object;", "Ljava/lang/Class;", "Ljava/lang/String;", "Ljava/lang/String;", "I", "B")) {
            "${cls.type}.${composable.name}: $handler goes to $call"
        }
        val range = insns[constructor] as RegisterRangeInstruction
        val caseRegister = range.startRegister + range.registerCount - 1
        val case = (constructor - 1 downTo 0).map { insns[it] }
            .first { it is OneRegisterInstruction && it.registerA == caseRegister && it.opcode.setsRegister() }
            .let { (it as NarrowLiteralInstruction).narrowLiteral }

        val lambda = byType.getValue(call.definingClass)
        val invoke = lambda.methods.single { it.name == "invoke" && it.implementation != null }
        val body = invoke.instructions()
        val addresses = body.runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        val selector = body.indexOfFirst { it.opcode == Opcode.IGET_BYTE && it.field()?.definingClass == lambda.type }
        val switch = (selector + 1 until body.size).first { body[it].opcode == Opcode.PACKED_SWITCH || body[it].opcode == Opcode.SPARSE_SWITCH }
        check((body[switch] as OneRegisterInstruction).registerA == (body[selector] as TwoRegisterInstruction).registerA) {
            "${lambda.type}.invoke does not switch on its case field"
        }
        val payload = body[addresses.indexOf(addresses[switch] + (body[switch] as OffsetInstruction).codeOffset)] as SwitchPayload
        val start = payload.switchElements.firstOrNull { it.key == case }
            ?.let { addresses.indexOf(addresses[switch] + it.offset) } ?: (switch + 1)
        val returns = setOf(Opcode.RETURN_OBJECT, Opcode.RETURN_VOID, Opcode.THROW)
        val end = (start until body.size).first { body[it].opcode in returns }
        // A case R8 outlined into a private method of the lambda (26.43.5: onDraggingProgressChanged
        // is invoke-direct {this, arg}, b(Object)Object; move-result-object; return-object), as the
        // patch follows it.
        val delegate = body[start].call()?.takeIf {
            end == start + 2 && it.definingClass == lambda.type && it.name != "<init>" &&
                body[start].opcode in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) &&
                body[start + 1].opcode == Opcode.MOVE_RESULT_OBJECT && body[end].opcode == Opcode.RETURN_OBJECT
        } ?: return Triple("${lambda.type}.invoke case $case ($handler)", invoke, start..end)
        val outlined = lambda.methods.single { it.name == delegate.name && it.params() == delegate.params() && it.returnType == delegate.returnType }
        val outlinedBody = outlined.instructions()
        return Triple("${lambda.type}.${outlined.name} (outlined case $case, $handler)", outlined, 0..outlinedBody.indexOfFirst { it.opcode in returns })
    }

    private fun assertDisableCallButtonHaptics(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        // 1. Every handler that reports an ACCEPT or REJECT call UI action (full screen, details
        // view, PiP) still builds its CONFIRM / REJECT haptic event and dispatches it only while the
        // feature is off (a skip gate jumps over the dispatch). Handlers reporting HANGUP keep
        // dispatching the same REJECT haptic unconditionally.
        val analytics = "Lcom/truecaller/callui/api/internal/analytics/model/"
        val enums = listOf("CallUIActions", "CallUIDetailsViewAction", "CallUIPipActions").map { "$analytics$it;" }
        val answerDecline = enums.flatMap { listOf((it to "ACCEPT") to "CONFIRM", (it to "REJECT") to "REJECT") }.toMap()
        val hangUp = enums.map { it to "HANGUP" }.toSet()
        val gated = mutableSetOf<Pair<String, String>>()
        val kept = mutableSetOf<Pair<String, String>>()
        for (cls in classes) for (method in cls.methods) {
            val insns = method.instructions()
            val actions = insns.indices.filter { index ->
                insns[index].opcode == Opcode.SGET_OBJECT &&
                    insns[index].field()?.let { (it.definingClass to it.name) in answerDecline || (it.definingClass to it.name) in hangUp } == true
            }
            if (actions.isEmpty()) continue
            // A skip gate's target (right after the dispatch) does not end the straight-line path.
            val targets = insns.jumpTargets(method).filterNot { insns.getOrNull(it - 5)?.stringOrNull() == DISABLE_CALL_HAPTICS }.toSet()
            for (index in actions) {
                // The haptic read on the straight-line path into the action, as the patch finds it.
                val haptic = (index - 1 downTo 0).firstOrNull { i ->
                    insns[i].isCallUiHaptic() || insns[i].opcode in BLOCK_END_OPCODES || i in targets
                }?.takeIf { insns[it].isCallUiHaptic() } ?: continue
                val field = insns[index].field()!!
                val action = field.definingClass to field.name
                val label = "${cls.type}.${method.name} (${field.name})"
                if (action in answerDecline) {
                    check(insns[haptic].field()?.name == answerDecline.getValue(action)) { "$label plays ${insns[haptic].field()?.name}" }
                    check(insns.hapticDispatched(method, haptic, label) == null) { "$label does not gate its haptic dispatch" }
                    gated += action
                } else {
                    check(insns.hapticDispatched(method, haptic, label) == true) { "$label (hang-up) lost its haptic" }
                    kept += action
                }
            }
        }
        check(gated == answerDecline.keys) { "answer/decline haptics gated for $gated, expected ${answerDecline.keys}" }
        check(kept.isNotEmpty()) { "no hang-up haptic dispatch found to check" }

        // 2. The dragging state case: the CLICK event behind "state != IDLE" is dispatched only while
        // the feature is off.
        run {
            val (label, invoke, block) = swipeHandlerCase(classes, byType, "onCallUiSwipeButtonDraggingStateChanged")
            val insns = invoke.instructions()
            val idle = block.first { insns[it].opcode == Opcode.SGET_OBJECT && insns[it].field()?.definingClass == SWIPE_DRAGGING_STATE && insns[it].field()?.name == "IDLE" }
            check(insns[idle + 1].opcode == Opcode.IF_EQ || insns[idle + 1].opcode == Opcode.IF_NE) { "$label does not compare IDLE" }
            val haptic = (idle + 2..block.last).first { insns[it].isCallUiHaptic() }
            check(insns[haptic].field()?.name == "CLICK") { "$label plays ${insns[haptic].field()?.name}" }
            check(insns.hapticDispatched(invoke, haptic, label) == null) { "$label does not gate the drag start CLICK" }
        }

        // 3. The dragging progress case: right before the 0.1f compare the progress goes through a
        // (F)F helper that answers 0 while the feature is on, so the looping vibration never starts.
        run {
            val (label, invoke, block) = swipeHandlerCase(classes, byType, "onDraggingProgressChanged")
            val insns = invoke.instructions()
            val threshold = block.first { insns[it].opcode == Opcode.CONST && (insns[it] as NarrowLiteralInstruction).narrowLiteral == 0.1f.toRawBits() }
            val compare = insns[threshold + 3]
            check(compare.opcode == Opcode.CMPG_FLOAT || compare.opcode == Opcode.CMPL_FLOAT) { "$label: no float compare after 0.1f; got ${compare.opcode}" }
            val thresholdRegister = (insns[threshold] as OneRegisterInstruction).registerA
            val progress = (compare as ThreeRegisterInstruction).let { if (it.registerC == thresholdRegister) it.registerB else it.registerC }
            val path = assertThroughValueHelper(insns, threshold + 1, progress, byType, DISABLE_CALL_HAPTICS, "F", "$label (drag progress)")
            check(path.isReturnZero()) { "$label: the progress helper does not answer 0 while the feature is on" }
        }
    }

    private fun assertClassicCallLogSwipe(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        // "featureCallLogRevamp" is checked in assertToggleOverrides. The classic lists' RecyclerView
        // setup reads "featureFavouriteContacts" and, with it on, skipped the swipe helper; the
        // result is now replaced with false right before that branch.
        val calls = listOf("addOnItemTouchListener", "addItemDecoration", "setItemAnimator", "setHasFixedSize")
        fun List<Instruction>.recyclerCall(name: String) =
            indexOfFirst { it.call()?.definingClass == RECYCLER_VIEW && it.call()?.name == name }
        val (cls, setup) = classes.singleMethod("call log RecyclerView setup") { _, m ->
            m.returnType == "V" && m.parameterTypes.isEmpty() && m.implementation != null &&
                m.instructions().let { insns -> calls.map { insns.recyclerCall(it) } }.let { it.all { index -> index >= 0 } && it == it.sorted() }
        }
        val label = "${cls.type}.${setup.name}()"
        val insns = setup.instructions()
        val touch = insns.recyclerCall("addOnItemTouchListener")
        val decoration = insns.recyclerCall("addItemDecoration")

        // The touch listener is the swipe helper (it fires ItemEvent.SWIPE_START).
        val listener = (insns[touch] as FiveRegisterInstruction).registerD
        val cast = insns.take(touch).last { it.opcode == Opcode.CHECK_CAST && (it as OneRegisterInstruction).registerA == listener }
        val helperType = ((cast as ReferenceInstruction).reference as TypeReference).type
        val helper = byType[helperType] ?: error("$label: swipe helper $helperType not found")
        check(helper.methods.any { "ItemEvent.SWIPE_START" in it.strings() }) { "$label: $helperType does not fire ItemEvent.SWIPE_START" }

        // invoke ...()Z, move-result vX, then vX through a (Z)Z helper (false while Restore classic
        // call log is on), then if-nez vX past the item decoration. 21t/22t are the if-* formats.
        val branches = (0 until touch).filter { insns[it].opcode.format in setOf(Format.Format21t, Format.Format22t) }
        check(branches.size == 1) { "$label has ${branches.size} branches before its touch listener" }
        val guard = branches.single()
        val register = (insns[guard] as OneRegisterInstruction).registerA
        check(insns[guard].opcode == Opcode.IF_NEZ) { "$label: the swipe guard is ${insns[guard].opcode}, expected if-nez" }
        val path = assertThroughValueHelper(insns, guard - 2, register, byType, RESTORE_CLASSIC_CALL_LOG, "Z", "$label (swipe guard)")
        check(path.isReturnZero()) { "$label: the swipe guard helper does not answer false while the feature is on" }
        val moveResult = insns[guard - 3]
        val toggle = insns[guard - 4].call()
        check(moveResult.opcode == Opcode.MOVE_RESULT && (moveResult as OneRegisterInstruction).registerA == register &&
            toggle?.returnType == "Z" && toggle.parameterTypes.isEmpty()
        ) { "$label: the forced register is not the result of a ()Z toggle read; got ${moveResult.opcode} $toggle" }
        check(insns.branchTarget(guard) > decoration) { "$label: the swipe guard no longer skips the item decoration" }
    }

    private fun assertUseSmsVerification(classes: List<ClassDef>) {
        // The selection branch now loads SMS where it loaded GOOGLE and returns it. Located by its
        // check-cast to OtpSmsApi right before, since the GOOGLE read the patch anchored on is gone.
        val selections = classes.methodsWhere { _, m ->
            m.returnType == "Ljava/lang/Object;" && m.parameterTypes.isEmpty() &&
                m.instructions().windowed(3).any { (cast, sms, ret) ->
                    cast.opcode == Opcode.CHECK_CAST &&
                        ((cast as ReferenceInstruction).reference as TypeReference).type == OTP_SMS_API &&
                        sms.opcode == Opcode.SGET_OBJECT && sms.field()?.definingClass == OTP_SMS_API && sms.field()?.name == "SMS" &&
                        ret.opcode == Opcode.RETURN_OBJECT &&
                        (ret as OneRegisterInstruction).registerA == (sms as OneRegisterInstruction).registerA
                }
        }
        check(selections.size == 1) { "expected one OtpSmsApi selection returning SMS, found ${selections.map { (c, m) -> "${c.type}.${m.name}" }}" }
        val (cls, method) = selections.single()
        check(method.instructions().none { it.opcode == Opcode.SGET_OBJECT && it.field()?.definingClass == OTP_SMS_API && it.field()?.name == "GOOGLE" }) {
            "${cls.type}.${method.name} still compares with OtpSmsApi.GOOGLE"
        }
    }

    private fun assertFixT9ContactSearch(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        // The RebuildAll helper and its incremental copy share the shape the patch anchors on.
        val helpers = classes.methodsWhere { _, m ->
            m.returnType == "V" && m.params() == listOf("Landroid/content/Context;") && AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.strings().containsAll(listOf(T9_REBUILD_ALL_KEY, "RefreshT9MappingWorker"))
        }
        val (cloneClass, clone) = helpers.singleOrNull { (_, m) -> m.name == T9_INCREMENTAL_HELPER }
            ?: error("expected one $T9_INCREMENTAL_HELPER, found ${helpers.map { (c, m) -> "${c.type}.${m.name}" }}")
        val (helperClass, helper) = helpers.singleOrNull { (_, m) -> m.name != T9_INCREMENTAL_HELPER }
            ?: error("expected one RefreshT9MappingWorker helper, found ${helpers.map { (c, m) -> "${c.type}.${m.name}" }}")
        check(cloneClass.type == helperClass.type) { "$T9_INCREMENTAL_HELPER is in ${cloneClass.type}, not ${helperClass.type}" }
        val label = "${cloneClass.type}.$T9_INCREMENTAL_HELPER(Context)"
        check(AccessFlags.PUBLIC.isSet(clone.accessFlags) && AccessFlags.STATIC.isSet(clone.accessFlags)) { "$label is not public static" }

        fun List<Instruction>.booleanLoads(name: String) = withIndex().filter { (_, insn) ->
            insn.opcode == Opcode.SGET_OBJECT && insn.field()?.definingClass == "Ljava/lang/Boolean;" && insn.field()?.name == name
        }.map { it.index }

        // The copy starts with the Fix T9 contact search gate: while the feature is off it returns
        // at once (nothing is enqueued, as in stock).
        val body = assertGate(clone, FIX_T9_SEARCH, label, branch = Opcode.IF_NEZ)
        val cloneInsns = clone.instructions()
        check(body == 5 && cloneInsns[4].opcode == Opcode.RETURN_VOID) { "$label does not return at once while its feature is off" }
        val copy = cloneInsns.drop(body)

        // The original still enqueues RebuildAll = TRUE; the copy is identical except for FALSE there.
        val stock = helper.instructions()
        val original = stock.booleanLoads("TRUE")
        check(original.size == 1 && stock.booleanLoads("FALSE").isEmpty()) {
            "${helperClass.type}.${helper.name} (RebuildAll helper) was changed: TRUE at $original"
        }
        check(copy.booleanLoads("FALSE") == original && copy.booleanLoads("TRUE").isEmpty()) {
            "$label does not load Boolean.FALSE in place of TRUE; FALSE at ${copy.booleanLoads("FALSE")}, TRUE at ${copy.booleanLoads("TRUE")}"
        }
        check(copy.map { it.opcode } == stock.map { it.opcode } && copy.mapNotNull { it.stringOrNull() } == helper.strings()) {
            "$label is not a copy of ${helperClass.type}.${helper.name}"
        }

        // TruecallerInit.onCreate calls the copy with p0 right after super.onCreate.
        val onCreate = (byType[TRUECALLER_INIT] ?: error("$TRUECALLER_INIT not found")).method("onCreate", listOf("Landroid/os/Bundle;"))
        val insns = onCreate.instructions()
        val superCall = insns.indexOfFirst {
            (it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE) && it.call()?.name == "onCreate"
        }
        check(superCall >= 0) { "TruecallerInit.onCreate does not call super.onCreate" }
        val call = insns.getOrNull(superCall + 1)
        val p0 = onCreate.implementation!!.registerCount - 2 // this + Bundle
        check(call?.opcode == Opcode.INVOKE_STATIC_RANGE && call.call()?.definingClass == helperClass.type &&
            call.call()?.name == T9_INCREMENTAL_HELPER && (call as RegisterRangeInstruction).startRegister == p0 && call.registerCount == 1
        ) { "TruecallerInit.onCreate does not call $label with p0 after super.onCreate; got ${call?.opcode} ${call?.call()}" }
    }

    private fun assertHideBusinessMedia(classes: List<ClassDef>) {
        // 1. The BusinessDetailsModel constructor passes brandMedia (p6) through morpheBrandMedia,
        // which returns a new empty ArrayList while Hide business media is on, the list otherwise.
        val (modelClass, _) = classes.singleMethod("BusinessDetailsModel.toString") { _, m ->
            m.name == "toString" && m.strings().any { it.startsWith("BusinessDetailsModel(description=") } &&
                ", brandMedia=" in m.strings()
        }
        // The six fields lead the parameter list (26.43.5 appended a contactId Long).
        val leading = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", CONTACT_TYPE, "Ljava/lang/String;", "Ljava/util/ArrayList;")
        val constructor = modelClass.methods.single { it.name == "<init>" && it.implementation != null && it.params().take(6) == leading }
        val label = "${modelClass.type}.<init>"
        // p0 = v(registers - ins); this + the six object parameters before brandMedia make it p6.
        val ins = 1 + constructor.params().sumOf { if (it == "J" || it == "D") 2L else 1L }.toInt()
        val p6 = constructor.implementation!!.registerCount - ins + 6
        val insns = constructor.instructions()
        val call = insns.getOrNull(0)
        check(call?.opcode == Opcode.INVOKE_STATIC_RANGE && call.call()?.definingClass == modelClass.type &&
            call.call()?.name == BRAND_MEDIA_HELPER && call.call()?.returnType == "Ljava/util/ArrayList;" &&
            (call as RegisterRangeInstruction).startRegister == p6 && call.registerCount == 1
        ) { "$label does not start with $BRAND_MEDIA_HELPER(p6); got ${call?.opcode} ${call?.call()}" }
        val result = insns.getOrNull(1)
        check(result?.opcode == Opcode.MOVE_RESULT_OBJECT && (result as OneRegisterInstruction).registerA == p6) {
            "$label does not put the $BRAND_MEDIA_HELPER result in p6; got ${result?.opcode}"
        }
        val stored = insns.drop(2).single { it.opcode == Opcode.IPUT_OBJECT && it.field()?.type == "Ljava/util/ArrayList;" }
        check((stored as TwoRegisterInstruction).registerA == p6) { "$label does not store p6 as brandMedia" }
        val helper = modelClass.method(BRAND_MEDIA_HELPER, listOf("Ljava/util/ArrayList;"))
        val helperLabel = "${modelClass.type}.$BRAND_MEDIA_HELPER"
        check(AccessFlags.STATIC.isSet(helper.accessFlags) && helper.returnType == "Ljava/util/ArrayList;") { "$helperLabel is not a static ArrayList getter" }
        val stockPath = assertGate(helper, HIDE_BUSINESS_MEDIA, helperLabel)
        val h = helper.instructions()
        val list = h[4]
        check(stockPath == 7 && list.opcode == Opcode.NEW_INSTANCE && ((list as ReferenceInstruction).reference as TypeReference).type == "Ljava/util/ArrayList;" &&
            h[5].opcode == Opcode.INVOKE_DIRECT_RANGE && h[5].call()?.definingClass == "Ljava/util/ArrayList;" && h[5].call()?.name == "<init>" &&
            h[5].call()?.parameterTypes?.isEmpty() == true && h[6].opcode == Opcode.RETURN_OBJECT &&
            (h[6] as OneRegisterInstruction).registerA == (list as OneRegisterInstruction).registerA
        ) { "$helperLabel does not return a new empty ArrayList while its feature is on" }
        val p0 = helper.implementation!!.registerCount - 1
        check(h.size == 8 && h[7].opcode == Opcode.RETURN_OBJECT && (h[7] as OneRegisterInstruction).registerA == p0) {
            "$helperLabel does not return the list unchanged while its feature is off"
        }

        // 2. BusinessDetailsScreen clears its video thumbnail slot (Function2, p4) first.
        val (screenClass, screen) = classes.singleMethod("BusinessDetailsScreen") { _, m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.params().size == 7 &&
                m.params()[1] == modelClass.type && m.params()[4] == "Lkotlin/jvm/functions/Function2;" &&
                m.strings().containsAll(listOf("BusinessDetailsScreen", "BusinessDesTitle"))
        }
        val p4 = screen.implementation!!.registerCount - 7 + 4 // static, 7 single-register parameters
        // The gate's patched path clears p4 and falls through into the stock code.
        check(assertGate(screen, HIDE_BUSINESS_MEDIA, "${screenClass.type}.${screen.name}") == 5) {
            "${screenClass.type}.${screen.name}: the gate does not skip only the clear"
        }
        val clear = screen.instructions().getOrNull(4)
        check(clear?.opcode == Opcode.CONST_16 && (clear as OneRegisterInstruction).registerA == p4 &&
            (clear as NarrowLiteralInstruction).narrowLiteral == 0
        ) { "${screenClass.type}.${screen.name} does not clear p4 (const/16 p4, 0x0) after the gate; got ${clear?.opcode}" }
        check(screen.instructions().drop(5).any { it.opcode == Opcode.MOVE_OBJECT_FROM16 && (it as TwoRegisterInstruction).registerB == p4 }) {
            "${screenClass.type}.${screen.name} no longer reads p4"
        }

        // 3. The verified business campaign toggles are checked in assertToggleOverrides.
    }

    private fun assertHideCallLogFilters(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        // 1. The filter row composable (static, void, 11 parameters, "filtersStartPadding") returns at
        // once while the feature is on.
        val (rowClass, row) = classes.singleMethod("call log filter row") { _, m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.params().size == 11 &&
                m.params()[2] == "Lkotlin/jvm/functions/Function1;" && m.params()[4] == "I" &&
                m.params()[6] == "Lkotlin/jvm/functions/Function0;" && m.params()[7] == "Z" &&
                "filtersStartPadding" in m.strings()
        }
        val rowLabel = "${rowClass.type}.${row.name} (call log filter row)"
        check(assertGate(row, HIDE_CALL_LOG_FILTERS, rowLabel) == 5 && row.instructions()[4].opcode == Opcode.RETURN_VOID) {
            "$rowLabel does not return at once while the feature is on"
        }

        // 2. The filter setter TruecallerInit uses for the intent extras (the (FilterType)V call after
        // "set_missed_filter" and FilterType.MISSED in onNewIntent) loads FilterType.NONE into p1 right
        // after its gate (while the feature is on).
        fun Instruction.setterCall() = call()?.takeIf {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(CALL_LOG_FILTER_TYPE)
        }
        val init = byType[TRUECALLER_INIT] ?: error("$TRUECALLER_INIT not found")
        val onNewIntent = init.method("onNewIntent", listOf("Landroid/content/Intent;")).instructions()
        val extra = onNewIntent.indexOfFirst { it.stringOrNull() == "set_missed_filter" }
        check(extra >= 0) { "TruecallerInit.onNewIntent no longer reads set_missed_filter" }
        val missed = (extra until onNewIntent.size).first { onNewIntent[it].field()?.let { f ->
            f.definingClass == CALL_LOG_FILTER_TYPE && f.name == "MISSED"
        } == true }
        val setterRef = (missed until onNewIntent.size).firstNotNullOf { onNewIntent[it].setterCall() }
        val setter = (byType[setterRef.definingClass] ?: error("${setterRef.definingClass} not found"))
            .method(setterRef.name, listOf(CALL_LOG_FILTER_TYPE))
        val label = "${setterRef.definingClass}.${setterRef.name}(FilterType)"
        val p1 = setter.implementation!!.registerCount - 1 // this + one FilterType parameter
        check(assertGate(setter, HIDE_CALL_LOG_FILTERS, label) == 5) { "$label: the gate does not skip the forced filter" }
        val first = setter.instructions().getOrNull(4)
        check(first?.opcode == Opcode.SGET_OBJECT && (first as OneRegisterInstruction).registerA == p1 &&
            first.field()?.let { it.definingClass == CALL_LOG_FILTER_TYPE && it.name == "NONE" } == true
        ) { "$label does not load sget-object p1, FilterType.NONE after its gate; got ${first?.opcode} ${first?.field()}" }
        // The forced value reaches the coroutine that reloads the list (a constructor taking the FilterType),
        // with nothing writing p1 before it (R8 reuses p1 for a constant afterwards).
        val insns = setter.instructions()
        val reload = insns.indexOfFirst { insn ->
            insn.call()?.let { it.name == "<init>" && CALL_LOG_FILTER_TYPE in it.parameterTypes.map(CharSequence::toString) } == true
        }
        check(reload > 0 && (insns[reload] as? FiveRegisterInstruction)?.let { five ->
            listOf(five.registerC, five.registerD, five.registerE, five.registerF, five.registerG).take(five.registerCount).contains(p1)
        } == true) { "$label does not pass p1 to the reload coroutine" }
        check((5 until reload).none { insns[it] is OneRegisterInstruction && insns[it].opcode.setsRegister() && (insns[it] as OneRegisterInstruction).registerA == p1 }) {
            "$label overwrites p1 before the reload coroutine"
        }
        // onCreate and onNewIntent select filters through this one setter only.
        for (name in listOf("onCreate", "onNewIntent")) {
            val calls = init.methods.filter { it.name == name }.flatMap { m -> m.instructions().mapNotNull { it.setterCall() } }
            check(calls.isNotEmpty() && calls.all { it.definingClass == setterRef.definingClass && it.name == setterRef.name }) {
                "TruecallerInit.$name selects filters through ${calls.map { "${it.definingClass}->${it.name}" }.distinct()}, not $label"
            }
        }
    }

    private fun assertHideListItems(classes: List<ClassDef>) {
        // "Hide frequently called contacts" and "Hide important senders": in each list builder
        // (invoke(Object)Object loading the item key), the key goes to a static void item helper,
        // and the nearest branch before it that jumps past that call now has the feature's skip gate
        // right before it, jumping to the same target: while the feature is on the item is never
        // added, while it is off the stock branch decides.
        for ((key, guardOpcode, feature) in listOf(
            Triple("frequent_contacts_id", Opcode.IF_EQZ, HIDE_FREQUENT_CONTACTS),
            Triple("important-senders-header", Opcode.IF_LT, HIDE_IMPORTANT_SENDERS),
        )) {
            val (cls, builder) = classes.singleMethod("$key list builder") { _, m ->
                m.name == "invoke" && m.returnType == "Ljava/lang/Object;" && m.params() == listOf("Ljava/lang/Object;") && key in m.strings()
            }
            val label = "${cls.type}.${builder.name} ($key)"
            val insns = builder.instructions()
            val keyIndex = insns.indexOfFirst { it.stringOrNull() == key }
            val keyRegister = (insns[keyIndex] as OneRegisterInstruction).registerA
            val addCall = (keyIndex + 1 until insns.size).first { insns[it].arguments()?.contains(keyRegister) == true }
            check(insns[addCall].opcode == Opcode.INVOKE_STATIC && insns[addCall].call()?.returnType == "V") {
                "$label does not pass the key to a static void item helper; got ${insns[addCall].opcode} ${insns[addCall].call()}"
            }
            val guard = (keyIndex - 1 downTo 0).firstOrNull {
                insns[it].opcode in setOf(Opcode.IF_EQZ, Opcode.IF_LT) && insns.branchTarget(it) > addCall
            } ?: error("$label has no guard that skips the item")
            check(insns[guard].opcode == guardOpcode) { "$label is guarded by ${insns[guard].opcode}, expected $guardOpcode" }
            assertSkipGate(builder, feature, guard, insns.branchTarget(guard), label)
            if (guardOpcode == Opcode.IF_LT) {
                // The guard compares importantSenders.size() (List.size, then move-result into its first register).
                val sizeRegister = (insns[guard] as TwoRegisterInstruction).registerA
                val result = (guard - 2 downTo 0).first {
                    insns[it].opcode.setsRegister() && (insns[it] as? OneRegisterInstruction)?.registerA == sizeRegister
                }
                check(insns[result].opcode == Opcode.MOVE_RESULT && insns[result - 1].call()?.let {
                    it.definingClass == "Ljava/util/List;" && it.name == "size"
                } == true) { "$label: the guard does not compare a List.size() result" }
            }
        }
    }

    private fun assertHideProfileMenuItems(classes: List<ClassDef>, byType: Map<String, ClassDef>, allPatches: Set<Patch<*>>) {
        val patch = allPatches.single { p -> p.name == PROFILE_MENU_PATCH && p.compatibility.orEmpty().any { it.packageName == PKG } }
        check(!patch.default) { "$PROFILE_MENU_PATCH is selected by default" }
        fun isEnabledCall(insn: Instruction?, register: Int) = insn?.call()?.let {
            it.definingClass == HEVAL_SETTINGS_CLASS && it.name == "isEnabled"
        } == true && insn.arguments() == listOf(register)
        fun helperOf(insn: Instruction, label: String): Method {
            val ref = insn.call() ?: error("$label: no helper call")
            val helper = (byType[ref.definingClass] ?: error("${ref.definingClass} not found")).method(ref.name, ref.parameterTypes.map(CharSequence::toString))
            check(AccessFlags.STATIC.isSet(helper.accessFlags)) { "$label: ${ref.definingClass}.${ref.name} is not static" }
            return helper
        }
        fun stateClass(prefix: String): Pair<ClassDef, Method> = classes.singleMethod("$prefix toString") { _, m ->
            m.name == "toString" && m.parameterTypes.isEmpty() && m.strings().any { it.startsWith(prefix) }
        }
        fun stateField(cls: ClassDef, toString: Method, label: String, type: String): FieldReference =
            toStringFields(toString, cls.type) { byType[it] }.filter { (name, field) -> name == label && field.type == type }
                .map { it.second }.distinctBy { it.name }.singleOrNull() ?: error("${cls.type}.toString does not print one $label")
        fun FieldReference.storedBy(insn: Instruction) = insn.field()?.let { it.definingClass == definingClass && it.name == name } == true

        // 1. Rows: each MenuItemUiState constructor passes (item, isVisible) through a static
        // (MenuItem, Z)Z helper right before it stores isVisible. The helper keeps a hidden row
        // hidden, and for each of the four rows compares the item with its MenuItem constant, loads
        // that row's feature id and asks isEnabled: true gives false (row dropped), else isVisible.
        val (rowClass, rowToString) = stateClass("MenuItemUiState(item=")
        val item = stateField(rowClass, rowToString, "item", PROFILE_MENU_ITEM)
        val visible = stateField(rowClass, rowToString, "isVisible", "Z")
        var rowStores = 0
        for (constructor in rowClass.methods.filter { it.name == "<init>" && it.implementation != null }) {
            val label = "${rowClass.type}.<init>(${constructor.params().joinToString()})"
            val insns = constructor.instructions()
            val itemStore = insns.singleOrNull { it.opcode == Opcode.IPUT_OBJECT && item.storedBy(it) } ?: continue
            val itemRegister = (itemStore as TwoRegisterInstruction).registerA
            for (index in insns.indices.filter { insns[it].opcode == Opcode.IPUT_BOOLEAN && visible.storedBy(insns[it]) }) {
                val value = (insns[index] as TwoRegisterInstruction).registerA
                val call = insns[index - 2]
                check(call.opcode == Opcode.INVOKE_STATIC && call.call()?.parameterTypes?.map(CharSequence::toString) == listOf(PROFILE_MENU_ITEM, "Z") &&
                    call.call()?.returnType == "Z" && call.arguments() == listOf(itemRegister, value) &&
                    insns[index - 1].opcode == Opcode.MOVE_RESULT && (insns[index - 1] as OneRegisterInstruction).registerA == value
                ) { "$label does not pass (item, ${visible.name}) through a (MenuItem, Z)Z helper; got ${call.opcode} ${call.call()}" }
                val helper = helperOf(call, label)
                val h = helper.instructions()
                val p0 = helper.implementation!!.registerCount - 2
                check(h.first().opcode == Opcode.IF_EQZ && (h.first() as OneRegisterInstruction).registerA == p0 + 1) {
                    "$label: the row helper does not keep hidden rows hidden first"
                }
                for ((id, constant, _) in PROFILE_MENU_ROWS) {
                    val load = h.indexOfFirst { it.opcode == Opcode.SGET_OBJECT && it.field()?.definingClass == PROFILE_MENU_ITEM && it.field()?.name == constant }
                    check(load >= 0 && h[load + 1].opcode == Opcode.IF_NE && (h[load + 1] as TwoRegisterInstruction).registerA == p0 &&
                        h[load + 2].stringOrNull() == id
                    ) { "$label: the row helper does not map MenuItem.$constant to $id" }
                }
                val ask = h.indexOfFirst { it.call()?.name == "isEnabled" }
                check(isEnabledCall(h.getOrNull(ask), 0) && h[ask + 2].opcode == Opcode.IF_EQZ &&
                    h[ask + 3].opcode == Opcode.CONST_4 && (h[ask + 3] as NarrowLiteralInstruction).narrowLiteral == 0 &&
                    h[ask + 4].opcode == Opcode.RETURN && h.last().opcode == Opcode.RETURN && (h.last() as OneRegisterInstruction).registerA == p0 + 1
                ) { "$label: the row helper does not answer false for a switched-on row and isVisible otherwise" }
                rowStores++
            }
        }
        check(rowStores > 0) { "${rowClass.type} has no constructor storing ${visible.name} through the row helper" }

        // 2. Groups: each MenuItemsViewState constructor passes groups through a static (List)List
        // helper that returns groups unchanged unless one of the four row switches is on, and then
        // drops the empty groups (List.isEmpty).
        val (groupsClass, groupsToString) = stateClass("MenuItemsViewState(groups=")
        val groups = stateField(groupsClass, groupsToString, "groups", "Ljava/util/List;")
        var groupStores = 0
        for (constructor in groupsClass.methods.filter { it.name == "<init>" && it.implementation != null }) {
            val label = "${groupsClass.type}.<init>(${constructor.params().joinToString()})"
            val insns = constructor.instructions()
            for (index in insns.indices.filter { insns[it].opcode == Opcode.IPUT_OBJECT && groups.storedBy(insns[it]) }) {
                val value = (insns[index] as TwoRegisterInstruction).registerA
                val call = insns[index - 2]
                check(call.opcode == Opcode.INVOKE_STATIC_RANGE && call.call()?.parameterTypes?.map(CharSequence::toString) == listOf("Ljava/util/List;") &&
                    call.call()?.returnType == "Ljava/util/List;" && call.arguments() == listOf(value) &&
                    insns[index - 1].opcode == Opcode.MOVE_RESULT_OBJECT && (insns[index - 1] as OneRegisterInstruction).registerA == value
                ) { "$label does not pass ${groups.name} through a (List)List helper; got ${call.opcode} ${call.call()}" }
                val h = helperOf(call, label).instructions()
                PROFILE_MENU_ROWS.forEachIndexed { row, (id, _, _) ->
                    check(h[row * 4].stringOrNull() == id && isEnabledCall(h[row * 4 + 1], 0) && h[row * 4 + 3].opcode == Opcode.IF_NEZ) {
                        "$label: the groups helper does not check $id at ${row * 4}"
                    }
                }
                check(h[PROFILE_MENU_ROWS.size * 4].opcode == Opcode.RETURN_OBJECT &&
                    h.any { it.call()?.let { c -> c.definingClass == "Ljava/util/List;" && c.name == "isEmpty" } == true }
                ) { "$label: the groups helper does not return groups unchanged with every switch off, or never drops empty groups" }
                groupStores++
            }
        }
        check(groupStores > 0) { "${groupsClass.type} has no constructor storing ${groups.name} through the groups helper" }

        // 3. Premium banner: every static renderer of the optional row states (first parameter the
        // interface of the "Enabled(iconRes=" state, tests instance-of Enabled) starts by passing that
        // parameter through a static helper, which returns the Disabled object for an Enabled state
        // whose titleRes is one of the two banner titles while the banner switch is on.
        val (enabledClass, enabledToString) = classes.singleMethod("Enabled(iconRes= toString") { _, m ->
            m.name == "toString" && m.parameterTypes.isEmpty() && "Enabled(iconRes=" in m.strings() && ", titleRes=" in m.strings()
        }
        val titleRes = stateField(enabledClass, enabledToString, "titleRes", "I")
        val stateType = enabledClass.interfaces.single()
        val publicXml = workDir.walkTopDown().firstOrNull { it.name == "public.xml" && it.parentFile.name == "values" }
            ?: error("no decoded res/values/public.xml under $workDir")
        val publics = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(publicXml).documentElement
            .getElementsByTagName("public").let { list -> (0 until list.length).map { list.item(it) as Element } }
        val titleIds = listOf("usershome_premium_section_premium_member", "usershome_premium_section_upgrade_to_premium").map { name ->
            publics.single { it.getAttribute("type") == "string" && it.getAttribute("name") == name }.getAttribute("id").removePrefix("0x").toLong(16).toInt()
        }
        val renderers = classes.methodsWhere { _, m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.params().firstOrNull() == stateType &&
                m.instructions().any { it.opcode == Opcode.INSTANCE_OF && ((it as ReferenceInstruction).reference as TypeReference).type == enabledClass.type }
        }.filter { (cls, _) -> !cls.type.startsWith("Lapp/template/") }
        check(renderers.isNotEmpty()) { "no static renderer takes a $stateType and tests for ${enabledClass.type}" }
        for ((cls, renderer) in renderers) {
            val label = "${cls.type}.${renderer.name}(${renderer.params().joinToString()})"
            val insns = renderer.instructions()
            val first = renderer.implementation!!.registerCount - renderer.params().sumOf { if (it == "J" || it == "D") 2 else 1 }
            val call = insns[0]
            check(call.opcode == Opcode.INVOKE_STATIC_RANGE && call.call()?.parameterTypes?.map(CharSequence::toString) == listOf(stateType) &&
                call.call()?.returnType == stateType && call.arguments() == listOf(first) &&
                insns[1].opcode == Opcode.MOVE_RESULT_OBJECT && (insns[1] as OneRegisterInstruction).registerA == first
            ) { "$label does not pass its state through a ($stateType)$stateType helper first; got ${call.opcode} ${call.call()}" }
            val bannerHelper = helperOf(call, label)
            check(AccessFlags.PUBLIC.isSet(bannerHelper.accessFlags) || call.call()?.definingClass == cls.type) {
                "$label: the banner helper is not public, so the call from ${cls.type} fails with IllegalAccessError"
            }
            val h = bannerHelper.instructions()
            check(h[0].opcode == Opcode.INSTANCE_OF && ((h[0] as ReferenceInstruction).reference as TypeReference).type == enabledClass.type &&
                h.any { it.opcode == Opcode.IGET && it.field()?.name == titleRes.name && it.field()?.definingClass == enabledClass.type }
            ) { "$label: the banner helper does not read titleRes of an Enabled state" }
            val literals = h.filter { it.opcode == Opcode.CONST }.map { (it as NarrowLiteralInstruction).narrowLiteral }
            check(literals == titleIds) { "$label: the banner helper compares titleRes with $literals, expected $titleIds" }
            val ask = h.indexOfFirst { it.call()?.name == "isEnabled" }
            check(h[ask - 1].stringOrNull() == HIDE_PROFILE_PREMIUM_BANNER && isEnabledCall(h[ask], 0)) {
                "$label: the banner helper does not ask $HIDE_PROFILE_PREMIUM_BANNER"
            }
            val disabled = h[ask + 3].field()
            check(h[ask + 2].opcode == Opcode.IF_EQZ && h[ask + 3].opcode == Opcode.SGET_OBJECT && disabled != null &&
                disabled.type == disabled.definingClass && byType[disabled.type]?.interfaces?.contains(stateType) == true &&
                h[ask + 4].opcode == Opcode.RETURN_OBJECT && h.last().opcode == Opcode.RETURN_OBJECT
            ) { "$label: the banner helper does not return the Disabled object while the switch is on" }
            check(byType.getValue(disabled.type).methods.single { it.name == "toString" }.strings() == listOf("Disabled")) {
                "$label: ${disabled.type} is not the Disabled state"
            }
        }
    }

    private fun assertDisableContactUpload(classes: List<ClassDef>) {
        // 1. Both saved-mobile-number queries (chat contact discovery, contacts' Premium status) pass
        // the selection ending in " AND 0" to ContentResolver.query; no method keeps the stock one.
        check(classes.methodsWhere { _, m -> MOBILE_NUMBERS_SELECTION in m.strings() }.isEmpty()) {
            "a method still queries with the stock mobile number selection"
        }
        val emptied = classes.methodsWhere { _, m -> "$MOBILE_NUMBERS_SELECTION AND 0" in m.strings() }
        check(emptied.size == 2) { "expected 2 emptied mobile number queries, found ${emptied.map { (c, m) -> "${c.type}.${m.name}" }}" }
        for ((cls, method) in emptied) {
            val label = "${cls.type}.${method.name} (mobile number query)"
            val insns = method.instructions()
            val selections = insns.indices.filter { insns[it].stringOrNull() == "$MOBILE_NUMBERS_SELECTION AND 0" }
            check(selections.size == 1) { "$label loads the emptied selection ${selections.size} times" }
            val register = (insns[selections.single()] as OneRegisterInstruction).registerA
            val query = insns.drop(selections.single() + 1).firstOrNull { it.arguments()?.contains(register) == true }
            check(query?.call()?.definingClass == "Landroid/content/ContentResolver;" && query.call()?.name == "query" &&
                query.arguments()?.getOrNull(3) == register
            ) { "$label does not pass the emptied selection to ContentResolver.query; got ${query?.opcode} ${query?.call()}" }
        }

        // 2. and 3. "featureCallAssistantNumberSync" and "featureContactEditorNameSuggestion" are
        // checked in assertToggleOverrides; both are still read through the resolver.
        for (key in listOf("featureCallAssistantNumberSync", "featureContactEditorNameSuggestion")) {
            check(classes.methodsWhere { _, m ->
                key in m.strings() && m.instructions().any {
                    it.call()?.returnType == "Z" && it.call()?.parameterTypes?.map(CharSequence::toString) == listOf("Ljava/lang/String;", FEATURE_STATE)
                }
            }.isNotEmpty()) { "no method reads $key through the toggle resolver" }
        }
    }

    private fun assertShowCallerNumber(classes: List<ClassDef>, byType: Map<String, ClassDef>, apk: File) {
        // 1. The source model (CallLogHistoryEntryData) and the row (HistoryEntry), mapped by their
        // toString labels as the patch does.
        val (sourceClass, sourceToString) = classes.singleMethod("CallLogHistoryEntryData.toString") { _, m ->
            m.name == "toString" && m.parameterTypes.isEmpty() &&
                m.strings().any { it.startsWith("CallLogHistoryEntryData(primaryHistoryEventId=") }
        }
        val sourceFields = toStringFields(sourceToString, sourceClass.type) { byType[it] }.groupBy({ it.first }, { it.second })
        fun sourceField(name: String, type: String): FieldReference {
            val fields = sourceFields[name].orEmpty().distinctBy { "${it.name}:${it.type}" }
            check(fields.size == 1 && fields.single().type == type) { "${sourceClass.type}.toString prints $name from $fields, expected one $type" }
            return fields.single()
        }
        val phonebookId = sourceField("phonebookId", "J")
        val number = sourceField("normalisedNumber", "Ljava/lang/String;")
        val countryCode = sourceField("countryCode", "Ljava/lang/String;")
        val callerName = sourceField("name", "Ljava/lang/String;")
        val isBlocked = sourceField("isBlocked", "Z")
        sourceField("isSpam", "Z")
        sourceField("spamScoreLabel", "Ljava/lang/String;")
        sourceField("blockReasonLabel", "Ljava/lang/String;")

        val (rowClass, rowToString) = classes.singleMethod("HistoryEntry.toString") { _, m ->
            m.name == "toString" && m.parameterTypes.isEmpty() && m.strings().any { it.startsWith("HistoryEntry(id=") } &&
                ", subtitleLabel=" in m.strings()
        }
        val rowFields = toStringFields(rowToString, rowClass.type) { byType[it] }.toMap()
        val subtitle = rowFields["subtitleLabel"] ?: error("${rowClass.type}.toString prints no subtitleLabel")
        val labelType = subtitle.type

        // 2. The helper: morpheCallLogSubtitle(entry, label): label, public static on the mapper's class.
        val (mapperClass, helper) = classes.singleMethod(CALL_LOG_SUBTITLE_HELPER) { _, m -> m.name == CALL_LOG_SUBTITLE_HELPER }
        val label = "${mapperClass.type}.$CALL_LOG_SUBTITLE_HELPER"
        check(helper.params() == listOf(sourceClass.type, labelType) && helper.returnType == labelType &&
            AccessFlags.PUBLIC.isSet(helper.accessFlags) && AccessFlags.STATIC.isSet(helper.accessFlags)
        ) { "$label has signature ${helper.params()} -> ${helper.returnType}" }
        val insns = helper.instructions()
        val p0 = helper.implementation!!.registerCount - 2
        val p1 = p0 + 1
        val keep = insns.lastIndex
        check(insns[keep].opcode == Opcode.RETURN_OBJECT && (insns[keep] as OneRegisterInstruction).registerA == p1) {
            "$label does not end with return-object p1"
        }
        // While Show caller number in call log is off, the helper returns the label at once (stock).
        val body = assertGate(helper, SHOW_CALLER_NUMBER, label, branch = Opcode.IF_NEZ)
        check(body == 5 && insns[4].opcode == Opcode.RETURN_OBJECT && (insns[4] as OneRegisterInstruction).registerA == p1) {
            "$label does not return the label unchanged while its feature is off"
        }
        // Each check reads its field from p0, and its first branch after the read keeps the label.
        fun Instruction.reads(expected: FieldReference, opcode: Opcode) = this.opcode == opcode && field()?.let {
            it.definingClass == expected.definingClass && it.name == expected.name && it.type == expected.type
        } == true && (this as TwoRegisterInstruction).registerB == p0
        fun firstBranchAfter(index: Int) = (index + 1..keep).first { insns[it].opcode.format in setOf(Format.Format21t, Format.Format22t) }
        for ((field, opcode) in listOf(
            phonebookId to Opcode.IGET_WIDE,
            isBlocked to Opcode.IGET_BOOLEAN,
            callerName to Opcode.IGET_OBJECT,
            number to Opcode.IGET_OBJECT,
        )) {
            val read = insns.indexOfFirst { it.reads(field, opcode) }
            check(read >= 0) { "$label does not read ${field.name}" }
            check(insns.branchTarget(firstBranchAfter(read)) == keep) { "$label does not keep the label after reading ${field.name}" }
        }
        val phonebookRead = insns.indexOfFirst { it.reads(phonebookId, Opcode.IGET_WIDE) }
        check(insns[phonebookRead + 2].opcode == Opcode.CMP_LONG && insns[firstBranchAfter(phonebookRead)].opcode == Opcode.IF_NEZ) {
            "$label does not keep the label for phonebookId != 0"
        }
        // A blank name or number (TextUtils.getTrimmedLength == 0) keeps the label.
        val trimmed = insns.indices.filter {
            insns[it].call()?.let { c -> c.definingClass == "Landroid/text/TextUtils;" && c.name == "getTrimmedLength" } == true
        }
        check(trimmed.size == 2 && trimmed.all { insns[firstBranchAfter(it)].opcode == Opcode.IF_EQZ && insns.branchTarget(firstBranchAfter(it)) == keep }) {
            "$label does not keep the label for a blank name or number"
        }
        // A label that is not the text label (a resource label: recording, video, WhatsApp, ...) is kept.
        val instanceOf = insns.indices.singleOrNull { insns[it].opcode == Opcode.INSTANCE_OF } ?: error("$label has no single instance-of")
        val textType = ((insns[instanceOf] as ReferenceInstruction).reference as TypeReference).type
        check((insns[instanceOf] as TwoRegisterInstruction).registerB == p1 && insns[instanceOf + 1].opcode == Opcode.IF_EQZ &&
            insns.branchTarget(instanceOf + 1) == keep
        ) { "$label does not keep labels that are not $textType" }
        val textClass = byType[textType] ?: error("$textType not found")
        check(textClass.superclass == labelType && textClass.methods.any { m -> m.name == "toString" && m.strings().any { it.startsWith("Text(text=") } }) {
            "$textType is not the text subtitle label (superclass ${textClass.superclass})"
        }
        // The number is formatted for the row's country and joined after " · ".
        check(insns.any { it.reads(countryCode, Opcode.IGET_OBJECT) }) { "$label does not read ${countryCode.name}" }
        check(insns.any { it.call()?.let { c -> c.definingClass == "Landroid/telephony/PhoneNumberUtils;" && c.name == "formatNumber" } == true }) {
            "$label does not call PhoneNumberUtils.formatNumber"
        }
        check(insns.any { it.stringOrNull() == CALL_LOG_NUMBER_SEPARATOR }) { "$label does not join with \"$CALL_LOG_NUMBER_SEPARATOR\"" }
        // The new text label is built and returned right before the keep exit.
        val newText = insns[keep - 3]
        val textInit = insns[keep - 2].call()
        check(newText.opcode == Opcode.NEW_INSTANCE && ((newText as ReferenceInstruction).reference as TypeReference).type == textType &&
            textInit?.definingClass == textType && textInit.name == "<init>" && textInit.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
            insns[keep - 1].opcode == Opcode.RETURN_OBJECT
        ) { "$label does not return a new $textType" }
        // One catch-all for Exception over the whole body after the gate, handled by the keep exit.
        val offsets = insns.runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        val tryBlock = helper.implementation!!.tryBlocks.singleOrNull() ?: error("$label has no single try block")
        val handler = tryBlock.exceptionHandlers.singleOrNull()
        check(tryBlock.startCodeAddress == offsets[body] && tryBlock.codeUnitCount == offsets[keep] - offsets[body] &&
            handler?.exceptionType == "Ljava/lang/Exception;" && handler.handlerCodeAddress == offsets[keep]
        ) { "$label: the try block does not cover the body with an Exception handler at the keep exit" }

        // 3. The mapper calls the helper once, before building the row: label = helper(entry, label).
        val callers = classes.methodsWhere { _, m -> m.instructions().any { it.call()?.name == CALL_LOG_SUBTITLE_HELPER } }
        val (callerClass, mapper) = callers.singleOrNull()
            ?: error("expected one caller of $label, found ${callers.map { (c, m) -> "${c.type}.${m.name}" }}")
        check(callerClass.type == mapperClass.type && mapper.params() == listOf("Ljava/util/List;")) { "$label is called from ${callerClass.type}.${mapper.name}" }
        val where = "${mapperClass.type}.${mapper.name}(List)"
        val minsns = mapper.instructions()
        val call = minsns.indices.single { minsns[it].call()?.name == CALL_LOG_SUBTITLE_HELPER }
        val construction = minsns.indices.single { minsns[it].call()?.let { c -> c.definingClass == rowClass.type && c.name == "<init>" } == true }
        check(call < construction && minsns[construction].opcode == Opcode.INVOKE_DIRECT_RANGE) { "$where does not call $label before building the row" }
        // The row constructor stores its subtitle parameter (a plain parameter register) into subtitleLabel.
        val constructorParams = minsns[construction].call()!!.parameterTypes.map(CharSequence::toString)
        val constructor = rowClass.method("<init>", constructorParams)
        val widths = constructorParams.map { if (it == "J" || it == "D") 2 else 1 }
        val firstParameter = constructor.implementation!!.registerCount - widths.sum()
        val subtitleStore = constructor.instructions().single {
            it.opcode == Opcode.IPUT_OBJECT && it.field()?.name == subtitle.name && it.field()?.definingClass == rowClass.type
        }
        val subtitleParam = widths.runningFold(firstParameter) { register, width -> register + width }
            .indexOf((subtitleStore as TwoRegisterInstruction).registerA)
        check(subtitleParam in constructorParams.indices && constructorParams[subtitleParam] == labelType) {
            "${rowClass.type}.<init> does not take the subtitle label as a parameter"
        }
        val labelRegister = (minsns[construction] as RegisterRangeInstruction).startRegister + 1 + widths.take(subtitleParam).sum()
        val entryCast = minsns.first { it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == sourceClass.type }
        val entryRegister = (entryCast as OneRegisterInstruction).registerA

        val (labelIn, entryIn, invoke, result, labelOut) = minsns.subList(call - 2, call + 3)
        val scratchLabel = (labelIn as TwoRegisterInstruction).registerA
        val scratchEntry = (entryIn as TwoRegisterInstruction).registerA
        val helperCall = invoke.call()
        check(labelIn.opcode == Opcode.MOVE_OBJECT_FROM16 && labelIn.registerB == labelRegister &&
            entryIn.opcode == Opcode.MOVE_OBJECT_FROM16 && entryIn.registerB == entryRegister &&
            invoke.opcode == Opcode.INVOKE_STATIC && helperCall?.definingClass == mapperClass.type &&
            helperCall.parameterTypes.map(CharSequence::toString) == listOf(sourceClass.type, labelType) && helperCall.returnType == labelType &&
            (invoke as FiveRegisterInstruction).registerCount == 2 && invoke.registerC == scratchEntry && invoke.registerD == scratchLabel &&
            result.opcode == Opcode.MOVE_RESULT_OBJECT && (result as OneRegisterInstruction).registerA == scratchLabel &&
            labelOut.opcode == Opcode.MOVE_OBJECT_FROM16 && (labelOut as TwoRegisterInstruction).registerA == labelRegister &&
            labelOut.registerB == scratchLabel
        ) {
            "$where does not set v$labelRegister = $CALL_LOG_SUBTITLE_HELPER(v$entryRegister, v$labelRegister) through two scratch registers; " +
                "got ${minsns.subList(call - 2, call + 3).map { it.opcode }}"
        }
        check((call + 3 until construction).none { minsns[it].opcode.setsRegister() && (minsns[it] as? OneRegisterInstruction)?.registerA == labelRegister }) {
            "$where overwrites the label between $CALL_LOG_SUBTITLE_HELPER and the row"
        }

        // 4. Apart from those five instructions the mapper is unchanged, and every branch that went to
        // the join now runs them first.
        val stockMapper = ZipFile(apk).use { zip ->
            zip.entries().toList().filter { Regex("classes\\d*\\.dex").matches(it.name) }.firstNotNullOfOrNull { entry ->
                val bytes = zip.getInputStream(entry).use { it.readBytes() }
                DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.firstOrNull { it.type == mapperClass.type }
            }
        }?.methods?.single { it.name == mapper.name && it.params() == mapper.params() && it.returnType == mapper.returnType }
            ?: error("stock ${mapperClass.type} not found")
        val join = minsns.take(call - 2).count { it.opcode != Opcode.NOP }
        val patched = mapper.normalizedInstructions()
        val stock = stockMapper.normalizedInstructions { target -> if (target <= join) target else target + 5 }
        check(stock.count { it.endsWith("-> $join") } >= 2) { "stock $where has fewer than two branches to the join" }
        val expected = stock.take(join) + patched.subList(join, join + 5) + stock.drop(join)
        check(patched == expected) {
            val diff = patched.indices.firstOrNull { patched[it] != expected.getOrNull(it) }
            "$where differs from stock beyond the five instructions inserted at $join; first difference at $diff: " +
                "${diff?.let { patched[it] }} vs ${diff?.let { expected.getOrNull(it) }}"
        }
    }

    /**
     * Each non-NOP instruction as text: opcode (goto widths merged), registers, reference, literal and
     * branch target as a non-NOP index, passed through [target].
     */
    private fun Method.normalizedInstructions(target: (Int) -> Int = { it }): List<String> {
        val insns = instructions()
        val offsets = insns.runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        val indexAt = offsets.withIndex().associate { (index, offset) -> offset to index }
        val kept = insns.indices.filter { insns[it].opcode != Opcode.NOP }
        val rank = kept.withIndex().associate { (k, index) -> index to k }
        val gotos = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
        return kept.map { index ->
            val insn = insns[index]
            buildString {
                append(if (insn.opcode in gotos) "goto" else insn.opcode.toString())
                when (insn) {
                    is RegisterRangeInstruction -> append(" {v${insn.startRegister} +${insn.registerCount}}")
                    is FiveRegisterInstruction -> append(
                        listOf(insn.registerC, insn.registerD, insn.registerE, insn.registerF, insn.registerG)
                            .take(insn.registerCount).joinToString(prefix = " {", postfix = "}"),
                    )
                    is ThreeRegisterInstruction -> append(" v${insn.registerA}, v${insn.registerB}, v${insn.registerC}")
                    is TwoRegisterInstruction -> append(" v${insn.registerA}, v${insn.registerB}")
                    is OneRegisterInstruction -> append(" v${insn.registerA}")
                }
                (insn as? ReferenceInstruction)?.let { append(" ").append(ReferenceUtil.getReferenceString(it.reference)) }
                (insn as? WideLiteralInstruction)?.let { append(" #").append(it.wideLiteral) }
                (insn as? SwitchPayload)?.let { append(" keys=").append(it.switchElements.map { element -> element.key }) }
                if (insn is OffsetInstruction) append(" -> ").append(target(rank.getValue(indexAt.getValue(offsets[index] + insn.codeOffset))))
            }
        }
    }
}
