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
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val TABS_HELPER = "morpheWithoutOddsTab"
private const val SET = "Ljava/util/Set;"

private val FLASHSCORE_PATCHES = setOf(
    "Block marketing popups",
    "Disable ads",
    "Disable rating prompts",
    "Disable telemetry",
    "Disable update prompts",
    "Hide betting content",
)

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

    /**
     * The static field of enum constant [name], found the way the patch finds it: const-string
     * NAME -> invoke-direct <init> with NAME as first argument -> sput-object of that instance.
     */
    private fun ClassDef.enumConstantField(name: String): FieldReference? {
        val insns = methods.singleOrNull { it.name == "<clinit>" }?.instructions() ?: return null
        val nameIndex = insns.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == name
        }
        if (nameIndex < 0) return null
        val nameRegister = (insns[nameIndex] as OneRegisterInstruction).registerA
        val initIndex = (nameIndex + 1 until insns.size).firstOrNull { i ->
            val ref = (insns[i] as? ReferenceInstruction)?.reference as? MethodReference
            val insn = insns[i]
            ref?.definingClass == type && ref.name == "<init>" && when (insn) {
                is FiveRegisterInstruction -> insn.registerD == nameRegister
                is RegisterRangeInstruction -> insn.startRegister + 1 == nameRegister
                else -> false
            }
        } ?: return null
        val instance = when (val init = insns[initIndex]) {
            is FiveRegisterInstruction -> init.registerC
            else -> (init as RegisterRangeInstruction).startRegister
        }
        return (initIndex + 1 until insns.size).asSequence()
            .map { insns[it] }
            .filter { it.opcode == Opcode.SPUT_OBJECT && (it as OneRegisterInstruction).registerA == instance }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .firstOrNull { it.definingClass == type && it.type == type }
    }

    /** The instruction an if-* at [index] jumps to. */
    private fun List<Instruction>.branchTarget(index: Int): Instruction? {
        val addresses = runningFold(0) { address, insn -> address + insn.codeUnits }
        val target = addresses[index] + (this[index] as OffsetInstruction).codeOffset
        return getOrNull(addresses.indexOf(target))
    }

    /** True when the constructor starts with `new-instance pN, ArrayList` + `<init>()` for [registers]. */
    private fun Method.startsWithNewArrayLists(registers: List<Int>): Boolean {
        val insns = instructions()
        return registers.withIndex().all { (i, register) ->
            val newInstance = insns.getOrNull(2 * i)
            val init = insns.getOrNull(2 * i + 1)
            val initRef = (init as? ReferenceInstruction)?.reference as? MethodReference
            newInstance?.opcode == Opcode.NEW_INSTANCE &&
                (newInstance as OneRegisterInstruction).registerA == register &&
                ((newInstance as ReferenceInstruction).reference as TypeReference).type == ARRAY_LIST &&
                init != null && init.argumentRegisters().firstOrNull() == register &&
                initRef?.definingClass == ARRAY_LIST && initRef.name == "<init>" && initRef.parameterTypes.isEmpty()
        }
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
            version = "26.10.2",
            patchNames = FLASHSCORE_PATCHES,
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        val diagnostics = "emitted classes=${classes.size}"

        fun klass(type: String) = byType[type] ?: error("$type not found in emitted dexes\n$diagnostics")

        // Disable ads: SDK initialization is a no-op.
        val mobileAds = klass(SDK + "MobileAds;")
        val initialize = mobileAds.methods.first {
            it.name == "initialize" && it.parameterTypes.size == 2
        }
        assertReturnsEarlyVoid(initialize, label = "MobileAds.initialize(Context, InitializationConfig)")
        // Rule 9: the next-gen setters that throw without init return at once, on MobileAds and
        // on its Companion (which the Kotlin statics delegate to).
        for (type in listOf(SDK + "MobileAds;", SDK + "MobileAds\$Companion;")) {
            for ((name, parameters) in listOf(
                "setRequestConfiguration" to listOf(SDK + "common/RequestConfiguration;"),
                "setUserMutedApp" to listOf("Z"),
                "setUserControlledAppVolume" to listOf("F"),
            )) {
                assertReturnsEarlyVoid(
                    klass(type).method(name, parameters),
                    label = "${type.substringAfterLast('/')}.$name(${parameters.joinToString()})",
                )
            }
        }

        // Preloading reports failure and never hands out an ad.
        val preloader = klass(SDK + "banner/BannerAdPreloader;")
        val start = preloader.methods.first {
            it.name == "start" && it.parameterTypes.size == 2 && it.returnType == "Z"
        }
        assertForcedBoolean(start, expected = false, label = "BannerAdPreloader.start(String, PreloadConfiguration)")

        // Direct interstitial loads are a no-op.
        val interstitial = klass(SDK + "interstitial/InterstitialAd;")
        val load = interstitial.methods.first {
            it.name == "load" && it.returnType == "V"
        }
        assertReturnsEarlyVoid(load, label = "InterstitialAd.load(request, callback)")

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

        // Block marketing popups: the remote dialog reports "not shown".
        val remoteDialog = classes.flatMap { it.methods }.single {
            it.returnType == "Z" && it.params() == listOf(EVENT_LIST_ACTIVITY) && "btnGoUrl" in it.strings()
        }
        assertForcedBoolean(remoteDialog, expected = false, label = "remote dialog ${remoteDialog.definingClass}.${remoteDialog.name}", diagnostics)

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

        // Hide betting content: the remote-config value's get() returns the helper's result.
        val configValue = classes.singleOrNull { cls ->
            cls.methods.any { it.name == "<init>" && it.hasStringStartingWith("USER_PREFS_CONFIG_KEY-") }
        } ?: error("no single class with 'USER_PREFS_CONFIG_KEY-' in a constructor\n$diagnostics")
        val keyType = configValue.methods.single {
            it.name == "<init>" && it.hasStringStartingWith("USER_PREFS_CONFIG_KEY-")
        }.params()[1]
        val configGet = configValue.methods.single {
            it.returnType == "Ljava/lang/Object;" && it.parameterTypes.isEmpty() && it.implementation != null
        }
        assertReturnsMethodCall(configGet, configValue.type, BETTING_HELPER, label = "${configValue.type}.${configGet.name}()", diagnostics)

        // The helper compares the key against the resolved enum constants and answers with the
        // forced value; otherwise it reads the holder exactly like the original get() did.
        val helper = configValue.methods.single { it.name == BETTING_HELPER }
        val helperInsns = helper.instructions()
        val keyEnum = klass(keyType)
        for ((name, expected) in BETTING_KEYS) {
            val field = keyEnum.enumConstantField(name)
                ?: error("$keyType has no $name constant\n$diagnostics")
            val load = helperInsns.indexOfFirst {
                it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference == field
            }
            assertTrue(load >= 0, "$BETTING_HELPER never loads $name ($field)\n$diagnostics")
            assertTrue(
                helperInsns.getOrNull(load + 1)?.opcode == Opcode.IF_EQ,
                "$BETTING_HELPER does not compare the key with $name\n$diagnostics"
            )
            val answer = helperInsns.branchTarget(load + 1)
            val answerRef = (answer as? ReferenceInstruction)?.reference
            val forced = when {
                answerRef is FieldReference && answerRef.definingClass == "Ljava/lang/Boolean;" -> answerRef.name
                answerRef is StringReference && answerRef.string.isEmpty() -> "EMPTY_STRING"
                answerRef is MethodReference && answerRef.definingClass == "Ljava/util/Collections;" &&
                    answerRef.name == "emptyList" -> "EMPTY_LIST"
                else -> "$answer $answerRef"
            }
            assertTrue(forced == expected, "$BETTING_HELPER answers $name with $forced, expected $expected\n$diagnostics")
        }
        val originalGet = original.getValue(configValue.type).methods.single {
            it.returnType == "Ljava/lang/Object;" && it.parameterTypes.isEmpty() && it.implementation != null
        }.instructions()
        val holderRead = (originalGet.first() as ReferenceInstruction).reference
        val holderGet = (originalGet[1] as ReferenceInstruction).reference
        val fallThrough = helperInsns.indexOfFirst { (it as? ReferenceInstruction)?.reference == holderRead }
        assertTrue(
            fallThrough > 0 && (helperInsns.getOrNull(fallThrough + 1) as? ReferenceInstruction)?.reference == holderGet &&
                helperInsns.getOrNull(fallThrough + 3)?.opcode == Opcode.RETURN_OBJECT,
            "$BETTING_HELPER does not fall through to $holderRead + $holderGet\n$diagnostics"
        )

        // No forced key is read past the helper. R8 inlines get() at some call sites as
        // "iget holder; invoke holder.get()" (26.10.2: config factory lambdas and change listeners),
        // which never reaches the helper. Every instance built for a forced key (a call returning
        // the value class with that key constant as its key argument, or the value class's own
        // constructor) is followed through its straight-line code: it must not be read through the
        // holder there, nor handed to a class that does such inlined reads (e.g. a listener).
        val forcedKeyFields = BETTING_KEYS.keys.map { keyEnum.enumConstantField(it)!! }.toSet()
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
        for (init in sponsoredInits) {
            val registers = init.implementation!!.registerCount
            assertTrue(
                init.startsWithNewArrayLists((registers - init.parameterTypes.size until registers).toList()),
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
        for (init in bonusInits) {
            val registers = init.implementation!!.registerCount
            val params = init.parameterTypes.size
            assertTrue(
                init.startsWithNewArrayLists((registers - params until registers).toList()),
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
        // A null set is handed back unchanged: if-nez p0 -> return-object p0.
        val tabsHelperInsns = tabsHelper.instructions()
        val tabsParam = tabsHelper.implementation!!.registerCount - 1
        assertTrue(
            tabsHelperInsns.getOrNull(0)?.opcode == Opcode.IF_NEZ &&
                (tabsHelperInsns[0] as OneRegisterInstruction).registerA == tabsParam &&
                tabsHelperInsns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
                (tabsHelperInsns[1] as OneRegisterInstruction).registerA == tabsParam,
            "$TABS_HELPER does not return a null set unchanged first\n$diagnostics"
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
                val forced = insns.getOrNull(index - 1)
                assertTrue(
                    forced is NarrowLiteralInstruction && forced.narrowLiteral == 0 &&
                        (forced.opcode == Opcode.CONST_4 || forced.opcode == Opcode.CONST_16) &&
                        (forced as OneRegisterInstruction).registerA == register,
                    "${summaryParams.type}.<init> does not load false into v$register right before storing " +
                        "isAgeVerified; the previous instruction is ${forced?.opcode}\n$diagnostics"
                )
            }
        }

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
    }
}
