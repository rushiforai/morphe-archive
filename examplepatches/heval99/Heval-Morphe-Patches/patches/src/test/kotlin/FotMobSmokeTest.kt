import app.template.patches.fotmob.betting.HIDE_BETTING_CONTENT
import app.template.patches.fotmob.misc.animations.DISABLE_ANIMATIONS
import app.template.patches.fotmob.misc.animations.FASTER_ANIMATIONS
import app.template.patches.fotmob.misc.font.USE_SYSTEM_FONT
import app.template.patches.fotmob.misc.theme.AMOLED_BLACK
import app.template.patches.fotmob.misc.promotions.DISABLE_PLUS_PROMO_POPUP
import app.template.patches.fotmob.misc.rating.DISABLE_RATING_PROMPTS
import app.template.patches.fotmob.misc.refresh.SLOWER_LIVE_REFRESH
import app.template.patches.fotmob.competitions.HIDDEN_COMPETITIONS
import app.template.patches.fotmob.countries.COMPETITION_FILTER
import app.template.patches.fotmob.countries.COUNTRY_FILTER
import app.template.patches.fotmob.countries.HIDDEN_COUNTRIES
import app.template.patches.fotmob.countries.SUGGESTION_FILTERS
import app.template.patches.fotmob.spoiler.LIVE_SCORE_WIDGET
import app.template.patches.fotmob.spoiler.SCORE_FORMAT
import app.template.patches.fotmob.spoiler.SPOILER_FREE
import app.template.patches.fotmob.spoiler.SPOILER_FREE_COMPETITIONS
import app.template.patches.fotmob.spoiler.SPOILER_FREE_LISTS
import app.template.patches.fotmob.spoiler.SPOILER_FREE_MATCHES
import app.template.patches.fotmob.spoiler.SPOILER_FREE_MATCH_PAGE
import app.template.patches.fotmob.spoiler.SPOILER_FREE_NOTIFICATIONS
import app.template.patches.fotmob.spoiler.SPOILER_FREE_WIDGET
import app.template.patches.fotmob.spoiler.SPOILER_FREE_MODE
import app.template.patches.shared.hevalcontrols.HEVAL_SETTINGS_CLASS
import app.template.patches.shared.hevalcontrols.HevalRegistryCodec
import com.android.tools.smali.dexlib2.AccessFlags
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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
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
import java.nio.ByteBuffer
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Element

private const val PKG = "com.mobilefootie.wc2010"
private const val STAFF_EMAIL = "norapps.as@"
private const val NO_SUBSCRIPTION_TEXT = "No active subscriptions found"
private const val MEMBERSHIP_ACTIVITY = "Lcom/fotmob/android/feature/billing/ui/MembershipActivity;"
private const val MAIN_ACTIVITY = "Lcom/fotmob/android/ui/MainActivity;"
private const val SIGNATURE_SHA1 = "5546e6c4b0c1f31b9e5a953a89a8bb6f25a2ad6f"
private const val TYPE_NO_CREDENTIAL = "android.credentials.GetCredentialException.TYPE_NO_CREDENTIAL"
private const val NO_ACCOUNT_LOG = "Did not find any existing Google accounts already used for logging"
private const val DISMISSED_LOG = "User seemingly dismissed the automatic Google sign-in prompt"
private const val SANCTIONED_LOG = "Ads disabled: user is in sanctioned country"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private val APPSFLYER_METHODS = setOf("start", "logEvent", "logSession", "logAdRevenue")
private const val GMS_MEASUREMENT = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;"
private const val ANALYTICS_DEACTIVATED_KEY = "firebase_analytics_collection_deactivated"
private const val CRASHLYTICS_KEY = "firebase_crashlytics_collection_enabled"
private const val ODDS_GATE_LOG = "User has disabled odds in settings"
private const val RATING_APP_MESSAGE = "Lcom/fotmob/android/feature/appmessage/model/RatingAppMessage;"
private const val PLUS_PROMO_CONFIG = "Lcom/fotmob/android/feature/billing/model/PlusPromoConfig;"
private const val PLUS_PROMO_KEY = "fotmobplus_promo"
private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val SYSTEM_FONT_EXTENSION = "Lapp/template/extension/fotmob/SystemFontPatch;"
private const val ANIMATION_SPEED = "Lapp/template/extension/fotmob/AnimationSpeed;"
private const val ACTIVITY_HOOKS = "Lapp/template/extension/fotmob/ActivityHooks;"
private const val FOTMOB_CONTROLS_ENTRY = "Lapp/template/extension/fotmob/HevalControlsEntry;"
private const val HEVAL_EXTENSION = "Lapp/template/extension/hevalcontrols/"
private const val SETTINGS_GLOBAL = "Landroid/provider/Settings\$Global;"
private const val SETTINGS_ACTIVITY = "Lcom/fotmob/android/feature/setting/ui/SettingsActivity;"
private const val RC_REALTIME_PATH = "/namespaces/firebase:streamFetchInvalidations"

class FotMobSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.referencesString(value: String): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference
        return ref is StringReference && ref.string == value
    }

    // Mirrors the patch: the subscription getter is the manager's only no-arg boolean method
    // that is neither the staff check (holds the staff email string) nor a constant-false stub.
    private fun Method.isSubscriptionGetter(): Boolean {
        if (parameterTypes.isNotEmpty() || returnType != "Z") return false
        val insns = implementation?.instructions?.toList() ?: return false
        val holdsStaffEmail = insns.any { it.referencesString(STAFF_EMAIL) }
        val constantFalse = insns.size <= 2 &&
            (insns.firstOrNull() as? NarrowLiteralInstruction)?.narrowLiteral?.toInt() == 0
        return !holdsStaffEmail && !constantFalse
    }

    @Test
    fun `all FotMob patches apply and mutate the expected bytecode`() {
        val root = repoRoot()
        val apk = File(root, "apks/fotmob/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "241.18134.20261030",
            patchNames = setOf(
                "Disable ads", "Disable telemetry", "Enable FotMob+", "GmsCore support", "Spoof signature",
                "Hide betting content", "Disable rating prompts", "Disable FotMob+ promo popup",
                "Use system font", "Patch settings", "Turn off animations", "Faster animations", "Slower live refresh",
                "Hide countries", "Hide competitions", "Show FotMob+ logo", "Spoiler-free mode", "AMOLED black",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val stock = originalClasses(apk)

        // The manager is R8-renamed every release, so find it the same way the patch does:
        // the class whose staff check contains the unique email string. 240 also has an unrelated
        // method with the same address (ks4.b(Lir4;)Z), so require the patch's no-arg Boolean shape.
        val manager = classes.firstOrNull { cls ->
            cls.methods.any { method ->
                method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                    method.implementation?.instructions?.any { it.referencesString(STAFF_EMAIL) } == true
            }
        } ?: error("subscription manager (staff email string) not found in emitted dexes")

        val staff = manager.methods.first { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any { it.referencesString(STAFF_EMAIL) } == true
        }
        assertForcedBoolean(staff, expected = false, label = "${manager.type}.${staff.name} (staff check)")

        // Exactly one candidate, like the patch requires (it throws on none or several).
        val getters = manager.methods.filter { it.isSubscriptionGetter() }
        assertEquals(1, getters.size, "subscription getter candidates in ${manager.type}: ${getters.map { it.name }}")
        val getter = getters.single()
        assertForcedBoolean(getter, expected = true, label = "${manager.type}.${getter.name} (subscription)")

        // App icons: the membership screen lambda (the only method with the NoEntitlement text)
        // now calls the icon picker in the NoEntitlement branch too, right after the Text call.
        val screen = classes.asSequence().flatMap { it.methods.asSequence() }.firstOrNull { method ->
            method.instructions().any { it.referencesString(NO_SUBSCRIPTION_TEXT) }
        } ?: error("membership screen lambda (\"$NO_SUBSCRIPTION_TEXT\") not found in emitted dexes")
        val insns = screen.instructions()
        val label = "${screen.definingClass}.${screen.name}"

        val textIndex = insns.indexOfFirst { it.referencesString(NO_SUBSCRIPTION_TEXT) }
        val textCall = (textIndex + 1 until insns.size).first { index ->
            val ref = insns[index].methodRef()
            insns[index].opcode == Opcode.INVOKE_STATIC_RANGE && ref?.returnType == "V" &&
                ref.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;"
        }
        val zero = insns[textCall + 1]
        val added = insns[textCall + 2]
        val endGroup = insns[textCall + 3]
        val composerType = endGroup.methodRef()?.definingClass
        assertTrue(
            zero.opcode == Opcode.CONST_4 && (zero as NarrowLiteralInstruction).narrowLiteral == 0,
            "$label: Text call is not followed by const/4 0; got ${zero.opcode}"
        )
        assertTrue(
            endGroup.opcode == Opcode.INVOKE_VIRTUAL &&
                endGroup.methodRef()?.parameterTypes?.map(CharSequence::toString) == listOf("Z"),
            "$label: the NoEntitlement group no longer closes with composer.(Z)V after the picker"
        )

        // The picker is found like the patch does: the most-called MembershipActivity
        // (I, composer)V method. Three entitlement branches call it in stock 238 and 239; now four.
        val pickerCalls = insns.filter { insn ->
            val ref = insn.methodRef()
            insn.opcode == Opcode.INVOKE_VIRTUAL && ref?.definingClass == MEMBERSHIP_ACTIVITY &&
                ref.returnType == "V" &&
                ref.parameterTypes.map(CharSequence::toString) == listOf("I", composerType)
        }.groupBy { it.methodRef()!!.name }.maxBy { it.value.size }
        assertEquals(4, pickerCalls.value.size, "$label: expected 4 calls to ${pickerCalls.key}")

        val addedRef = added.methodRef()
        assertTrue(
            added.opcode == Opcode.INVOKE_VIRTUAL && addedRef?.definingClass == MEMBERSHIP_ACTIVITY &&
                addedRef.name == pickerCalls.key,
            "$label: no ${pickerCalls.key} call directly after the NoEntitlement Text call; got ${added.opcode} $addedRef"
        )
        val registers = added as FiveRegisterInstruction
        val activityReg = (pickerCalls.value.first() as FiveRegisterInstruction).registerC
        assertEquals(activityReg, registers.registerC, "$label: picker call is not on the activity register")
        assertEquals((zero as OneRegisterInstruction).registerA, registers.registerD, "$label: picker flags register")
        assertEquals((endGroup as FiveRegisterInstruction).registerC, registers.registerE, "$label: picker composer register")

        // GmsCore support + Spoof signature (MicroG RE for Google sign-in, issue #64).
        assertGmsCoreSupport(classes, workDir, PKG, MAIN_ACTIVITY, SIGNATURE_SHA1, expectCredentialRouting = true)
        assertSpoofSignature(classes, PKG, SIGNATURE_SHA1)

        // GmsCore support also skips the onboarding auto sign-in: right after the request reads
        // google_server_client_id, it throws NoCredentialException inside the try block whose
        // NoCredentialException handler is the stock "no account found" path.
        assertOnboardingAutoSignInSkipped(classes, stock)

        assertAdsDisabled(classes)
        assertTelemetryDisabled(classes, stock)
        assertBettingRatingAndPromoDisabled(classes)
        assertSystemFont(classes)
        assertSystemFontStyles()
        assertAnimationSpeed(classes)
        assertSlowerLiveRefresh(classes)
        assertHideCountries(classes)
        assertHevalControls(classes)
        assertSpoilerFree(classes, stock)

        // AMOLED black (2026-11-09): the night theme's cards, surfaces, bottom bar and sheets are AMOLED values.
        assertAmoledBlack(classes)

        // Show FotMob+ logo: the toolbar refresher's shouldUseFotMobPlusLogo read is replaced
        // with const/4 1, so it always picks the Plus wordmark.
        val logoOwner = classes.firstOrNull { cls -> cls.fields.any { it.name == "shouldUseFotMobPlusLogo" } }
            ?: error("shouldUseFotMobPlusLogo field not found")
        fun Method.readsPlusLogo() = instructions().any {
            it.opcode == Opcode.IGET_BOOLEAN && it.fieldRef()?.name == "shouldUseFotMobPlusLogo"
        }
        fun Method.writesPlusLogo() = instructions().any {
            it.opcode == Opcode.IPUT_BOOLEAN && it.fieldRef()?.name == "shouldUseFotMobPlusLogo"
        }
        val stockReader = stock.first { it.type == logoOwner.type }
            .methods.single { it.returnType == "V" && it.parameterTypes.isEmpty() && it.readsPlusLogo() && !it.writesPlusLogo() }
        val readIndex = stockReader.instructions().indexOfFirst {
            it.opcode == Opcode.IGET_BOOLEAN && it.fieldRef()?.name == "shouldUseFotMobPlusLogo"
        }
        val patchedReader = logoOwner.methods.single {
            it.returnType == stockReader.returnType &&
                it.parameterTypes.map(CharSequence::toString) == stockReader.parameterTypes.map(CharSequence::toString) &&
                it.name == stockReader.name
        }
        val forced = patchedReader.instructions()[readIndex]
        assertTrue(
            forced is NarrowLiteralInstruction && forced.opcode == Opcode.CONST_4 && forced.narrowLiteral == 1,
            "${logoOwner.type}->${patchedReader.name}: the FotMob+ logo read is not forced true; got ${forced.opcode}",
        )

        // The home toolbar observer's normal-logo branch is skipped: the if-eqz before the Plus
        // drawable const is now a nop.
        fun Instruction.literal(): Long? = (this as? NarrowLiteralInstruction)?.narrowLiteral?.toLong()
        fun Method.setsToolbarLogo() = instructions().any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroidx/appcompat/widget/Toolbar;" && ref.name == "setLogo"
        }
        val hook = classes.flatMap { it.methods }.filter { it.implementation != null }.singleOrNull { method ->
            method.setsToolbarLogo() &&
                method.instructions().any { it.literal() == 0x7f0802c5L } &&
                method.instructions().any { it.literal() == 0x7f0802c2L }
        } ?: error("toolbar logo observer not found")
        val hookInsns = hook.instructions()
        val plus = hookInsns.indexOfFirst { it.literal() == 0x7f0802c5L }
        assertEquals(Opcode.NOP, hookInsns[plus - 1].opcode, "${hook.definingClass}->${hook.name}: normal-logo branch")
    }

    private fun Instruction.stringOrNull(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    /** The instruction index the offset instruction at [index] jumps to. */
    private fun List<Instruction>.branchTarget(index: Int): Int {
        val offsets = runningFold(0) { address, insn -> address + insn.codeUnits }
        return offsets.indexOf(offsets[index] + (this[index] as OffsetInstruction).codeOffset)
    }

    /**
     * The instructions at [at] are the Patch settings gate for [featureId] (const-string vX, the
     * /range isEnabled call, move-result vX, if-eqz vX). Returns the index it jumps to.
     */
    private fun assertGate(method: Method, featureId: String, label: String, at: Int = 0): Int {
        val insns = method.instructions()
        val id = insns.getOrNull(at)
        assertTrue(id?.opcode == Opcode.CONST_STRING && id.stringOrNull() == featureId, "$label: no \"$featureId\" gate at $at; got ${id?.opcode}")
        val register = (id as OneRegisterInstruction).registerA
        val call = insns[at + 1]
        assertTrue(
            call.opcode == Opcode.INVOKE_STATIC_RANGE && call.methodRef()?.definingClass == HEVAL_SETTINGS_CLASS &&
                call.methodRef()?.name == "isEnabled" && (call as RegisterRangeInstruction).startRegister == register,
            "$label: the gate does not ask HevalSettings.isEnabled(v$register); got ${call.opcode} ${call.methodRef()}"
        )
        assertTrue(
            insns[at + 2].opcode == Opcode.MOVE_RESULT && (insns[at + 2] as OneRegisterInstruction).registerA == register &&
                insns[at + 3].opcode == Opcode.IF_EQZ && (insns[at + 3] as OneRegisterInstruction).registerA == register,
            "$label: the gate does not branch on the isEnabled result; got ${insns[at + 2].opcode} ${insns[at + 3].opcode}"
        )
        return insns.branchTarget(at + 3)
    }

    /** [method] starts with the gate for [featureId], then [body] (opcodes); the gate jumps past it. */
    private fun assertGatedPath(method: Method, featureId: String, label: String, body: List<Opcode>): List<Instruction> {
        val target = assertGate(method, featureId, label)
        val path = method.instructions().subList(4, 4 + body.size)
        assertEquals(body, path.map { it.opcode }, "$label: gated path")
        assertEquals(4 + body.size, target, "$label: the gate does not jump past the gated path")
        return path
    }

    /**
     * The static (T)T value helper [ref]: the gate for [featureId], `const` [literal] + return,
     * then `return p0` as the stock path.
     */
    private fun assertValueHelper(classes: List<ClassDef>, ref: MethodReference, featureId: String, literal: Int) {
        val helper = classes.single { it.type == ref.definingClass }.methods.single {
            it.name == ref.name && it.parameterTypes.map(CharSequence::toString) == ref.parameterTypes.map(CharSequence::toString)
        }
        val label = "${ref.definingClass}->${ref.name}"
        val target = assertGate(helper, featureId, label)
        val insns = helper.instructions()
        assertEquals(literal, (insns[4] as NarrowLiteralInstruction).narrowLiteral, "$label: value while on")
        assertEquals(Opcode.RETURN, insns[5].opcode, "$label: no return after the value")
        assertEquals(6, target, "$label: the stock path is not the gate target")
        assertEquals(Opcode.RETURN, insns[6].opcode, "$label: stock path")
        assertEquals(helper.implementation!!.registerCount - 1, (insns[6] as OneRegisterInstruction).registerA, "$label: stock path returns p0")
    }

    /** At [index]: invoke-static/range {vR .. vR} of a static (T)T helper, then move-result vR. */
    private fun valueHelperCallAt(insns: List<Instruction>, index: Int, register: Int, label: String): MethodReference {
        val call = insns[index]
        val ref = call.methodRef()
        assertTrue(
            call.opcode == Opcode.INVOKE_STATIC_RANGE && (call as RegisterRangeInstruction).startRegister == register &&
                call.registerCount == 1 && ref != null && ref.parameterTypes.size == 1,
            "$label: no value helper call on v$register at $index; got ${call.opcode} $ref"
        )
        assertTrue(
            insns[index + 1].opcode == Opcode.MOVE_RESULT && (insns[index + 1] as OneRegisterInstruction).registerA == register,
            "$label: the helper result does not go back into v$register"
        )
        return ref!!
    }

    // Turn off animations / Faster animations: every Settings.Global.getFloat(ContentResolver,
    // String, float) of the app (11 methods in 240 and 241) calls AnimationSpeed.getFloat with the same
    // arguments; the extension keeps the direct framework call (its call-through).
    private fun assertAnimationSpeed(classes: List<ClassDef>) {
        fun MethodReference.isGetFloat(owner: String) = definingClass == owner && name == "getFloat" && returnType == "F" &&
            parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/ContentResolver;", "Ljava/lang/String;", "F")
        val extension = classes.singleOrNull { it.type == ANIMATION_SPEED } ?: error("AnimationSpeed is not in the patched dex")
        assertTrue(
            extension.methods.single { it.name == "getFloat" }.instructions().any { it.methodRef()?.isGetFloat(SETTINGS_GLOBAL) == true },
            "AnimationSpeed.getFloat no longer calls Settings.Global.getFloat itself"
        )
        val app = classes.filter { !it.type.startsWith("Lapp/template/extension/") }
        val direct = app.flatMap { cls ->
            cls.methods.filter { m -> m.instructions().any { it.methodRef()?.isGetFloat(SETTINGS_GLOBAL) == true } }.map { "${cls.type}->${it.name}" }
        }
        assertTrue(direct.isEmpty(), "Settings.Global.getFloat still called directly: $direct")
        val redirected = app.flatMap { cls ->
            cls.methods.filter { m -> m.instructions().any { it.methodRef()?.isGetFloat(ANIMATION_SPEED) == true } }.map { "${cls.type}->${it.name}" }
        }
        assertEquals(11, redirected.size, "methods calling AnimationSpeed.getFloat: $redirected")
        assertTrue(
            redirected.any { it.startsWith("Lcom/fotmob/android/feature/onboarding/ui/firstrun/OnboardingStartActivity;") },
            "the onboarding call site is not redirected"
        )

        // The lifecycle hooks are registered from FotMobApp.onCreate right after super.onCreate().
        val onCreate = classes.single { it.type == "Lcom/fotmob/android/FotMobApp;" }.method("onCreate", listOf())
        val insns = onCreate.instructions()
        val superCall = insns.indexOfFirst { it.opcode == Opcode.INVOKE_SUPER && it.methodRef()?.name == "onCreate" }
        val hook = insns[superCall + 1]
        assertTrue(
            hook.opcode == Opcode.INVOKE_STATIC_RANGE && hook.methodRef()?.definingClass == ACTIVITY_HOOKS &&
                hook.methodRef()?.name == "register" &&
                (hook as RegisterRangeInstruction).startRegister == onCreate.implementation!!.registerCount - 1,
            "FotMobApp.onCreate does not call ActivityHooks.register(this) after super.onCreate(); got ${hook.opcode} ${hook.methodRef()}"
        )
    }

    // Hide countries: each data path goes through CountryFilter right before it is stored or
    // returned (invoke-static/range on the value register, move-result-object into the same one).
    private fun assertFilteredAt(insns: List<Instruction>, index: Int, register: Int, helper: String, label: String, cast: String? = null) {
        val tail = if (cast != null) 3 else 2
        val call = insns[index - tail]
        val ref = call.methodRef()
        assertTrue(
            call.opcode == Opcode.INVOKE_STATIC_RANGE && ref?.definingClass == COUNTRY_FILTER && ref.name == helper &&
                (call as RegisterRangeInstruction).startRegister == register && call.registerCount == 1,
            "$label: not filtered by CountryFilter.$helper (v$register); got ${call.opcode} $ref"
        )
        val move = insns[index - tail + 1]
        assertTrue(move.opcode == Opcode.MOVE_RESULT_OBJECT && (move as OneRegisterInstruction).registerA == register, "$label: no move-result-object v$register")
        if (cast != null) assertEquals(cast, insns[index - 1].typeRef(), "$label: check-cast")
    }

    private fun assertHideCountries(classes: List<ClassDef>) {
        val byType = classes.associateBy { it.type }

        val holder = byType.getValue("Lcom/fotmob/models/LiveMatchesAndLeagueRank;")
            .method("<init>", listOf("Lcom/fotmob/models/LiveMatches;", "Ljava/util/List;")).instructions()
        val store = holder.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.type == "Lcom/fotmob/models/LiveMatches;" }
        assertFilteredAt(holder, store, (holder[store] as TwoRegisterInstruction).registerA, "filterLiveMatches",
            "LiveMatchesAndLeagueRank.<init>", "Lcom/fotmob/models/LiveMatches;")

        val convert = byType.getValue("Lcom/fotmob/network/converters/LeagueConverter;")
            .method("convert", listOf("Lokhttp3/ResponseBody;")).instructions()
        val returns = convert.indices.filter { convert[it].opcode == Opcode.RETURN_OBJECT }
        assertTrue(returns.isNotEmpty(), "LeagueConverter.convert has no return-object")
        returns.forEach { assertFilteredAt(convert, it, (convert[it] as OneRegisterInstruction).registerA, "filterLeagues", "LeagueConverter.convert") }

        val suggestion = byType.getValue("Lcom/fotmob/models/search/Suggestion;")
        val seen = mutableSetOf<String>()
        suggestion.methods.filter { it.name == "<init>" && it.implementation != null }.forEach { ctor ->
            val insns = ctor.instructions()
            insns.indices.filter { insns[it].opcode == Opcode.IPUT_OBJECT }.forEach { index ->
                val field = insns[index].fieldRef()!!
                val helper = SUGGESTION_FILTERS[field.name] ?: return@forEach
                seen += field.name
                assertFilteredAt(insns, index, (insns[index] as TwoRegisterInstruction).registerA, helper,
                    "Suggestion.<init>${ctor.parameterTypes} ${field.name}")
            }
        }
        assertEquals(SUGGESTION_FILTERS.keys, seen, "Suggestion fields stored by a constructor")

        // Both list patches are selected, yet each site is filtered once (the shared hooks patch).
        fun List<Instruction>.filterCalls() = count { it.methodRef()?.definingClass == COUNTRY_FILTER }
        assertEquals(1, holder.filterCalls(), "CountryFilter calls in LiveMatchesAndLeagueRank.<init>")
        assertEquals(returns.size, convert.filterCalls(), "CountryFilter calls in LeagueConverter.convert")
        val suggestionStores = suggestion.methods.filter { it.name == "<init>" && it.implementation != null }.sumOf { ctor ->
            ctor.instructions().count { it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.name in SUGGESTION_FILTERS.keys }
        }
        assertEquals(suggestionStores, suggestion.methods.sumOf { it.instructions().filterCalls() }, "CountryFilter calls in Suggestion constructors")

        // The picker seeds come from ActivityHooks.register (FotMobApp.onCreate).
        val register = byType.getValue(ACTIVITY_HOOKS).method("register", listOf("Landroid/app/Application;")).instructions()
        assertTrue(register.any { it.methodRef()?.let { r -> r.definingClass == COUNTRY_FILTER && r.name == "init" } == true },
            "ActivityHooks.register does not call CountryFilter.init")
        // Picker flags (2026-11-03): CountryFilter.init registers CountryIcons (FIFA -> ISO table,
        // every seed code covered: extensions/fotmob CountryIconsTest).
        val init = byType.getValue(COUNTRY_FILTER).method("init", listOf("Landroid/app/Application;"))
        assertOptionIconsWired(byType, init, "Lapp/template/extension/fotmob/CountryIcons;", images = true)

        // Hide competitions (2026-11-03) shares every hook above (fotMobListFiltersPatch, edited
        // once: one filter call per site, checked by assertFilteredAt's exact positions and below).
        // Each feature patch turns its part on: patched() returns true.
        for (type in listOf(COUNTRY_FILTER, COMPETITION_FILTER)) {
            val patched = byType.getValue(type).methods.single { it.name == "patched" && it.returnType == "Z" && it.parameterTypes.isEmpty() }
            assertForcedBoolean(patched, expected = true, label = "$type.patched()")
        }
        assertEquals("fotmob.hidden_competitions", HIDDEN_COMPETITIONS.id, "the Hidden competitions list id changed")
        val competition = byType.getValue(COMPETITION_FILTER)
        assertTrue(competition.methods.flatMap { m -> m.instructions().mapNotNull { it.stringOrNull() } }
            .contains("https://images.fotmob.com/image_resources/logo/leaguelogo/%s.png"), "CompetitionFilter lost its logo URL")
        assertTrue(competition.methods.flatMap { m -> m.instructions().mapNotNull { it.stringOrNull() } }
            .contains("fotmob.hidden_competitions"), "CompetitionFilter does not use the fotmob.hidden_competitions list")
        assertTrue(init.instructions().any { it.methodRef()?.let { r -> r.definingClass == COMPETITION_FILTER && r.name == "init" } == true },
            "CountryFilter.init does not call CompetitionFilter.init")
        val competitionInit = competition.methods.single { it.name == "init" }
        assertOptionIconsWired(byType, competitionInit, "Lapp/template/extension/fotmob/CompetitionIcons;", images = true)
        // The seeds: the bundled leagues file (CountryData.competitionSeeds) goes to registerOptions
        // on a background thread started by CompetitionFilter.init.
        assertTrue(competitionInit.instructions().any { it.methodRef()?.let { r -> r.definingClass == "Ljava/lang/Thread;" && r.name == "start" } == true },
            "CompetitionFilter.init does not start the seed thread")
        val seedRunner = classes.filter { it.type.startsWith("Lapp/template/extension/fotmob/CompetitionFilter$") }
            .flatMap { it.methods }.flatMap { it.instructions() }.mapNotNull { it.methodRef() }
        assertTrue(seedRunner.any { it.definingClass == "Lapp/template/extension/fotmob/CountryData;" && it.name == "competitionSeeds" } &&
            seedRunner.any { it.definingClass == HEVAL_SETTINGS_CLASS && it.name == "registerOptions" },
            "the seed thread does not register CountryData.competitionSeeds")

        // Every hook consults the competition list too (and the countries list through patched()).
        val filter = byType.getValue(COUNTRY_FILTER)
        for (hook in listOf("filterLiveMatches", "filterLeagues") + SUGGESTION_FILTERS.values) {
            val calls = filter.methods.single { it.name == hook }.instructions().mapNotNull { it.methodRef() }
            assertTrue(calls.any { it.definingClass == COMPETITION_FILTER && (it.name == "hidden" || it.name == "patched") },
                "CountryFilter.$hook does not consult CompetitionFilter")
        }
        // Competition logos are offered from the leagues list and search, never from match lists.
        val reporters = filter.methods.filter { m -> m.instructions().any { it.methodRef()?.let { r -> r.definingClass == COMPETITION_FILTER && r.name == "reportSeen" } == true } }
            .map { it.name }.toSet()
        assertEquals(setOf("filterLeagues", "filterLeagueSuggestions"), reporters, "CompetitionFilter.reportSeen callers")
    }

    // Slower live refresh: in the match page ticker (found like the fingerprint), the const/16 15
    // limit goes through the feature's value helper (30 while on) right before the if-lt.
    private fun assertSlowerLiveRefresh(classes: List<ClassDef>) {
        val sites = classes.flatMap { it.methods }.flatMap { m ->
            val insns = m.instructions()
            insns.indices.filter { insns[it].referencesString("Refreshing match facts!") }.mapNotNull { log ->
                (log - 3 until log).firstOrNull { it >= 0 && insns[it].opcode == Opcode.IF_LT }?.let { Triple(m, insns, it) }
            }
        }
        assertEquals(1, sites.size, "match refresh tickers: ${sites.map { "${it.first.definingClass}.${it.first.name}" }}")
        val (method, insns, branch) = sites.single()
        val label = "${method.definingClass}.${method.name} (match refresh)"
        val limit = (insns[branch] as TwoRegisterInstruction).registerB
        val ref = valueHelperCallAt(insns, branch - 2, limit, label)
        val const = insns[branch - 3]
        assertTrue(
            const.opcode == Opcode.CONST_16 && (const as NarrowLiteralInstruction).narrowLiteral == 15 &&
                (const as OneRegisterInstruction).registerA == limit,
            "$label: the helper does not filter the stock limit 15; got ${const.opcode}"
        )
        assertEquals(method.definingClass, ref.definingClass, "$label: helper class")
        assertValueHelper(classes, ref, SLOWER_LIVE_REFRESH.id, 30)
    }

    private fun assertHevalControls(classes: List<ClassDef>) {
        val byType = classes.associateBy { it.type }
        for (type in listOf(HEVAL_SETTINGS_CLASS, "${HEVAL_EXTENSION}Registry;", "${HEVAL_EXTENSION}InitProvider;",
            "${HEVAL_EXTENSION}ui/HevalControlsActivity;", FOTMOB_CONTROLS_ENTRY, ACTIVITY_HOOKS, ANIMATION_SPEED, SYSTEM_FONT_EXTENSION,
            COUNTRY_FILTER, "Lapp/template/extension/fotmob/CountryData;", "Lapp/template/extension/fotmob/CountrySeeds;",
            COMPETITION_FILTER, "Lapp/template/extension/fotmob/CompetitionIcons;")) {
            assertTrue(type in byType, "$type is not in the patched dex")
        }
        val entryStrings = byType.getValue(FOTMOB_CONTROLS_ENTRY).methods.flatMap { m -> m.instructions().mapNotNull { it.stringOrNull() } }
        assertTrue("Patch settings" in entryStrings, "the Settings row does not say \"Patch settings\"")

        // The registry lists exactly the FotMob features (any record order: execution order).
        val registry = byType.getValue("${HEVAL_EXTENSION}Registry;").methods.single { it.name == "encoded" }.instructions()
        assertTrue(registry[0].opcode == Opcode.CONST_STRING_JUMBO && registry[1].opcode == Opcode.RETURN_OBJECT, "Registry.encoded() was not rewritten")
        val encoded = registry[0].stringOrNull()!!.split('\n')
        val wanted = HevalRegistryCodec.encode(
            listOf(
                HIDE_BETTING_CONTENT, DISABLE_RATING_PROMPTS, DISABLE_PLUS_PROMO_POPUP, USE_SYSTEM_FONT, AMOLED_BLACK,
                DISABLE_ANIMATIONS, FASTER_ANIMATIONS, SLOWER_LIVE_REFRESH, HIDDEN_COUNTRIES, HIDDEN_COMPETITIONS,
                SPOILER_FREE_MODE, SPOILER_FREE_MATCHES, SPOILER_FREE_COMPETITIONS,
                SPOILER_FREE_NOTIFICATIONS, SPOILER_FREE_LISTS, SPOILER_FREE_MATCH_PAGE, SPOILER_FREE_WIDGET,
            ),
        ).split('\n')
        assertTrue(
            encoded.first() == wanted.first() && encoded.size == wanted.size && encoded.toSet() == wanted.toSet(),
            "Registry.encoded() is\n${encoded.joinToString("\n")}\nexpected (any order)\n${wanted.joinToString("\n")}"
        )

        // Manifest: the non-exported init provider (initOrder 1000) and the non-exported screen.
        val manifestFile = workDir.walkTopDown()
            .firstOrNull { it.name == "AndroidManifest.xml" && it.readText().contains("hevalcontrols") }
            ?: error("no decoded AndroidManifest.xml with Patch settings under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        fun elements(tag: String) = manifest.getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
        val provider = elements("provider").single { it.getAttribute("android:name") == "app.template.extension.hevalcontrols.InitProvider" }
        assertTrue(
            provider.getAttribute("android:authorities") == "$PKG.hevalcontrols" && provider.getAttribute("android:exported") == "false" &&
                provider.getAttribute("android:initOrder") == "1000",
            "Patch settings provider has the wrong authority, exported flag or initOrder"
        )
        val activity = elements("activity").single { it.getAttribute("android:name") == "app.template.extension.hevalcontrols.ui.HevalControlsActivity" }
        assertEquals("false", activity.getAttribute("android:exported"), "HevalControlsActivity exported")

        // The Settings row: SettingsActivity.onCreate calls addRow(this) right after setContentView.
        val onCreate = byType.getValue(SETTINGS_ACTIVITY).method("onCreate", listOf("Landroid/os/Bundle;"))
        val insns = onCreate.instructions()
        val setContent = insns.indexOfFirst { it.methodRef()?.name == "setContentView" }
        val entry = insns[setContent + 1]
        assertTrue(
            entry.opcode == Opcode.INVOKE_STATIC_RANGE && entry.methodRef()?.definingClass == FOTMOB_CONTROLS_ENTRY &&
                entry.methodRef()?.name == "addRow" &&
                (entry as RegisterRangeInstruction).startRegister == onCreate.implementation!!.registerCount - 2,
            "SettingsActivity.onCreate does not call addRow(p0) after setContentView; got ${entry.opcode} ${entry.methodRef()}"
        )
        assertEquals(1, insns.count { it.methodRef()?.definingClass == FOTMOB_CONTROLS_ENTRY }, "addRow calls")
    }

    // Spoiler-free mode. 1: onMessageReceived starts with the switch gate, then reads RemoteMessage's
    // Bundle, asks SpoilerFree.blocksPush and returns; the gate and the "not blocked" branch both land
    // on the stock first instruction. 2/3: the (Menu, MenuInflater) builders that inflate
    // menu/activity_match_facts_v2 and menu/league_info (241 ids, aapt2 dump resources) start with the
    // gate, then pass the menu and the builder's activity field to the extension.
    /**
     * AMOLED black (a Patch settings switch): the night Base.Theme.FotMob.DayNight is untouched, a new
     * HevalAmoledOverlay style holds the twenty attributes at near-black values, and the activity hook
     * applies it (AmoledBlack.applyTheme from ActivityHooks.onActivityCreated).
     */
    private fun assertAmoledBlack(classes: List<ClassDef>) {
        fun styles(dir: String): Map<String, Map<String, String>> {
            val file = workDir.walkTopDown().singleOrNull { it.name == "styles.xml" && it.parentFile.name == dir }
                ?: error("no decoded $dir/styles.xml under $workDir")
            val doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file)
            val nodes = doc.getElementsByTagName("style")
            return (0 until nodes.length).map { nodes.item(it) as Element }.associate { style ->
                val items = style.getElementsByTagName("item")
                style.getAttribute("name") to (0 until items.length).map { items.item(it) as Element }
                    .associate { it.getAttribute("name") to it.textContent.trim() }
            }
        }
        val night = styles("values-night")["Base.Theme.FotMob.DayNight"] ?: error("values-night: Base.Theme.FotMob.DayNight not found")
        assertEquals("@color/nero_black", night["cardBackgroundColor"], "the night theme keeps its stock cardBackgroundColor")
        assertEquals("@color/chinese_black", night["bottomNavBackgroundColor"], "the night theme keeps its stock bottomNavBackgroundColor")
        assertEquals("@color/black", night["appBackground"], "appBackground stays black")
        assertEquals("@color/nero_black", night["colorContainer"], "the night theme keeps its stock colorContainer")
        assertEquals("@color/dark_charcoal", night["popupMenuBackgroundColor"], "the night theme keeps its stock popupMenuBackgroundColor")

        val overlay = styles("values")["HevalAmoledOverlay"] ?: error("values: HevalAmoledOverlay not found")
        fun String.opaque() = lowercase().let { if (it.length == 9 && it.startsWith("#ff")) "#" + it.substring(3) else it }
        val expected = mapOf(
            "cardBackgroundColor" to "#0a0a0a", "colorSurface" to "#0a0a0a", "colorSurfaceContainer" to "#0a0a0a",
            "colorSurfaceContainerLow" to "#0a0a0a", "colorSurfaceContainerHigh" to "#0a0a0a",
            "colorSurfaceContainerHighest" to "#0a0a0a", "bottomNavBackgroundColor" to "#000000",
            "cardInCardHeaderBackground" to "#141414", "chipBackgroundUnselected" to "#141414",
            "bottomSheetBackgroundColor" to "#121212", "popupMenuBackgroundColor" to "#121212",
            "colorContainer" to "#0a0a0a", "predictorCardBackgroundColor" to "#0a0a0a",
            "predictorBottomSheetBackgroundColor" to "#0a0a0a", "onboardingBottomSheetBackground" to "#0a0a0a",
            "newsTopTransferItemBackgroundColor" to "#0a0a0a", "segmentedButtonsBackgroundColor" to "#0a0a0a",
            "segmentedButtonsInsideCardSelectedBackgroundColor" to "#0a0a0a",
            "fifaRankGraphBackgroundColor" to "#0a0a0a", "switchTrackBackgroundColorUnchecked" to "#0a0a0a",
        )
        // Issue #146: every item must reference a color resource, never a raw value. FotMob resolves
        // some of these attributes through TypedArray.getResourceId + Context.getColorStateList (qo0.z,
        // used by the league table row); a raw value has resource id 0, the call throws and the row
        // stops binding, so the table showed no points.
        overlay.forEach { (name, value) ->
            assertTrue(value.startsWith("@color/"), "HevalAmoledOverlay $name must reference a color resource, is $value")
        }
        val colorsFile = workDir.walkTopDown().singleOrNull { it.name == "colors.xml" && it.parentFile.name == "values" }
            ?: error("no decoded values/colors.xml under $workDir")
        val colorDoc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(colorsFile)
        val colorNodes = colorDoc.getElementsByTagName("color")
        val colors = (0 until colorNodes.length).map { colorNodes.item(it) as Element }
            .associate { it.getAttribute("name") to it.textContent.trim() }
        val resolved = overlay.mapValues { (name, ref) ->
            colors[ref.removePrefix("@color/")]?.opaque() ?: error("values/colors.xml has no ${ref.removePrefix("@color/")} for $name")
        }
        assertEquals(expected, resolved, "HevalAmoledOverlay items (resolved colors)")

        // The hook: ActivityHooks.onActivityCreated calls AmoledBlack.applyTheme.
        val hooks = classes.single { it.type == "Lapp/template/extension/fotmob/ActivityHooks;" }
        val created = hooks.methods.single { it.name == "onActivityCreated" }
        val calls = created.implementation!!.instructions.mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference) }
        assertTrue(
            calls.any { it.definingClass == "Lapp/template/extension/fotmob/AmoledBlack;" && it.name == "applyTheme" },
            "ActivityHooks.onActivityCreated does not apply the AMOLED overlay",
        )
        assertTrue(classes.any { it.type == "Lapp/template/extension/fotmob/AmoledBlack;" }, "AmoledBlack is not in the patched dex")
    }

    private fun assertSpoilerFree(classes: List<ClassDef>, stock: List<ClassDef>) {
        val featureId = SPOILER_FREE_MODE.id
        assertTrue(classes.any { it.type == SPOILER_FREE }, "SpoilerFree is not in the patched dex")
        val service = "Lcom/fotmob/android/feature/notification/push/PushMessagingService;"
        val remoteMessage = "Lcom/google/firebase/messaging/RemoteMessage;"
        val params = listOf(remoteMessage)
        val push = classes.single { it.type == service }.method("onMessageReceived", params)
        val stockPush = stock.single { it.type == service }.method("onMessageReceived", params)
        val label = "PushMessagingService.onMessageReceived"
        val target = assertGate(push, featureId, label)
        val insns = push.instructions()
        assertEquals(
            listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
            insns.subList(4, 10).map { it.opcode }, "$label: spoiler path",
        )
        val bundle = insns[5].fieldRef()
        assertTrue(bundle?.definingClass == remoteMessage && bundle.type == "Landroid/os/Bundle;", "$label: reads $bundle, not the message Bundle")
        val check = insns[6].methodRef()
        assertTrue(check?.definingClass == SPOILER_FREE && check.name == "blocksPush", "$label: calls $check, not SpoilerFree.blocksPush")
        assertEquals(10, target, "$label: the gate does not jump to the stock code")
        assertEquals(10, insns.branchTarget(8), "$label: a push that is not blocked does not reach the stock code")
        assertEquals(
            stockPush.instructions().map { it.opcode }.filter { it != Opcode.NOP },
            insns.drop(10).map { it.opcode }.filter { it != Opcode.NOP }, "$label: stock code changed",
        )

        val menuShape = listOf("Landroid/view/Menu;", "Landroid/view/MenuInflater;")
        fun builder(all: List<ClassDef>, menuId: Long) = all.flatMap { it.methods }.filter { m ->
            m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == menuShape &&
                m.instructions().any { (it as? NarrowLiteralInstruction)?.narrowLiteral?.toLong() == menuId } &&
                m.instructions().any { it.methodRef()?.let { r -> r.definingClass == "Landroid/view/MenuInflater;" && r.name == "inflate" } == true }
        }.also { assertEquals(1, it.size, "builders inflating menu 0x${menuId.toString(16)}") }.single()
        for ((menuId, helper) in listOf(0x7f0f0002L to "addMatchItem", 0x7f0f0004L to "addCompetitionItem")) {
            val method = builder(classes, menuId)
            val stockMethod = builder(stock, menuId)
            val where = "${method.definingClass}->${method.name} ($helper)"
            val menuTarget = assertGate(method, featureId, where)
            val body = method.instructions()
            // Compact form (p1 at most v15): iget-object v0, p0 + invoke-static {p1, v0}; else the
            // parameters are first copied into v0/v1 with move-object/from16.
            val path = body.subList(4, menuTarget).map { it.opcode }
            assertTrue(
                path == listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC) ||
                    path == listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC),
                "$where: menu item path is $path",
            )
            val host = body.subList(4, menuTarget).single { it.opcode == Opcode.IGET_OBJECT }.fieldRef()!!
            assertEquals(method.definingClass, host.definingClass, "$where: the activity field is not the builder's own")
            if (helper == "addMatchItem") assertEquals("Lcom/fotmob/android/feature/match/ui/MatchActivity;", host.type, "$where: activity field")
            val call = body[menuTarget - 1].methodRef()
            assertTrue(call?.definingClass == SPOILER_FREE && call.name == helper, "$where: calls $call")
            // Alignment nops before switch payloads move with the inserted code, so they are ignored.
            fun List<Instruction>.withoutNops() = map { it.opcode }.filter { it != Opcode.NOP }
            assertEquals(stockMethod.instructions().withoutNops(), body.drop(menuTarget).withoutNops(), "$where: stock builder changed")
        }

        // 4. Live score widget row: Match's started check result is ANDed with !hidesScore(match)
        // (if-eqz skips the call for a match that has not started), and the status label goes
        // through SpoilerFree.status(label, match). One site each.
        val widgetShape = listOf("Landroid/content/Context;", "Lcom/fotmob/models/Match;", "Z", "Ljava/lang/Integer;")
        val widget = classes.single { it.type == LIVE_SCORE_WIDGET }.methods.single {
            it.returnType == "Landroid/widget/RemoteViews;" && it.parameterTypes.map(CharSequence::toString) == widgetShape
        }
        val w = widget.instructions()
        val wLabel = "${widget.definingClass}->${widget.name}"
        fun calls(name: String) = w.indices.filter { w[it].methodRef()?.let { r -> r.definingClass == SPOILER_FREE && r.name == name } == true }
        val hide = calls("hidesScoreInWidget").also { assertEquals(1, it.size, "$wLabel: hidesScoreInWidget calls") }.single()
        val started = w[hide - 3].methodRef()
        assertTrue(
            w[hide - 3].opcode == Opcode.INVOKE_VIRTUAL && started?.definingClass == "Lcom/fotmob/models/Match;" &&
                started.returnType == "Z" && started.parameterTypes.isEmpty(),
            "$wLabel: hidesScore does not follow Match's started check; got ${w[hide - 3].opcode} $started",
        )
        val flag = (w[hide - 2] as OneRegisterInstruction).registerA
        assertEquals(
            listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.XOR_INT_LIT8),
            w.subList(hide - 2, hide + 3).map { it.opcode }, "$wLabel: started-check override",
        )
        assertEquals((w[hide - 3] as FiveRegisterInstruction).registerC, (w[hide] as RegisterRangeInstruction).startRegister, "$wLabel: hidesScore gets the match")
        assertTrue(
            (w[hide - 1] as OneRegisterInstruction).registerA == flag && (w[hide + 1] as OneRegisterInstruction).registerA == flag &&
                (w[hide + 2] as TwoRegisterInstruction).registerA == flag && (w[hide + 2] as NarrowLiteralInstruction).narrowLiteral == 1,
            "$wLabel: the override does not write !hidesScore back into the started flag v$flag",
        )
        assertEquals(hide + 3, w.branchTarget(hide - 1), "$wLabel: a match that has not started does not skip the override")
        val status = calls("status").also { assertEquals(1, it.size, "$wLabel: status calls") }.single()
        val labelCall = w[status - 2]
        assertTrue(
            labelCall.opcode == Opcode.INVOKE_STATIC && labelCall.methodRef()?.returnType == "Ljava/lang/String;" &&
                labelCall.methodRef()?.parameterTypes?.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Lcom/fotmob/models/Match;", "Z"),
            "$wLabel: status does not follow the status label call; got ${labelCall.opcode} ${labelCall.methodRef()}",
        )
        val labelRegister = (w[status - 1] as OneRegisterInstruction).registerA
        val statusCall = w[status] as FiveRegisterInstruction
        assertTrue(
            w[status - 1].opcode == Opcode.MOVE_RESULT_OBJECT && w[status + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                (w[status + 1] as OneRegisterInstruction).registerA == labelRegister && statusCall.registerC == labelRegister &&
                statusCall.registerD == (labelCall as FiveRegisterInstruction).registerD,
            "$wLabel: status(label, match) does not replace the label",
        )

        // 5. Match rows: each method that formats the live score ("%d %s- %d") carries the same
        // started-flag override at every started check (six in 241), and no started check is left bare.
        val rowMethods = classes.flatMap { it.methods }.filter { m ->
            val ins = m.instructions()
            ins.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == SCORE_FORMAT } &&
                ins.any { it.methodRef()?.let { r -> r.definingClass == SPOILER_FREE && r.name.startsWith("hidesScore") } == true }
        }
        assertEquals(6, rowMethods.size, "methods that format the live score and carry the started override")
        for (row in rowMethods) {
            val r = row.instructions()
            val rLabel = "${row.definingClass}->${row.name}"
            val hides = r.indices.filter {
                r[it].methodRef()?.let { ref -> ref.definingClass == SPOILER_FREE && ref.name.startsWith("hidesScore") } == true
            }
            val startedCalls = r.indices.filter {
                r[it].methodRef()?.let { ref ->
                    ref.definingClass == "Lcom/fotmob/models/Match;" && ref.name == started!!.name &&
                        ref.returnType == "Z" && ref.parameterTypes.isEmpty()
                } == true
            }
            assertEquals(startedCalls.size, hides.size, "$rLabel: started checks and overrides")
            // Each surface answers to its own switch: the match page header, the ongoing notification
            // and every other row use their own SpoilerFree check.
            val expectedHelper = when (row.definingClass) {
                "Lcom/fotmob/android/feature/match/ui/MatchActivity;" -> "hidesScoreOnMatchPage"
                "Lcom/fotmob/android/feature/liveupdate/worker/LiveUpdateWorker;" -> "hidesScoreInNotifications"
                else -> "hidesScoreInLists"
            }
            assertTrue(
                hides.all { r[it].methodRef()?.name == expectedHelper },
                "$rLabel: the override must call SpoilerFree.$expectedHelper; got ${hides.map { r[it].methodRef()?.name }}",
            )
            for (h in hides) {
                assertEquals(
                    listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.XOR_INT_LIT8),
                    r.subList(h - 2, h + 3).map { it.opcode }, "$rLabel: started-check override at $h",
                )
                val receiver = when (val call = r[h - 3]) {
                    is FiveRegisterInstruction -> call.registerC
                    is RegisterRangeInstruction -> call.startRegister
                    else -> -1
                }
                assertEquals(receiver, (r[h] as RegisterRangeInstruction).startRegister, "$rLabel: hidesScore gets the match")
                val flag = (r[h - 2] as OneRegisterInstruction).registerA
                assertTrue(
                    (r[h + 1] as OneRegisterInstruction).registerA == flag && (r[h + 2] as TwoRegisterInstruction).registerA == flag &&
                        (r[h + 2] as NarrowLiteralInstruction).narrowLiteral == 1,
                    "$rLabel: the override does not write !hidesScore back into the started flag v$flag",
                )
                assertEquals(h + 3, r.branchTarget(h - 1), "$rLabel: a match that has not started does not skip the override")
            }
        }
    }

    // Use system font, bytecode: both targets found like the patch does (the "my" locale check
    // storing a boolean of its own class; the static (Context, I, String, I)Typeface loader).
    private fun assertSystemFont(classes: List<ClassDef>) {
        val flagInits = classes.flatMap { cls ->
            cls.methods.filter { m ->
                m.name == "<clinit>" && m.instructions().any { it.referencesString("my") } &&
                    m.instructions().any { it.methodRef()?.let { r -> r.definingClass == "Ljava/util/Locale;" && r.name == "getLanguage" } == true } &&
                    m.instructions().any { it.opcode == Opcode.SPUT_BOOLEAN && it.fieldRef()?.definingClass == cls.type }
            }
        }
        assertEquals(1, flagInits.size, "font flag initializers: ${flagInits.map { it.definingClass }}")
        val init = flagInits.single()
        val initLabel = "${init.definingClass}.<clinit> (font flag)"
        val initInsns = init.instructions()
        val myIndex = initInsns.indexOfFirst { it.referencesString("my") }
        val store = (myIndex until initInsns.size).first { i ->
            initInsns[i].opcode == Opcode.SPUT_BOOLEAN && initInsns[i].fieldRef()?.definingClass == init.definingClass
        }
        // The stored flag goes through the feature's (Z)Z value helper (false while on).
        val flagRegister = (initInsns[store] as OneRegisterInstruction).registerA
        val helper = valueHelperCallAt(initInsns, store - 2, flagRegister, initLabel)
        assertEquals(init.definingClass, helper.definingClass, "$initLabel: helper class")
        assertValueHelper(classes, helper, USE_SYSTEM_FONT.id, 0)
        // Both branches of the "my" check must run the helper: no jump may land between it and the store.
        val addresses = initInsns.runningFold(0) { address, insn -> address + insn.codeUnits }
        val targets = initInsns.indices.mapNotNull { i ->
            (initInsns[i] as? OffsetInstruction)?.let { addresses[i] + it.codeOffset }
        }.toSet()
        assertTrue(addresses[store] !in targets && addresses[store - 1] !in targets, "$initLabel: a branch jumps past the helper call")
        assertTrue(addresses[store - 2] in targets, "$initLabel: no branch reaches the helper call")

        val loaders = classes.flatMap { it.methods }.filter { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == TYPEFACE &&
                m.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "I", "Ljava/lang/String;", "I") &&
                m.instructions().any { insn ->
                    insn.methodRef()?.let { it.definingClass == TYPEFACE && it.name == "create" && it.parameterTypes.firstOrNull()?.toString() == TYPEFACE } == true
                }
        }
        assertEquals(1, loaders.size, "Typeface loaders: ${loaders.map { "${it.definingClass}.${it.name}" }}")
        val loader = loaders.single()
        val loaderLabel = "${loader.definingClass}.${loader.name} (Typeface loader)"
        // While the feature is on: SystemFontPatch.create(p2 family, p3 style) is returned at once.
        val path = assertGatedPath(
            loader, USE_SYSTEM_FONT.id, loaderLabel,
            listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
        )
        val call = path[0]
        val callRef = call.methodRef()
        val p2 = loader.implementation!!.registerCount - 4 + 2
        assertTrue(
            callRef?.definingClass == SYSTEM_FONT_EXTENSION && callRef.name == "create" &&
                callRef.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I") && callRef.returnType == TYPEFACE &&
                (call as RegisterRangeInstruction).startRegister == p2 && call.registerCount == 2,
            "$loaderLabel: the gated path is not SystemFontPatch.create(p2 family, p3 style); got ${call.opcode} $callRef"
        )
        assertEquals(
            (path[1] as OneRegisterInstruction).registerA, (path[2] as OneRegisterInstruction).registerA,
            "$loaderLabel: the created Typeface is not returned"
        )

        // The extension is merged, and no app code calls Typeface.create(String, int) directly any
        // more: AppCompat's fontFamily resolution, Compose and the loader all go through it.
        val extension = classes.singleOrNull { it.type == SYSTEM_FONT_EXTENSION }
        assertTrue(extension != null, "SystemFontPatch extension class is missing")
        assertTrue(
            extension!!.methods.any { it.name == "composeFamily" } && extension.methods.any { it.name == "create" },
            "SystemFontPatch lacks create/composeFamily"
        )
        fun MethodReference.isCreateByName() = definingClass == TYPEFACE && name == "create" &&
            parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I")
        // The redirect skips the extension package: its fallbacks (create's original call, the
        // device-font lookups in map/weighted) must stay direct framework calls, or every
        // Typeface.create would recurse into itself.
        val extensionCreate = extension.method("create", listOf("Ljava/lang/String;", "I"))
        assertTrue(
            extensionCreate.instructions().any { it.methodRef()?.isCreateByName() == true },
            "SystemFontPatch.create no longer falls back to Typeface.create(String, int) directly"
        )
        val selfCalls = extension.methods.flatMap { m ->
            m.instructions().mapNotNull { it.methodRef() }
                .filter { it.definingClass == SYSTEM_FONT_EXTENSION && it.name == "create" }
                .map { "${m.name} -> ${it.name}" }
        }
        assertTrue(selfCalls.isEmpty(), "SystemFontPatch calls its own create (would recurse): $selfCalls")
        val direct = classes.filter { it.type != SYSTEM_FONT_EXTENSION }.flatMap { cls ->
            cls.methods.filter { m -> m.instructions().any { it.methodRef()?.isCreateByName() == true } }
                .map { "${cls.type}->${it.name}" }
        }
        assertTrue(direct.isEmpty(), "Typeface.create(String, int) still called directly: $direct")
        val redirected = classes.filter { it.type != SYSTEM_FONT_EXTENSION }.sumOf { cls ->
            cls.methods.sumOf { m ->
                m.instructions().count { insn ->
                    insn.methodRef()?.let { it.definingClass == SYSTEM_FONT_EXTENSION && it.name == "create" } == true
                }
            }
        }
        assertTrue(redirected >= 10, "only $redirected calls go through SystemFontPatch.create")

        // Compose's platform typeface factory (found by its library shape) first maps the family.
        val factories = classes.flatMap { it.methods }.filter { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == TYPEFACE && m.parameterTypes.size == 3 &&
                m.parameterTypes[0].toString() == "Ljava/lang/String;" && m.parameterTypes[2].toString() == "I" &&
                m.instructions().any { it.fieldRef()?.let { f -> f.definingClass == TYPEFACE && f.name == "DEFAULT_BOLD" } == true } &&
                m.instructions().any { insn ->
                    insn.methodRef()?.let { it.definingClass == TYPEFACE && it.name == "create" && it.parameterTypes.size == 3 } == true
                }
        }
        assertEquals(1, factories.size, "Compose typeface factories: ${factories.map { "${it.definingClass}.${it.name}" }}")
        val factory = factories.single()
        val factoryInsns = factory.instructions()
        val p0 = factory.implementation!!.registerCount - 3
        val mapCall = factoryInsns[0]
        assertTrue(
            mapCall.methodRef()?.let { it.definingClass == SYSTEM_FONT_EXTENSION && it.name == "composeFamily" } == true &&
                (mapCall as FiveRegisterInstruction).registerCount == 1 && mapCall.registerC == p0 &&
                factoryInsns[1].opcode == Opcode.MOVE_RESULT_OBJECT && (factoryInsns[1] as OneRegisterInstruction).registerA == p0,
            "${factory.definingClass}.${factory.name}: does not start with p0 = SystemFontPatch.composeFamily(p0); got ${factoryInsns.take(2)}"
        )
    }

    // Use system font, resources: the stock theme and switch styles are untouched (the switch can be
    // off), and the overlay the extension applies holds the system families of the base/Burmese
    // themes plus a switch style whose text appearance uses the system medium family.
    private fun assertSystemFontStyles() {
        fun styles(dir: String): Map<String, Map<String, String>> {
            val file = workDir.walkTopDown().singleOrNull { it.name == "styles.xml" && it.parentFile.name == dir }
                ?: error("no decoded $dir/styles.xml under $workDir")
            val doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file)
            val nodes = doc.getElementsByTagName("style")
            return (0 until nodes.length).map { nodes.item(it) as Element }.associate { style ->
                val items = style.getElementsByTagName("item")
                style.getAttribute("name") to (0 until items.length).map { items.item(it) as Element }
                    .associate { it.getAttribute("name") to it.textContent.trim() }
            }
        }
        val theme = styles("values-v26")["Base.Theme.FotMob.V26"] ?: error("values-v26: Base.Theme.FotMob.V26 not found")
        assertEquals("@font/flex_regular", theme["font_regular"], "Base.Theme.FotMob.V26 font_regular (stock)")
        val base = styles("values")
        val switch = base["TextAppearance.FotMob.Switch"] ?: error("values: TextAppearance.FotMob.Switch not found")
        assertEquals("@font/flex_semi_bold", switch["android:fontFamily"], "TextAppearance.FotMob.Switch android:fontFamily (stock)")

        val expected = mapOf(
            "font_regular" to "sans-serif", "font_medium" to "sans-serif-medium", "font_semi_bold" to "sans-serif-medium",
            "font_extra_bold" to "sans-serif-black", "nativeAdBodyFont" to "sans-serif", "nativeAdTitleFont" to "sans-serif-medium",
            "materialSwitchStyle" to "@style/HevalSystemFontSwitch",
        )
        assertEquals(expected, base["HevalSystemFontOverlay"], "HevalSystemFontOverlay items")
        assertEquals(mapOf("android:textAppearance" to "@style/HevalSystemFontSwitchText"), base["HevalSystemFontSwitch"], "HevalSystemFontSwitch")
        assertEquals(
            mapOf("android:fontFamily" to "sans-serif-medium", "fontFamily" to "sans-serif-medium"),
            base["HevalSystemFontSwitchText"], "HevalSystemFontSwitchText",
        )
    }

    // Hide betting content, Disable rating prompts, Disable FotMob+ promo popup: each target is
    // found like its patch (log prefix, RatingAppMessage constructor call, PlusPromoConfig reader)
    // and must now return its "nothing to show" value at index 0.
    private fun assertBettingRatingAndPromoDisabled(classes: List<ClassDef>) {
        val methods = classes.flatMap { it.methods }
        fun Method.isContinuationShape() =
            returnType == "Ljava/lang/Object;" && parameterTypes.size == 1 &&
                parameterTypes.single().toString().startsWith("L")

        val gates = methods.filter { m -> m.isContinuationShape() && m.instructions().any { it.stringStartsWith(ODDS_GATE_LOG) } }
        assertEquals(1, gates.size, "odds gate candidates: ${gates.map { "${it.definingClass}.${it.name}" }}")
        val gate = gates.single()
        val gatePath = assertGatedPath(
            gate, HIDE_BETTING_CONTENT.id, "${gate.definingClass}.${gate.name} (odds gate)",
            listOf(Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT),
        )
        val falseField = gatePath[0].fieldRef()
        assertTrue(
            falseField?.definingClass == "Ljava/lang/Boolean;" && falseField.name == "FALSE" &&
                (gatePath[0] as OneRegisterInstruction).registerA == (gatePath[1] as OneRegisterInstruction).registerA,
            "${gate.definingClass}.${gate.name} (odds gate): the gated path does not return Boolean.FALSE"
        )

        val producers = methods.filter { m ->
            m.isContinuationShape() && m.instructions().any { insn ->
                val ref = insn.methodRef()
                insn.opcode == Opcode.INVOKE_DIRECT && ref?.definingClass == RATING_APP_MESSAGE && ref.name == "<init>"
            }
        }
        assertEquals(1, producers.size, "RatingAppMessage producers: ${producers.map { "${it.definingClass}.${it.name}" }}")
        assertReturnsNull(producers.single(), "RatingAppMessage producer", DISABLE_RATING_PROMPTS.id)

        val readers = methods.filter { m ->
            m.returnType == PLUS_PROMO_CONFIG && m.parameterTypes.isEmpty() && AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.instructions().any { it.referencesString(PLUS_PROMO_KEY) }
        }
        assertEquals(1, readers.size, "PlusPromoConfig readers: ${readers.map { "${it.definingClass}.${it.name}" }}")
        assertReturnsNull(readers.single(), "PlusPromoConfig reader", DISABLE_PLUS_PROMO_POPUP.id)
    }

    /** [method] starts with the [featureId] gate whose path is const/4 0 + return-object. */
    private fun assertReturnsNull(method: Method, what: String, featureId: String) {
        val path = assertGatedPath(method, featureId, "${method.definingClass}.${method.name} ($what)", listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT))
        assertTrue(
            (path[0] as NarrowLiteralInstruction).narrowLiteral == 0 &&
                (path[0] as OneRegisterInstruction).registerA == (path[1] as OneRegisterInstruction).registerA,
            "${method.definingClass}.${method.name} ($what): the gated path does not return null"
        )
    }

    // Disable ads: shouldShowAds(), found like the patch by its no-arg boolean shape and the
    // "Ads disabled: user is in sanctioned country" log prefix, returns false.
    private fun assertAdsDisabled(classes: List<ClassDef>) {
        val gates = classes.flatMap { it.methods }.filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.instructions().any { it.stringStartsWith(SANCTIONED_LOG) }
        }
        assertEquals(1, gates.size, "shouldShowAds candidates: ${gates.map { "${it.definingClass}.${it.name}" }}")
        val gate = gates.single()
        assertForcedBoolean(gate, expected = false, label = "${gate.definingClass}.${gate.name} (shouldShowAds)")

        // The Meta Audience Network and Vungle startup providers answer true at once.
        for (provider in listOf("Lcom/facebook/ads/AudienceNetworkContentProvider;", "Lcom/vungle/ads/VungleProvider;")) {
            val onCreate = classes.single { it.type == provider }.method("onCreate", listOf())
            assertForcedBoolean(onCreate, expected = true, label = "$provider.onCreate")
        }
    }

    private fun assertTelemetryDisabled(classes: List<ClassDef>, stock: List<ClassDef>) {
        // AppsFlyer: the concrete AppsFlyerLib subclass's six sending entry points.
        val appsFlyer = classes.single { it.superclass == APPSFLYER_LIB }
        val appsFlyerMethods = appsFlyer.methods.filter {
            it.name in APPSFLYER_METHODS && it.returnType == "V" && it.implementation != null
        }
        assertEquals(6, appsFlyerMethods.size, "AppsFlyer methods in ${appsFlyer.type}: ${appsFlyerMethods.map { it.name }}")
        assertTrue(appsFlyerMethods.any { it.name == "start" }, "${appsFlyer.type} has no concrete start()")
        for (method in appsFlyerMethods) {
            assertReturnsEarlyVoid(method, label = "${appsFlyer.type}.${method.name}(${method.parameterTypes.joinToString()})")
        }

        // Firebase Analytics: the measurement SDK's logEvent entry point returns early.
        val measurement = classes.single { it.type == GMS_MEASUREMENT }
        assertReturnsEarlyVoid(
            measurement.method("logEvent", listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/os/Bundle;")),
            label = "AppMeasurementSdk.logEvent(String, String, Bundle)",
        )

        // The single "firebase_analytics_collection_deactivated" read (R8-renamed config, found
        // by the string like the patch) is overwritten with Boolean.TRUE after its move-result.
        val readers = classes.flatMap { it.methods }.filter { m -> m.instructions().any { it.referencesString(ANALYTICS_DEACTIVATED_KEY) } }
        assertEquals(1, readers.size, "$ANALYTICS_DEACTIVATED_KEY readers: ${readers.map { "${it.definingClass}.${it.name}" }}")
        val reader = readers.single()
        val readLabel = "${reader.definingClass}.${reader.name} ($ANALYTICS_DEACTIVATED_KEY)"
        val readInsns = reader.instructions()
        val keyIndex = readInsns.indexOfFirst { it.referencesString(ANALYTICS_DEACTIVATED_KEY) }
        val keyRegister = (readInsns[keyIndex] as OneRegisterInstruction).registerA
        val read = readInsns[keyIndex + 1]
        val readRef = read.methodRef()
        assertTrue(
            read is FiveRegisterInstruction && read.registerCount == 2 && read.registerD == keyRegister &&
                readRef?.returnType == "Ljava/lang/Boolean;" &&
                readRef.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;"),
            "$readLabel: the key is not read through a Boolean get(String); got ${read.opcode} $readRef"
        )
        val move = readInsns[keyIndex + 2]
        val forced = readInsns[keyIndex + 3]
        val forcedField = (forced as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            move.opcode == Opcode.MOVE_RESULT_OBJECT && forced.opcode == Opcode.SGET_OBJECT &&
                forcedField?.definingClass == "Ljava/lang/Boolean;" && forcedField.name == "TRUE" &&
                (forced as OneRegisterInstruction).registerA == (move as OneRegisterInstruction).registerA,
            "$readLabel: the read is not overwritten with Boolean.TRUE; got ${readInsns.drop(keyIndex).take(4).map { it.opcode }}"
        )

        // Crashlytics: in the classes holding the collection-enabled key (found like the patch),
        // exactly the synchronized no-arg boolean (the DataCollectionArbiter getter) returns
        // false. Every other no-arg boolean there, such as the static SDK_INT check R8 merged
        // into the other class, keeps its stock code.
        fun List<ClassDef>.crashlyticsClasses() = filter { cls ->
            cls.methods.any { m -> m.instructions().any { it.referencesString(CRASHLYTICS_KEY) } }
        }
        fun Method.isNoArgBoolean() = implementation != null && returnType == "Z" && parameterTypes.isEmpty()
        fun Method.isSynchronized() =
            AccessFlags.DECLARED_SYNCHRONIZED.isSet(accessFlags) || AccessFlags.SYNCHRONIZED.isSet(accessFlags)
        val crashlytics = classes.crashlyticsClasses()
        assertEquals(stock.crashlyticsClasses().map { it.type }.toSet(), crashlytics.map { it.type }.toSet(), "Crashlytics classes")
        val arbiters = crashlytics.flatMap { it.methods }.filter { it.isNoArgBoolean() && it.isSynchronized() }
        assertEquals(1, arbiters.size, "synchronized ()Z Crashlytics getters: ${arbiters.map { "${it.definingClass}.${it.name}" }}")
        val arbiter = arbiters.single()
        assertForcedBoolean(arbiter, expected = false, label = "${arbiter.definingClass}.${arbiter.name} (Crashlytics collection)")

        val stockByType = stock.associateBy { it.type }
        val untouched = crashlytics.flatMap { it.methods }.filter { it.isNoArgBoolean() && !it.isSynchronized() }
        assertTrue(
            untouched.any { AccessFlags.STATIC.isSet(it.accessFlags) && it.definingClass != arbiter.definingClass },
            "no static ()Z found in the other Crashlytics class; got ${untouched.map { "${it.definingClass}.${it.name}" }}"
        )
        for (method in untouched) {
            val stockMethod = stockByType.getValue(method.definingClass).methods.single { it.name == method.name && it.isNoArgBoolean() }
            assertEquals(
                stockMethod.instructions().map { it.opcode },
                method.instructions().map { it.opcode },
                "${method.definingClass}.${method.name}()Z (not the Crashlytics getter) was changed",
            )
        }

        // Remote Config realtime: in the client holding the stream path, the synchronized (J)V
        // that schedules the connection returns at once; its other methods keep their stock code.
        val realtime = classes.single { cls -> cls.methods.any { m -> m.instructions().any { it.referencesString(RC_REALTIME_PATH) } } }
        val schedulers = realtime.methods.filter {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("J") && it.isSynchronized()
        }
        assertEquals(1, schedulers.size, "synchronized (J)V in ${realtime.type}: ${schedulers.map { it.name }}")
        assertReturnsEarlyVoid(schedulers.single(), label = "${realtime.type}.${schedulers.single().name} (realtime connection)")
        val stockRealtime = stockByType.getValue(realtime.type)
        val schedulerName = schedulers.single().name
        for (method in realtime.methods.filter { it.name != schedulerName && it.implementation != null }) {
            val stockMethod = stockRealtime.methods.single {
                it.name == method.name && it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
            }
            assertEquals(stockMethod.instructions().map { it.opcode }, method.instructions().map { it.opcode }, "${realtime.type}.${method.name} was changed")
        }

        // AppsFlyer init: right after the "enable_appsflyer_sdk" getter's move-result, the result
        // register is set to 0 (FotMob's "disabled in Remote Config" path).
        val afGates = classes.flatMap { it.methods }.filter { m ->
            m.instructions().any { it.referencesString("enable_appsflyer_sdk") } &&
                m.instructions().any { it.methodRef()?.let { r -> r.definingClass == APPSFLYER_LIB && r.name == "init" } == true }
        }
        assertEquals(1, afGates.size, "AppsFlyer init methods: ${afGates.map { "${it.definingClass}.${it.name}" }}")
        val afInsns = afGates.single().instructions()
        val afKey = afInsns.indexOfFirst { it.referencesString("enable_appsflyer_sdk") }
        val afMove = (afKey + 1 until afKey + 4).first { afInsns[it].opcode == Opcode.MOVE_RESULT }
        val afForced = afInsns[afMove + 1]
        assertTrue(
            afForced.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16) && (afForced as NarrowLiteralInstruction).narrowLiteral == 0 &&
                (afForced as OneRegisterInstruction).registerA == (afInsns[afMove] as OneRegisterInstruction).registerA &&
                afInsns[afMove + 2].opcode == Opcode.IF_NEZ,
            "AppsFlyer init flag is not forced to 0 before its check; got ${afInsns.subList(afMove, afMove + 3).map { it.opcode }}"
        )
        // The firebase.test.lab check in FotMobApp.onCreate is untouched (it also gates account sync).
        val app = classes.single { it.type == "Lcom/fotmob/android/FotMobApp;" }.method("onCreate", listOf())
        val appInsns = app.instructions()
        val lab = appInsns.indexOfFirst { it.referencesString("firebase.test.lab") }
        assertTrue(lab > 0 && appInsns[lab + 1].methodRef()?.name == "getString", "FotMobApp firebase.test.lab check changed")

        // EmojiCompatInitializer.create returns Boolean.TRUE at once.
        val emoji = classes.single { it.type == "Landroidx/emoji2/text/EmojiCompatInitializer;" }
            .method("create", listOf("Landroid/content/Context;")).instructions()
        assertTrue(
            emoji[0].opcode == Opcode.SGET_OBJECT && emoji[0].fieldRef()?.let { it.definingClass == "Ljava/lang/Boolean;" && it.name == "TRUE" } == true &&
                emoji[1].opcode == Opcode.RETURN_OBJECT,
            "EmojiCompatInitializer.create does not return Boolean.TRUE at once; got ${emoji.take(2).map { it.opcode }}"
        )
    }

    private fun assertOnboardingAutoSignInSkipped(classes: List<ClassDef>, stock: List<ClassDef>) {
        // Both found like the patch does: the NoCredentialException(CharSequence) constructor by
        // its type string, the onboarding coroutine by its two log prefixes.
        fun noCredentialType(all: List<ClassDef>) = all.single { cls ->
            cls.methods.any { m ->
                m.name == "<init>" && AccessFlags.PUBLIC.isSet(m.accessFlags) &&
                    m.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;") &&
                    m.instructions().any { it.referencesString(TYPE_NO_CREDENTIAL) }
            }
        }.type
        fun Method.isOnboardingAutoSignIn() = returnType == "Ljava/lang/Object;" &&
            parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") &&
            instructions().any { it.stringStartsWith(NO_ACCOUNT_LOG) } &&
            instructions().any { it.stringStartsWith(DISMISSED_LOG) }
        val noCredential = noCredentialType(classes)
        assertEquals(noCredentialType(stock), noCredential, "NoCredentialException resolves differently in stock and patched dex")
        val method = classes.flatMap { it.methods }.single { it.isOnboardingAutoSignIn() }
        val label = "${method.definingClass}.${method.name} (onboarding auto sign-in)"
        val insns = method.instructions()

        // The inserted new-instance / invoke-direct <init>(CharSequence) / throw on one register.
        val newInstance = insns.indices.singleOrNull { i ->
            insns[i].opcode == Opcode.NEW_INSTANCE && insns[i].typeRef() == noCredential &&
                insns.getOrNull(i + 2)?.opcode == Opcode.THROW
        } ?: error("$label: no new-instance $noCredential followed by throw")
        val exceptionReg = (insns[newInstance] as OneRegisterInstruction).registerA
        val init = insns[newInstance + 1]
        val initRef = init.methodRef()
        val initRegs = init as FiveRegisterInstruction
        assertTrue(
            init.opcode == Opcode.INVOKE_DIRECT && initRef?.definingClass == noCredential && initRef.name == "<init>" &&
                initRef.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;") &&
                initRegs.registerCount == 2 && initRegs.registerC == exceptionReg,
            "$label: the exception is not built with $noCredential.<init>(CharSequence); got ${init.opcode} $initRef"
        )
        assertEquals(exceptionReg, (insns[newInstance + 2] as OneRegisterInstruction).registerA, "$label: throws another register")

        // Directly after Context.getString(I) + move-result-object, whose result is the message.
        val getString = insns[newInstance - 2]
        val moveResult = insns[newInstance - 1]
        val getStringRef = getString.methodRef()
        assertTrue(
            getString.opcode == Opcode.INVOKE_VIRTUAL && getStringRef?.definingClass == "Landroid/content/Context;" &&
                getStringRef.name == "getString" && getStringRef.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                moveResult.opcode == Opcode.MOVE_RESULT_OBJECT,
            "$label: the throw does not follow Context.getString(I) + move-result-object; got ${getString.opcode} $getStringRef"
        )
        assertEquals((moveResult as OneRegisterInstruction).registerA, initRegs.registerD, "$label: the message is not the getString result")
        assertTrue(exceptionReg != initRegs.registerD, "$label: exception and message share v$exceptionReg")

        // The throw lies inside one try block whose first handler able to catch it is the
        // NoCredentialException one (the Exception and catch-all handlers come after it).
        val addresses = insns.runningFold(0) { address, insn -> address + insn.codeUnits }
        val throwAddress = addresses[newInstance + 2]
        val covering = method.implementation!!.tryBlocks.filter {
            throwAddress >= it.startCodeAddress && throwAddress < it.startCodeAddress + it.codeUnitCount
        }
        assertEquals(1, covering.size, "$label: try blocks covering the throw at 0x${throwAddress.toString(16)}")
        val firstCatching = covering.single().exceptionHandlers.first { handler ->
            handler.exceptionType == null || handler.exceptionType == noCredential ||
                handler.exceptionType == "Ljava/lang/Exception;" || handler.exceptionType == "Ljava/lang/Throwable;"
        }
        assertEquals(noCredential, firstCatching.exceptionType, "$label: the throw is not caught by the NoCredentialException handler first")

        // The patch adds exactly this one NoCredentialException, and every other method that reads
        // the same client id resource (the Sign in with Google buttons in SignInActivity, the
        // predictor and the profile screens) is unchanged.
        fun List<ClassDef>.noCredentialNews() = sumOf { cls ->
            cls.methods.sumOf { m -> m.instructions().count { it.opcode == Opcode.NEW_INSTANCE && it.typeRef() == noCredential } }
        }
        assertEquals(stock.noCredentialNews() + 1, classes.noCredentialNews(), "NoCredentialException new-instance count")

        val idRegister = (getString as FiveRegisterInstruction).registerD
        val clientIdRes = insns.subList(0, newInstance - 2).last { insn ->
            insn is NarrowLiteralInstruction && (insn as? OneRegisterInstruction)?.registerA == idRegister
        }.let { (it as NarrowLiteralInstruction).narrowLiteral }
        fun List<ClassDef>.clientIdReaders() = flatMap { cls -> cls.methods.map { m -> "${cls.type}->${m.name}${m.parameterTypes}" to m } }
            .filter { (_, m) ->
                !m.isOnboardingAutoSignIn() && m.instructions().any { insn ->
                    insn.opcode.name.startsWith("const") && (insn as? NarrowLiteralInstruction)?.narrowLiteral == clientIdRes
                }
            }.toMap()
        val stockReaders = stock.clientIdReaders()
        val patchedReaders = classes.clientIdReaders()
        assertEquals(stockReaders.keys, patchedReaders.keys, "methods reading the client id resource")
        assertTrue(stockReaders.size >= 3, "expected the Sign in with Google call sites to read the client id; found ${stockReaders.keys}")
        for ((key, stockMethod) in stockReaders) {
            assertEquals(
                stockMethod.instructions().map { it.opcode },
                patchedReaders.getValue(key).instructions().map { it.opcode },
                "$key (reads the client id) was changed",
            )
        }
    }

    private fun Instruction.stringStartsWith(prefix: String): Boolean =
        ((this as? ReferenceInstruction)?.reference as? StringReference)?.string?.startsWith(prefix) == true

    private fun Instruction.typeRef(): String? = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

    /** The unpatched classes, read straight from the APK's dex files. */
    private fun originalClasses(apk: File): List<ClassDef> = ZipFile(apk).use { zip ->
        zip.entries().toList()
            .filter { Regex("classes\\d*\\.dex").matches(it.name) }
            .flatMap { entry ->
                val bytes = zip.getInputStream(entry).use { it.readBytes() }
                DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.toList()
            }
    }

    private fun Instruction.methodRef(): MethodReference? =
        (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.fieldRef(): FieldReference? =
        (this as? ReferenceInstruction)?.reference as? FieldReference
}
