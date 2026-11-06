/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.parameterRegister
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.requireThisIntact
import app.morphe.patches.tumblr.misc.extension.returnEarlyWhen
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.EXTENSION_ROOT
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import app.morphe.util.writesRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide note counts"
internal const val NOTE_COUNT_HOOK = "$POST_FOOTER->noteCount(I)I"
internal const val COMMUNITY_COMMENTS_TEXT_HOOK = "$POST_FOOTER->communityCommentsText(Ljava/lang/String;)Ljava/lang/String;"
internal const val NOTES_TITLE_HOOK = "$POST_FOOTER->notesTitle(Ljava/lang/String;)Ljava/lang/String;"
internal const val TEXT_COUNT_HOOK = "$POST_FOOTER->textCount(Ljava/lang/String;)Ljava/lang/String;"
internal const val COMMUNITY_REACTIONS_TEXT_HOOK =
    "$POST_FOOTER->communityReactionsText(Ljava/lang/String;I)Ljava/lang/String;"
internal const val NOTES_TAB_COUNTS_HOOK = "$POST_FOOTER->hideNotesTabCounts()Z"
internal const val COMMENT_COUNT_HOOK = "$POST_FOOTER->commentCount(I)I"
internal const val COMMENT_REPLIES_DESCRIPTION_HOOK = "$POST_FOOTER->commentRepliesDescription(Landroid/view/View;)V"
internal const val COMMENT_LIKES_DESCRIPTION_HOOK =
    "$POST_FOOTER->commentLikesDescription(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;"

/**
 * A comment's reply count and its like count on a post's notes, by the Views Tumblr names in its
 * layouts, so R8 keeps the names, each with the plural its renderer reads for the screen reader.
 */
internal val COMMENT_COUNT_VIEWS = listOf(
    "Lcom/tumblr/ui/widget/RepliesCountView;" to "comments_count",
    "Lcom/tumblr/ui/widget/ReplyLikeButtonView;" to "like_count_show",
)

/** The three tabs of a post's notes screen, by the fragments Tumblr makes for them, kept by name in 46.5.0.109. */
internal val NOTES_TAB_FRAGMENTS = listOf(
    "Lcom/tumblr/notes/view/replies/PostNotesRepliesFragment;",
    "Lcom/tumblr/notes/view/reblogs/PostNotesReblogsFragment;",
    "Lcom/tumblr/notes/view/likes/PostNotesLikesFragment;",
)

/** A community post's reaction button, a View Tumblr names in its layouts, so R8 keeps the name. */
internal const val REACTION_CONTROL = "${COMMUNITY_CONTROLS}CommunitiesReactionControl;"

/** Compose's source note for the function that writes a community post's comment count. */
internal const val COMMUNITY_COMMENTS_TEXT = "com.tumblr.ui.widget.postcontrol.rememberFormattedComments ("

/** The plurals Tumblr writes "3 comments" on a community post and "12 notes" over a post's notes with. */
private const val COMMUNITY_COMMENTS_PLURAL = "community_post_comments"
private const val NOTE_COUNT_PLURAL = "note_count_show"

private const val STRING = "Ljava/lang/String;"
private const val STRING_BUILDER = "Ljava/lang/StringBuilder;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"

/**
 * Where a count text hook goes: in front of instruction [at], on the text in [register]. [count] is
 * the register of the count Tumblr bolds inside that text, when it does, which `PostFooter.textCount`
 * blanks right after whenever the text went to a word.
 */
internal class CountTextSite(val method: MutableMethod, val at: Int, val register: Int, val count: Int? = null)

/**
 * The two methods that write a comment's counts, in [COMMENT_COUNT_VIEWS] order, and where the
 * like count's spoken description gets its hook: in front of instruction [likesDescribed] of the
 * second, the `setContentDescription` that sets the text in register [likesDescription].
 */
internal class CommentCountSites(
    val renderers: List<MutableMethod>,
    val likesDescribed: Int,
    val likesDescription: Int,
)

/**
 * Where the reaction text hook goes: in front of instruction [at], the `setText` that shows the text
 * in register [text], with the reactions' total still in register [count].
 */
internal class ReactionTextSite(val method: MutableMethod, val at: Int, val text: Int, val count: Int)

