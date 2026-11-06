/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.patches.tumblr.misc.extension.localRegisterCount
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

/**
 * The footer's count formatter and each of its five buttons in each declared build. The formatter
 * gets the extension's count in place of its own first thing, the community comment text and the
 * notes title go to the extension as they're written, and a community reaction's text goes to it
 * with its count before it's shown, a notes tab's count is asked for first and answers a blank
 * on true, and a comment's reply and like counts go to the extension first, with the reply button
 * after them and the like count's description before it's set; each button gets the question in front
 * of its first instruction and returns at once on true, and the like, comment and share buttons'
 * community controls go to the extension at the end of the community footer's bind. Tumblr's code
 * is otherwise unchanged, and each patch turns its switch and its target on.
 */
@Category(FixtureTests::class)
class PostFooterFixtureTest {
    @Test
    fun `each declared build hands the count formatter the extension's count`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = footerContext(build)
            val formatter = context.resolveCountFormatter()
            val identity = "${formatter.definingClass}->${formatter.name}"
            val before = formatter.instructionList().map { it.opcode }
            val count = formatter.parameterRegisterNumber(0)
            val texts = listOf(
                context.resolveCommunityCommentsText() to COMMUNITY_COMMENTS_TEXT_HOOK,
                context.resolveNotesTitle() to NOTES_TITLE_HOOK,
            )
            val textsBefore = texts.map { (site, _) -> site.method.instructionList().map { it.opcode } }
            val reactions = context.resolveCommunityReactionsText()
            val reactionsBefore = reactions.method.instructionList().map { it.opcode }
            assertEquals("${build.name}: the community comment count is handed over with its text", true,
                texts.first().first.count != null)
            assertEquals("${build.name}: the notes title has no count of its own", null, texts.last().first.count)

            hideNoteCountsPatch.execute(context)

