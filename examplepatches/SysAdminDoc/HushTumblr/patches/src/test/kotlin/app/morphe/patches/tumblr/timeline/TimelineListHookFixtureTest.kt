/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.tumblr.ads.hideAdsPatch
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * The two constructors every timeline page is built with, in each declared build, and the filter
 * call put in front of each one's first instruction: the items go in, and what comes back replaces
 * them before Tumblr's own code reads them. Hide ads then turns its switch and its rule on.
 */
@Category(FixtureTests::class)
class TimelineListHookFixtureTest {
    @Test
    fun `each declared build filters both timeline pages' items first thing and Hide ads turns on`() {
        for (build in Fixtures.declaredBuilds()) {
            val types = TIMELINE_LISTS.map { it.substringBefore("->") }.toSet()
            val classes = FixtureDex.classes(build, types)
            assertEquals("${build.name}: both timeline classes", types, classes.keys)
            val originals = TIMELINE_LISTS.associateWith { constructor ->
                classes.getValue(constructor.substringBefore("->")).methods.single { it.identity() == constructor }
            }

            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            timelineListHookPatch.execute(context)
            hideAdsPatch.execute(context)

            for ((constructor, original) in originals) {
                val patched = context.mutableClassDefBy(constructor.substringBefore("->")).methods
                    .single { it.identity() == constructor }
                val body = patched.instructionList()
                val before = original.instructionList()
                assertEquals("$constructor: two instructions added", before.size + 2, body.size)
                val items = patched.parameterRegisterNumber(0)
                val call = body[0] as RegisterRangeInstruction
                assertEquals(constructor, Opcode.INVOKE_STATIC_RANGE, body[0].opcode)
                assertEquals("$constructor: the filter is called", TIMELINE_FILTER_HOOK, body[0].methodRef()?.let {
                    "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" })
                assertEquals("$constructor: on the items", listOf(items, 1), listOf(call.startRegister, call.registerCount))
                assertEquals(constructor, Opcode.MOVE_RESULT_OBJECT, body[1].opcode)
                assertEquals("$constructor: back into the items", items, (body[1] as OneRegisterInstruction).registerA)
                assertEquals("$constructor: what follows is Tumblr's own code", before.map { it.opcode },
                    body.drop(2).map { it.opcode })
            }
            for (flag in listOf("hideAds", "timelineAds")) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                    .implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    /**
     * A blog's posts, likes and blog search keep their own copy of the items they hand
     * `TimelineResponse` and read that copy back, so each of their constructors filters the items
     * before that call, with the call that tells the base constructor not to filter them again.
     */
    @Test
    fun `each declared build filters the items the timeline response subclasses keep`() {
        for (build in Fixtures.declaredBuilds()) {
            val subclasses = mutableListOf<ClassDef>()
            FixtureDex.forEach(build) { dex ->
                dex.classes.filter { it.superclass == TIMELINE_RESPONSE }.forEach { subclasses += ImmutableClassDef.of(it) }
            }
            assertEquals("${build.name}: the subclasses", setOf("PostsResponse", "LikesResponse", "BlogSearchResponse"),
                subclasses.map { it.type.substringAfterLast('/').removeSuffix(";") }.toSet())
            val types = TIMELINE_LISTS.map { it.substringBefore("->") }.toSet()
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, types).values + subclasses)
            timelineListHookPatch.execute(context)

            for (subclass in subclasses) {
                val originals = subclass.methods.filter { it.name == "<init>" && it.instructionList().firstOrNull()
                    ?.methodRef()?.let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" } == TIMELINE_LISTS[1] }
                assertEquals("${subclass.type}: one constructor hands its items on", 1, originals.size)
                val original = originals.single()
                val patched = context.mutableClassDefBy(subclass.type).methods.single { it.identity() == original.identity() }
                val body = patched.instructionList()
                val before = original.instructionList()
                val items = patched.parameterRegisterNumber(original.parameterTypes.indexOfFirst { it.toString() == "Ljava/util/List;" })
                assertEquals("${subclass.type}: the items are what it hands on", items, (before[0] as FiveRegisterInstruction).registerD)
                assertEquals("${subclass.type}: the kept filter is called", TIMELINE_KEPT_HOOK, body[0].methodRef()?.let {
                    "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" })
                val call = body[0] as RegisterRangeInstruction
                assertEquals("${subclass.type}: on the items", listOf(items, 1), listOf(call.startRegister, call.registerCount))
                assertEquals(subclass.type, Opcode.MOVE_RESULT_OBJECT, body[1].opcode)
                assertEquals("${subclass.type}: back into the items", items, (body[1] as OneRegisterInstruction).registerA)
                assertEquals("${subclass.type}: what follows is Tumblr's own code", before.map { it.opcode },
                    body.drop(2).map { it.opcode })
            }
        }
    }

    /**
     * What `TimelineFilter` reads from an item by name, in each declared build. A name that's gone
     * keeps every item, so this is what says Hide ads can see a paid placement: the display block's
     * sponsored state and the display type, each with the SPONSORED constant the filter compares
     * against. An enum constant's name() is the string its <clinit> hands the constructor, so that's
     * checked as well as the field. A button counts as a follow prompt by the class of what its tap
     * follows, so that class is checked by name too.
     */
    @Test
    fun `each declared build keeps the item members the filter reads by name`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, FILTER_READS.keys + SPONSORED_ENUMS + ACTION_LINK)
            assertTrue("${build.name}: $ACTION_LINK", ACTION_LINK in classes)
            for ((type, getters) in FILTER_READS) {
                val methods = classes[type]?.methods?.toList().orEmpty()
                for (getter in getters) {
                    assertTrue("${build.name}: $type->$getter", methods.any {
                        "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == getter &&
                            AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
                    })
                }
            }
            for (type in SPONSORED_ENUMS) {
                val enumClass = classes[type]
                assertTrue("${build.name}: $type is an enum", enumClass != null && AccessFlags.ENUM.isSet(enumClass.accessFlags))
                assertTrue("${build.name}: $type has SPONSORED", enumClass!!.fields.any {
                    it.name == SPONSORED && it.type == type && AccessFlags.STATIC.isSet(it.accessFlags)
                })
                val clinit = enumClass.methods.single { it.name == "<clinit>" }
                assertTrue("${build.name}: $type names SPONSORED", clinit.instructionList().any { it.stringRef() == SPONSORED })
            }
        }
    }

    /**
     * Each item kind the filter takes out by name, the constant names `TimelineFilter`'s static
     * initializer holds, is a constant of `TimelineObjectType` in each declared build. A kind Tumblr
     * renamed or dropped would leave its items on screen without a word.
     */
    @Test
    fun `each declared build has every item kind the filter takes out`() {
        val filter = ExtensionDex.classes().single { it.type == TIMELINE_FILTER }
        val kinds = filter.methods.single { it.name == "<clinit>" }.instructionList()
            .mapNotNull { it.stringRef() }.filter { CONSTANT_NAME.matches(it) }.toSet()
        assertTrue("the filter's kinds are read: $kinds", "GEMINI_AD" in kinds && "BLOG_SUBSCRIPTION_CTA" in kinds)
        for (build in Fixtures.declaredBuilds()) {
            val type = FixtureDex.classes(build, setOf(OBJECT_TYPE)).getValue(OBJECT_TYPE)
            val names = type.fields.filter { AccessFlags.STATIC.isSet(it.accessFlags) && it.type == OBJECT_TYPE }
                .map { it.name }.toSet()
            assertEquals("${build.name}: kinds Tumblr doesn't have", emptySet<String>(), kinds - names)
        }
    }

    private fun Method.identity() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
}