/**
 * Hands the method that turns a like, reblog or comment count into the footer's text the count
 * `PostFooter.noteCount` answers, zero while the switch is on. Tumblr shows no count for zero, so
 * the buttons stay and their counts go. The switch is read for each count, so it shows on the next
 * post that scrolls in, without a restart.
 *
 * Each footer button that shows a count takes its own state as its first parameter: the comment,
 * like and reblog buttons, found by their source notes ([resolveFooterControl]). One class builds
 * all three states, the one with a static method returning each, and the formatter is its one
 * static method taking an int and returning a String. Every footer built with Tumblr's split note
 * counts goes through it, reblog notes included. Found by reading Tumblr 46.5.0.109 (2026-10-11).
 *
 * Two more counts are words rather than numbers, so they get Tumblr's own word in their place:
 * a community post's comment button writes "3 comments" ([resolveCommunityCommentsText]), and a
 * post's notes screen is titled "12 notes" ([resolveNotesTitle]). Each is read as it's written.
 * The notes screen's comment, reblog and like tabs each show a count too, which go blank the way
 * Tumblr leaves a count it doesn't have yet ([resolveNotesTabCount]), read each time the tabs are
 * drawn.
 *
 * A community post's reactions stand in for likes there, and each reaction button writes its emoji,
 * a space and how many reacted ([resolveCommunityReactionsText]); the extension hands back just the
 * emoji, read each time the button is bound.
 *
 * Each comment on a post's notes shows its own reply and like counts, which its two Views write
 * from a count handed to each ([resolveCommentCounts]). Those go to zero the same way, read each
 * time a comment is bound. Both buttons also tell TalkBack their count: the reply button keeps a
 * description it was given for an earlier count, which goes, and the like button's "0 likes" goes
 * to Tumblr's own "Like".
 */
@Suppress("unused")
val hideNoteCountsPatch = bytecodePatch(
    name = PATCH,
    description = "Takes the like, reblog and comment counts off the footer under posts, community posts" +
        " included, and the counts off a post's notes, from the top and its tabs to each comment's likes and replies." +
        " The buttons stay and still work. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts.",
    default = true,
) {
    category("Posts")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideNoteCounts")
        requireStatusMethod("noteCounts")
        // Found and checked before any edit, so a refusal leaves the APK as it was.
        val formatter = resolveCountFormatter()
        val texts = listOf(
            resolveCommunityCommentsText() to COMMUNITY_COMMENTS_TEXT_HOOK,
            resolveNotesTitle() to NOTES_TITLE_HOOK,
        )
        val reactions = resolveCommunityReactionsText()
        val tabCount = resolveNotesTabCount()
        val commentCounts = resolveCommentCounts()
        val count = formatter.parameterRegister(0)
        formatter.addInstructions(
            0,
            """
                invoke-static {$count}, $NOTE_COUNT_HOOK
                move-result $count
            """,
        )
        for ((site, hook) in texts) {
            // The count Tumblr bolds inside the text follows it, so the bold never lands on the word.
            val bolded = site.count?.let { register ->
                """
                    invoke-static/range { v$register .. v$register }, $TEXT_COUNT_HOOK
                    move-result-object v$register
                """
            }.orEmpty()
            site.method.addInstructions(
                site.at,
                """
                    invoke-static {v${site.register}}, $hook
                    move-result-object v${site.register}
                """ + bolded,
            )
        }
        reactions.method.addInstructions(
            reactions.at,
            """
                invoke-static {v${reactions.text}, v${reactions.count}}, $COMMUNITY_REACTIONS_TEXT_HOOK
                move-result-object v${reactions.text}
            """,
        )
        tabCount.returnEarlyWhen(PATCH, NOTES_TAB_COUNTS_HOOK, "const-string v0, \"\"\nreturn-object v0")
        val (replies, likes) = commentCounts.renderers
        // In front of the like count's description before anything goes in at the start, which moves it.
        likes.addInstructions(
            commentCounts.likesDescribed,
            """
                invoke-static {v${commentCounts.likesDescription}}, $COMMENT_LIKES_DESCRIPTION_HOOK
                move-result-object v${commentCounts.likesDescription}
            """,
        )
        for (renderer in commentCounts.renderers) {
            val shown = renderer.parameterRegister(0)
            // The reply count's zero branch writes over p0, so its description is cleared up front.
            val described = if (renderer === replies) "invoke-static {p0}, $COMMENT_REPLIES_DESCRIPTION_HOOK" else ""
            renderer.addInstructions(
                0,
                """
                    invoke-static {$shown}, $COMMENT_COUNT_HOOK
                    move-result $shown
                    $described
                """,
            )
        }
        enableCapability("noteCounts")
        enableStatus("hideNoteCounts")
    }
}