            val body = context.bodyOf(formatter)
            assertEquals("$identity: two instructions added", before.size + 2, body.size)
            assertEquals(identity, Opcode.INVOKE_STATIC, body[0].opcode)
            assertEquals("$identity: the extension is asked", NOTE_COUNT_HOOK, body[0].call())
            assertEquals("$identity: with the count", listOf(count), body[0].namedRegisters())
            assertEquals(identity, Opcode.MOVE_RESULT, body[1].opcode)
            assertEquals("$identity: its answer is the count", count, (body[1] as OneRegisterInstruction).registerA)
            assertEquals("$identity: what follows is Tumblr's own code", before, body.drop(2).map { it.opcode })
            for ((index, pair) in texts.withIndex()) {
                val (site, hook) = pair
                val where = "${site.method.definingClass}->${site.method.name}"
                val text = context.bodyOf(site.method)
                val added = if (site.count == null) 2 else 4
                assertEquals("$where: $added instructions added", textsBefore[index].size + added, text.size)
                assertEquals("$where: right after the text is written", Opcode.MOVE_RESULT_OBJECT, text[site.at - 1].opcode)
                assertEquals(where, site.register, (text[site.at - 1] as OneRegisterInstruction).registerA)
                assertEquals("$where: the extension is handed the text", hook, text[site.at].call())
                assertEquals(where, listOf(site.register), text[site.at].namedRegisters())
                assertEquals("$where: its answer is the text", Opcode.MOVE_RESULT_OBJECT, text[site.at + 1].opcode)
                assertEquals(where, site.register, (text[site.at + 1] as OneRegisterInstruction).registerA)
                site.count?.let { count ->
                    assertEquals("$where: then the count Tumblr bolds", TEXT_COUNT_HOOK, text[site.at + 2].call())
                    assertEquals(where, listOf(count), text[site.at + 2].namedRegisters())
                    assertEquals("$where: its answer is the count", Opcode.MOVE_RESULT_OBJECT, text[site.at + 3].opcode)
                    assertEquals(where, count, (text[site.at + 3] as OneRegisterInstruction).registerA)
                }
                assertEquals("$where: Tumblr's own code around it", textsBefore[index],
                    text.filterIndexed { at, _ -> at !in site.at until site.at + added }.map { it.opcode })
            }
            val reaction = context.bodyOf(reactions.method)
            val where = "${reactions.method.definingClass}->${reactions.method.name}"
            assertEquals("$where: two instructions added", reactionsBefore.size + 2, reaction.size)
            assertEquals("$where: the extension is handed the text and its count",
                COMMUNITY_REACTIONS_TEXT_HOOK, reaction[reactions.at].call())
            assertEquals(where, listOf(reactions.text, reactions.count), reaction[reactions.at].namedRegisters())
            assertEquals("$where: its answer is the text", Opcode.MOVE_RESULT_OBJECT, reaction[reactions.at + 1].opcode)
            assertEquals(where, reactions.text, (reaction[reactions.at + 1] as OneRegisterInstruction).registerA)
            assertEquals("$where: then Tumblr shows it", "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V",
                reaction[reactions.at + 2].call())
            assertEquals("$where: Tumblr's own code around it", reactionsBefore,
                reaction.filterIndexed { at, _ -> at !in reactions.at until reactions.at + 2 }.map { it.opcode })
            assertSwitchedOn(context, build.name, "hideNoteCounts", "noteCounts")
        }
    }

    @Test
    fun `each declared build answers a blank notes tab count first thing when asked to`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = footerContext(build)
            val tab = context.resolveNotesTabCount()
            val identity = "${tab.definingClass}->${tab.name}"
            val before = tab.instructionList().map { it.opcode }

            hideNoteCountsPatch.execute(context)

            val body = context.bodyOf(tab)
            assertEquals("$identity: five instructions added", before.size + 5, body.size)
            assertEquals("$identity: the extension is asked", NOTES_TAB_COUNTS_HOOK, body[0].call())
            assertEquals(identity, Opcode.MOVE_RESULT, body[1].opcode)
            assertEquals(identity, Opcode.IF_EQZ, body[2].opcode)
            assertEquals("$identity: the answer is what's tested",
                (body[1] as OneRegisterInstruction).registerA, (body[2] as OneRegisterInstruction).registerA)
            assertEquals("$identity: false goes on to Tumblr's first instruction",
                body.take(5).sumOf { it.codeUnits }, body.take(2).sumOf { it.codeUnits } + (body[2] as OffsetInstruction).codeOffset)
            assertEquals("$identity: true answers a blank", "", body[3].stringRef())
            assertEquals(identity, Opcode.RETURN_OBJECT, body[4].opcode)
            assertEquals("$identity: the blank is what's answered",
                (body[3] as OneRegisterInstruction).registerA, (body[4] as OneRegisterInstruction).registerA)
            assertEquals("$identity: what follows is Tumblr's own code", before, body.drop(5).map { it.opcode })
            assertSwitchedOn(context, build.name, "hideNoteCounts", "noteCounts")
        }
    }

    @Test
    fun `each declared build hands a comment's reply and like counts and their descriptions to the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = footerContext(build)
            val formatter = context.resolveCountFormatter()
            val sites = context.resolveCommentCounts()
            val renderers = sites.renderers
            assertEquals("${build.name}: the reply count and the like count",
                COMMENT_COUNT_VIEWS.map { it.first }, renderers.map { it.definingClass })
            val before = renderers.map { renderer -> renderer.instructionList().map { it.opcode } }
            val formatterBefore = formatter.instructionList().size

            hideNoteCountsPatch.execute(context)

            for ((index, renderer) in renderers.withIndex()) {
                val identity = "${renderer.definingClass}->${renderer.name}"
                val count = renderer.parameterRegisterNumber(0)
                val body = context.bodyOf(renderer)
                assertEquals("$identity: the extension is asked", COMMENT_COUNT_HOOK, body[0].call())
                assertEquals("$identity: with the count", listOf(count), body[0].namedRegisters())
                assertEquals(identity, Opcode.MOVE_RESULT, body[1].opcode)
                assertEquals("$identity: its answer is the count", count, (body[1] as OneRegisterInstruction).registerA)
                if (index == 0) {
                    assertEquals("$identity: three instructions added", before[index].size + 3, body.size)
                    assertEquals("$identity: then the button goes to the extension for its description",
                        COMMENT_REPLIES_DESCRIPTION_HOOK, body[2].call())
                    assertEquals("$identity: this, the button", listOf(renderer.localRegisterCount()), body[2].namedRegisters())
                    assertEquals("$identity: what follows is Tumblr's own code", before[index], body.drop(3).map { it.opcode })
                } else {
                    val at = sites.likesDescribed + 2
                    val text = sites.likesDescription
                    assertEquals("$identity: four instructions added", before[index].size + 4, body.size)
                    assertEquals("$identity: the description goes to the extension", COMMENT_LIKES_DESCRIPTION_HOOK, body[at].call())
                    assertEquals("$identity: with its text", listOf(text), body[at].namedRegisters())
                    assertEquals(identity, Opcode.MOVE_RESULT_OBJECT, body[at + 1].opcode)
                    assertEquals("$identity: its answer is the text", text, (body[at + 1] as OneRegisterInstruction).registerA)
                    assertEquals("$identity: right before Tumblr sets it", "setContentDescription", body[at + 2].methodRef()?.name)
                    assertEquals("$identity: on that text", text, body[at + 2].namedRegisters()[1])
                    assertEquals("$identity: Tumblr's own code around it", before[index],
                        (body.subList(2, at) + body.drop(at + 2)).map { it.opcode })
                }
            }
            val footer = context.bodyOf(formatter)
            assertEquals("${build.name}: the footer's formatter keeps its own hook alone", formatterBefore + 2, footer.size)
            assertEquals(NOTE_COUNT_HOOK, footer[0].call())
            assertEquals("${build.name}: and no comment count", false, footer.any { it.call() == COMMENT_COUNT_HOOK })
            assertSwitchedOn(context, build.name, "hideNoteCounts", "noteCounts")
        }
    }

    @Test
    fun `each declared build returns from the like button first thing when asked to`() =
        checkButton(hideLikeButtonPatch, LIKE_CONTROL, HIDE_LIKE_HOOK, "hideLikeButton", "likeButton",
            HIDE_COMMUNITY_REACTIONS_HOOK to COMMUNITY_REACTION_CONTROLS)

    @Test
    fun `each declared build returns from the reblog button first thing when asked to`() =
        checkButton(hideReblogButtonPatch, REBLOG_CONTROL, HIDE_REBLOG_HOOK, "hideReblogButton", "reblogButton", null)

    @Test
    fun `each declared build returns from the comment button first thing when asked to`() =
        checkButton(hideCommentButtonPatch, COMMENT_CONTROL, HIDE_COMMENT_HOOK, "hideCommentButton", "commentButton",
            HIDE_COMMUNITY_COMMENTS_HOOK to COMMUNITY_COMMENT_CONTROLS)

    @Test
    fun `each declared build returns from the share button first thing when asked to`() =
        checkButton(hideShareButtonPatch, SHARE_CONTROL, HIDE_SHARE_HOOK, "hideShareButton", "shareButton",
            HIDE_COMMUNITY_SHARE_HOOK to COMMUNITY_SHARE_CONTROLS)

    @Test
    fun `each declared build returns from the Save button first thing when asked to`() =
        checkButton(hideSaveButtonPatch, SAVE_CONTROL, HIDE_SAVE_HOOK, "hideSaveButton", "saveButton", null)

    @Test
    fun `each declared build hands the community footer to every button patch it has`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = footerContext(build)
            val site = context.resolveCommunityFooterBind("test", HIDE_COMMUNITY_SHARE_HOOK, COMMUNITY_SHARE_CONTROLS)
            val before = site.method.instructionList().map { it.opcode }

            hideLikeButtonPatch.execute(context)
            hideCommentButtonPatch.execute(context)
            hideShareButtonPatch.execute(context)

            val body = context.bodyOf(site.method)
            val where = "${site.method.definingClass}->${site.method.name}"
            assertEquals("$where: one call per patch", before.size + 3, body.size)
            assertEquals("$where: each in front of the return",
                listOf(HIDE_COMMUNITY_REACTIONS_HOOK, HIDE_COMMUNITY_COMMENTS_HOOK, HIDE_COMMUNITY_SHARE_HOOK),
                body.subList(site.at, site.at + 3).map { it.call() })
            assertEquals(where, Opcode.RETURN_VOID, body.last().opcode)
        }
    }

    /**
     * Applies [patch] to each declared build and checks the button Compose calls [control] asks
     * [hook] first and returns at once on true, that [community]'s hook, when the patch has one, goes
     * in front of the community footer bind's return with the footer, and that [status] and
     * [capability] are on.
     */
    private fun checkButton(
        patch: BytecodePatch,
        control: String,
        hook: String,
        status: String,
        capability: String,
        community: Pair<String, List<String>>?,
    ) {
        for (build in Fixtures.declaredBuilds()) {
            val context = footerContext(build)
            val button = context.resolveFooterButton("test", control, hook)
            val identity = "${button.definingClass}->${button.name}"
            val before = button.instructionList().map { it.opcode }
            val site = community?.let { (communityHook, controls) ->
                context.resolveCommunityFooterBind("test", communityHook, controls)
            }
            val bindBefore = site?.method?.instructionList()?.map { it.opcode }

            patch.execute(context)

            val body = context.bodyOf(button)
            assertEquals("$identity: four instructions added", before.size + 4, body.size)
            assertEquals(identity, Opcode.INVOKE_STATIC, body[0].opcode)
            assertEquals("$identity: the extension is asked", hook, body[0].call())
            assertEquals(identity, Opcode.MOVE_RESULT, body[1].opcode)
            assertEquals(identity, Opcode.IF_EQZ, body[2].opcode)
            assertEquals("$identity: the answer is what's tested",
                (body[1] as OneRegisterInstruction).registerA, (body[2] as OneRegisterInstruction).registerA)
            assertEquals("$identity: true returns at once", Opcode.RETURN_VOID, body[3].opcode)
            assertEquals("$identity: what follows is Tumblr's own code", before, body.drop(4).map { it.opcode })
            if (community != null && site != null && bindBefore != null) {
                val where = "${site.method.definingClass}->${site.method.name}"
                val bind = context.bodyOf(site.method)
                assertEquals("$where: one call added", bindBefore.size + 1, bind.size)
                assertEquals("$where: the extension is handed the footer", community.first, bind[site.at].call())
                assertEquals("$where: this, the footer", listOf(site.method.localRegisterCount()), bind[site.at].namedRegisters())
                assertEquals("$where: right before the return", Opcode.RETURN_VOID, bind[site.at + 1].opcode)
                assertEquals("$where: Tumblr's own code around it", bindBefore,
                    bind.filterIndexed { at, _ -> at != site.at }.map { it.opcode })
            }
            assertSwitchedOn(context, build.name, status, capability)
        }
    }

    /**
     * The footer's controls, found by their source notes, and every class with a static method
     * turning an int into a String, which takes in the class that builds the buttons' states. Also
     * the community footer and its controls, the community comment text, every reader of the notes
     * count plural, the notes title among them, the adapter that makes the notes tabs, and the two
     * Views a comment on the notes writes its own counts with.
     */
    private fun footerContext(build: File): BytecodePatchContext {
        val classes = FixtureDex.classesWhere(build, { true }) { method ->
            method.strings().any { it.startsWith(FOOTER_CONTROLS) || it.startsWith(COMMUNITY_COMMENTS_TEXT) } ||
                (method.isStatic() && method.returnType == "Ljava/lang/String;" &&
                    method.parameterTypes.map { it.toString() } == listOf("I")) ||
                method.definingClass == COMMUNITY_FOOTER || method.definingClass.startsWith(COMMUNITY_CONTROLS) ||
                method.instructionList().any { it.fieldRef()?.name == "note_count_show" } || method.makesNotesTabs() ||
                COMMENT_COUNT_VIEWS.any { it.first == method.definingClass }
        }
        return PatchContexts.of(ExtensionDex.classes() + classes)
    }

    private fun BytecodePatchContext.bodyOf(method: Method): List<Instruction> =
        mutableClassDefBy(method.definingClass).methods
            .single { it.name == method.name && it.parameterTypes == method.parameterTypes }
            .instructionList()

    private fun Instruction.call(): String? = methodRef()?.let {
        "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}"
    }

    /** Each of [flags] in the status class now answers true. */
    private fun assertSwitchedOn(context: BytecodePatchContext, build: String, vararg flags: String) {
        for (flag in flags) {
            val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                .implementation!!.instructions.first()
            assertEquals("$build: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
        }
    }
}
