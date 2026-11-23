import app.template.patches.digisport.layout.capturedField
import app.template.patches.digisport.layout.caseOf
import app.template.patches.digisport.layout.lastIndexOfString
import app.template.patches.digisport.layout.returnedSingletonAfter
import app.template.patches.digisport.layout.singletonBefore
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
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
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "ro.rcsrds.digisport"
private const val UI_AD = "Lro/rcsrds/digisport/data/model/ui/others/UIAd;"
private const val UI_LIVE_PREROLL = "Lro/rcsrds/digisport/data/model/ui/live/UiLivePreroll;"
private const val UI_LIVE_DAI = "Lro/rcsrds/digisport/data/model/ui/live/UiLiveDai;"
private const val PLAYER_SERVICE = "Lro/rcsrds/lib/player/PlayerService;"
private const val VIEW = "Landroid/view/View;"
private const val VIEW_GROUP = "Landroid/view/ViewGroup;"
private val AD_SLOT_PARAMETERS = listOf(VIEW_GROUP, UI_AD)
private const val ARTICLE_SECTION = "Lro/rcsrds/digisport/data/model/ui/articles/ArticleSection;"
private const val API_ARTICLE = "Lro/rcsrds/digisport/data/model/api/article/ApiArticle;"
private const val API_ARTICLE_LAYOUT = "Lro/rcsrds/digisport/data/model/api/article/ApiArticleLayout;"
private const val UI_EXCLUSIVE = "Lro/rcsrds/digisport/data/model/ui/epg/UIExclusive;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"

/**
 * Since 1.1.16 Digi Sport is R8-obfuscated (renamed, merged and inlined, SDKs included), so every
 * target is found in the stock APK the same way the patches find it (kept data classes and field
 * names, manifest components, app and SDK strings, method shape), then checked in the patched APK.
 */
class DigiSportSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference
    private fun Instruction.stringRef() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
    private fun Instruction.registerA() = (this as OneRegisterInstruction).registerA
    private fun Instruction.literal() = (this as? NarrowLiteralInstruction)?.narrowLiteral
    private fun Method.params() = parameterTypes.map(CharSequence::toString)
    private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)
    private fun Method.label() = "$definingClass->$name(${params().joinToString("")})$returnType"

    /** The register of parameter [index] (0 = this) of an instance method. */
    private fun Method.p(index: Int): Int = implementation!!.registerCount - (parameterTypes.size + 1) + index

    /** Index of the instruction a branch at [index] jumps to, or -1. */
    private fun List<Instruction>.branchTarget(index: Int): Int {
        val target = take(index).sumOf { it.codeUnits } + (this[index] as OffsetInstruction).codeOffset
        var address = 0
        forEachIndexed { i, insn ->
            if (address == target) return i
            address += insn.codeUnits
        }
        return -1
    }

    private fun Instruction.calls(owner: String, name: String) =
        methodRef()?.let { it.definingClass == owner && it.name == name } == true

    private fun Instruction.reads(field: FieldReference) = fieldRef()?.let {
        it.definingClass == field.definingClass && it.name == field.name && it.type == field.type
    } == true

    /** Asserts `const/4 vX, 0x0` + `return-object vX` at the top. */
    private fun assertReturnsNull(method: Method, label: String) {
        val insns = method.instructions()
        val first = insns.getOrNull(0)
        assertTrue(
            first?.opcode == Opcode.CONST_4 && first.literal() == 0 &&
                insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT && insns[1].registerA() == first.registerA(),
            "$label does not return null; starts with ${first?.opcode}, ${insns.getOrNull(1)?.opcode}"
        )
    }

    /** Asserts `new-instance vX, ArrayList` + `ArrayList.<init>()` + `return-object vX` at the top. */
    private fun assertReturnsNewEmptyArrayList(method: Method, label: String) {
        val insns = method.instructions()
        val create = insns.getOrNull(0)
        val init = insns.getOrNull(1)
        val type = ((create as? ReferenceInstruction)?.reference as? TypeReference)?.type
        assertTrue(
            create?.opcode == Opcode.NEW_INSTANCE && type == "Ljava/util/ArrayList;" &&
                init?.opcode == Opcode.INVOKE_DIRECT && init.calls("Ljava/util/ArrayList;", "<init>") &&
                init.methodRef()!!.parameterTypes.isEmpty() &&
                (init as FiveRegisterInstruction).registerC == create.registerA() &&
                insns.getOrNull(2)?.opcode == Opcode.RETURN_OBJECT && insns[2].registerA() == create.registerA(),
            "$label does not return a new empty ArrayList; starts with ${create?.opcode} $type, ${init?.opcode}, " +
                "${insns.getOrNull(2)?.opcode}"
        )
    }

    /** Asserts the first instruction is `const/4 p1, 0x0` (a (Z) argument forced off). */
    private fun assertArgumentForcedOff(method: Method, label: String) {
        val first = method.instructions().firstOrNull()
        assertTrue(
            first?.opcode == Opcode.CONST_4 && first.literal() == 0 && first.registerA() == method.p(1),
            "$label does not force its argument (p1 = v${method.p(1)}) off first; found ${first?.opcode}"
        )
    }

    /**
     * Asserts a case prologue at [start]: move-object/from16 v0, p0; iget-byte v1, v0, [selector];
     * const/16 v2, [key]; if-ne v1, v2 to [skip]. Returns the index after it.
     */
    private fun assertCasePrologue(
        method: Method,
        insns: List<Instruction>,
        start: Int,
        selector: FieldReference,
        key: Int,
        skip: Int,
        label: String,
    ): Int {
        val move = insns[start]
        assertTrue(
            move.opcode == Opcode.MOVE_OBJECT_FROM16 && (move as TwoRegisterInstruction).registerA == 0 &&
                move.registerB == method.p(0),
            "$label: no move-object/from16 v0, p0 at $start; found ${move.opcode}"
        )
        val case = insns[start + 1]
        assertTrue(
            case.opcode == Opcode.IGET_BYTE && case.reads(selector) && (case as TwoRegisterInstruction).registerA == 1 &&
                case.registerB == 0,
            "$label: does not read the case selector ${selector.name} into v1; found ${case.opcode} ${case.fieldRef()}"
        )
        assertTrue(
            insns[start + 2].opcode == Opcode.CONST_16 && insns[start + 2].literal() == key && insns[start + 2].registerA() == 2,
            "$label: does not load case $key into v2; found ${insns[start + 2].opcode} ${insns[start + 2].literal()}"
        )
        val branch = insns[start + 3]
        assertTrue(
            branch.opcode == Opcode.IF_NE && (branch as TwoRegisterInstruction).registerA == 1 && branch.registerB == 2 &&
                insns.branchTarget(start + 3) == skip,
            "$label: the other cases do not skip the hook (if-ne at ${start + 3} -> ${insns.branchTarget(start + 3)}, expected $skip)"
        )
        return start + 4
    }

    @Test
    fun `Digi Sport patches neutralise ads, odds, telemetry, update and consent prompts, sponsored and cross-promo cards`() {
        val root = repoRoot()
        val apk = File(root, "apks/digisport/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val stockClasses = patchedApkClasses(apk)
        val stock = stockClasses.associateBy { it.type }
        val stockMethods = stockClasses.flatMap { it.methods }.filter { it.implementation != null }
        fun stockOne(label: String, predicate: (Method) -> Boolean): Method =
            stockMethods.filter(predicate).also {
                check(it.size == 1) { "$label: expected one stock method, found ${it.map { m -> m.label() }}" }
            }.single()

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.1.16",
            versionCode = 76,
            patchNames = setOf(
                "Disable ads",
                "Disable live stream ads",
                "Hide betting odds",
                "Disable telemetry",
                "Disable update prompts",
                "Skip ad consent form",
                "Hide sponsored articles",
                "Hide promotions",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun patched(method: Method): Method = byType.getValue(method.definingClass).methods.single {
            it.name == method.name && it.returnType == method.returnType && it.params() == method.params()
        }
        fun Method.readsField(type: String, field: String) = instructions().any {
            it.fieldRef()?.let { ref -> ref.definingClass == type && ref.name == field } == true
        }
        fun getter(type: String, field: String, returnType: String) = stockOne("$type getter of $field") {
            it.definingClass == type && it.returnType == returnType && it.params().isEmpty() && it.name != "toString" &&
                it.readsField(type, field)
        }

        // Disable ads 1: AdMobManager's requestAd (instance, builds the AdView) and putAd (static)
        // return at once. They are the app's only two (ViewGroup, UIAd)V methods.
        val adSlots = stockMethods.filter { it.returnType == "V" && it.params() == AD_SLOT_PARAMETERS }
        assertEquals(1, adSlots.count { it.isStatic() }, "expected one static putAd, found ${adSlots.map { it.label() }}")
        assertEquals(1, adSlots.count { !it.isStatic() }, "expected one requestAd, found ${adSlots.map { it.label() }}")
        assertTrue(
            adSlots.single { !it.isStatic() }.instructions().any { it.literal() == 300 },
            "requestAd does not pick the 300x250 size"
        )
        assertTrue(
            adSlots.single { it.isStatic() }.instructions().any { it.calls(VIEW_GROUP, "addView") },
            "putAd does not add the AdView"
        )
        adSlots.forEach { assertReturnsEarlyVoid(patched(it), label = "AdMobManager ${it.label()}") }

        // Disable ads 2: VHSectionAd.bind (with AdMobManager.loadAd inlined since 1.1.16, which
        // replaces the old loadAd assertion) loads itemView into p1, sets it GONE, zeroes its
        // LayoutParams height when there are any, and returns before it posts the ad request.
        val stockBind = stockOne("VHSectionAd.bind") {
            it.returnType == "V" && it.params() == listOf(UI_AD) && it.instructions().any { insn -> insn.calls(VIEW, "post") }
        }
        val itemViewField = stockBind.instructions().first { it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.type == VIEW }.fieldRef()!!
        assertEquals(
            stock.getValue(stockBind.definingClass).superclass, itemViewField.definingClass,
            "bind's itemView is not the ViewHolder's field"
        )
        val bind = patched(stockBind)
        val b = bind.instructions()
        val p0 = bind.p(0)
        val p1 = bind.p(1)
        val label = "VHSectionAd.bind"
        val itemView = b.getOrNull(0)
        assertTrue(
            itemView?.opcode == Opcode.IGET_OBJECT && itemView.reads(itemViewField) &&
                (itemView as TwoRegisterInstruction).registerA == p1 && itemView.registerB == p0,
            "$label does not load this.itemView into p1 first; found ${itemView?.opcode} ${itemView?.fieldRef()}"
        )
        val bindGone = b.getOrNull(1)
        assertTrue(
            bindGone?.opcode == Opcode.CONST_16 && bindGone.literal() == 8 && bindGone.registerA() == p0,
            "$label does not load View.GONE into p0; found ${bindGone?.opcode}"
        )
        val setVisibility = b.getOrNull(2)
        assertTrue(
            setVisibility?.methodRef()?.name == "setVisibility" &&
                (setVisibility as FiveRegisterInstruction).registerC == p1 && setVisibility.registerD == p0,
            "$label does not call itemView.setVisibility(GONE); found ${setVisibility?.opcode} ${setVisibility?.methodRef()}"
        )
        val getParams = b.getOrNull(3)
        assertTrue(
            getParams?.methodRef()?.name == "getLayoutParams" && (getParams as FiveRegisterInstruction).registerC == p1 &&
                b.getOrNull(4)?.opcode == Opcode.MOVE_RESULT_OBJECT && b[4].registerA() == p0,
            "$label does not read itemView's LayoutParams into p0; found ${getParams?.opcode} ${getParams?.methodRef()}"
        )
        val nullCheck = b.getOrNull(5)
        assertTrue(
            nullCheck?.opcode == Opcode.IF_EQZ && nullCheck.registerA() == p0 &&
                (nullCheck as OffsetInstruction).codeOffset == b.subList(5, 8).sumOf { it.codeUnits },
            "$label does not skip the height write for null LayoutParams; found ${nullCheck?.opcode}"
        )
        val zero = b.getOrNull(6)
        val height = b.getOrNull(7)
        assertTrue(
            zero?.opcode == Opcode.CONST_4 && zero.literal() == 0 &&
                height?.opcode == Opcode.IPUT && height.fieldRef()?.definingClass == "Landroid/view/ViewGroup\$LayoutParams;" &&
                height.fieldRef()?.name == "height" &&
                (height as TwoRegisterInstruction).registerA == zero.registerA() && height.registerB == p0,
            "$label does not set LayoutParams.height = 0; found ${zero?.opcode}, ${height?.opcode} ${height?.fieldRef()}"
        )
        assertEquals(Opcode.RETURN_VOID, b.getOrNull(8)?.opcode, "$label does not return after collapsing the row")

        // Disable ads 3: UiLivePreroll's enable getter answers false.
        assertForcedBoolean(patched(getter(UI_LIVE_PREROLL, "enable", "Z")), expected = false, label = "UiLivePreroll enable")

        // Disable ads 4: the inlined getMVideoPreroll: every read of ArticleApiPayloads'
        // mVideoPreroll field (the one after ", mVideoPreroll=" in its toString) outside its own
        // class became const-string "" in the same register.
        val toString = stockOne("ArticleApiPayloads.toString") {
            it.name == "toString" && it.instructions().any { insn -> insn.stringRef() == "ArticleApiPayloads(mId=" }
        }
        val toStringInsns = toString.instructions()
        val prerollField = toStringInsns.drop(toStringInsns.indexOfFirst { it.stringRef() == ", mVideoPreroll=" })
            .first { it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.definingClass == toString.definingClass }.fieldRef()!!
        assertEquals(STRING, prerollField.type, "mVideoPreroll is not a String")
        val prerollReaders = stockMethods.filter { method ->
            method.definingClass != prerollField.definingClass &&
                method.instructions().any { it.opcode == Opcode.IGET_OBJECT && it.reads(prerollField) }
        }
        assertTrue(prerollReaders.size >= 2, "expected the VOD and article pre-roll readers, found ${prerollReaders.map { it.label() }}")
        for (reader in prerollReaders) {
            val before = reader.instructions()
            val after = patched(reader).instructions()
            assertTrue(after.none { it.opcode == Opcode.IGET_OBJECT && it.reads(prerollField) }, "${reader.label()} still reads the pre-roll tag")
            before.forEachIndexed { index, insn ->
                if (insn.opcode == Opcode.IGET_OBJECT && insn.reads(prerollField)) {
                    val replaced = after[index]
                    assertTrue(
                        replaced.opcode == Opcode.CONST_STRING && replaced.stringRef() == "" &&
                            replaced.registerA() == (insn as TwoRegisterInstruction).registerA,
                        "${reader.label()} at $index is ${replaced.opcode}, not const-string \"\" into v${(insn as TwoRegisterInstruction).registerA}"
                    )
                }
            }
        }

        // Disable ads 5: initImaAds (static (PlayerService), ImaAdsLoader's 10 s preload timeout)
        // returns null.
        val initIma = stockOne("initImaAds") {
            it.isStatic() && it.params() == listOf(PLAYER_SERVICE) && it.returnType.startsWith("L") &&
                it.instructions().any { insn -> (insn as? WideLiteralInstruction)?.wideLiteral == 10000L }
        }
        assertReturnsNull(patched(initIma), "initImaAds")

        // Disable live stream ads 1: UiLiveDai's enable getter answers false.
        assertForcedBoolean(patched(getter(UI_LIVE_DAI, "enable", "Z")), expected = false, label = "UiLiveDai enable")

        // Disable live stream ads 2: updateAdViewForDai (static (PlayerService)V for "dai" items)
        // returns at once.
        val updateDai = stockOne("updateAdViewForDai") {
            it.isStatic() && it.returnType == "V" && it.params() == listOf(PLAYER_SERVICE) &&
                it.instructions().any { insn -> insn.stringRef() == "media_item_type" } &&
                it.instructions().any { insn -> insn.stringRef() == "dai" }
        }
        assertReturnsEarlyVoid(patched(updateDai), label = "updateAdViewForDai")

        // Disable ads 6: the four server ad-list getters return a new empty ArrayList (the article
        // list also fed the inlined addAdWidget, whose own assertion this replaces).
        for ((type, field, returnType) in listOf(
            Triple("Lro/rcsrds/digisport/data/model/api/article/ApiArticleData;", "ads", "Ljava/util/List;"),
            Triple("Lro/rcsrds/digisport/data/model/api/epg/ApiEpgData;", "ads", "Ljava/util/List;"),
            Triple("Lro/rcsrds/digisport/data/model/api/listingArticles/Data;", "adsList", "Ljava/util/List;"),
            Triple("Lro/rcsrds/digisport/data/model/api/soccer/APIResultsResponseData;", "ads", "Ljava/util/ArrayList;"),
        )) {
            assertReturnsNewEmptyArrayList(patched(getter(type, field, returnType)), label = "$type $field")
        }

        // Disable ads 7: the inlined adConstraints: hasAttr("data-slot") reads false right after
        // its move-result.
        val adSlotMethod = stockOne("article ad-slot check") { method ->
            method.instructions().withIndex().any { (i, insn) ->
                insn.stringRef() == "data-slot" && method.instructions().getOrNull(i + 1)?.methodRef()?.returnType == "Z" &&
                    method.instructions().getOrNull(i + 2)?.opcode == Opcode.MOVE_RESULT
            }
        }
        val slotInsns = adSlotMethod.instructions()
        val hasAttr = slotInsns.indices.first { slotInsns[it].stringRef() == "data-slot" && slotInsns.getOrNull(it + 1)?.methodRef()?.returnType == "Z" } + 1
        assertEquals(Opcode.MOVE_RESULT, slotInsns[hasAttr + 1].opcode, "no move-result after hasAttr(\"data-slot\")")
        val forced = patched(adSlotMethod).instructions()[hasAttr + 2]
        assertTrue(
            forced.opcode == Opcode.CONST_4 && forced.literal() == 0 && forced.registerA() == slotInsns[hasAttr + 1].registerA(),
            "hasAttr(\"data-slot\") is not forced false; found ${forced.opcode}"
        )

        // Disable ads 8: the EPG cache gets no ad rows (addBanner, static, with the "ad" row type).
        val addBanner = stockOne("SyncEpgRepositoryBase.addBanner") {
            it.isStatic() && it.returnType == "V" &&
                it.params() == listOf("Ljava/util/List;", "Lro/rcsrds/digisport/data/model/ui/epg/UIEpgCacheDay;", STRING) &&
                it.instructions().any { insn -> insn.stringRef() == "ad" }
        }
        assertReturnsEarlyVoid(patched(addBanner), label = "SyncEpgRepositoryBase.addBanner")

        // Hide betting odds: UIResultsMatch's bet getter returns null.
        assertReturnsNull(
            patched(getter("Lro/rcsrds/digisport/data/model/ui/articles/UIResultsMatch;", "bet", "Lro/rcsrds/digisport/data/model/ui/articles/UIResultsMatchBet;")),
            "UIResultsMatch bet",
        )

        // Disable telemetry: Crashlytics (the class of getInstance's "component is not present"
        // error): the (Z) collection switch is forced off; recordException, sendUnsentReports and
        // the core's log(String) return. Performance's (Z) switch is forced off; the Cxense event
        // store and every measurement logEvent return.
        val crashlyticsType = stockOne("FirebaseCrashlytics.getInstance") {
            it.isStatic() && it.instructions().any { insn -> insn.stringRef() == "FirebaseCrashlytics component is not present." }
        }.definingClass
        val crashlytics = stock.getValue(crashlyticsType).methods.filter { it.implementation != null }
        val collection = crashlytics.single {
            it.params() == listOf("Z") && it.instructions().any { insn -> insn.stringRef() == "firebase_crashlytics_collection_enabled" }
        }
        assertArgumentForcedOff(patched(collection), "FirebaseCrashlytics.setCrashlyticsCollectionEnabled(Z)")
        val recordException = crashlytics.filter {
            it.returnType == "V" && it.params().singleOrNull() in setOf("Ljava/lang/Throwable;", "Ljava/lang/Exception;", "Ljava/lang/RuntimeException;")
        }
        assertEquals(1, recordException.size, "expected one recordException overload in $crashlyticsType, found ${recordException.map { it.label() }}")
        recordException.forEach { assertReturnsEarlyVoid(patched(it), label = "FirebaseCrashlytics.recordException ${it.label()}") }
        val sendUnsent = crashlytics.single {
            it.returnType == "V" && it.params().isEmpty() &&
                it.instructions().any { insn -> insn.fieldRef()?.let { f -> f.definingClass == "Ljava/lang/Boolean;" && f.name == "TRUE" } == true }
        }
        assertReturnsEarlyVoid(patched(sendUnsent), label = "FirebaseCrashlytics.sendUnsentReports")
        val coreType = stock.getValue(crashlyticsType).fields.single { it.type.startsWith("L") && it.type != crashlyticsType }.type
        val coreLog = stock.getValue(coreType).methods.single {
            it.implementation != null && it.returnType == "V" && it.params() == listOf(STRING) &&
                it.instructions().any { insn -> insn.calls("Ljava/lang/System;", "currentTimeMillis") }
        }
        assertReturnsEarlyVoid(patched(coreLog), label = "CrashlyticsCore.log")
        val performance = stockOne("FirebasePerformance.setPerformanceCollectionEnabled") {
            it.returnType == "V" && it.params() == listOf("Z") &&
                it.instructions().any { insn -> insn.stringRef() == "Firebase Performance is permanently disabled" }
        }
        assertArgumentForcedOff(patched(performance), "FirebasePerformance.setPerformanceCollectionEnabled(Z)")
        fun Instruction.castsToEvents() = opcode == Opcode.CHECK_CAST &&
            (this as ReferenceInstruction).reference.toString() == "[Lio/piano/android/cxense/model/Event;"
        val stockPush = stockOne("Cxense pushEvents runnable") {
            it.name == "run" && it.returnType == "V" && it.params().isEmpty() && it.instructions().any { insn -> insn.castsToEvents() }
        }
        val (pushSelector, pushCase) = stockPush.caseOf(stockPush.instructions().indexOfFirst { it.castsToEvents() })
        // The case keys of 1.1.16 were read by hand from the smali (the switch target holding the
        // anchor), independent of the patch's own case walk.
        assertEquals(0x11, pushCase, "Cxense pushEvents runnable: the Event[] cast is in case 0x11")
        val push = patched(stockPush)
        val pu = push.instructions()
        val pushAt = assertCasePrologue(push, pu, 0, pushSelector, pushCase, 5, "Cxense pushEvents runnable")
        assertTrue(
            pu[pushAt].opcode == Opcode.RETURN_VOID && pu[pushAt + 1].opcode == Opcode.NOP,
            "the Cxense pushEvents case does not return at once; found ${pu[pushAt].opcode}"
        )
        val logEvents = stockMethods.filter {
            it.name == "logEvent" && it.returnType == "V" &&
                it.params() == listOf(STRING, STRING, "Landroid/os/Bundle;", "Z", "Z", "J")
        }
        assertTrue(
            logEvents.any { it.definingClass == "Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;" } && logEvents.size >= 2,
            "expected the measurement service and its binder proxy logEvent, found ${logEvents.map { it.label() }}"
        )
        logEvents.forEach { assertReturnsEarlyVoid(patched(it), label = "measurement ${it.label()}") }

        // Disable telemetry (manifest): the Firebase switches are set on <application>.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("firebase_crashlytics_collection_enabled") }
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
            "firebase_crashlytics_collection_enabled" to "false",
        )) {
            check(metaData[name] == listOf(value)) { "meta-data $name is ${metaData[name]}, expected [$value]" }
        }

        // Disable update prompts: MainActivity's checkUpdate (Play Core's "requestUpdateInfo(%s)")
        // returns at once.
        val checkUpdate = stockOne("checkUpdate") {
            it.definingClass == "Lro/rcsrds/digisport/ui/main/MainActivity;" && it.returnType == "V" && it.params().isEmpty() &&
                it.instructions().any { insn -> insn.stringRef() == "requestUpdateInfo(%s)" }
        }
        assertReturnsEarlyVoid(patched(checkUpdate), label = "MainActivity checkUpdate")

        // Skip ad consent form 1: loadConsentInfo posts STATUS.SUCCESS to its status LiveData (the
        // same field, cast and post method its own STARTED post uses) and returns.
        val stockConsent = stockOne("loadConsentInfo") {
            it.returnType == "V" && it.params() == listOf("Z") &&
                it.instructions().any { insn -> insn.stringRef() == "mConsentInformation" } &&
                it.instructions().any { insn -> insn.opcode == Opcode.SGET_OBJECT && insn.fieldRef()?.name == "STARTED" }
        }
        val stockHead = stockConsent.instructions().take(4)
        val consent = patched(stockConsent)
        val c = consent.instructions()
        assertTrue(
            c[0].opcode == Opcode.MOVE_OBJECT_FROM16 && (c[0] as TwoRegisterInstruction).registerA == 0 &&
                (c[0] as TwoRegisterInstruction).registerB == consent.p(0),
            "loadConsentInfo does not start with move-object/from16 v0, p0; found ${c[0].opcode}"
        )
        assertTrue(
            c[1].opcode == Opcode.IGET_OBJECT && c[1].reads(stockHead[0].fieldRef()!!),
            "loadConsentInfo does not read the status LiveData; found ${c[1].opcode} ${c[1].fieldRef()}"
        )
        assertEquals(
            (stockHead[1] as ReferenceInstruction).reference.toString(), (c[2] as ReferenceInstruction).reference.toString(),
            "loadConsentInfo does not cast to the LiveData type"
        )
        val statusEnum = stockHead[2].fieldRef()!!.definingClass
        assertTrue(
            c[3].opcode == Opcode.SGET_OBJECT && c[3].fieldRef()?.definingClass == statusEnum && c[3].fieldRef()?.name == "SUCCESS",
            "loadConsentInfo does not load STATUS.SUCCESS; found ${c[3].opcode} ${c[3].fieldRef()}"
        )
        val post = c[4] as? FiveRegisterInstruction
        assertTrue(
            post != null && c[4].methodRef()?.let { it.definingClass == stockHead[3].methodRef()!!.definingClass && it.name == stockHead[3].methodRef()!!.name } == true &&
                post.registerC == c[1].registerA() && post.registerD == c[3].registerA(),
            "loadConsentInfo does not post SUCCESS to the status; found ${c[4].opcode} ${c[4].methodRef()}"
        )
        assertEquals(Opcode.RETURN_VOID, c[5].opcode, "loadConsentInfo does not return right after")

        // Skip ad consent form 2: the include_settings_user_data_ads binding (created by
        // DataBinderMapperImpl after its layout tag check) sets its root view GONE at the end of
        // its constructor, and nothing else in it touches the root's visibility.
        val mapper = stock.getValue("Lro/rcsrds/digisport/DataBinderMapperImpl;").methods.single {
            it.instructions().any { insn -> insn.stringRef() == "layout/include_settings_user_data_ads_0" }
        }.instructions()
        val tag = mapper.indexOfFirst { it.stringRef() == "layout/include_settings_user_data_ads_0" }
        val bindingType = mapper.drop(tag).first { it.opcode == Opcode.NEW_INSTANCE }.let {
            ((it as ReferenceInstruction).reference as TypeReference).type
        }
        val bindingSuper = stock.getValue(bindingType).superclass!!
        val rootField = stock.getValue(bindingSuper).fields.single { it.type == VIEW }
        val ctor = byType.getValue(bindingType).methods.single { it.name == "<init>" && it.params() == listOf(VIEW) }
        val e = ctor.instructions()
        val end = e.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        val (loadRoot, gone, hide) = Triple(e[end - 3], e[end - 2], e[end - 1])
        assertTrue(
            loadRoot.opcode == Opcode.IGET_OBJECT && loadRoot.fieldRef()?.name == rootField.name &&
                loadRoot.fieldRef()?.definingClass == bindingSuper && (loadRoot as TwoRegisterInstruction).registerB == ctor.p(0),
            "the binding does not read its root view before returning; found ${loadRoot.opcode} ${loadRoot.fieldRef()}"
        )
        assertTrue(gone.opcode == Opcode.CONST_16 && gone.literal() == 8, "the binding does not load View.GONE; found ${gone.opcode}")
        assertTrue(
            hide.calls(VIEW, "setVisibility") && (hide as FiveRegisterInstruction).registerC == loadRoot.registerA() &&
                hide.registerD == gone.registerA(),
            "the binding does not set its root GONE; found ${hide.opcode} ${hide.methodRef()}"
        )
        assertTrue(
            byType.getValue(bindingType).methods.flatMap { it.instructions() }.count { it.calls(VIEW, "setVisibility") } ==
                stock.getValue(bindingType).methods.flatMap { it.instructions() }.count { it.calls(VIEW, "setVisibility") } + 1,
            "the binding gained more than the one root setVisibility"
        )

        val sponsoredGetter = getter(API_ARTICLE, "sponsored", STRING)
        val typeGetter = getter(API_ARTICLE_LAYOUT, "type", STRING)
        val spacing = stockOne("ParsingExtensionsKt.getSpacing") {
            it.isStatic() && it.returnType == ARTICLE_SECTION && it.params().isEmpty() &&
                it.instructions().any { insn -> insn.fieldRef()?.name == "SPACING" }
        }

        /** Asserts the null-safe trim().isEmpty() check on v1 at [start], branching to [skip]. Returns the index after it. */
        fun assertBlankCheck(insns: List<Instruction>, start: Int, skip: Int, label: String): Int {
            assertTrue(insns[start].opcode == Opcode.IF_EQZ && insns[start].registerA() == 1 && insns.branchTarget(start) == skip, "$label: no null check")
            assertTrue(insns[start + 1].calls(STRING, "trim") && insns[start + 3].calls(STRING, "isEmpty"), "$label: no trim().isEmpty()")
            assertTrue(insns[start + 5].opcode == Opcode.IF_NEZ && insns.branchTarget(start + 5) == skip, "$label: blank text does not skip")
            return start + 6
        }

        // Hide sponsored articles 1: the listing article lambda's parseListingArticles case returns
        // its Unit for an article with a non-blank sponsored text; other cases skip the check.
        val stockListing = stockOne("listing article lambda") { method ->
            method.returnType == OBJECT && method.params().isEmpty() &&
                stock.getValue(method.definingClass).fields.any { it.type == API_ARTICLE } &&
                method.instructions().any { it.stringRef() == "1" } && method.instructions().any { it.stringRef() == "bg" }
        }
        val (listingSelector, listingCase) = stockListing.caseOf(stockListing.instructions().indexOfFirst { it.stringRef() == "1" })
        assertEquals(0, listingCase, "listing lambda: the \"1\" anchor is in case 0")
        val listingUnit = stockListing.singletonBefore(stockListing.instructions().indexOfFirst { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH })
        val l = patched(stockListing).instructions()
        val listingSkip = l.indexOfFirst { it.opcode == Opcode.NOP }
        var at = assertCasePrologue(patched(stockListing), l, 0, listingSelector, listingCase, listingSkip, "listing lambda")
        assertTrue(l[at].opcode == Opcode.IGET_OBJECT && l[at].fieldRef()?.type == API_ARTICLE, "listing lambda does not read its article")
        assertTrue(l[at + 1].calls(API_ARTICLE, sponsoredGetter.name) && l[at + 2].opcode == Opcode.MOVE_RESULT_OBJECT, "listing lambda does not read the sponsored text")
        at = assertBlankCheck(l, at + 3, listingSkip, "listing lambda")
        assertTrue(
            l[at].opcode == Opcode.SGET_OBJECT && l[at].reads(listingUnit) && l[at + 1].opcode == Opcode.RETURN_OBJECT && at + 2 == listingSkip,
            "listing lambda does not return its Unit for a sponsored article; found ${l[at].opcode} ${l[at].fieldRef()}, ${l[at + 1].opcode}"
        )

        // Hide sponsored articles 2 + Hide promotions 1: the article widget lambda's card case
        // starts with both self-contained checks (in either order); each adds getSpacing() to the
        // card list and returns the add result instead of the card.
        val stockWidget = stockOne("article widget lambda") { method ->
            method.returnType == OBJECT && method.params().isEmpty() && method.instructions().any { it.stringRef() == "widgetCross" }
        }
        val widgetAnchor = stockWidget.lastIndexOfString("widgetCross")
        val (widgetSelector, widgetCase) = stockWidget.caseOf(widgetAnchor)
        assertEquals(0, widgetCase, "article widget lambda: the widgetCross card is case 0")
        val listField = stockWidget.capturedField(widgetAnchor, "Ljava/util/ArrayList;")
        val articleField = stockWidget.capturedField(widgetAnchor, API_ARTICLE)
        val layoutField = stockWidget.capturedField(widgetAnchor, API_ARTICLE_LAYOUT)
        val widget = patched(stockWidget)
        val w = widget.instructions()
        var index = 0
        var sponsoredGuards = 0
        var crossGuards = 0
        repeat(2) {
            val skip = (index until w.size).first { w[it].opcode == Opcode.NOP }
            at = assertCasePrologue(widget, w, index, widgetSelector, widgetCase, skip, "widget lambda guard at $index")
            assertTrue(w[at].opcode == Opcode.IGET_OBJECT, "widget lambda guard at $index does not read a capture")
            if (w[at].reads(articleField)) {
                assertTrue(w[at + 1].opcode == Opcode.CHECK_CAST && w[at + 2].calls(API_ARTICLE, sponsoredGetter.name), "sponsored guard does not read the sponsored text")
                at = assertBlankCheck(w, at + 4, skip, "sponsored guard")
                sponsoredGuards++
            } else {
                assertTrue(w[at].reads(layoutField) && w[at + 2].calls(API_ARTICLE_LAYOUT, typeGetter.name), "cross guard does not read the widget type")
                assertTrue(w[at + 4].stringRef() == "widgetCross" && w[at + 5].calls(STRING, "equals"), "cross guard does not compare with widgetCross")
                assertTrue(w[at + 7].opcode == Opcode.IF_EQZ && w.branchTarget(at + 7) == skip, "cross guard does not skip other widgets")
                at += 8
                crossGuards++
            }
            assertTrue(
                w[at].reads(listField) && w[at + 2].calls(spacing.definingClass, spacing.name) &&
                    w[at + 4].calls("Ljava/util/ArrayList;", "add") && w[at + 6].calls("Ljava/lang/Boolean;", "valueOf") &&
                    w[at + 8].opcode == Opcode.RETURN_OBJECT && at + 9 == skip,
                "widget lambda guard at $index does not add getSpacing() and return the add result"
            )
            index = skip + 1
        }
        assertTrue(sponsoredGuards == 1 && crossGuards == 1, "widget lambda guards: $sponsoredGuards sponsored, $crossGuards cross")

        // Hide promotions 2: the widgetTitle case returns its Unit for a "widgetCross" widget.
        val stockTitle = stockOne("widget title lambda") { method ->
            method.returnType == OBJECT && method.params().isEmpty() && method.instructions().any { it.stringRef() == "row.widget.title" }
        }
        val titleAnchor = stockTitle.lastIndexOfString("row.widget.title")
        val (titleSelector, titleCase) = stockTitle.caseOf(titleAnchor)
        assertEquals(5, titleCase, "widget title lambda: row.widget.title is case 5")
        val titleLayout = stockTitle.capturedField(titleAnchor, API_ARTICLE_LAYOUT)
        val titleUnit = stockTitle.returnedSingletonAfter(titleAnchor)
        val title = patched(stockTitle)
        val t = title.instructions()
        val titleSkip = t.indexOfFirst { it.opcode == Opcode.NOP }
        at = assertCasePrologue(title, t, 0, titleSelector, titleCase, titleSkip, "widget title lambda")
        assertTrue(
            t[at].reads(titleLayout) && t[at + 2].calls(API_ARTICLE_LAYOUT, typeGetter.name) && t[at + 4].stringRef() == "widgetCross" &&
                t[at + 5].calls(STRING, "equals") && t[at + 7].opcode == Opcode.IF_EQZ && t.branchTarget(at + 7) == titleSkip,
            "widget title lambda does not check for a widgetCross widget"
        )
        assertTrue(
            t[at + 8].reads(titleUnit) && t[at + 9].opcode == Opcode.RETURN_OBJECT && at + 10 == titleSkip,
            "widget title lambda does not return its Unit for a widgetCross widget"
        )

        // Hide promotions 3: the inlined getExclusiveVideo in HomeFragment: both exclusive-count
        // reads are followed by a 0 in their result register, so the promotion flag is false.
        val stockHome = stockOne("HomeFragment exclusive video") {
            it.definingClass == "Lro/rcsrds/digisport/ui/main/home/HomeFragment;" && it.returnType == "V" &&
                it.instructions().count { insn -> insn.methodRef()?.let { ref -> ref.definingClass == UI_EXCLUSIVE && ref.returnType == "I" } == true } == 2
        }
        val h = patched(stockHome).instructions()
        val countReads = h.indices.filter { h[it].methodRef()?.let { ref -> ref.definingClass == UI_EXCLUSIVE && ref.returnType == "I" } == true }
        assertEquals(2, countReads.size, "HomeFragment exclusive count reads")
        for (read in countReads) {
            val result = h[read + 1]
            val zeroed = h[read + 2]
            assertTrue(
                result.opcode == Opcode.MOVE_RESULT && zeroed.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16) &&
                    zeroed.literal() == 0 && zeroed.registerA() == result.registerA(),
                "the exclusive count read at $read is not zeroed; found ${result.opcode}, ${zeroed.opcode}"
            )
        }
    }
}