/**
 * The footer's count formatter, throwing when this build has none, several, or one that doesn't
 * turn its count into text the way Tumblr's does.
 */
internal fun BytecodePatchContext.resolveCountFormatter(): MutableMethod {
    requireExtensionHook(PATCH, NOTE_COUNT_HOOK)
    val states = listOf(COMMENT_CONTROL, LIKE_CONTROL, REBLOG_CONTROL).map { control ->
        val button = resolveFooterControl(PATCH, control)
        requireShape(PATCH, button.parameterTypes.isNotEmpty(), "the footer's $control takes no state")
        button.parameterTypes.first().toString()
    }
    val builders = mutableListOf<ClassDef>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        val built = owner.methods.filter { it.isStatic() }.map { it.returnType }.toSet()
        if (built.containsAll(states)) builders += owner
    }
    val builder = builders.distinctBy { it.type }.only(PATCH, "the class that builds the footer's button states")
    val formatter = builder.methods
        .filter { method ->
            method.isStatic() && method.returnType == "Ljava/lang/String;" &&
                method.parameterTypes.map { it.toString() } == listOf("I")
        }
        .only(PATCH, "the footer's count formatter")
    requireShape(
        PATCH,
        "" in formatter.strings() && formatter.instructionList().any { instruction ->
            instruction.methodRef()?.let { it.definingClass == "Ljava/lang/String;" && it.name == "valueOf" } == true
        },
        "the footer's count formatter doesn't leave zero blank and write the rest as digits",
    )
    return mutableOf(formatter)
}

/**
 * Right after a community post's comment button has its "3 comments" text, throwing when this build
 * has no such function, several, or one that writes the text another way.
 *
 * The function is the one whose source note starts with [COMMUNITY_COMMENTS_TEXT]. It reads the
 * [COMMUNITY_COMMENTS_PLURAL] plural and hands it to a call that answers the text; the hook goes
 * right after that answer is moved into its register (index 61 in 46.5.0.109), where nothing jumps.
 *
 * The plural's one argument is the formatted count (v27, packed at 55), and Tumblr later bolds as
 * many characters at the start of the text as that count has (its `String.length()` at 104). The
 * count is handed over right after the text, so it goes blank with it: the first thing after the
 * hook to name that register has to be that `length()` read, so nothing else sees the blank count.
 * Found by reading Tumblr 46.5.0.109 (2026-10-11).
 */
internal fun BytecodePatchContext.resolveCommunityCommentsText(): CountTextSite {
    requireExtensionHook(PATCH, COMMUNITY_COMMENTS_TEXT_HOOK)
    requireExtensionHook(PATCH, TEXT_COUNT_HOOK)
    val writer = classDefByStrings(COMMUNITY_COMMENTS_TEXT, StringComparisonType.STARTS_WITH)
        .filter { !it.type.startsWith(EXTENSION_ROOT) }
        .distinctBy { it.type }
        .flatMap { owner -> owner.methods.filter { method -> method.strings().any { it.startsWith(COMMUNITY_COMMENTS_TEXT) } } }
        .only(PATCH, "the function that writes a community post's comment count")
    val body = writer.instructionList()
    val plural = body.indexOfFirst { it.readsPlural(COMMUNITY_COMMENTS_PLURAL) }
    requireShape(PATCH, plural >= 0, "the community comment count isn't written with $COMMUNITY_COMMENTS_PLURAL")
    val written = (plural + 1 until body.size).firstOrNull { body[it].methodRef()?.returnType == STRING }
    val site = textSiteAfter(writer, written, "the community comment count")

    val packed = (plural + 1 until site.at)
        .filter { body[it].opcode == Opcode.FILLED_NEW_ARRAY || body[it].opcode == Opcode.FILLED_NEW_ARRAY_RANGE }
        .singleOrNull()?.let { body[it].namedRegisters().singleOrNull() }
    requireShape(PATCH, packed != null, "the community comment count isn't the plural's one argument")
    val count = packed!!
    val measured = (site.at until body.size).firstOrNull { count in body[it].namedRegisters() }
    requireShape(PATCH, measured != null && body[measured].measuresString() &&
        (site.at until measured).none { writesRegister(body[it], count) },
        "the community comment count isn't measured for its bold right after the text")
    requireShape(PATCH, count <= 255, "the community comment count is in v$count, past what its answer can be moved to")
    return CountTextSite(site.method, site.at, site.register, count)
}

