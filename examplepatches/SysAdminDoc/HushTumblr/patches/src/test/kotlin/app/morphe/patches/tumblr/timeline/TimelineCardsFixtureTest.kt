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
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * The carousel bridge in each declared build: `TimelineFilter.carouselItems` gets a body that casts
 * to Tumblr's `Carousel` and returns what its items getter returns, the getter the adapter writes
 * under "elements". Each card patch then turns its switch and its rule on. What the rules take out
 * is TimelineFilterTest's.
 */
@Category(FixtureTests::class)
class TimelineCardsFixtureTest {
    @Test
    fun `Hide suggested blogs reads carousels and turns its switch on`() =
        check(hideSuggestedBlogsPatch, "hideSuggestedBlogs", "suggestedBlogCards")

    @Test
    fun `Hide suggested communities reads carousels and turns its switch on`() =
        check(hideSuggestedCommunitiesPatch, "hideSuggestedCommunities", "suggestedCommunityCards")

    @Test
    fun `Hide suggested tags reads carousels and turns its switch on`() =
        check(hideSuggestedTagsPatch, "hideSuggestedTags", "suggestedTagCards")

    @Test
    fun `Hide Watch it rows reads carousels and turns its switch on`() =
        check(hideWatchItRowsPatch, "hideWatchItRows", "watchItRows")

    /**
     * What tells a feed from a page of search results, in each declared build. The suggested blogs
     * and communities rules read the adapter that's parsing a page off the call stack, so each adapter
     * the extension names has to be there under that name with a `fromJson`. A page has to be built
     * inside its own adapter's `fromJson` and nowhere else, or a page could reach the filter with no
     * adapter on the stack. And every adapter that reads a `Timeline` has to be one placed here, so a
     * build with a response this hasn't seen stops and gets looked at.
     */
    @Test
    fun `each declared build keeps the adapters that say what a page was parsed for`() {
        val search = ExtensionDex.stringConstant(PAGE_SOURCE, "SEARCH_RESULTS").descriptor()
        val feeds = ExtensionDex.classDef(PAGE_SOURCE).methods.single { it.name == "<clinit>" }.strings()
            .map { it.descriptor() }.toSet()
        assertEquals("the search adapter the extension names", SEARCH_ADAPTER, search)
        assertEquals("the feed adapters the extension names", TIMELINE_FEEDS + PAGE_FEEDS, feeds)

        for (build in Fixtures.declaredBuilds()) {
            val named = FixtureDex.classes(build, feeds + search)
            for (adapter in feeds + search) {
                assertTrue("${build.name}: $adapter has a fromJson", named[adapter]?.methods?.toList().orEmpty().any {
                    it.name == "fromJson" && it.parameterTypes.size == 1 && it.implementation != null
                })
            }

            val pages = setOf(TIMELINE, TIMELINE_RESPONSE) + FixtureDex.classesWhere(build, { true }) {
                it.definingClass.startsWith(TIMELINE_RESPONSES)
            }.filter { it.superclass == TIMELINE_RESPONSE }.map { it.type }
            assertEquals("${build.name}: the pages built on TimelineResponse",
                PAGE_FEEDS.map { it.removeSuffix("JsonAdapter;") + ";" }.toSet(), pages - TIMELINE)

            val found = FixtureDex.methodsWhere(build, { true }) { method ->
                method.builds(pages).isNotEmpty() || method.readsATimeline()
            }
            val builders = found.filter { it.builds(pages).isNotEmpty() }
            assertTrue("${build.name}: something builds a page", builders.any { it.name == "fromJson" })
            for (builder in builders) {
                val built = builder.builds(pages)
                val own = builder.name == "<init>" && builder.definingClass in pages
                val adapter = builder.name == "fromJson" &&
                    builder.definingClass in built.map { it.removeSuffix(";") + "JsonAdapter;" }
                assertTrue("${build.name}: ${builder.definingClass}->${builder.name} builds $built outside its adapter",
                    own || adapter)
                if (adapter && TIMELINE !in built) {
                    assertTrue("${build.name}: ${builder.definingClass} isn't a feed the extension names",
                        builder.definingClass in feeds)
                }
            }

            assertEquals("${build.name}: the adapters that read a Timeline",
                TIMELINE_FEEDS + SEARCH_ADAPTER + OTHER_TIMELINE_READERS,
                found.filter { it.readsATimeline() }.map { it.definingClass }.toSet())
        }
    }