private val CONSTANT_NAME = Regex("[A-Z][A-Z0-9_]+")

private const val MODEL = "Lcom/tumblr/rumblr/model"
private const val SPONSORED = "SPONSORED"
private const val OBJECT_TYPE = "$MODEL/TimelineObjectType;"

/** Each class `TimelineFilter.Model` reads by name, with its getters as `name()returnType`. */
private val FILTER_READS = mapOf(
    "$MODEL/TimelineObject;" to listOf(
        "getData()$MODEL/Timelineable;",
        "isShowSponsoredLabel()Z",
        "getDisplay()$MODEL/Display;",
        "getDisplayType()$MODEL/post/DisplayType;",
    ),
    "$MODEL/Timelineable;" to listOf("getTimelineObjectType()$MODEL/TimelineObjectType;"),
    "$MODEL/Display;" to listOf("getSponsored()$MODEL/SponsoredState;"),
    "$MODEL/GenericButton;" to listOf("getButton()$MODEL/GenericButton\$Button;"),
    "$MODEL/GenericButton\$Button;" to listOf("getLinks()$MODEL/GenericButton\$Button\$Links;"),
    "$MODEL/GenericButton\$Button\$Links;" to listOf("getTap()$MODEL/link/Link;"),
)

/** What a button's tap follows when it does something in place, which is following a blog. */
private const val ACTION_LINK = "$MODEL/link/ActionLink;"

/** The enums whose SPONSORED constant marks a paid placement. */
private val SPONSORED_ENUMS = setOf("$MODEL/SponsoredState;", "$MODEL/post/DisplayType;")