/**
 * Right after a post's notes screen has its "12 notes" title, throwing when this build has no such
 * method, several, or one that sets the title another way.
 *
 * The method is the one that reads the [NOTE_COUNT_PLURAL] plural and sets the activity's title
 * (`PostNotesFragment.I5`, a private `(I)V`, in 46.5.0.109). The hook goes right after the
 * `getQuantityString` answer is moved into its register (index 12), and that register has to reach
 * the `setTitle` call unchanged. Found by reading Tumblr 46.5.0.109 (2026-10-11).
 */
internal fun BytecodePatchContext.resolveNotesTitle(): CountTextSite {
    requireExtensionHook(PATCH, NOTES_TITLE_HOOK)
    val titles = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(titles) { method ->
            val body = method.instructionList()
            body.any { it.readsPlural(NOTE_COUNT_PLURAL) } && body.any { it.setsTitle() }
        }
    }
    val title = titles.only(PATCH, "the method that titles a post's notes with its count")
    val body = title.instructionList()
    val plural = body.indexOfFirst { it.readsPlural(NOTE_COUNT_PLURAL) }
    val written = (plural + 1 until body.size).firstOrNull { body[it].methodRef()?.name == "getQuantityString" }
    val site = textSiteAfter(title, written, "the notes title")
    val shown = (site.at until body.size).firstOrNull { body[it].setsTitle() }
    requireShape(PATCH, shown != null && body[shown].namedRegisters().getOrNull(1) == site.register &&
        (site.at until shown).none { writesRegister(body[it], site.register) },
        "the notes title isn't set from the count text unchanged")
    return site
}

/**
 * Right before a community post's reaction button shows its text, throwing when this build has no
 * such button, no method that writes it, or one that writes it another way.
 *
 * The button is [REACTION_CONTROL], and the method is its one instance method taking a List and
 * returning nothing (`d`, regs=12, in 46.5.0.109), called from the community footer's bind for each
 * reaction. It adds up the reactions' counts (v4), joins their emoji, then appends a space and the
 * total with `StringBuilder.append(I)` (35), moves `toString()` into v11 (37) and hands it to
 * `TextView.setText` (38). The hook goes in front of that `setText`, where nothing jumps, with the
 * text and the total. Nothing measures the text or reads it back afterwards: the button keeps its
 * reactions in a list field of its own, which is what `c()` reads. Found by reading Tumblr
 * 46.5.0.109 (2026-10-11).
 */
internal fun BytecodePatchContext.resolveCommunityReactionsText(): ReactionTextSite {
    requireExtensionHook(PATCH, COMMUNITY_REACTIONS_TEXT_HOOK)
    val control = classDefByOrNull(REACTION_CONTROL)
    requireShape(PATCH, control != null, "Tumblr's community footer has no CommunitiesReactionControl")
    val writer = control!!.methods
        .filter { method ->
            !method.isStatic() && method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;")
        }
        .only(PATCH, "the method that writes a community reaction's count")
    val body = writer.instructionList()
    val appended = body.indexOfFirst { it.callsStringBuilder("append", listOf("I")) }
    requireShape(PATCH, appended >= 0, "the community reaction count isn't appended as a number")
    val count = body[appended].namedRegisters().getOrNull(1)
    val built = (appended + 1 until body.size).firstOrNull { body[it].callsStringBuilder("toString", emptyList()) }
    val moved = built?.let { body.getOrNull(it + 1) }
    requireShape(PATCH, count != null && moved?.opcode == Opcode.MOVE_RESULT_OBJECT,
        "the community reaction text isn't a String moved into a register")
    val text = (moved as OneRegisterInstruction).registerA
    val at = (built!! + 2 until body.size).firstOrNull { body[it].setsText() }
    requireShape(PATCH, at != null && body[at].namedRegisters().getOrNull(1) == text &&
        (built + 2 until at).none { writesRegister(body[it], text) } &&
        (appended + 1 until at).none { writesRegister(body[it], count!!) },
        "the community reaction text and its count don't reach setText unchanged")
    requireShape(PATCH, !writer.isJumpTarget(at!!), "something jumps past the hook on the community reaction text")
    requireShape(PATCH, text <= 15 && count!! <= 15,
        "the community reaction text or count is past what the added call can name")
    return ReactionTextSite(mutableOf(writer), at, text, count!!)
}