    private fun check(patch: BytecodePatch, status: String, capability: String) {
        for (build in Fixtures.declaredBuilds()) {
            val types = setOf(CAROUSEL, CAROUSEL_ADAPTER)
            val classes = FixtureDex.classes(build, types)
            assertEquals("${build.name}: the carousel and its adapter", types, classes.keys)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)

            timelineCarouselPatch.execute(context)
            patch.execute(context)

            val stub = context.mutableClassDefBy(TIMELINE_FILTER).methods.single { it.name == "carouselItems" }
                .instructionList()
            assertEquals("${build.name}: cast, call, result, return",
                listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
                stub.map { it.opcode })
            assertEquals("${build.name}: cast to the carousel", CAROUSEL,
                ((stub[0] as ReferenceInstruction).reference as TypeReference).type)
            val getter = stub[1].methodRef()!!
            assertEquals(CAROUSEL, getter.definingClass)
            assertTrue("${build.name}: ${getter.name} is a carousel getter of a List", classes.getValue(CAROUSEL).methods.any {
                it.name == getter.name && it.parameterTypes.isEmpty() && it.returnType == "Ljava/util/List;"
            })
            for (flag in listOf(status, capability)) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                    .implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }
}

private const val RUMBLR = "Lcom/tumblr/rumblr"
private const val PAGE_SOURCE = "$EXTENSION_PACKAGE/timeline/PageSource;"
private const val TIMELINE = "$RUMBLR/model/Timeline;"
private const val TIMELINE_RESPONSES = "$RUMBLR/response/timeline/"
private const val TIMELINE_RESPONSE = "${TIMELINE_RESPONSES}TimelineResponse;"

/** Parses every page of every search tab. A blog or community card under it is a result. */
private const val SEARCH_ADAPTER = "$RUMBLR/response/SearchResultsResponseJsonAdapter;"

/** The adapters of the feeds that carry a `Timeline`: the dashboard and its like, a tag's page, the blogs beside a card. */
private val TIMELINE_FEEDS = setOf(
    "$RUMBLR/response/WrappedTimelineResponseJsonAdapter;",
    "$RUMBLR/response/CommunityHubResponseJsonAdapter;",
    "$RUMBLR/model/RelatedBlogsJsonAdapter;",
)

/** The adapters of the feeds built on `TimelineResponse`: the plain page, a blog's posts, likes and blog search. */
private val PAGE_FEEDS = setOf(
    "${TIMELINE_RESPONSES}TimelineResponseJsonAdapter;",
    "${TIMELINE_RESPONSES}PostsResponseJsonAdapter;",
    "${TIMELINE_RESPONSES}LikesResponseJsonAdapter;",
    "${TIMELINE_RESPONSES}BlogSearchResponseJsonAdapter;",
)

/**
 * The other adapters that read a `Timeline`, none of them a list of suggestions: a post's notes and
 * replies, a single post, an Answertime page and Tumblr TV's hub. The extension names none of
 * these, so a blog or community card under one stays.
 */
private val OTHER_TIMELINE_READERS = setOf(
    "$RUMBLR/response/PostNotesResponseJsonAdapter;",
    "$RUMBLR/response/PostResponseJsonAdapter;",
    "$RUMBLR/response/VideoHubResponseJsonAdapter;",
    "$RUMBLR/model/post/PostReplyPreviewJsonAdapter;",
    "$RUMBLR/model/note/RichNoteJsonAdapter;",
    "$RUMBLR/model/answertime/AnswertimeResponseJsonAdapter;",
)

/** A class name as Java writes it, turned into the dex's type descriptor. */
private fun String.descriptor() = "L${replace('.', '/')};"

/** Which of [pages] the method builds: each one whose constructor it calls. */
private fun Method.builds(pages: Set<String>): Set<String> = instructionList().mapNotNull { instruction ->
    instruction.methodRef()?.takeIf {
        (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            it.name == "<init>" && it.definingClass in pages
    }?.definingClass
}.toSet()

/** Whether the method is a generated adapter's constructor asking Moshi for the adapter of a `Timeline`. */
private fun Method.readsATimeline(): Boolean = name == "<init>" && definingClass.endsWith("JsonAdapter;") &&
    instructionList().any {
        it.opcode == Opcode.CONST_CLASS && ((it as ReferenceInstruction).reference as TypeReference).type == TIMELINE
    }
