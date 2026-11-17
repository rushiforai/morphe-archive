/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.HOOK_TARGETS
import app.morphe.patches.pinterest.misc.extension.PatchLogCapture
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import app.morphe.patches.pinterest.ui.UI_HOOKS
import app.morphe.patches.pinterest.ui.calls
import app.morphe.patches.pinterest.ui.mutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** The field set search's requests name, as the enum spells it, and More to explore's item filter. */
private const val ELSEWHERE_SEARCH_SET = "SEARCH_PIN_FEED"
private const val ELSEWHERE_RELATED_FILTER = "Lcom/pinterest/feature/pin/closeup/datasource/RelatedModulesModelFilter;"

/**
 * Hide ads and Hide AI-labeled pins against the Pinterest builds the bundle declares: each list
 * holder text names exactly one class, all three holders and all four ad-only views are hooked,
 * and nothing is warned about. Reads the real dex, so a renamed class or a moved literal in a new
 * build fails here before it reaches a phone.
 */
@Category(FixtureTests::class)
class FeedFixtureTest {
    private val literals = listOf(", _items count:", "PagedResponse(bookmark=", "ModelListWithBookmark(models=")
    private val interstitialStrings = setOf(INTERSTITIAL_KILLSWITCH, HOUSE_INTERSTITIAL, GMA_INTERSTITIAL)
    private val elsewhereSets = setOf(ELSEWHERE_SEARCH_SET, "RELATED_PIN_FIELDS")