/**
 * The method that writes the count on one of a post's notes screen tabs, throwing when this build
 * has no such adapter, several, or one that writes its counts another way.
 *
 * The adapter is the one class that makes the three tabs' fragments ([NOTES_TAB_FRAGMENTS]) from
 * their position (`pke.X`, in 46.5.0.109), and the method is its one instance method taking the
 * position and answering a CharSequence (`pke.q0`). It writes the tab's count with
 * `NumberFormat.getIntegerInstance()` and answers "" for a count it doesn't have yet.
 * `PostNotesFragment` hands that answer to each tab when it sets the tabs up (`X4`) and each time
 * the counts change (`R5`), so the hook goes first thing and answers "" itself while the switch is
 * on. Found by reading Tumblr 46.5.0.109 (2026-10-14).
 */
internal fun BytecodePatchContext.resolveNotesTabCount(): MutableMethod {
    requireExtensionHook(PATCH, NOTES_TAB_COUNTS_HOOK)
    val adapters = mutableListOf<ClassDef>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        if (owner.methods.any { it.makesNotesTabs() }) adapters += owner
    }
    val adapter = adapters.distinctBy { it.type }.only(PATCH, "the adapter behind a post's notes tabs")
    val count = adapter.methods
        .filter { method ->
            !method.isStatic() && method.returnType == CHAR_SEQUENCE &&
                method.parameterTypes.map(CharSequence::toString) == listOf("I")
        }
        .only(PATCH, "the method that writes a notes tab's count")
    requireShape(
        PATCH,
        "" in count.strings() && count.instructionList().any { instruction ->
            instruction.methodRef()?.let { it.definingClass == "Ljava/text/NumberFormat;" && it.name == "getIntegerInstance" } == true
        },
        "the notes tab count isn't written as a number, blank when it's unknown",
    )
    return mutableOf(count)
}

/**
 * The two methods that write a comment's reply count and its like count on a post's notes,
 * throwing when this build lacks either View, has no such method or several, or one that writes
 * its count another way.
 *
 * Each View of [COMMENT_COUNT_VIEWS] has one instance method taking the count and returning
 * nothing that reads the View's plural (`RepliesCountView.V` and `ReplyLikeButtonView.W`, both
 * private, in 47.0.0.108). The first thing either does with the count is test it with `if-lez`:
 * the reply count shows Tumblr's "Reply" label for zero, and the like count goes GONE. The notes
 * reply cards are the only callers of their public setters (`iih.G` and `ijh.i` bind
 * `NoteReplyViewHolder`), and they hand each setter the comment's own count on every bind, so the
 * hook only changes what's drawn and the next bind with the switch off shows the real count.
 * Found by reading Tumblr 47.0.0.108 (2026-11-05).
 *
 * Each also sets the View's spoken description from its plural, and only from there. The reply
 * count sets it for a count and leaves it be for zero, whose branch then writes over `this`
 * (`V` 0x35-0x46), so the description hook takes `this` right after the count hook. The like count
 * sets it on every bind with one `setContentDescription` on `this` (`W` 0x44, from v5), and its
 * hook goes in front of that call, on its text.
 */
