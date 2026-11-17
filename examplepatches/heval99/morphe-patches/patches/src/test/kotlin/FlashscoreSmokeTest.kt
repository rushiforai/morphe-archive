import app.template.patches.flashscore.competitions.COMPETITION_FEATURES
import app.template.patches.flashscore.competitions.COMPETITION_FILTER
import app.template.patches.flashscore.competitions.EVENT_ENTITY_TO_STRING
import app.template.patches.flashscore.competitions.FILTER_EVENTS_LOG
import app.template.patches.flashscore.competitions.LEAGUE_MODEL_TO_STRING
import app.template.patches.flashscore.misc.animations.ANIMATION_FEATURES
import app.template.patches.flashscore.misc.betting.HIDE_BETTING
import app.template.patches.flashscore.misc.news.HIDE_NEWS
import app.template.patches.flashscore.misc.notifications.BLOCK_MARKETING_NOTIFICATIONS
import app.template.patches.flashscore.misc.polls.HIDE_MATCH_POLLS
import app.template.patches.flashscore.misc.theme.AMOLED_BLACK
import app.template.patches.flashscore.shared.findEnumConstantField
import app.template.patches.flashscore.spoiler.CONFIG_EVENT_ID
import app.template.patches.flashscore.spoiler.CONFIG_TO_STRING
import app.template.patches.flashscore.spoiler.DUEL_HOLDER
import app.template.patches.flashscore.spoiler.EVENT_MODEL_TO_STRING
import app.template.patches.flashscore.spoiler.PUSH_HANDLERS
import app.template.patches.flashscore.spoiler.SPOILER_FEATURES
import app.template.patches.flashscore.spoiler.SPOILER_FREE
import app.template.patches.flashscore.spoiler.SPOILER_NOTIFICATIONS
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
import org.w3c.dom.Element
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "eu.livesport.FlashScore_com"
private const val SDK = "Lcom/google/android/libraries/ads/mobile/sdk/"
private const val ADVERT_ZONE = "Leu/livesport/core/ui/adverts/AdvertZone;"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private const val APPTENTIVE = "Lapptentive/com/android/feedback/Apptentive;"
private const val FIAM_DISPLAY = "Lcom/google/firebase/inappmessaging/FirebaseInAppMessagingDisplay;"
private const val EVENT_LIST_ACTIVITY = "Leu/livesport/LiveSport_cz/EventListActivity;"
private const val CRASHLYTICS_KEY = "firebase_crashlytics_collection_enabled"
private const val CRASHLYTICS_WRAPPER_MARKER = "FirebaseCrashlytics component is not present."

private const val BETTING_HELPER = "morpheBettingGet"
private const val ADS_HELPER = "morpheAdsGet"
private val INTERSTITIAL_PREF_KEYS = listOf("ads_interstitial_display_date", "ads_interstitial_display_count")
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val TABS_HELPER = "morpheWithoutOddsTab"
private const val SET = "Ljava/util/Set;"

private const val TELEMETRY_HELPER = "morpheTelemetryGet"
private const val POLLS_HELPER = "morpheMatchPollsGet"
private const val NEWS_HELPER = "morpheNewsGet"
private const val AGE_VERIFIED_HELPER = "morpheHevalAgeVerified"
private const val HEVAL_SETTINGS = "Lapp/template/extension/hevalcontrols/HevalSettings;"
private const val CLARITY = "Lcom/microsoft/clarity/Clarity;"

// Enum constants R8 left without a static field of their own in 26.11.6: the resolver must say
// null for them, not hand back the next constant's field.
private val FIELDLESS_KEYS = listOf(
    "SELF_UPDATE_APP",
    "DETAIL_ODDS_COMPARISON_IMAGES_DISABLED",
    "DATA_URL_PLATFORM",
    "DATA_URL_PROJECT",
    "DATA_URL_SHARED",
    "DATA_URL_DATA_SERVICE",
    "DATA_URL_IMAGE",
    "AUDIO_COMMENT_HEADER_BUTTON_ENABLED",
)

private val FLASHSCORE_PATCHES = setOf(
    "Block marketing popups",
    "Disable ads",
    "Disable rating prompts",
    "Disable telemetry",
    "Disable update prompts",
    "Hide betting content",
    "Hide match polls",
    "Hide news",
    "Use system font",
    "Spoof signature",
    "Patch settings",
    "Animation speed",
    "Force edge-to-edge",
    "Block marketing notifications",
    "AMOLED black",
    "Spoiler-free mode",
    "Hide competitions",
)

// SHA-1 of the original signing certificate (CN=Pavel Cvetler, O=LiveSport s.r.o.).
private const val SIGNATURE_SHA1 = "fd9fbf3b2dac2390355b54c50a1b716076d79bc1"

// Hide betting content: the remote-config keys and the value the helper must answer with.
private val BETTING_KEYS = mapOf(
    "ODDS_ENABLE" to "FALSE",
    "DETAIL_ODDS_ENABLE" to "FALSE",
    "DETAIL_ODDS_COMPARISON_ENABLE" to "FALSE",
    "DETAIL_ODDS_AFFILIATE_ENABLE" to "FALSE",
    "DETAIL_ODDS_BETSLIP_ENABLE" to "FALSE",
    "DETAIL_ODDS_PREMATCH_BUTTON_ENABLE" to "FALSE",
    "DETAIL_ODDS_POSTMATCH_BUTTON_ENABLE" to "FALSE",
    "DETAIL_ODDS_LIVE_ENABLE" to "FALSE",
    "DETAIL_ODDS_LIVE_BET_BUTTON_ENABLE" to "FALSE",
    "DETAIL_ODDS_SUMMARY_REDIRECT_TO_ODDS" to "FALSE",
    "DETAIL_SUMMARY_GAMBLING_TEXT_ENABLED" to "FALSE",
    "DETAIL_BROADCASTING_BOOKMAKERS_DISABLE" to "TRUE",
    "DETAIL_ODDS_SUMMARY_IMAGES_DISABLED" to "TRUE",
    "BONUS_PROMO_GIFT_ICON_URL" to "EMPTY_STRING",
    "LEAGUE_DETAIL_HEADER_STRIP_SPORTS_ENABLED" to "EMPTY_LIST",
    "GAMBLE_RESPONSIBLY" to "EMPTY_STRING",
    "GAMBLE_RESPONSIBLY_BODY" to "EMPTY_STRING",
    "GAMBLE_RESPONSIBLY_TYPE" to "EMPTY_STRING",
    "GAMBLE_RESPONSIBLY_SUMMARY_PLACEMENT_TYPE" to "EMPTY_STRING",
    "GAMBLE_RESPONSIBLY_URL" to "EMPTY_STRING",
    "GAMBLE_RESPONSIBLY_TITLES" to "EMPTY_LIST",
)

// Disable ads: the app's own ads kill switches.
private val ADS_KEYS = mapOf(
    "ADS_ENABLED" to "FALSE",
    "ADS_AMAZON_ENABLED" to "FALSE",
)

// Disable telemetry: Clarity's remote-config switches (build-time, no gate).
private val TELEMETRY_KEYS = mapOf(
    "CLARITY_ENABLED" to "FALSE",
    "CLARITY_PROJECT_ID" to "EMPTY_STRING",
)

private val POLLS_KEYS = mapOf("MATCH_POLL_ENABLED" to "FALSE")
private val NEWS_KEYS = mapOf(
    "MATCH_LIST_FS_NEWS" to "FALSE",
    "FLASHSCORE_NEWS_ENABLED" to "FALSE",
    "NEWS_ENABLED" to "FALSE",
)

class FlashscoreSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.strings(): List<String> =
        instructions().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

    // The fingerprints match concatenation pieces by prefix or with CONTAINS (patcher 2.0 compares
    // raw `strings` with the whole constant), so the test finds the methods the same way.
    private fun Method.hasStringStartingWith(prefix: String): Boolean = strings().any { it.startsWith(prefix) }

    private fun Method.hasStringContaining(part: String): Boolean = strings().any { part in it }

    private fun Method.calls(definingClass: String, name: String): Boolean = instructions().any { insn ->
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == definingClass && ref.name == name
    }

    private fun ClassDef.referencesString(value: String): Boolean = methods.any { value in it.strings() }

    private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)

    /** The static field of enum constant [name]: the patch's own scan, run over the emitted `<clinit>`. */
    private fun ClassDef.enumConstantField(name: String): FieldReference? {
        val insns = methods.singleOrNull { it.name == "<clinit>" }?.instructions() ?: return null
        return findEnumConstantField(type, insns, name)
    }

    /** What a helper answer block is: the forced value name and the Patch settings gate id, if any. */
    private fun List<Instruction>.forcedAnswer(target: Int, stock: Int?): Pair<String, String?> {
        var at = target
        var gate: String? = null
        val first = (this[at] as? ReferenceInstruction)?.reference as? StringReference
        // A gate is: const-string v1, "<id>"; invoke-static/range isEnabled; move-result v1; if-eqz v1 -> stock.
        if (this[at].opcode == Opcode.CONST_STRING && first != null && first.string.isNotEmpty()) {
            gate = first.string
            val call = (this[at + 1] as? ReferenceInstruction)?.reference as? MethodReference
            assertTrue(
                this[at + 1].opcode == Opcode.INVOKE_STATIC_RANGE && call?.definingClass == HEVAL_SETTINGS &&
                    call.name == "isEnabled" && (this[at + 1] as RegisterRangeInstruction).registerCount == 1 &&
                    this[at + 2].opcode == Opcode.MOVE_RESULT && this[at + 3].opcode == Opcode.IF_EQZ,
                "the gate for \"$gate\" is not isEnabled + if-eqz",
            )
            assertEquals(
                stock, indexOfInstruction(branchTarget(at + 3)),
                "the gate for \"$gate\" does not fall back to the stock path",
            )
            at += 4
        }
        val answerRef = (this[at] as? ReferenceInstruction)?.reference
        val forced = when {
            answerRef is FieldReference && answerRef.definingClass == "Ljava/lang/Boolean;" -> answerRef.name
            answerRef is StringReference && answerRef.string.isEmpty() -> "EMPTY_STRING"
            answerRef is MethodReference && answerRef.definingClass == "Ljava/util/Collections;" &&
                answerRef.name == "emptyList" -> "EMPTY_LIST"
            else -> "${this[at].opcode} $answerRef"
        }
        return forced to gate
    }

    private fun List<Instruction>.indexOfInstruction(instruction: Instruction?): Int? =
        indexOfFirst { it === instruction }.takeIf { it >= 0 }

    /** The instruction an if-* at [index] jumps to. */
    private fun List<Instruction>.branchTarget(index: Int): Instruction? {
        val addresses = runningFold(0) { address, insn -> address + insn.codeUnits }
        val target = addresses[index] + (this[index] as OffsetInstruction).codeOffset
        return getOrNull(addresses.indexOf(target))
    }

    /**
     * True when the constructor starts, for each of [registers], with `invoke-static/range {pN}` of
     * the class's `morpheHevalStrip(ArrayList)ArrayList` and `move-result-object pN`.
     */
    private fun Method.startsWithStripHelper(registers: List<Int>): Boolean {
        val insns = instructions()
        return registers.withIndex().all { (i, register) ->
            val call = insns.getOrNull(2 * i)
            val ref = (call as? ReferenceInstruction)?.reference as? MethodReference
            val result = insns.getOrNull(2 * i + 1)
            call?.opcode == Opcode.INVOKE_STATIC_RANGE && (call as RegisterRangeInstruction).startRegister == register &&
                call.registerCount == 1 && ref?.definingClass == definingClass && ref.name == "morpheHevalStrip" &&
                ref.parameterTypes.map(CharSequence::toString) == listOf(ARRAY_LIST) && ref.returnType == ARRAY_LIST &&
                result?.opcode == Opcode.MOVE_RESULT_OBJECT && (result as OneRegisterInstruction).registerA == register
        }
    }

    /** morpheHevalStrip: gate on hide_betting; on = new empty ArrayList, off = the argument. */
    private fun assertStripHelper(cls: ClassDef) {
        val helper = cls.methods.single { it.name == "morpheHevalStrip" }
        val insns = helper.instructions()
        val gate = (insns[0] as? ReferenceInstruction)?.reference as? StringReference
        assertTrue(
            helper.params() == listOf(ARRAY_LIST) && helper.returnType == ARRAY_LIST &&
                AccessFlags.STATIC.isSet(helper.accessFlags) && insns[0].opcode == Opcode.CONST_STRING &&
                gate?.string == "flashscore.hide_betting" && insns[3].opcode == Opcode.IF_EQZ &&
                insns[4].opcode == Opcode.NEW_INSTANCE &&
                ((insns[4] as ReferenceInstruction).reference as TypeReference).type == ARRAY_LIST &&
                insns[6].opcode == Opcode.RETURN_OBJECT && insns[7].opcode == Opcode.RETURN_OBJECT &&
                (insns[7] as OneRegisterInstruction).registerA == helper.implementation!!.registerCount - 1,
            "${cls.type}.morpheHevalStrip is not the hide_betting ArrayList helper: ${insns.map { it.opcode }}",
        )
    }

    /** The registers an invoke passes, in order (receiver first for non-static calls). */
    private fun Instruction.argumentRegisters(): List<Int> = when (this) {
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        else -> emptyList()
    }

    /** The register of each declared parameter of the invoked [ref] (wide types take two registers). */
    private fun Instruction.parameterRegisters(ref: MethodReference): List<Int> {
        val registers = argumentRegisters()
        var next = if (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) 0 else 1
        return ref.parameterTypes.map { type ->
            val register = registers.getOrElse(next) { -1 }
            next += if (type.toString() == "J" || type.toString() == "D") 2 else 1
            register
        }
    }

    /** The index of the last instruction before [index] that writes [register], or -1 (straight-line scan). */
    private fun List<Instruction>.lastWriteBefore(index: Int, register: Int): Int =
        (index - 1 downTo 0).firstOrNull { i ->
            val insn = this[i]
            insn.opcode.setsRegister() && (insn as? OneRegisterInstruction)?.registerA == register
        } ?: -1

    /** The unpatched classes, read straight from the APK's dex files. */
    private fun originalClasses(apk: File): List<ClassDef> = ZipFile(apk).use { zip ->
        zip.entries().toList()
            .filter { Regex("classes\\d*\\.dex").matches(it.name) }
            .flatMap { entry ->
                val bytes = zip.getInputStream(entry).use { it.readBytes() }
                DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.toList()
            }
    }

    @Test
    fun `all Flashscore patches apply and mutate the expected bytecode`() {
        val root = repoRoot()
        val apk = File(root, "apks/flashscore/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "26.11.6",
            patchNames = FLASHSCORE_PATCHES,
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        val diagnostics = "emitted classes=${classes.size}"

        fun klass(type: String) = byType[type] ?: error("$type not found in emitted dexes\n$diagnostics")

        // Disable ads. Since 26.11.4 the next-gen Ads SDK is R8-repackaged (ads_mobile_sdk.*), so
        // nothing is hooked by SDK name: ADS_ENABLED / ADS_AMAZON_ENABLED are checked with the
        // remote-config helpers below. The SDK's public classes must stay gone, or the old
        // SDK-level hooks would be needed again.
        assertTrue(
            byType[SDK + "MobileAds;"] == null && byType[SDK + "interstitial/InterstitialAd;"] == null,
            "the next-gen Ads SDK keeps its public class names again; restore the SDK-level hooks\n$diagnostics"
        )

        // The interstitial manager (ctor opens the display-counter prefs) has no ad unit id: its
        // only ()String getter returns "" at once.
        val interstitialManager = classes.singleOrNull { cls ->
            cls.methods.any {
                it.name == "<init>" && it.strings().containsAll(INTERSTITIAL_PREF_KEYS)
            }
        } ?: error("no single class opening $INTERSTITIAL_PREF_KEYS in its constructor\n$diagnostics")
        val unitId = interstitialManager.methods.single {
            it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty() && it.implementation != null &&
                !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        val unitIdInsns = unitId.instructions()
        val emptyId = (unitIdInsns.firstOrNull() as? ReferenceInstruction)?.reference as? StringReference
        assertTrue(
            unitIdInsns.firstOrNull()?.opcode == Opcode.CONST_STRING && emptyId?.string == "" &&
                unitIdInsns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
                (unitIdInsns[1] as OneRegisterInstruction).registerA == (unitIdInsns[0] as OneRegisterInstruction).registerA,
            "${interstitialManager.type}.${unitId.name}() does not return \"\" first\n$diagnostics"
        )

        // AdvertZone's load entry point hides the slot, runs the (I)V collapse helper and returns.
        val advertZone = klass(ADVERT_ZONE)
        val zoneLoad = advertZone.methods.single {
            it.returnType == "V" && it.parameterTypes.isEmpty() && it.hasStringStartingWith("Unsupported ad provider: ")
        }
        val collapse = advertZone.methods.single {
            it.returnType == "V" && it.params() == listOf("I") &&
                it.calls("Landroidx/constraintlayout/widget/ConstraintLayout;", "setMinHeight")
        }
        val zoneInsns = zoneLoad.instructions()
        val gone = zoneInsns.getOrNull(1)
        assertTrue(
            gone is NarrowLiteralInstruction && gone.narrowLiteral == 8,
            "AdvertZone.${zoneLoad.name}() does not load GONE (8); second instruction is ${gone?.opcode}\n$diagnostics"
        )
        val setVisibility = (zoneInsns.getOrNull(2) as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            setVisibility?.name == "setVisibility",
            "AdvertZone.${zoneLoad.name}() does not call setVisibility first; got $setVisibility\n$diagnostics"
        )
        val collapseCall = (zoneInsns.getOrNull(3) as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            collapseCall?.definingClass == ADVERT_ZONE && collapseCall.name == collapse.name,
            "AdvertZone.${zoneLoad.name}() does not call ${collapse.name}(I); got $collapseCall\n$diagnostics"
        )
        assertTrue(
            zoneInsns.getOrNull(4)?.opcode == Opcode.RETURN_VOID,
            "AdvertZone.${zoneLoad.name}() does not return after collapsing; got ${zoneInsns.getOrNull(4)?.opcode}\n$diagnostics"
        )

        // Video ads: the media item's constructor nulls the VMAP response (p3) first.
        val videoMedia = classes.singleOrNull { cls ->
            cls.methods.any { it.name == "toString" && it.hasStringContaining(", vmapResponse=") }
        } ?: error("no single class with ', vmapResponse=' in toString\n$diagnostics")
        val videoInit = videoMedia.method(
            "<init>",
            listOf("Ljava/util/ArrayList;", "Lcom/zentity/ottplayer/MediaProvider\$DrmData;", "Ljava/lang/String;"),
        )
        val nullVmap = videoInit.instructions().firstOrNull()
        assertTrue(
            nullVmap is NarrowLiteralInstruction && nullVmap.opcode == Opcode.CONST_4 &&
                nullVmap.narrowLiteral == 0 &&
                (nullVmap as OneRegisterInstruction).registerA == videoInit.implementation!!.registerCount - 1,
            "${videoMedia.type}.<init> does not null vmapResponse (p3) first; first instruction is ${nullVmap?.opcode}\n$diagnostics"
        )

        // Disable telemetry: AppsFlyer start / logEvent / logSession / logAdRevenue are no-ops,
        // its push APIs are untouched.
        val appsFlyer = classes.singleOrNull { it.superclass == APPSFLYER_LIB }
            ?: error("no single AppsFlyerLib subclass in emitted dexes\n$diagnostics")
        val appsFlyerSends = appsFlyer.methods.filter {
            it.name in setOf("start", "logEvent", "logSession", "logAdRevenue") && it.implementation != null
        }
        assertTrue(appsFlyerSends.any { it.name == "start" }, "${appsFlyer.type} has no start()\n$diagnostics")
        assertTrue(appsFlyerSends.count { it.name == "logEvent" } >= 2, "${appsFlyer.type} lost a logEvent overload\n$diagnostics")
        for (method in appsFlyerSends) {
            assertReturnsEarlyVoid(method, label = "${appsFlyer.type}.${method.name}(${method.params().joinToString()})", diagnostics)
        }
        for (method in appsFlyer.methods.filter { it.name == "sendPushNotificationData" }) {
            assertTrue(
                method.instructions().firstOrNull()?.opcode != Opcode.RETURN_VOID,
                "${appsFlyer.type}.sendPushNotificationData must stay untouched\n$diagnostics"
            )
        }

        // Microsoft Clarity (unobfuscated): both initialize overloads and the session calls answer
        // Boolean.FALSE first; sendCustomEvent and setCustomTag (primitive Z) return false.
        val clarity = klass(CLARITY)
        val clarityObjectMethods = listOf(
            "initialize", "resume", "consent", "startNewSession", "setCustomUserId",
            "setCustomSessionId", "setCurrentScreenName", "setOnSessionStartedCallback",
        )
        for (name in clarityObjectMethods) {
            val methods = clarity.methods.filter { it.name == name && it.returnType == "Ljava/lang/Boolean;" }
            assertTrue(methods.isNotEmpty(), "Clarity.$name is gone\n$diagnostics")
            if (name == "initialize") {
                assertEquals(
                    setOf("Landroid/app/Activity;", "Landroid/content/Context;"), methods.map { it.params().first() }.toSet(),
                    "Clarity.initialize overloads\n$diagnostics",
                )
            }
            for (method in methods) {
                val insns = method.instructions()
                val field = (insns.getOrNull(0) as? ReferenceInstruction)?.reference as? FieldReference
                assertTrue(
                    insns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT && field?.definingClass == "Ljava/lang/Boolean;" &&
                        field.name == "FALSE" && insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
                        (insns[1] as OneRegisterInstruction).registerA == (insns[0] as OneRegisterInstruction).registerA,
                    "Clarity.$name(${method.params().joinToString()}) does not return Boolean.FALSE first\n$diagnostics",
                )
            }
        }
        for (name in listOf("sendCustomEvent", "setCustomTag")) {
            val methods = clarity.methods.filter { it.name == name && it.returnType == "Z" }
            assertTrue(methods.isNotEmpty(), "Clarity.$name is gone\n$diagnostics")
            methods.forEach { assertForcedBoolean(it, expected = false, label = "Clarity.$name", diagnostics) }
        }

        // Crashlytics is R8-renamed; locate its classes the same way the patch does.
        val crashlyticsClasses = classes.filter { it.referencesString(CRASHLYTICS_KEY) }
        assertTrue(crashlyticsClasses.isNotEmpty(), "no class references '$CRASHLYTICS_KEY'\n$diagnostics")
        val collectionGetters = crashlyticsClasses.flatMap { cls ->
            cls.methods.filter { it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null }
        }
        assertTrue(collectionGetters.isNotEmpty(), "no Crashlytics ()Z getter found\n$diagnostics")
        collectionGetters.forEach {
            assertForcedBoolean(it, expected = false, label = "Crashlytics ${it.definingClass}.${it.name}()Z", diagnostics)
        }
        val recordException = crashlyticsClasses.flatMap { cls ->
            cls.methods.filter { it.returnType == "V" && it.params() == listOf("Ljava/lang/Throwable;") }
        }
        assertTrue(recordException.isNotEmpty(), "no Crashlytics recordException(Throwable) found\n$diagnostics")
        recordException.forEach {
            assertReturnsEarlyVoid(it, label = "Crashlytics ${it.definingClass}.${it.name}(Throwable)", diagnostics)
        }
        val crashlyticsWrapper = classes.single { it.referencesString(CRASHLYTICS_WRAPPER_MARKER) }
        val enableCollection = crashlyticsWrapper.methods.single {
            it.name != "<init>" && it.returnType == "V" && it.parameterTypes.isEmpty() && CRASHLYTICS_KEY in it.strings()
        }
        assertReturnsEarlyVoid(enableCollection, label = "Crashlytics setCrashlyticsCollectionEnabled(true)", diagnostics)

        // Apptentive never registers or engages events.
        val apptentive = klass(APPTENTIVE).methods.filter {
            (it.name == "register" || it.name == "engage") && it.implementation != null
        }
        assertTrue(apptentive.any { it.name == "register" } && apptentive.any { it.name == "engage" },
            "Apptentive register/engage missing\n$diagnostics")
        apptentive.forEach {
            assertReturnsEarlyVoid(it, label = "Apptentive.${it.name}(${it.params().joinToString()})", diagnostics)
        }

        // Disable rating prompts: the settings getBool answers false for the two rating keys.
        val getBool = classes.flatMap { it.methods }.single {
            it.returnType == "Z" && it.hasStringStartingWith("Undefined default value for ") &&
                it.hasStringContaining(" using getBool!")
        }
        val getBoolInsns = getBool.instructions()
        val nameCall = (getBoolInsns.firstOrNull() as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            nameCall?.definingClass == "Ljava/lang/Enum;" && nameCall.name == "name",
            "${getBool.definingClass}.${getBool.name} does not read the key's name() first; got $nameCall\n$diagnostics"
        )
        val prologue = getBoolInsns.take(12)
        val prologueStrings = prologue.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
        assertTrue(
            prologueStrings == listOf("CAN_SHOW_RATING_BANNER", "CAN_SHOW_INAPP_RATING"),
            "${getBool.definingClass}.${getBool.name} prologue compares $prologueStrings\n$diagnostics"
        )
        val forcedFalse = prologue.indexOfFirst {
            it is NarrowLiteralInstruction && it.opcode == Opcode.CONST_4 && it.narrowLiteral == 0
        }
        assertTrue(
            forcedFalse > 0 && prologue.getOrNull(forcedFalse + 1)?.opcode == Opcode.RETURN,
            "${getBool.definingClass}.${getBool.name} prologue does not return false\n$diagnostics"
        )

        // Block marketing popups: since 26.11.4 the remote dialog is inlined into
        // EventListActivity.onResume. Found like the patch finds it: the parsed model is stored on
        // the helper (ctor "dialogSupport") after the "btnGoUrl" read, then read back for the null
        // check that guards the dialog; that read is overwritten with null at once.
        val dialogHelper = classes.single { cls ->
            cls.methods.any { it.name == "<init>" && it.hasStringContaining("dialogSupport") }
        }.type
        val onResume = klass(EVENT_LIST_ACTIVITY).method("onResume", emptyList())
        val resumeInsns = onResume.instructions()
        fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
        val urlIndex = resumeInsns.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "btnGoUrl"
        }
        assertTrue(urlIndex >= 0, "EventListActivity.onResume no longer reads \"btnGoUrl\"\n$diagnostics")
        val modelStore = (urlIndex + 1 until resumeInsns.size).first {
            resumeInsns[it].opcode == Opcode.IPUT_OBJECT && resumeInsns[it].field()?.definingClass == dialogHelper
        }
        val model = resumeInsns[modelStore].field()!!
        val modelRead = (modelStore + 1 until resumeInsns.size).first {
            resumeInsns[it].opcode == Opcode.IGET_OBJECT && resumeInsns[it].field() == model
        }
        val modelRegister = (resumeInsns[modelRead] as TwoRegisterInstruction).registerA
        val nulled = resumeInsns[modelRead + 1]
        assertTrue(
            (nulled.opcode == Opcode.CONST_4 || nulled.opcode == Opcode.CONST_16) &&
                (nulled as NarrowLiteralInstruction).narrowLiteral == 0 &&
                (nulled as OneRegisterInstruction).registerA == modelRegister,
            "onResume does not null the remote dialog model ($model) after reading it; found ${nulled.opcode}\n$diagnostics"
        )
        assertTrue(
            resumeInsns.subList(modelRead + 2, modelRead + 5).any {
                (it.opcode == Opcode.IF_NEZ || it.opcode == Opcode.IF_EQZ) &&
                    (it as OneRegisterInstruction).registerA == modelRegister
            },
            "the nulled remote dialog model is not null-checked right after\n$diagnostics"
        )

        // Every Firebase In-App Messaging display implementation returns at once.
        val fiamDisplays = classes.filter { FIAM_DISPLAY in it.interfaces }
        assertTrue(fiamDisplays.isNotEmpty(), "no FirebaseInAppMessagingDisplay implementation found\n$diagnostics")
        for (display in fiamDisplays) {
            assertReturnsEarlyVoid(
                display.methods.single { it.name == "displayMessage" },
                label = "${display.type}.displayMessage()", diagnostics
            )
        }

        // In-app promo strips parse to an empty list.
        val stripParse = classes.flatMap { it.methods }.single {
            it.returnType == "Ljava/util/List;" && "Failed to parse InAppStrip JSON" in it.strings()
        }
        assertReturnsMethodCall(
            stripParse, "Ljava/util/Collections;", "emptyList",
            label = "InAppStrip parser ${stripParse.definingClass}.${stripParse.name}", diagnostics
        )

        // Disable update prompts: the SOFT/HARD dialog method returns before building the dialog.
        val updateDialog = classes.flatMap { it.methods }.single {
            it.returnType == "V" && it.hasStringStartingWith("last_notify_") && it.calls("Landroid/app/Dialog;", "show")
        }
        assertReturnsEarlyVoid(updateDialog, label = "update dialog ${updateDialog.definingClass}.${updateDialog.name}", diagnostics)

        val original = originalClasses(apk).associateBy { it.type }

        // Disable ads + Hide betting content: the remote-config value's get() returns the result of
        // a chain of override helpers, one per patch (in patch order, which is not pinned): each
        // falls through to the next, the last one to the holder.
        val configValue = classes.singleOrNull { cls ->
            cls.methods.any { it.name == "<init>" && it.hasStringStartingWith("USER_PREFS_CONFIG_KEY-") }
        } ?: error("no single class with 'USER_PREFS_CONFIG_KEY-' in a constructor\n$diagnostics")
        val keyType = configValue.methods.single {
            it.name == "<init>" && it.hasStringStartingWith("USER_PREFS_CONFIG_KEY-")
        }.params()[1]
        val configGet = configValue.methods.single {
            it.returnType == "Ljava/lang/Object;" && it.parameterTypes.isEmpty() && it.implementation != null &&
                !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        fun Instruction.helperCall(): MethodReference? =
            ((this as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf {
                opcode == Opcode.INVOKE_STATIC && it.definingClass == configValue.type && it.name.startsWith("morphe")
            }
        val helpers = mutableListOf<Method>()
        var nextHelper = configGet.instructions().firstOrNull()?.helperCall()
        while (nextHelper != null) {
            val name = nextHelper.name
            assertTrue(helpers.none { it.name == name }, "the config helper chain loops at $name\n$diagnostics")
            val helper = configValue.methods.single { it.name == name }
            helpers += helper
            nextHelper = helper.instructions().firstNotNullOfOrNull { it.helperCall() }
        }
        val expectedHelpers = setOf(ADS_HELPER, BETTING_HELPER, TELEMETRY_HELPER, POLLS_HELPER, NEWS_HELPER)
        assertTrue(
            helpers.map { it.name }.toSet() == expectedHelpers,
            "${configValue.type}.${configGet.name}() helper chain is ${helpers.map { it.name }}, expected $expectedHelpers\n$diagnostics"
        )
        assertReturnsMethodCall(configGet, configValue.type, helpers.first().name, label = "${configValue.type}.${configGet.name}()", diagnostics)

        // The key resolver is exact: an enum constant R8 left without a static field of its own is
        // null, never the next constant's field (AUDIO_COMMENT_HEADER_BUTTON_ENABLED used to give
        // APPSFLYER_ENABLED).
        val keyEnum = klass(keyType)
        for (name in FIELDLESS_KEYS) {
            assertEquals(null, keyEnum.enumConstantField(name), "$name has no static field of its own, but resolves to one")
        }
        // Every forced key resolves to its own field: the one whose sput-object follows the
        // constructor call of exactly that name, and no two keys share a field.
        val forcedNames = BETTING_KEYS.keys + ADS_KEYS.keys + TELEMETRY_KEYS.keys + POLLS_KEYS.keys + NEWS_KEYS.keys
        val forcedFields = forcedNames.associateWith { keyEnum.enumConstantField(it) ?: error("$keyType has no field for $it\n$diagnostics") }
        assertEquals(forcedNames.size, forcedFields.values.toSet().size, "two forced keys resolve to the same field")

        // Each helper compares the key against the resolved enum constants and answers with the
        // forced value (behind the Patch settings gate where the patch registers a feature).
        val gates = mapOf(
            BETTING_HELPER to ("flashscore.hide_betting" to BETTING_KEYS),
            POLLS_HELPER to ("flashscore.hide_match_polls" to POLLS_KEYS),
            NEWS_HELPER to ("flashscore.hide_news" to NEWS_KEYS),
        )
        for ((helperName, keys) in listOf(
            BETTING_HELPER to BETTING_KEYS, ADS_HELPER to ADS_KEYS, TELEMETRY_HELPER to TELEMETRY_KEYS,
            POLLS_HELPER to POLLS_KEYS, NEWS_HELPER to NEWS_KEYS,
        )) {
            val helperInsns = helpers.single { it.name == helperName }.instructions()
            // The checks are sget-object/if-eq pairs after the key read; the stock path starts after them.
            var stockStart = 1
            while (helperInsns[stockStart].opcode == Opcode.SGET_OBJECT && helperInsns[stockStart + 1].opcode == Opcode.IF_EQ) stockStart += 2
            val wantedGate = gates[helperName]?.first
            for ((name, expected) in keys) {
                val field = keyEnum.enumConstantField(name)
                    ?: error("$keyType has no $name constant\n$diagnostics")
                val load = helperInsns.indexOfFirst {
                    it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference == field
                }
                assertTrue(load >= 0, "$helperName never loads $name ($field)\n$diagnostics")
                assertTrue(
                    helperInsns.getOrNull(load + 1)?.opcode == Opcode.IF_EQ,
                    "$helperName does not compare the key with $name\n$diagnostics"
                )
                val answerIndex = helperInsns.indexOfInstruction(helperInsns.branchTarget(load + 1))
                    ?: error("$helperName: the branch for $name goes nowhere\n$diagnostics")
                val (forced, gate) = helperInsns.forcedAnswer(answerIndex, stockStart)
                assertTrue(forced == expected, "$helperName answers $name with $forced, expected $expected\n$diagnostics")
                assertEquals(wantedGate, gate, "$helperName gates $name with $gate, expected $wantedGate\n$diagnostics")
            }
        }
        // Every helper but the last hands any other key to the next helper and returns its result.
        for ((helper, next) in helpers.zipWithNext()) {
            val insns = helper.instructions()
            val call = insns.indexOfFirst { it.helperCall()?.name == next.name }
            assertTrue(
                call > 0 && insns.getOrNull(call + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
                    insns.getOrNull(call + 2)?.opcode == Opcode.RETURN_OBJECT,
                "${helper.name} does not fall through to ${next.name}\n$diagnostics"
            )
        }
        // The last one reads the holder exactly like the original get() did.
        val originalGet = original.getValue(configValue.type).methods.single {
            it.returnType == "Ljava/lang/Object;" && it.parameterTypes.isEmpty() && it.implementation != null
        }.instructions()
        val holderRead = (originalGet.first() as ReferenceInstruction).reference
        val holderGet = (originalGet[1] as ReferenceInstruction).reference
        val lastInsns = helpers.last().instructions()
        val fallThrough = lastInsns.indexOfFirst { (it as? ReferenceInstruction)?.reference == holderRead }
        assertTrue(
            fallThrough > 0 && (lastInsns.getOrNull(fallThrough + 1) as? ReferenceInstruction)?.reference == holderGet &&
                lastInsns.getOrNull(fallThrough + 3)?.opcode == Opcode.RETURN_OBJECT,
            "${helpers.last().name} does not fall through to $holderRead + $holderGet\n$diagnostics"
        )

        // No forced key is read past the helper. R8 inlines get() at some call sites as
        // "iget holder; invoke holder.get()" (26.10.2: config factory lambdas and change listeners),
        // which never reaches the helper. Every instance built for a forced key (a call returning
        // the value class with that key constant as its key argument, or the value class's own
        // constructor) is followed through its straight-line code: it must not be read through the
        // holder there, nor handed to a class that does such inlined reads (e.g. a listener).
        val forcedKeyFields = forcedFields.values.toSet()
        fun Instruction.isHolderRead() =
            opcode == Opcode.IGET_OBJECT && (this as ReferenceInstruction).reference == holderRead
        val inlinedReaders = classes.filter { it.type != configValue.type }.flatMap { cls ->
            cls.methods.filter { method ->
                val insns = method.instructions()
                insns.indices.any { i ->
                    insns[i].isHolderRead() && (insns.getOrNull(i + 1) as? ReferenceInstruction)?.reference == holderGet
                }
            }
        }
        // Whole-method matching would be unsound here: one factory lambda (a packed switch) builds
        // many keys, forced ones included, and inlines reads for others. So each forced-key
        // instance is followed from where it is built instead.
        val inlinedReaderClasses = inlinedReaders.map { it.definingClass }.toSet()
        var forcedCreations = 0
        for (method in classes.filter { it.type != configValue.type }.flatMap { it.methods }) {
            val insns = method.instructions()
            for ((i, insn) in insns.withIndex()) {
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                val isConstructor = ref.definingClass == configValue.type && ref.name == "<init>"
                if (ref.returnType != configValue.type && !isConstructor) continue
                val keyIndex = ref.parameterTypes.indexOfFirst { it.toString() == keyType }
                if (keyIndex < 0) continue
                val keyRegister = insn.parameterRegisters(ref)[keyIndex]
                val keyLoad = insns.getOrNull(insns.lastWriteBefore(i, keyRegister))
                if (keyLoad?.opcode != Opcode.SGET_OBJECT || (keyLoad as ReferenceInstruction).reference !in forcedKeyFields) continue
                val (instance, start) = if (isConstructor) {
                    insn.argumentRegisters().first() to i + 1
                } else {
                    val result = insns.getOrNull(i + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } ?: continue
                    (result as OneRegisterInstruction).registerA to i + 2
                }
                forcedCreations++
                val key = ((keyLoad as ReferenceInstruction).reference as FieldReference).name
                val where = "${method.definingClass}.${method.name} (key field $key)"
                for (use in insns.drop(start)) {
                    assertTrue(
                        !(use.isHolderRead() && (use as TwoRegisterInstruction).registerB == instance),
                        "$where reads a forced key's value holder directly\n$diagnostics"
                    )
                    val callee = (use as? ReferenceInstruction)?.reference as? MethodReference
                    if (callee != null && instance in use.argumentRegisters()) {
                        assertTrue(
                            callee.definingClass == configValue.type || callee.definingClass !in inlinedReaderClasses,
                            "$where hands a forced key's value to ${callee.definingClass}, which reads value holders directly\n$diagnostics"
                        )
                    }
                    if ((use.opcode == Opcode.IPUT_OBJECT || use.opcode == Opcode.SPUT_OBJECT) &&
                        (use as OneRegisterInstruction).registerA == instance
                    ) {
                        val field = (use as ReferenceInstruction).reference as FieldReference
                        assertTrue(
                            field.definingClass !in inlinedReaderClasses,
                            "$where stores a forced key's value in ${field.definingClass}, which reads value holders directly\n$diagnostics"
                        )
                    }
                    if (use.opcode.name.startsWith("RETURN") || use.opcode == Opcode.THROW ||
                        use.opcode.name.startsWith("GOTO") ||
                        (use.opcode.setsRegister() && (use as? OneRegisterInstruction)?.registerA == instance)
                    ) break
                }
            }
        }
        // Guards against a vacuous check: the forced keys' instances must actually be found.
        assertTrue(forcedCreations > 0, "no value-class instance built for a forced key was found\n$diagnostics")

        // The sponsored and bonus strips are built with fresh empty lists.
        val sponsoredStrip = classes.singleOrNull { cls ->
            cls.methods.any { it.name == "toString" && it.hasStringStartingWith("SponsoredStripWidgetDTO(sponsoredItems=") }
        } ?: error("no single SponsoredStripWidgetDTO class\n$diagnostics")
        val sponsoredInits = sponsoredStrip.methods.filter {
            it.name == "<init>" && it.parameterTypes.isNotEmpty() && it.params().all { type -> type == ARRAY_LIST }
        }
        assertTrue(sponsoredInits.isNotEmpty(), "${sponsoredStrip.type} has no ArrayList-only constructor\n$diagnostics")
        assertStripHelper(sponsoredStrip)
        for (init in sponsoredInits) {
            val registers = init.implementation!!.registerCount
            assertTrue(
                init.startsWithStripHelper((registers - init.parameterTypes.size until registers).toList()),
                "${sponsoredStrip.type}.<init>(${init.params().joinToString()}) does not replace sponsoredItems first\n$diagnostics"
            )
        }
        // 26.9.2 has (bonuses), 26.10.2 (summaryBonuses, oddsBonuses): every list is replaced.
        val bonusStrip = classes.singleOrNull { cls ->
            cls.methods.any { m -> m.name == "toString" && m.strings().any { it.startsWith("BonusStripWidgetDTO(") } }
        } ?: error("no single BonusStripWidgetDTO class\n$diagnostics")
        val bonusInits = bonusStrip.methods.filter {
            it.name == "<init>" && it.parameterTypes.isNotEmpty() && it.params().all { type -> type == ARRAY_LIST }
        }
        assertTrue(bonusInits.isNotEmpty(), "${bonusStrip.type} has no ArrayList-only constructor\n$diagnostics")
        assertStripHelper(bonusStrip)
        for (init in bonusInits) {
            val registers = init.implementation!!.registerCount
            val params = init.parameterTypes.size
            assertTrue(
                init.startsWithStripHelper((registers - params until registers).toList()),
                "${bonusStrip.type}.<init>(${init.params().joinToString()}) does not replace every bonus list first\n$diagnostics"
            )
        }

        // League pages: the header model's constructor passes its tab set through the helper first.
        val headerModel = classes.singleOrNull { cls ->
            cls.methods.any {
                it.name == "toString" && it.hasStringStartingWith("LeagueDetailHeaderModel(tournamentId=") &&
                    it.hasStringContaining(", detailTabs=")
            }
        } ?: error("no single LeagueDetailHeaderModel class\n$diagnostics")
        val headerInits = headerModel.methods.filter {
            it.name == "<init>" && it.implementation != null && it.params().count { type -> type == SET } == 1
        }
        assertTrue(headerInits.isNotEmpty(), "${headerModel.type} has no constructor with a tab Set\n$diagnostics")
        for (init in headerInits) {
            val insns = init.instructions()
            val sizes = init.params().map { if (it == "J" || it == "D") 2 else 1 }
            val setRegister = init.implementation!!.registerCount - sizes.sum() + sizes.take(init.params().indexOf(SET)).sum()
            val call = insns.firstOrNull() as? RegisterRangeInstruction
            val callRef = (call as? ReferenceInstruction)?.reference as? MethodReference
            assertTrue(
                call?.opcode == Opcode.INVOKE_STATIC_RANGE && call.startRegister == setRegister && call.registerCount == 1 &&
                    callRef?.definingClass == headerModel.type && callRef.name == TABS_HELPER,
                "${headerModel.type}.<init> does not pass the tab set (v$setRegister) to $TABS_HELPER first; got $callRef\n$diagnostics"
            )
            val moveResult = insns.getOrNull(1)
            assertTrue(
                moveResult?.opcode == Opcode.MOVE_RESULT_OBJECT && (moveResult as OneRegisterInstruction).registerA == setRegister,
                "${headerModel.type}.<init> does not store the filtered tab set back in v$setRegister\n$diagnostics"
            )
        }
        // The helper drops the enum constant named ODDS (Enum.name() compared with "ODDS").
        val tabsHelper = headerModel.methods.single { it.name == TABS_HELPER }
        assertTrue(
            tabsHelper.params() == listOf(SET) && tabsHelper.returnType == SET && "ODDS" in tabsHelper.strings() &&
                tabsHelper.calls("Ljava/lang/Enum;", "name") && tabsHelper.calls("Ljava/lang/String;", "equals") &&
                tabsHelper.calls("Ljava/util/Set;", "add"),
            "$TABS_HELPER does not copy the tab set without ODDS\n$diagnostics"
        )
        // The ODDS tab gate: with hide_betting off the helper returns the stock set (const-string id,
        // isEnabled, move-result, if-nez -> the copy below, return-object p0).
        val tabsHelperInsns = tabsHelper.instructions()
        val tabsParam = tabsHelper.implementation!!.registerCount - 1
        val tabsGateCall = (tabsHelperInsns[1] as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            tabsHelperInsns[0].opcode == Opcode.CONST_STRING &&
                (tabsHelperInsns[0] as ReferenceInstruction).reference.let { (it as StringReference).string } == "flashscore.hide_betting" &&
                tabsHelperInsns[1].opcode == Opcode.INVOKE_STATIC_RANGE && tabsGateCall?.definingClass == HEVAL_SETTINGS &&
                tabsGateCall.name == "isEnabled" && tabsHelperInsns[2].opcode == Opcode.MOVE_RESULT &&
                tabsHelperInsns[3].opcode == Opcode.IF_NEZ &&
                tabsHelperInsns[4].opcode == Opcode.RETURN_OBJECT &&
                (tabsHelperInsns[4] as OneRegisterInstruction).registerA == tabsParam &&
                tabsHelperInsns.indexOfInstruction(tabsHelperInsns.branchTarget(3)) == 5,
            "$TABS_HELPER does not return the stock set while hide_betting is off\n$diagnostics"
        )
        // A null set is handed back unchanged: if-nez p0 -> return-object p0.
        assertTrue(
            tabsHelperInsns.getOrNull(5)?.opcode == Opcode.IF_NEZ &&
                (tabsHelperInsns[5] as OneRegisterInstruction).registerA == tabsParam &&
                tabsHelperInsns.getOrNull(6)?.opcode == Opcode.RETURN_OBJECT &&
                (tabsHelperInsns[6] as OneRegisterInstruction).registerA == tabsParam,
            "$TABS_HELPER does not return a null set unchanged\n$diagnostics"
        )
        // The league tab-id enum still has an ODDS constant for the helper to drop.
        val leagueTabEnum = classes.filter { cls ->
            cls.superclass == "Ljava/lang/Enum;" && cls.methods.any {
                it.name == "<clinit>" && it.strings().containsAll(listOf("SUMMARY", "ODDS", "STANDING", "FIXTURES", "RESULTS", "ODDS_PREVIEW"))
            }
        }
        assertTrue(
            leagueTabEnum.size == 1 && leagueTabEnum.single().enumConstantField("ODDS") != null,
            "no single league tab-id enum with an ODDS constant: ${leagueTabEnum.map { it.type }}\n$diagnostics"
        )

        // League summary: the params' constructor loads false right before every isAgeVerified
        // store, so the outright (Winner Odds) widget is never created.
        val summaryParams = classes.singleOrNull { cls ->
            cls.methods.any {
                it.name == "toString" &&
                    it.hasStringStartingWith("LeagueDetailSummaryScreenParams(tournamentId=") &&
                    ", isAgeVerified=" in it.strings()
            }
        } ?: error("no single LeagueDetailSummaryScreenParams class\n$diagnostics")
        val summaryToString = summaryParams.methods.single { it.name == "toString" }.instructions()
        val ageLabel = summaryToString.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ", isAgeVerified="
        }
        val ageVerified = summaryToString.drop(ageLabel + 1).first { it.opcode == Opcode.IGET_BOOLEAN }
            .let { (it as ReferenceInstruction).reference as FieldReference }
        val summaryInits = summaryParams.methods.filter { init ->
            init.name == "<init>" && init.instructions().any {
                it.opcode == Opcode.IPUT_BOOLEAN && (it as ReferenceInstruction).reference == ageVerified
            }
        }
        assertTrue(summaryInits.isNotEmpty(), "no ${summaryParams.type} constructor stores ${ageVerified.name}\n$diagnostics")
        for (init in summaryInits) {
            val insns = init.instructions()
            for ((index, store) in insns.withIndex()) {
                if (store.opcode != Opcode.IPUT_BOOLEAN || (store as ReferenceInstruction).reference != ageVerified) continue
                val register = (store as OneRegisterInstruction).registerA
                // invoke-static/range {vR}, helper; move-result vR; iput-boolean vR.
                val call = insns.getOrNull(index - 2)
                val callRef = (call as? ReferenceInstruction)?.reference as? MethodReference
                val result = insns.getOrNull(index - 1)
                assertTrue(
                    call?.opcode == Opcode.INVOKE_STATIC_RANGE && (call as RegisterRangeInstruction).startRegister == register &&
                        call.registerCount == 1 && callRef?.definingClass == summaryParams.type &&
                        callRef.name == AGE_VERIFIED_HELPER &&
                        result?.opcode == Opcode.MOVE_RESULT && (result as OneRegisterInstruction).registerA == register,
                    "${summaryParams.type}.<init> does not pass v$register through $AGE_VERIFIED_HELPER right before storing " +
                        "isAgeVerified; the previous instructions are ${call?.opcode}, ${result?.opcode}\n$diagnostics"
                )
            }
        }
        // The helper answers its argument while hide_betting is off and false while it is on.
        val ageHelper = summaryParams.methods.single { it.name == AGE_VERIFIED_HELPER }
        val ageInsns = ageHelper.instructions()
        val ageGate = (ageInsns[0] as? ReferenceInstruction)?.reference as? StringReference
        assertTrue(
            ageHelper.params() == listOf("Z") && ageHelper.returnType == "Z" &&
                ageInsns[0].opcode == Opcode.CONST_STRING && ageGate?.string == "flashscore.hide_betting" &&
                ageInsns[3].opcode == Opcode.IF_EQZ &&
                ageInsns[4].opcode == Opcode.CONST_4 && (ageInsns[4] as NarrowLiteralInstruction).narrowLiteral == 0 &&
                ageInsns[5].opcode == Opcode.RETURN && ageInsns[6].opcode == Opcode.RETURN &&
                (ageInsns[6] as OneRegisterInstruction).registerA == ageHelper.implementation!!.registerCount - 1,
            "$AGE_VERIFIED_HELPER is not the hide_betting (Z)Z value helper: ${ageInsns.map { it.opcode }}\n$diagnostics"
        )

        // Disable telemetry (manifest): the collection switches are set on <application>.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("firebase_analytics_collection_deactivated") }
            .firstOrNull() ?: error("no decoded AndroidManifest.xml with the telemetry meta-data under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        fun Element.children(tag: String) =
            getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
        val application = manifest.children("application").single()
        val metaData = application.children("meta-data")
            .filter { it.parentNode == application }
            .groupBy({ it.getAttribute("android:name") }, { it.getAttribute("android:value") })
        for ((name, value) in mapOf(
            "firebase_analytics_collection_deactivated" to "true",
            "firebase_performance_collection_deactivated" to "true",
            "google_analytics_adid_collection_enabled" to "false",
            "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
            "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
        )) {
            check(metaData[name] == listOf(value)) { "meta-data $name is ${metaData[name]}, expected [$value]" }
        }
        // FCM auto-init is not touched (the stock manifest does not set it).
        check("firebase_messaging_auto_init_enabled" !in metaData) { "firebase_messaging_auto_init_enabled was added" }

        // Push must keep working: the app's FirebaseMessagingService (the MESSAGING_EVENT service
        // that is not Firebase's own) is byte-for-byte the same opcode stream as in the stock APK.
        val messagingServices = application.children("service").filter { service ->
            service.children("action").any { it.getAttribute("android:name") == "com.google.firebase.MESSAGING_EVENT" }
        }.map { "L" + it.getAttribute("android:name").replace('.', '/') + ";" }
        val appService = messagingServices.singleOrNull { it != "Lcom/google/firebase/messaging/FirebaseMessagingService;" }
            ?: error("no single app MESSAGING_EVENT service in $messagingServices")
        for (type in listOf(appService, "Lcom/google/firebase/messaging/FirebaseMessagingService;")) {
            val before = original[type] ?: error("$type not in the stock APK")
            val after = klass(type)
            for (name in listOf("onMessageReceived", "onNewToken")) {
                assertTrue(
                    type != appService || after.methods.any { it.name == name },
                    "$type has no $name\n$diagnostics"
                )
            }
            for (method in after.methods) {
                val stock = before.methods.single { it.name == method.name && it.params() == method.params() }
                assertTrue(
                    stock.instructions().map { it.opcode } == method.instructions().map { it.opcode },
                    "$type.${method.name} changed; push handling must stay untouched\n$diagnostics"
                )
            }
        }

        // Use system font: ResourcesCompat.getFont(int, Context) asks SystemFonts first and returns its
        // typeface when it has one; the app's own font families (and their weights) are untouched.
        val getFonts = classes.flatMap { it.methods }.filter { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "Landroid/graphics/Typeface;" &&
                m.parameterTypes.map(CharSequence::toString) == listOf("I", "Landroid/content/Context;") &&
                m.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "isRestricted"
                } == true
        }
        assertTrue(getFonts.size == 1, "ResourcesCompat.getFont candidates: ${getFonts.map { "${it.definingClass}->${it.name}" }}")
        val fontInsns = getFonts.single().instructions()
        val lookup = (fontInsns[0] as? ReferenceInstruction)?.reference as? MethodReference
        assertTrue(
            fontInsns[0].opcode == Opcode.INVOKE_STATIC &&
                lookup?.definingClass == "Lapp/template/extension/flashscore/SystemFonts;" && lookup.name == "typeface" &&
                fontInsns[1].opcode == Opcode.MOVE_RESULT_OBJECT && fontInsns[2].opcode == Opcode.IF_EQZ &&
                fontInsns[3].opcode == Opcode.RETURN_OBJECT,
            "ResourcesCompat.getFont does not ask SystemFonts first: ${fontInsns.take(4).map { it.opcode }}",
        )
        assertTrue(classes.any { it.type == "Lapp/template/extension/flashscore/SystemFonts;" }, "SystemFonts is not merged")

        // Use system font (#128): the app's Bold-text override (the static (Activity)V that reads
        // Configuration.fontWeightAdjustment and writes 1 back) returns at once, and it was the only
        // method in the stock APK that writes the field; nothing writes it any more.
        fun Method.writesFontWeightAdjustment() = instructions().any {
            it.opcode == Opcode.IPUT && ((it as ReferenceInstruction).reference as FieldReference).let { f ->
                f.definingClass == "Landroid/content/res/Configuration;" && f.name == "fontWeightAdjustment"
            }
        }
        val stockWriters = originalClasses(apk).flatMap { it.methods }.filter { it.implementation != null && it.writesFontWeightAdjustment() }
        assertEquals(1, stockWriters.size, "stock fontWeightAdjustment writers: ${stockWriters.map { "${it.definingClass}->${it.name}" }}")
        val stockWriter = stockWriters.single()
        assertTrue(
            AccessFlags.STATIC.isSet(stockWriter.accessFlags) && stockWriter.returnType == "V" && stockWriter.parameterTypes.size == 1,
            "the fontWeightAdjustment writer is no longer a static one-parameter void method",
        )
        val patchedWriter = classes.single { it.type == stockWriter.definingClass }
            .methods.single { it.name == stockWriter.name && it.params() == stockWriter.params() }
        assertReturnsEarlyVoid(patchedWriter, label = "fontWeightAdjustment override ${stockWriter.definingClass}->${stockWriter.name}", diagnostics)
        val leftWriters = classes.flatMap { it.methods }.filter { it.implementation != null && it.writesFontWeightAdjustment() }
        assertTrue(
            leftWriters.all { it.definingClass == stockWriter.definingClass && it.name == stockWriter.name },
            "other methods write fontWeightAdjustment: ${leftWriters.map { "${it.definingClass}->${it.name}" }}",
        )

        // Use system font (styles): the decoded text appearances and layouts no longer name the
        // custom families, and the weight mapping uses the system families.
        val styles = workDir.walkTopDown()
            .singleOrNull { it.name == "styles.xml" && it.parentFile.name == "values" }
            ?: error("res/values/styles.xml was not decoded under $workDir")
        val stylesDoc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(styles)
        val fontItems = stylesDoc.getElementsByTagName("item").let { items ->
            (0 until items.length).map { items.item(it) as Element }
        }.filter { it.getAttribute("name") in setOf("android:fontFamily", "fontFamily") }
        assertTrue(fontItems.isNotEmpty(), "styles.xml has no fontFamily items")
        val customLeft = fontItems.filter { it.textContent.trim().startsWith("@font/") }
        assertTrue(customLeft.isEmpty(), "${customLeft.size} text appearances still name a custom font")
        assertTrue(
            fontItems.map { it.textContent.trim() }.any { it.startsWith("sans-serif") },
            "styles.xml fontFamily items are not system families: ${fontItems.map { it.textContent.trim() }.distinct()}",
        )
        val layoutFonts = workDir.walkTopDown()
            .filter { it.parentFile?.name == "layout" && it.extension == "xml" }
            .flatMap { file ->
                val nodes = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file)
                    .getElementsByTagName("*")
                (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }.flatMap { element ->
                    val attributes = element.attributes
                    (0 until attributes.length).map { attributes.item(it) }.filter { it.nodeName.endsWith("fontFamily") }
                }
            }
            .map { it.nodeValue }
        assertTrue(layoutFonts.none { it.startsWith("@font/") }, "layouts still name a custom font: $layoutFonts")
        // The three layouts that set a custom family inline were decoded and now use system families
        // (the v2.3.0-dev.1 check passed vacuously because no layout was decoded).
        for (name in listOf("duel_detail_header_with_tabs.xml", "fragment_event_participant_page_squad_row.xml", "tooltip_with_tip.xml")) {
            val file = workDir.walkTopDown().singleOrNull { it.name == name && it.parentFile?.name == "layout" }
                ?: error("$name was not decoded under $workDir")
            val fonts = Regex("""fontFamily="([^"]+)"""").findAll(file.readText()).map { it.groupValues[1] }.toList()
            assertTrue(fonts.isNotEmpty() && fonts.all { it.startsWith("sans-serif") }, "$name font families: $fonts")
        }

        // Spoof signature: the extension returns Flashscore's package and original certificate,
        // and every PackageManager.getPackageInfo(String, ...) call is routed through it.
        assertSpoofSignature(classes, PKG, SIGNATURE_SHA1)

        // Patch settings: the Settings screen calls the row entry right after setContentView.
        val settings = classes.singleOrNull { it.type == "Leu/livesport/LiveSport_cz/view/settings/SettingsActivity;" }
            ?: error("SettingsActivity not found")
        val onCreate = settings.method("onCreate", listOf("Landroid/os/Bundle;"))
        val entryCall = onCreate.instructions().withIndex().singleOrNull { (_, insn) ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lapp/template/extension/flashscore/HevalControlsEntry;" && ref.name == "addRow"
        } ?: error("SettingsActivity.onCreate does not call HevalControlsEntry.addRow")
        val setContentView = onCreate.instructions().withIndex().singleOrNull { (_, insn) ->
            (insn as? ReferenceInstruction)?.reference.let { (it as? MethodReference)?.name == "setContentView" }
        } ?: error("SettingsActivity.onCreate has no setContentView")
        assertTrue(
            entryCall.index == setContentView.index + 1,
            "addRow is at ${entryCall.index}, not directly after setContentView at ${setContentView.index}",
        )

        // The "Patch settings" row itself is a resource patch; its decoded layout is not asserted
        // here because the harness reads the patcher's decode cache, which a later resource patch
        // can reset depending on execution order. The CLI run (aapt2: the include and the
        // re-constrained version label) and the emulator check cover it.
        // Animation speed: App.onCreate initialises the hooks right after super.onCreate, the
        // Compose duration-scale read goes through the extension, and both features are in the
        // Patch settings registry.
        val app = classes.singleOrNull { it.type == "Leu/livesport/LiveSport_cz/App;" } ?: error("App class not found")
        val appOnCreate = app.method("onCreate", emptyList())
        val appInsns = appOnCreate.instructions()
        val superIndex = appInsns.indexOfFirst {
            (it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE) &&
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "onCreate"
        }
        val initCall = appInsns.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lapp/template/extension/flashscore/AnimationSpeed;" && ref.name == "init"
        }
        assertEquals(superIndex + 1, initCall, "AnimationSpeed.init is not directly after super.onCreate")

        fun Instruction.callsAnimationScale() = (this as? ReferenceInstruction)?.reference.let { reference ->
            val ref = reference as? MethodReference
            ref?.definingClass == "Lapp/template/extension/flashscore/AnimationSpeed;" && ref.name == "durationScale"
        }
        fun Instruction.readsValueAnimatorScale() = (this as? ReferenceInstruction)?.reference.let { reference ->
            val ref = reference as? MethodReference
            ref?.definingClass == "Landroid/animation/ValueAnimator;" && ref.name == "getDurationScale"
        }
        val scaleCalls = classes.filterNot { it.type.startsWith("Lapp/template/extension/") }
            .flatMap { it.methods }.filter { it.implementation != null }
            .flatMap { it.instructions() }
            .count { it.callsAnimationScale() }
        val directReads = classes.filterNot { it.type.startsWith("Lapp/template/extension/") }
            .flatMap { it.methods }.filter { it.implementation != null }
            .flatMap { it.instructions() }
            .count { it.readsValueAnimatorScale() }
        assertTrue(scaleCalls > 0, "no duration-scale read goes through AnimationSpeed")
        assertEquals(0, directReads, "a ValueAnimator.getDurationScale read is left outside the extension")

        // Spoiler-free mode (2026-11-14): the duel row binder (found by the patch's shape) calls
        // SpoilerFree.unmaskRow(p2) first and SpoilerFree.maskRow(p1, p2) right before its only
        // return-void; the three push validators return false at entry for a marked event id; the
        // stub accessors are rewritten with the resolved R8 fields.
        fun Instruction.callsSpoiler(name: String) =
            ((this as? ReferenceInstruction)?.reference as? MethodReference)?.let { it.definingClass == SPOILER_FREE && it.name == name } == true
        fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference
        val spoiler = klass(SPOILER_FREE)
        val appClasses = classes.filterNot { it.type.startsWith("Lapp/template/extension/") }
        val binders = appClasses.flatMap { c -> c.methods.map { c to it } }.filter { (_, m) ->
            m.returnType == "V" && m.implementation != null && !AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.params().size == 2 && m.params()[1] == DUEL_HOLDER && !m.params()[0].startsWith("Ljava/")
        }
        assertEquals(1, binders.size, "expected one (row, EventListDuelHolder)V binder, found ${binders.map { "${it.first.type}->${it.second.name}" }}")
        val binder = binders.single().second
        val binderInsns = binder.instructions()
        val binderRegs = binder.implementation!!.registerCount
        assertEquals(Opcode.RETURN_VOID, binderInsns.last().opcode)
        assertEquals(1, binderInsns.count { it.opcode == Opcode.RETURN_VOID }, "the binder gained a return-void")
        val maskCall = binderInsns[binderInsns.size - 2]
        assertTrue(
            maskCall.opcode == Opcode.INVOKE_STATIC_RANGE && maskCall.callsSpoiler("maskRow") &&
                (maskCall as RegisterRangeInstruction).startRegister == binderRegs - 2 && maskCall.registerCount == 2,
            "SpoilerFree.maskRow(p1, p2) is not right before the binder's return-void",
        )
        val unmaskCall = binderInsns.first()
        assertTrue(
            unmaskCall.opcode == Opcode.INVOKE_STATIC_RANGE && unmaskCall.callsSpoiler("unmaskRow") &&
                (unmaskCall as RegisterRangeInstruction).startRegister == binderRegs - 1 && unmaskCall.registerCount == 1,
            "SpoilerFree.unmaskRow(p2) is not the binder's first instruction",
        )
        assertEquals(2, binderInsns.count { it.callsSpoiler("maskRow") || it.callsSpoiler("unmaskRow") }, "extra SpoilerFree calls in the binder")

        fun classByToString(prefix: String) = appClasses.filter { c ->
            c.methods.any { it.name == "toString" && it.implementation != null && it.strings().any { s -> s.startsWith(prefix) } }
        }.also { assertEquals(1, it.size, "classes with toString \"$prefix\": ${it.map { c -> c.type }}") }.single()
        val eventModel = classByToString(EVENT_MODEL_TO_STRING)
        val config = classByToString(CONFIG_TO_STRING)
        val configToString = config.method("toString", emptyList()).instructions()
        val eventIdAt = configToString.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == CONFIG_EVENT_ID }
        assertTrue(eventIdAt >= 0, "NotificationConfig.toString has no \"$CONFIG_EVENT_ID\"")
        val configEventId = configToString.drop(eventIdAt + 1).firstNotNullOf { insn ->
            ((insn as? ReferenceInstruction)?.reference as? FieldReference)
                ?.takeIf { insn.opcode == Opcode.IGET_OBJECT && it.definingClass == config.type && it.type == "Ljava/lang/String;" }
        }

        val eventIdStub = spoiler.method("eventId", listOf("Ljava/lang/Object;")).instructions()
        assertTrue(
            eventIdStub.size >= 4 && eventIdStub[0].opcode == Opcode.CHECK_CAST &&
                eventIdStub[1].fieldRef()?.let { it.definingClass == binder.params()[0] && it.type == eventModel.type } == true &&
                eventIdStub[2].fieldRef()?.let { it.definingClass == eventModel.type && it.type == "Ljava/lang/String;" } == true &&
                eventIdStub[3].opcode == Opcode.RETURN_OBJECT,
            "SpoilerFree.eventId was not rewritten to read the row's EventModel id",
        )
        val highlightStub = spoiler.method("highlightView", listOf("Ljava/lang/Object;"))
        assertTrue(highlightStub.calls(DUEL_HOLDER, "getHighlighterHolder"), "SpoilerFree.highlightView was not rewritten")
        val styleStub = spoiler.method("neutralNameStyle", emptyList()).instructions()
        val neutralStyle = (styleStub.first() as? NarrowLiteralInstruction)?.narrowLiteral ?: 0
        assertTrue(styleStub.first().opcode == Opcode.CONST && neutralStyle != 0, "SpoilerFree.neutralNameStyle was not rewritten")

        for (type in PUSH_HANDLERS) {
            val isValid = klass(type).method("isValid", listOf(config.type))
            val gate = isValid.instructions().take(10)
            assertTrue(
                ((gate.first() as? ReferenceInstruction)?.reference as? StringReference)?.string == SPOILER_NOTIFICATIONS.id &&
                    gate.any { it.opcode == Opcode.IGET_OBJECT && it.fieldRef() == configEventId } &&
                    gate.any { it.callsSpoiler("blocksPush") },
                "$type.isValid does not start with the spoiler-free push gate on ${configEventId.name}",
            )
        }

        // The push id field is also the String field HandlerEventDuel.isValid logs as "eventId:".
        assertTrue(
            klass(PUSH_HANDLERS.first()).method("isValid", listOf(config.type)).instructions()
                .count { it.opcode == Opcode.IGET_OBJECT && it.fieldRef() == configEventId } >= 2,
            "HandlerEventDuel.isValid does not read ${configEventId.name} in its stock code besides the gate",
        )
        // Every kept member SpoilerFree reaches by reflection is public (getMethod/getField see only those).
        fun assertPublicGetter(type: String, name: String): String {
            val m = klass(type).methods.singleOrNull { it.name == name && it.parameterTypes.isEmpty() }
            assertTrue(m != null && AccessFlags.PUBLIC.isSet(m.accessFlags), "$type.$name() is missing or not public")
            return m!!.returnType
        }
        assertPublicGetter(DUEL_HOLDER, "getRoot")
        val eventViewType = assertPublicGetter(DUEL_HOLDER, "getEventViewHolder")
        for (name in listOf("homeName", "awayName")) {
            val field = klass(eventViewType).fields.singleOrNull { it.name == name }
            assertTrue(field != null && AccessFlags.PUBLIC.isSet(field.accessFlags), "$eventViewType.$name is missing or not public")
        }
        assertPublicGetter(assertPublicGetter(DUEL_HOLDER, "getEventExtraRowHolder"), "getExtraRowLayout")
        val indicatorsType = assertPublicGetter(DUEL_HOLDER, "getEventListIndicatorsHolder")
        assertPublicGetter(indicatorsType, "getRedCardsHome")
        assertPublicGetter(indicatorsType, "getRedCardsAway")
        // The mask reaches the extra row and the red cards through those getters.
        val spoilerStrings = spoiler.methods.filter { it.implementation != null }.flatMap { it.strings() }
        for (name in listOf("getEventExtraRowHolder", "getExtraRowLayout", "getEventListIndicatorsHolder", "getRedCardsHome", "getRedCardsAway")) {
            assertTrue(name in spoilerStrings, "SpoilerFree no longer names $name")
        }
        // Row taps keep working (2026-11-14 emulator regression): rows made long-clickable without a
        // click listener of their own get one that forwards the tap to the list's item click, and the
        // install checks for an existing listener first.
        val spoilerNested = classes.filter { it.type.startsWith(SPOILER_FREE.removeSuffix(";") + "$") }
        assertTrue(
            spoilerNested.any { c ->
                c.interfaces.contains("Landroid/view/View\$OnClickListener;") &&
                    c.methods.any { it.implementation != null && it.calls("Landroid/widget/AbsListView;", "performItemClick") }
            },
            "SpoilerFree has no OnClickListener that forwards the tap to AbsListView.performItemClick",
        )
        val install = spoiler.method("installListeners", listOf("Landroid/view/View;", SPOILER_FREE.removeSuffix(";") + "\$Row;"))
        assertTrue(
            install.calls("Landroid/view/View;", "hasOnClickListeners") && install.calls("Landroid/view/View;", "setOnLongClickListener"),
            "SpoilerFree.installListeners no longer checks for an existing click listener",
        )

        // Hide competitions (2026-11-14, stage B2): the event filter (the only method with "FILTER_EVENTS: ")
        // calls CompetitionFilter.filterEvents(filter, list) right after it casts its list filter out of p0's
        // field; the returned list (one new ArrayList) is the call's second argument and every return-object
        // comes after it. The stubs read the resolved R8 fields; the row dialog offers the competition entry.
        fun Instruction.callsCompetition(name: String) =
            ((this as? ReferenceInstruction)?.reference as? MethodReference)?.let { it.definingClass == COMPETITION_FILTER && it.name == name } == true
        val filterMethods = appClasses.flatMap { c -> c.methods.filter { m -> m.implementation != null && FILTER_EVENTS_LOG in m.strings() } }
        assertEquals(1, filterMethods.size, "methods with \"$FILTER_EVENTS_LOG\": ${filterMethods.map { "${it.definingClass}->${it.name}" }}")
        val eventFilter = filterMethods.single()
        val filterInsns = eventFilter.instructions()
        val filterP0 = eventFilter.implementation!!.registerCount - 1
        val hookAt = filterInsns.indexOfFirst { it.callsCompetition("filterEvents") }
        assertEquals(1, filterInsns.count { it.callsCompetition("filterEvents") }, "expected one CompetitionFilter.filterEvents call")
        val hook = filterInsns[hookAt] as FiveRegisterInstruction
        val returnsAt = filterInsns.indices.filter { filterInsns[it].opcode == Opcode.RETURN_OBJECT }
        assertEquals(2, returnsAt.size, "the event filter's return-objects changed")
        val returned = returnsAt.map { (filterInsns[it] as OneRegisterInstruction).registerA }.toSet().single()
        val castBefore = filterInsns[hookAt - 1]
        assertTrue(
            hook.registerCount == 2 && hook.registerC == filterP0 && hook.registerD == returned &&
                castBefore.opcode == Opcode.CHECK_CAST && (castBefore as OneRegisterInstruction).registerA == filterP0 &&
                returnsAt.all { it > hookAt },
            "CompetitionFilter.filterEvents(p0, v$returned) is not right after the filter cast, before every return-object",
        )
        assertTrue(
            filterInsns.take(hookAt).any { it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == "Ljava/util/ArrayList;" &&
                (it as OneRegisterInstruction).registerA == returned },
            "the returned list is not a new ArrayList made before the hook",
        )
        val filterType = ((castBefore as ReferenceInstruction).reference as TypeReference).type
        val competition = klass(COMPETITION_FILTER)
        val entityType = classByToString(EVENT_ENTITY_TO_STRING).type
        val leagueType = classByToString(LEAGUE_MODEL_TO_STRING).type
        val isEventStub = competition.method("isEvent", listOf("Ljava/lang/Object;")).instructions()
        assertTrue(
            isEventStub[0].opcode == Opcode.INSTANCE_OF && ((isEventStub[0] as ReferenceInstruction).reference as TypeReference).type == entityType &&
                isEventStub[1].opcode == Opcode.RETURN,
            "CompetitionFilter.isEvent was not rewritten",
        )
        fun assertReadStub(name: String, owner: String, fieldType: String? = null): FieldReference {
            val body = competition.method(name, listOf("Ljava/lang/Object;")).instructions()
            val field = body.getOrNull(1)?.fieldRef()
            assertTrue(
                body[0].opcode == Opcode.CHECK_CAST && body[1].opcode == Opcode.IGET_OBJECT && field?.definingClass == owner &&
                    (fieldType == null || field.type == fieldType) && body[2].opcode == Opcode.RETURN_OBJECT,
                "CompetitionFilter.$name was not rewritten to read a $owner field",
            )
            return field!!
        }
        assertReadStub("eventModel", entityType, eventModel.type)
        val holderType = assertReadStub("leagueHolder", eventModel.type).type
        assertReadStub("league", holderType, leagueType)
        val leagueFields = listOf("leagueId", "leagueTemplateId", "leagueName", "leaguePrefix", "leagueTitle")
            .map { assertReadStub(it, leagueType, "Ljava/lang/String;").name }
        assertEquals(5, leagueFields.toSet().size, "the league id, template id and name stubs read the same field: $leagueFields")
        // The header name parts are the fields the league holder's key switch stores NAME_PART_1/NAME_PART_2 in
        // (they are what the app passes to LeagueRowModel as prefix and leagueName).
        val holderSwitch = klass(holderType).methods.single { m ->
            m.implementation != null && m.instructions().any { it.opcode == Opcode.PACKED_SWITCH } &&
                m.instructions().any { it.opcode == Opcode.CHECK_CAST }
        }
        val storedFields = holderSwitch.instructions().mapNotNull { it.fieldRef()?.takeIf { f -> it.opcode == Opcode.IPUT_OBJECT && f.definingClass == leagueType }?.name }.toSet()
        assertTrue(storedFields.containsAll(leagueFields.drop(1)), "the name/template stubs read fields the key switch never stores: $leagueFields vs $storedFields")
        val typeField = assertReadStub("filterType", filterType)
        assertTrue(
            klass(typeField.type).methods.any { m -> m.name == "<clinit>" && "FILTER_MYFS" in m.strings() },
            "the filter's type field ${typeField.type} is not the enum with FILTER_MYFS",
        )
        val rowModelStub = spoiler.method("eventModel", listOf("Ljava/lang/Object;")).instructions()
        assertTrue(
            rowModelStub[0].opcode == Opcode.CHECK_CAST && rowModelStub[1].fieldRef()?.type == eventModel.type &&
                rowModelStub[2].opcode == Opcode.RETURN_OBJECT,
            "SpoilerFree.eventModel was not rewritten",
        )
        // The dialog entry: the shared action list adds CompetitionFilter's toggle when its switch is on.
        assertTrue(
            spoiler.method("actions", emptyList()).instructions().any { insn ->
                ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let { it.definingClass == COMPETITION_FILTER && it.name == "TOGGLE" } == true
            },
            "SpoilerFree.actions() does not offer the competition entry",
        )
        val competitionStrings = classes.filter { it.type.startsWith(COMPETITION_FILTER.removeSuffix(";")) }
            .flatMap { c -> c.methods.filter { it.implementation != null }.flatMap { it.strings() } }
        for (text in listOf("Hide this competition", "Show this competition", "flashscore.hidden_competitions", "FILTER_MYFS")) {
            assertTrue(text in competitionStrings, "CompetitionFilter no longer has \"$text\"")
        }

        val registry = classes.singleOrNull { it.type == "Lapp/template/extension/hevalcontrols/Registry;" }
            ?: error("Registry class not merged")
        val encoded = registry.method("encoded", emptyList()).instructions()
            .mapNotNull { insn ->
                ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string
            }
            .singleOrNull { it.startsWith("hevalcontrols-registry:") }
            ?: error("Registry.encoded() was not rewritten")
        for (id in listOf("flashscore.animations_off", "flashscore.animations_fast")) {
            assertTrue(id in encoded, "Patch settings registry has no $id")
        }
        // The registry lists exactly the Flashscore features (any record order: execution order),
        // the betting, polls and news switches among them with their category and restart flag.
        val wantedRegistry = HevalRegistryCodec.encode(
            ANIMATION_FEATURES + listOf(
                BLOCK_MARKETING_NOTIFICATIONS, HIDE_BETTING, HIDE_MATCH_POLLS, HIDE_NEWS, AMOLED_BLACK,
            ) + SPOILER_FEATURES + COMPETITION_FEATURES,
        ).split('\n')
        val gotRegistry = encoded.split('\n')
        assertTrue(
            gotRegistry.first() == wantedRegistry.first() && gotRegistry.size == wantedRegistry.size &&
                gotRegistry.toSet() == wantedRegistry.toSet(),
            "Registry.encoded() is\n${gotRegistry.joinToString("\n")}\nexpected (any order)\n${wantedRegistry.joinToString("\n")}",
        )
        for (feature in listOf(HIDE_BETTING, HIDE_MATCH_POLLS, HIDE_NEWS)) {
            assertTrue(feature.restartRequired && feature.default, "${feature.id} must be a restart-required switch that starts on")
        }
        assertEquals("Betting and promotions", HIDE_BETTING.category)

        // AMOLED black (2026-11-14): the night entries of the decoded values-night/colors.xml are
        // pure black (build-time only, a read-only row in Patch settings); the elevated fills and
        // the borders keep their stock values. The light values are compared with aapt2 (CLI check).
        assertTrue(AMOLED_BLACK.buildTimeOnly, "flashscore.amoled_black must be a build-time-only row")
        val nightColors = workDir.walkTopDown().singleOrNull { it.name == "colors.xml" && it.parentFile.name == "values-night" }
            ?: error("res/values-night/colors.xml was not decoded under $workDir")
        val nightDoc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(nightColors)
        val nightValues = nightDoc.getElementsByTagName("color").let { nodes ->
            (0 until nodes.length).associate { index ->
                val node = nodes.item(index) as Element
                node.getAttribute("name") to node.textContent.trim().lowercase()
                    .let { if (it.length == 9 && it.startsWith("#ff")) "#" + it.substring(3) else it }
            }
        }
        for (name in listOf(
            "background_primary", "background_dualTone", "background_secondary", "background_dialog",
            "background_highlight", "background_input", "background_base", "navigationHeader_primary",
            "modalContent_primary", "tab_bg", "event_info_background_non_live",
        )) {
            assertEquals("#000000", nightValues[name], "AMOLED black: $name")
        }
        assertEquals("#213d46", nightValues["background_baseAlt"], "background_baseAlt stays elevated")
        // Borders, dividers and tints that follow the recolored colors keep their stock shade at night.
        assertEquals("#0f2d37", nightValues["participant_logo_border"], "participant_logo_border")
        assertEquals("#001e28", nightValues["fs_support_1"], "fs_support_1")

        // Force edge-to-edge: every navigation-bar colour write is preceded by a zero constant in
        // the register the call passes, so the bar is transparent (the status bar is untouched).
        fun Instruction.navigationColour() = (this as? ReferenceInstruction)?.reference.let { reference ->
            val ref = reference as? MethodReference
            ref?.definingClass == "Landroid/view/Window;" && ref.name == "setNavigationBarColor"
        }
        var edgeSites = 0
        for (cls in classes) {
            for (method in cls.methods) {
                if (method.implementation == null) continue
                val insns = method.instructions()
                insns.forEachIndexed { index, insn ->
                    if (!insn.navigationColour()) return@forEachIndexed
                    val colour = (insn as FiveRegisterInstruction).registerD
                    val previous = insns.getOrNull(index - 1)
                    assertTrue(
                        previous is NarrowLiteralInstruction && previous.opcode == Opcode.CONST_16 &&
                            previous.narrowLiteral == 0 && (previous as OneRegisterInstruction).registerA == colour,
                        "${cls.type}->${method.name}: the navigation bar colour is not forced transparent",
                    )
                    edgeSites++
                }
            }
        }
        assertTrue(edgeSites > 0, "no navigation-bar colour write was patched")
        // Android 15+: the content view gets the navigation-bar strip right after its lookup.
        val eventList = classes.single { it.type == "Leu/livesport/LiveSport_cz/EventListActivity;" }
            .methods.single { it.name == "onCreate" && it.parameterTypes.size == 1 }.instructions()
        val contentAt = eventList.indexOfFirst { (it as? NarrowLiteralInstruction)?.narrowLiteral == 0x01020002 }
        val strip = eventList.getOrNull(contentAt + 3)
        assertTrue(
            strip?.opcode == Opcode.INVOKE_STATIC_RANGE &&
                ((strip as ReferenceInstruction).reference as MethodReference).let {
                    it.definingClass == "Lapp/template/extension/flashscore/NavigationBarStrip;" && it.name == "install"
                } &&
                (strip as RegisterRangeInstruction).startRegister == (eventList[contentAt + 2] as OneRegisterInstruction).registerA,
            "EventListActivity.onCreate does not install the navigation-bar strip on the content view",
        )

        // Block marketing notifications: HandlerInfo.process starts with the Heval gate that
        // returns at once while the switch is on; the stock body stays after the gate's label.
        val handlerInfo = classes.singleOrNull { it.type == "Leu/livesport/notification/handler/HandlerInfo;" }
            ?: error("HandlerInfo not found")
        val process = handlerInfo.methods.single {
            it.name == "process" && it.parameterTypes.size == 2 && it.parameterTypes[0].toString() == "Landroid/content/Context;"
        }
        val processInsns = process.instructions()
        assertTrue(
            processInsns[0].opcode == Opcode.CONST_STRING &&
                ((processInsns[0] as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                "flashscore.block_marketing_notifications",
            "HandlerInfo.process does not start with the marketing gate",
        )
        assertTrue(
            processInsns.any { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lapp/template/extension/hevalcontrols/HevalSettings;" && ref.name == "isEnabled"
            },
            "HandlerInfo.process has no HevalSettings.isEnabled call",
        )
        assertTrue(processInsns.any { it.opcode == Opcode.RETURN_VOID }, "HandlerInfo.process lost its stock body")
    }
}