    @Test
    fun `every list holder and ad-only view in each declared build is hooked without a warning`() {
        val builds = Fixtures.declaredBuilds()
        assertTrue("no declared build to read", builds.isNotEmpty())
        for (build in builds) {
            val (classes, holders) = read(build)
            for (literal in literals) {
                assertEquals("${build.name}: classes whose toString writes \"$literal\"", 1, holders[literal]?.size ?: 0)
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val warnings = PatchLogCapture.warnings {
                feedListHookPatch.execute(context)
                hideAdsPatch.execute(context)
                hideAiPinsPatch.execute(context)
                hideShoppingPatch.execute(context)
                filterFeedPatch.execute(context)
            }
            assertEquals("${build.name} warnings", emptyList<String>(), warnings)
            assertEquals(build.name, 3, feedListHoldersHooked)
            for (flag in listOf("hideAds", "feedAds", "adViews", "googleAds", "metaAds", "interstitialAds", "hideAiPins", "feedAiPins", "hideShopping", "feedShopping", "closeupShopping",
                    "filterFeed", "feedVideoPins", "feedMutedWords", "feedSavedPins", "feedSavedSearch", "feedSavedRelated", "feedHomeSuggestions",
                    "feedbackFlyout")) assertFlag(context, flag)
            // #6: Shop the look under a pin is a closeup module of its own, and Hide shopping folds it.
            val shopTheLook = classes.filter { it.isShopTheLookModule() }
            assertEquals("${build.name}: $SHOP_THE_LOOK_COMPONENT modules", 1, shopTheLook.size)
            val module = context.mutableClassDefBy(shopTheLook.single().type)
            for ((parameters, hook) in listOf(listOf("I") to "closeupShoppingVisibility", listOf("I", "I") to "closeupShoppingMeasureSpec")) {
                val name = if (parameters.size == 1) "setVisibility" else "onMeasure"
                val code = module.methods.single { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters }
                    .implementation!!.instructions.toList()
                val calls = code.take(parameters.size * 2).mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
                assertEquals("${build.name}: ${module.type}->$name starts with the hook", List(parameters.size) { "$UI_HOOKS->$hook(I)I" }, calls)
            }
            // The pin's "See more like this?" getter hands every answer through the hook on its way out, once.
            val flyout = context.feedbackFlyoutOrNull()!!
            context.installFeedbackFlyout(flyout)
            val asks = context.mutable(flyout.getter).implementation!!.instructions.toList()
            val flyoutHooks = asks.indices.filter { (asks[it] as? ReferenceInstruction)?.reference?.toString() == FEEDBACK_FLYOUT_HOOK }
            assertEquals("${build.name}: flyout hooks", 1, flyoutHooks.size)
            assertEquals(build.name, listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
                asks.subList(flyoutHooks.single(), asks.size).map { it.opcode })
            for (branch in asks.filterIsInstance<BuilderOffsetInstruction>()) {
                assertTrue("${build.name}: a branch in the flyout getter skips the hook",
                    asks.indexOf(branch.target.location.instruction) <= flyoutHooks.single())
            }
            // Home's request and page each carry one hook, and Download pins asking for the first adds no second.
            val homeFields = context.homeFieldsOrNull()!!
            context.installHomeFields(homeFields)
            assertEquals(build.name, 1, context.mutable(homeFields.request).calls().count { it.name == "homeFields" })
            val homePage = context.homePageOrNull()!!
            assertEquals(build.name, 1, context.mutable(homePage.callback).calls().count { it.name == "homePage" })
            // #34: every read of search's and More to explore's field lists hands the list through the
            // hook right where it's kept, each search page goes through it first, and so does each item
            // More to explore's filter judges. Asking again adds no second hook.
            context.installSavedElsewhere(context.savedElsewhere(), "Filter feed")
            val elsewhere = context.savedElsewhere()
            assertTrue(build.name, elsewhere.search && elsewhere.related)
            for (read in elsewhere.searchFields + elsewhere.relatedFields) {
                val body = context.mutable(read.method).implementation!!.instructions.toList()
                assertEquals("${build.name}: ${read.method.definingClass}->${read.method.name} field list",
                    "$EXTENSION_PACKAGE/ads/SavedPins;->elsewhereFields(Ljava/lang/String;)Ljava/lang/String;",
                    (body[read.after] as ReferenceInstruction).reference.toString())
                assertEquals(build.name, read.register, (body[read.after + 1] as OneRegisterInstruction).registerA)
            }
            assertEquals(build.name, 3, elsewhere.searchFields.size)
            assertEquals(build.name, 2, elsewhere.relatedFields.size)
            assertEquals(build.name, 2, elsewhere.searchPages.size)
            for (page in elsewhere.searchPages) {
                val body = context.mutable(page).implementation!!.instructions.toList()
                assertEquals("${build.name}: search page ${page.name}", "$EXTENSION_PACKAGE/ads/SavedPins;->searchPage(Ljava/util/List;)Ljava/util/List;",
                    (body[0] as ReferenceInstruction).reference.toString())
                assertEquals(build.name, 1, context.mutable(page).calls().count { it.name == "searchPage" })
            }
            val judged = context.mutable(elsewhere.relatedFilter!!).implementation!!.instructions.toList()
            assertEquals("${build.name}: More to explore's filter", "$EXTENSION_PACKAGE/ads/SavedPins;->dropRelated(Ljava/lang/Object;)Z",
                (judged[0] as ReferenceInstruction).reference.toString())
            assertEquals(build.name, listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN), judged.subList(1, 4).map { it.opcode })
            assertEquals(build.name, 1, context.mutable(elsewhere.relatedFilter!!).calls().count { it.name == "dropRelated" })
            // Full coverage by target, not only by flag: both feed constructors, each holder and both methods of every view.
            assertEquals(build.name, "feedList=2/2;pagedResponse=1/1;modelList=1/1", recorded(context, "feedLists"))
            assertEquals(build.name, "TextAdView=2/2;LegacyPromotedCloseupActionButtonModule=2/2;" +
                "PromotedPinCloseupFloatingActionBarModule=2/2;BoardSponsoredCuratorView=2/2", recorded(context, "adViews"))
            val start = classes.flatMap { it.methods }.single { method -> !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.isEmpty() && method.returnType == "V" &&
                method.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == GOOGLE_MOBILE_ADS } == true }
            val guarded = context.mutableClassDefBy(start.definingClass).methods.single { it.name == start.name && it.parameterTypes.isEmpty() }
                .implementation!!.instructions.toList()
            assertEquals("${build.name}: Google ad SDK start", "$EXTENSION_PACKAGE/ads/Ads;->skipGoogleAds()Z",
                (guarded[0] as ReferenceInstruction).reference.toString())
            assertEquals(build.name, listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), guarded.subList(1, 4).map { it.opcode })
            // Meta's ad SDK waits on one consent check, asked with a vendor enum; it answers no for Meta first.
            val vendors = classes.filter { owner -> owner.fields.any { it.name == META_AUDIENCE_NETWORK && it.type == owner.type } }.map { it.type }.toSet()
            val consent = classes.flatMap { it.methods }.single { method -> !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" &&
                method.parameterTypes.size == 1 && method.parameterTypes.single().toString() in vendors }
            val asked = context.mutableClassDefBy(consent.definingClass).methods.single { it.name == consent.name && it.parameterTypes == consent.parameterTypes }
                .implementation!!.instructions.toList()
            assertEquals("${build.name}: Meta ad SDK consent", "$EXTENSION_PACKAGE/ads/Ads;->skipMetaConsent(Ljava/lang/Object;)Z",
                (asked[0] as ReferenceInstruction).reference.toString())
            assertEquals(build.name, listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), asked.subList(1, 5).map { it.opcode })
            // The pin-open interstitial asks two questions in one class: the killswitch read answers
            // true and the house-or-Google experiment check answers false, each before Pinterest's code.
            fun strings(method: Method) = method.implementation?.instructions
                ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }?.toSet() ?: emptySet()
            val killswitch = classes.flatMap { it.methods }.single { method -> !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "Z" && method.parameterTypes.isEmpty() && INTERSTITIAL_KILLSWITCH in strings(method) }
            val experiment = classes.flatMap { it.methods }.single { method -> !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "Z" && method.parameterTypes.size == 2 && method.parameterTypes[1].toString() == "Z" &&
                strings(method).containsAll(listOf(HOUSE_INTERSTITIAL, GMA_INTERSTITIAL)) }
            assertEquals("${build.name}: interstitial checks share a class", killswitch.definingClass, experiment.definingClass)
            for ((method, hook, answer) in listOf(Triple(killswitch, "killInterstitials", 1), Triple(experiment, "skipInterstitials", 0))) {
                val answered = context.mutableClassDefBy(method.definingClass).methods.single { it.name == method.name && it.parameterTypes == method.parameterTypes }
                    .implementation!!.instructions.toList()
                assertEquals("${build.name}: $hook", "$EXTENSION_PACKAGE/ads/Ads;->$hook()Z", (answered[0] as ReferenceInstruction).reference.toString())
                assertEquals("${build.name}: $hook", listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN),
                    answered.subList(1, 5).map { it.opcode })
                assertEquals("${build.name}: $hook answer", answer, (answered[3] as NarrowLiteralInstruction).narrowLiteral)
            }
            assertInterstitialGate(build, killswitch, experiment)

            val filter = "$EXTENSION_PACKAGE/ads/FeedFilter;->filter(Ljava/util/List;)Ljava/util/List;"
            for (holder in holders.values.flatten()) {
                val constructors = context.mutableClassDefBy(holder).methods.filter { method ->
                    method.name == "<init>" && method.parameterTypes.count { it.toString() == "Ljava/util/List;" } == 1
                }
                assertTrue("${build.name}: $holder has no list constructor", constructors.isNotEmpty())
                for (constructor in constructors) {
                    val first = constructor.implementation!!.instructions.first()
                    assertEquals("${build.name}: $holder ${constructor.parameterTypes}", filter,
                        (first as? ReferenceInstruction)?.reference?.toString())
                }
            }
            for (view in AD_ONLY_VIEWS) {
                val methods = context.mutableClassDefBy(view).methods
                for ((name, helper) in listOf("setVisibility" to "adViewVisibility", "onMeasure" to "adViewMeasureSpec")) {
                    val method = methods.singleOrNull { it.name == name && it.returnType == "V" }
                    assertTrue("${build.name}: $view has no $name of its own", method != null)
                    assertTrue("${build.name}: $view.$name doesn't call $helper", method!!.implementation!!.instructions.any {
                        (it as? ReferenceInstruction)?.reference?.toString() == "$EXTENSION_PACKAGE/ads/Ads;->$helper(I)I"
                    })
                }
            }
        }
    }

    // #30: the board-tab Home's "More ideas for your board" row is a story of one of these types, which
    // the app's own story binder compares. Hide Home suggestions names them, so a build that renames
    // them would show the row again.
    @Test
    fun `each declared build still compares the board ideas upsell story types`() {
        val types = listOf("boards_more_ideas_feed_upsell_list_items", "boards_more_ideas_feed_upsell_list_cards")
        fun strings(method: Method) = method.implementation?.instructions
            ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.orEmpty()
        for (build in Fixtures.declaredBuilds()) {
            val comparing = FixtureDex.methodsWhere(build, { true }) { method -> strings(method).any { it in types } }
            for (type in types) {
                assertTrue("${build.name}: some method compares $type", comparing.any { type in strings(it) })
            }
        }
    }

    // The hooks above can all land while a retyped pin field quietly stops every filter that reads it.
    @Test
    fun `the pin model in each declared build keeps the JSON names and types the feed filters read`() {
        for (build in Fixtures.declaredBuilds()) {
            val models = mutableMapOf<String, Map<String, String>>()
            FixtureDex.forEach(build) { dex ->
                for (classDef in dex.classes) {
                    if (classDef.type.startsWith("Lcom/pinterest/api/model/")) models[classDef.type] = serializedFields(classDef)
                }
            }
            assertEquals("${build.name}: pin model", emptyList<String>(), pinSchemaProblems(models))
        }
    }

    /**
     * What makes a yes from the killswitch safe: the static gate that opens a tapped pin reads it
     * before it asks the experiments, a yes branches past that question, and the gate has the
     * KILL_SWITCH path that opens the pin with no ad. The killswitch's other readers are the launch
     * prefetch and the prefetch stop in its own class. A reader beyond those is a trigger nobody has
     * traced, and one gate missing its open call would leave a tapped pin doing nothing.
     */
    private fun assertInterstitialGate(build: File, killswitch: Method, experiment: Method) {
        fun call(instruction: Instruction) = ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
        val read = "${killswitch.definingClass}->${killswitch.name}()Z"
        val ask = "${experiment.definingClass}->${experiment.name}(${experiment.parameterTypes.joinToString("")})Z"
        // By its parts rather than its text, since this reads every call in the APK.
        val readers = FixtureDex.methodsWhere(build, { true }) { method ->
            method.implementation?.instructions?.any {
                val called = (it as? ReferenceInstruction)?.reference as? MethodReference
                called != null && called.name == killswitch.name && called.definingClass == killswitch.definingClass &&
                    called.returnType == "Z" && called.parameterTypes.isEmpty()
            } == true
        }
        val own = readers.filter { it.definingClass == killswitch.definingClass }
        assertEquals("${build.name}: the killswitch's readers in its class", setOf("()V", "(Ljava/util/List;Ljava/lang/Boolean;)V"),
            own.map { "(${it.parameterTypes.joinToString("")})${it.returnType}" }.toSet())
        assertEquals("${build.name}: the killswitch's readers in its class", 2, own.size)
        val gate = (readers - own.toSet()).single()
        assertTrue("${build.name}: the gate is static and returns nothing", AccessFlags.STATIC.isSet(gate.accessFlags) && gate.returnType == "V")
        val body = gate.implementation!!.instructions.toList()
        val firstRead = body.indexOfFirst { call(it) == read }
        val firstAsk = body.indexOfFirst { call(it) == ask }
        assertTrue("${build.name}: the gate reads the killswitch ($firstRead) before it asks ($firstAsk)", firstRead in 0 until firstAsk)
        val answer = (body[firstRead + 1] as OneRegisterInstruction).registerA
        val yes = body.subList(firstRead + 2, firstRead + 6).single {
            it.opcode == Opcode.IF_NEZ && (it as OneRegisterInstruction).registerA == answer
        } as OffsetInstruction
        val addresses = body.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        val target = addresses.indexOf(addresses[body.indexOf(yes)] + yes.codeOffset)
        assertTrue("${build.name}: a yes from the killswitch skips the experiment check", target > firstAsk)
        assertTrue("${build.name}: the gate has its KILL_SWITCH path", body.any {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == "KILL_SWITCH" && it.opcode == Opcode.SGET_OBJECT
        })
        assertTrue("${build.name}: the gate opens the pin itself", body.any { call(it) == "Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;" })
    }

    /** The holder classes by literal, and those classes with the ad-only views and every app class above them. */
    private fun read(build: File): Pair<List<ClassDef>, Map<String, List<String>>> {
        val wanted = mutableMapOf<String, ClassDef>()
        val holders = mutableMapOf<String, MutableList<String>>()
        // Pinterest's consent vendor enums, and the classes with a one-argument boolean check by parameter type.
        val vendors = mutableSetOf<String>()
        val askers = mutableMapOf<String, MutableSet<String>>()
        // The pin model, as the outer class of whatever reads its "See more like this?" JSON name.
        val models = mutableSetOf<String>()
        FixtureDex.forEach(build) { dex ->
            for (classDef in dex.classes) {
                if (classDef.fields.any { it.name == META_AUDIENCE_NETWORK && it.type == classDef.type && AccessFlags.STATIC.isSet(it.accessFlags) }) {
                    vendors += classDef.type
                    wanted[classDef.type] = ImmutableClassDef.of(classDef)
                }
                for (method in classDef.methods) {
                    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "Z" || method.parameterTypes.size != 1) continue
                    askers.getOrPut(method.parameterTypes.single().toString()) { mutableSetOf() } += classDef.type
                }
                val written = classDef.methods.filter { it.name == "toString" }.flatMap { method ->
                    (method.implementation?.instructions?.toList() ?: emptyList()).mapNotNull {
                        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                    }
                }
                val matched = literals.filter { it in written }
                if (classDef.methods.any { method -> method.implementation?.instructions?.any {
                        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == FEEDBACK_FLYOUT } == true }) {
                    wanted[classDef.type] = ImmutableClassDef.of(classDef)
                    models += classDef.type.substringBefore('$').removeSuffix(";") + ";"
                }
                matched.forEach { holders.getOrPut(it) { mutableListOf() } += classDef.type }
                val googleAds = classDef.methods.any { method -> method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == GOOGLE_MOBILE_ADS } == true }
                // 14.43.0 moved Home's page callback into a shared lambda class, found by the page it hands to Home's model.
                val handsToHome = classDef.methods.any { method -> method.implementation?.instructions?.any {
                    val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                    call != null && call.definingClass.startsWith("Lcom/pinterest/feature/home/model/") &&
                        call.parameterTypes.any { type -> type.toString() == "Lcom/pinterest/legacy/feeds/DynamicFeed;" }
                } == true }
                val home = classDef.type.startsWith("Lcom/pinterest/feature/home/model/") || classDef.type == "Lcom/pinterest/legacy/feeds/DynamicFeed;" || handsToHome
                // Every class naming an interstitial experiment, so a second holder would show up as one.
                val interstitial = classDef.methods.any { method -> method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string in interstitialStrings } == true }
                // #34: the request field sets, every class asking for search's or More to explore's
                // fields, and More to explore's item filter.
                val fieldSets = classDef.fields.any { it.name == ELSEWHERE_SEARCH_SET && it.type == classDef.type && AccessFlags.STATIC.isSet(it.accessFlags) }
                val asksElsewhere = classDef.methods.any { method -> method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name in elsewhereSets } == true }
                val elsewhere = fieldSets || asksElsewhere || classDef.type == ELSEWHERE_RELATED_FILTER
                if (matched.isNotEmpty() || classDef.type in AD_ONLY_VIEWS || googleAds || home || interstitial || elsewhere ||
                    classDef.isShopTheLookModule()) {
                    wanted[classDef.type] = ImmutableClassDef.of(classDef)
                }
            }
        }
        wanted += FixtureDex.classes(build, (vendors.flatMap { askers[it].orEmpty() } + models).toSet() - wanted.keys)
        var above = wanted.values.mapNotNull { it.superclass }.toSet() - wanted.keys
        while (above.isNotEmpty()) {
            val found = FixtureDex.classes(build, above)
            wanted += found
            above = found.values.mapNotNull { it.superclass }.toSet() - wanted.keys
        }
        return wanted.values.toList() to holders
    }

    private fun recorded(context: BytecodePatchContext, name: String): String {
        val first = context.mutableClassDefBy(HOOK_TARGETS).methods.single { it.name == name }.implementation!!.instructions.first()
        return ((first as ReferenceInstruction).reference as StringReference).string
    }

    private fun assertFlag(context: BytecodePatchContext, name: String) {
        val instructions = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }
            .implementation!!.instructions.toList()
        assertEquals(Opcode.CONST_4, instructions[0].opcode)
        assertEquals("$name coverage", 1, (instructions[0] as NarrowLiteralInstruction).narrowLiteral)
    }
}