internal fun BytecodePatchContext.resolveCommentCounts(): CommentCountSites {
    requireExtensionHook(PATCH, COMMENT_COUNT_HOOK)
    requireExtensionHook(PATCH, COMMENT_REPLIES_DESCRIPTION_HOOK)
    requireExtensionHook(PATCH, COMMENT_LIKES_DESCRIPTION_HOOK)
    val renderers = COMMENT_COUNT_VIEWS.map { (type, plural) ->
        val name = type.substringAfterLast('/').removeSuffix(";")
        val view = classDefByOrNull(type)
        requireShape(PATCH, view != null, "Tumblr's notes have no $name")
        val renderer = view!!.methods
            .filter { method ->
                !method.isStatic() && method.returnType == "V" &&
                    method.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                    method.instructionList().any { it.readsPlural(plural) }
            }
            .only(PATCH, "the method that writes the $name count")
        val count = renderer.parameterRegisterNumber(0)
        val body = renderer.instructionList()
        val tested = body.firstOrNull { count in it.namedRegisters() }
        requireShape(PATCH, tested?.opcode == Opcode.IF_LEZ, "the $name count isn't tested for zero before it's used")
        requireShape(PATCH, count <= 15, "the $name count is in v$count, past what the added call can name")
        requireShape(PATCH, !renderer.isJumpTarget(0), "something jumps back to the start of the $name count")
        mutableOf(renderer)
    }
    val (replies, likes) = renderers
    requireShape(PATCH, replies.instructionList().any { it.setsDescription() },
        "the RepliesCountView count doesn't set the button's spoken description")
    val body = likes.instructionList()
    val described = body.indices.filter { body[it].setsDescription() }
    requireShape(PATCH, described.size == 1, "the ReplyLikeButtonView count doesn't set its spoken description once")
    val at = described.single()
    val registers = body[at].namedRegisters()
    requireShape(PATCH, body[at].opcode == Opcode.INVOKE_VIRTUAL && registers.size == 2 &&
        registers[0] == likes.parameterRegisterNumber(0) - 1,
        "the ReplyLikeButtonView count doesn't set the description on the button itself")
    likes.requireThisIntact(PATCH, listOf(at))
    val text = registers[1]
    requireShape(PATCH, text <= 15, "the ReplyLikeButtonView description is in v$text, past what the added call can name")
    requireShape(PATCH, !likes.isJumpTarget(at), "something jumps past the hook on the ReplyLikeButtonView description")
    return CommentCountSites(renderers, at, text)
}

/** A method answering the Fragment for a position that makes each of [NOTES_TAB_FRAGMENTS]. */
internal fun Method.makesNotesTabs(): Boolean {
    if (returnType != "Landroidx/fragment/app/Fragment;" || parameterTypes.map(CharSequence::toString) != listOf("I")) {
        return false
    }
    val made = instructionList()
        .filter { it.opcode == Opcode.NEW_INSTANCE }
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type }
        .toSet()
    return made.containsAll(NOTES_TAB_FRAGMENTS)
}

/**
 * The place right after the call at [written] has its String answer moved into a register, ready
 * for a hook on it, throwing naming [what] when there's no such call, no move, or the place can't
 * take the hook.
 */
private fun BytecodePatchContext.textSiteAfter(method: Method, written: Int?, what: String): CountTextSite {
    val body = method.instructionList()
    val moved = written?.let { body.getOrNull(it + 1) }
    requireShape(PATCH, moved?.opcode == Opcode.MOVE_RESULT_OBJECT && body[written!!].methodRef()?.returnType == STRING,
        "$what isn't a String moved into a register")
    val register = (moved as OneRegisterInstruction).registerA
    val at = written!! + 2
    requireShape(PATCH, register <= 15, "$what is in v$register, past what the added call can name")
    requireShape(PATCH, at < body.size && !method.isJumpTarget(at), "something jumps past the hook on $what")
    return CountTextSite(mutableOf(method), at, register)
}

/** An `sget` of the plural resource named [name], from whichever R class holds it. */
private fun Instruction.readsPlural(name: String): Boolean =
    opcode == Opcode.SGET && fieldRef()?.let { it.name == name && it.definingClass.endsWith("R\$plurals;") } == true

/** A call of `String.length()`. */
private fun Instruction.measuresString(): Boolean =
    methodRef()?.let { it.definingClass == STRING && it.name == "length" && it.parameterTypes.isEmpty() } == true

/** A call of `StringBuilder.[name]` taking [parameters]. */
private fun Instruction.callsStringBuilder(name: String, parameters: List<String>): Boolean =
    methodRef()?.let {
        it.definingClass == STRING_BUILDER && it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters
    } == true

/** A call of `TextView.setText(CharSequence)`. */
private fun Instruction.setsText(): Boolean =
    methodRef()?.let {
        it.definingClass == "Landroid/widget/TextView;" && it.name == "setText" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(CHAR_SEQUENCE)
    } == true

/** A call of `View.setContentDescription(CharSequence)`. */
private fun Instruction.setsDescription(): Boolean =
    methodRef()?.let {
        it.name == "setContentDescription" && it.parameterTypes.map(CharSequence::toString) == listOf(CHAR_SEQUENCE)
    } == true

/** A call of `Activity.setTitle(CharSequence)`. */
private fun Instruction.setsTitle(): Boolean =
    methodRef()?.let { it.name == "setTitle" && it.parameterTypes.map(CharSequence::toString) == listOf(CHAR_SEQUENCE) } == true
