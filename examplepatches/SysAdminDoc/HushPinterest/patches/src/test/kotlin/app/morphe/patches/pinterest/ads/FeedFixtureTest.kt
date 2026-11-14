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
import app.morphe.patches.pinterest.ui.calls
import app.morphe.patches.pinterest.ui.mutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
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

/**
 * Hide ads and Hide AI-labeled pins against the Pinterest builds the bundle declares: each list
 * holder text names exactly one class, all three holders and all four ad-only views are hooked,
 * and nothing is warned about. Reads the real dex, so a renamed class or a moved literal in a new
 * build fails here before it reaches a phone.
 */
@Category(FixtureTests::class)
class FeedFixtureTest {
    private val literals = listOf(", _items count:", "PagedResponse(bookmark=", "ModelListWithBookmark(models=")

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
            for (flag in listOf("hideAds", "feedAds", "adViews", "googleAds", "metaAds", "hideAiPins", "feedAiPins", "hideShopping", "feedShopping",
                    "filterFeed", "feedVideoPins", "feedMutedWords", "feedSavedPins", "feedHomeSuggestions", "feedbackFlyout")) assertFlag(context, flag)
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
                if (matched.isNotEmpty() || classDef.type in AD_ONLY_VIEWS || googleAds || home) wanted[classDef.type] = ImmutableClassDef.of(classDef)
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
