/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.comments

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Filter comments"

/** The extension's filter, and the stubs the patch writes into it. */
internal const val COMMENTS = "$EXTENSION_PACKAGE/comments/CommentFilter;"

/** The opened post's repository. Its name survives Redex; its methods' names don't. */
internal const val PERMALINK_REPOSITORY = "Lcom/instagram/barcelona/permalink/data/BarcelonaPermalinkRepository;"

/** The answer Threads parses an opened post's replies from. */
internal const val REPLIES_RESPONSE = "Lcom/instagram/api/schemas/TextAppRepliesResponseIntf;"

/** One reply. A kept schema interface, whose method names Redex renames. */
internal const val THREAD = "Lcom/instagram/api/schemas/ThreadIntf;"

/** One post inside a reply; a reply's text is the text of the post it carries. */
internal const val THREAD_ITEM = "Lcom/instagram/api/schemas/ThreadItemIntf;"

/** A post. A kept class. */
internal const val MEDIA = "Lcom/instagram/feed/media/Media;"

/** A post's text with its mentions and links. A kept schema interface. */
internal const val TEXT_WITH_ENTITIES = "Lcom/instagram/api/schemas/TextWithEntitiesIntf;"

/** The helpers Threads keeps for a post's caption. A kept class. */
internal const val MEDIA_EXT = "Lcom/instagram/feed/media/MediaExtKt;"

private const val LIST = "Ljava/util/List;"
private const val STRING = "Ljava/lang/String;"

/**
 * The repository's parse of one opened post's answer: it takes the answer, the repository, two
 * state objects and two flags, and answers the next state. A suspend function, so its answer is an
 * object, and the names of its own and the state's types change with every build.
 */
internal object RepliesParseFingerprint : Fingerprint(
    definingClass = PERMALINK_REPOSITORY,
    returnType = "L",
    parameters = listOf(REPLIES_RESPONSE, PERMALINK_REPOSITORY, "L", "L", "Z", "Z"),
)

/**
 * Takes replies that match the user's patterns, or that carry a link while links are hidden, out of
 * an opened post before Threads parses them into rows.
 *
 * <p>Threads reads the answer's list of replies and parses each one into the row it draws. The
 * patch hands that list to the extension first and parses what comes back, so a reply that is taken
 * out was never parsed, counted or drawn, and the replies that stay keep their order.
 *
 * <p>What a reply says is read from the post it carries. Those reads have a new name in every
 * build, so four of them are written into the extension here: the reply's list of posts, a post's
 * media, a media's own text, and the caption Threads keeps beside it. Each is found by its shape on
 * a class Threads keeps the name of, and each has to be the only one of its shape, or the patch
 * refuses rather than filtering the wrong thing.
 */
@Suppress("unused")
val filterCommentsPatch = bytecodePatch(
    name = PATCH,
    description = "Leaves out the replies to a post that match words or domains you list, such as the shop link a " +
        "spam reply ends with, before Threads shows them. A second switch under it also hides any reply with a " +
        "web link. The replies that stay keep their order. Starts off. Turn it on and add your list in HushThreads " +
        "settings > Comments.",
) {
    category("Feed")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.threads())
    dependsOn(threadsExtensionPatch)

    execute {
        requireStatusMethod("filterComments")

        val parse = RepliesParseFingerprint.method
        val site = parse.replyListSite()
        // Read before the first stub is written, so a refusal leaves the extension as it was.
        val list = (parse.implementation!!.instructions.toList()[site + 1] as OneRegisterInstruction).registerA

        val threadList = threadListGetter()
        val itemMedia = itemMediaGetter()
        val mediaText = mediaTextGetter()
        val textBody = textBodyGetter(mediaText.returnType)
        val caption = captionHelper()

        writeStub(
            COMMENTS, "threadItems", 2,
            """
                instance-of v0, p0, $THREAD
                if-eqz v0, :none
                check-cast p0, $THREAD
                invoke-interface { p0 }, $THREAD->${threadList.name}()$LIST
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
        )
        writeStub(
            COMMENTS, "itemMedia", 2,
            """
                instance-of v0, p0, $THREAD_ITEM
                if-eqz v0, :none
                check-cast p0, $THREAD_ITEM
                invoke-interface { p0 }, $THREAD_ITEM->${itemMedia.name}()$MEDIA
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
        )
        writeStub(
            COMMENTS, "mediaText", 2,
            """
                instance-of v0, p0, $MEDIA
                if-eqz v0, :nothing
                check-cast p0, $MEDIA
                invoke-virtual { p0 }, $MEDIA->${mediaText.name}()${mediaText.returnType}
                move-result-object v0
                if-eqz v0, :nothing
                invoke-interface { v0 }, ${mediaText.returnType}->${textBody.name}()$STRING
                move-result-object v0
                return-object v0
                :nothing
                const/4 v0, 0x0
                return-object v0
            """,
        )
        writeStub(
            COMMENTS, "mediaCaption", 2,
            """
                instance-of v0, p0, $MEDIA
                if-eqz v0, :nothing
                check-cast p0, $MEDIA
                invoke-static { p0 }, $MEDIA_EXT->${caption.name}($MEDIA)$STRING
                move-result-object v0
                return-object v0
                :nothing
                const/4 v0, 0x0
                return-object v0
            """,
        )

        // The range form reaches every register, where { v$list } stops at v15.
        parse.addInstructions(
            site + 2,
            """
                invoke-static/range { v$list .. v$list }, $COMMENTS->filter($LIST)$LIST
                move-result-object v$list
            """,
        )

        enableStatus("filterComments")
    }
}

/**
 * The instruction in [RepliesParseFingerprint]'s method that answers the answer's own list of
 * replies, with the `move-result-object` that follows it one past it: the answer's one no-argument
 * call answering a List whose entries are read as [THREAD], not the related threads beside it.
 */
internal fun Method.replyListSite(): Int {
    val body = implementation?.instructions?.toList() ?: throw PatchException("$PATCH: $definingClass->$name has no body")
    val sites = body.indices.filter { index ->
        val reference = body[index].getReference<MethodReference>() ?: return@filter false
        body[index].opcode in setOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE) &&
            reference.definingClass == REPLIES_RESPONSE &&
            reference.parameterTypes.isEmpty() &&
            reference.returnType == LIST &&
            body.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
            body.iterationCast(index + 1) == THREAD
    }
    val site = sites.singleOrPatchException("$PATCH: the opened post's reply list in $definingClass->$name")
    // The hook goes in front of the instruction after the move-result-object. A branch or handler
    // landing there would skip it and hand Threads the unfiltered list, so that build is refused.
    val flow = ControlFlow.of(this)
    val entered = flow.normal.indices.any { from ->
        (from != site + 1 && site + 2 in flow.normal[from]) || site + 2 in flow.exceptional[from]
    }
    if (entered) throw PatchException("$PATCH: a branch in $definingClass->$name lands right after the reply list")
    return site
}

/** The first register an invoke passes, in either its five-register or its range form. */
private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.firstArgument(): Int? = when (this) {
    is FiveRegisterInstruction -> registerC
    is RegisterRangeInstruction -> startRegister
    else -> null
}

/**
 * What the list the `move-result-object` at [result] holds is read as: the type the iterator made
 * from it checks each entry against. Null when the list isn't iterated right after, which is what
 * tells the answer's two lists apart.
 */
internal fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>.iterationCast(result: Int): String? {
    val list = (getOrNull(result) as? OneRegisterInstruction)?.registerA ?: return null
    val iterator = (result until minOf(size, result + 8)).firstOrNull { index ->
        (this[index].opcode == Opcode.INVOKE_INTERFACE || this[index].opcode == Opcode.INVOKE_INTERFACE_RANGE) &&
            this[index].firstArgument() == list &&
            (this[index] as ReferenceInstruction).getReference<MethodReference>()?.let {
                it.definingClass == "Ljava/util/List;" && it.name == "iterator"
            } == true
    } ?: return null
    val iteratorRegister = (getOrNull(iterator + 1) as? OneRegisterInstruction)?.registerA ?: return null
    val next = (iterator until minOf(size, iterator + 12)).firstOrNull { index ->
        (this[index].opcode == Opcode.INVOKE_INTERFACE || this[index].opcode == Opcode.INVOKE_INTERFACE_RANGE) &&
            this[index].firstArgument() == iteratorRegister &&
            (this[index] as ReferenceInstruction).getReference<MethodReference>()?.let {
                it.definingClass == "Ljava/util/Iterator;" && it.name == "next"
            } == true
    } ?: return null
    val entry = (getOrNull(next + 1) as? OneRegisterInstruction)?.registerA ?: return null
    val cast = (next until minOf(size, next + 8)).firstOrNull { index ->
        this[index].opcode == Opcode.CHECK_CAST && (this[index] as OneRegisterInstruction).registerA == entry
    } ?: return null
    return (this[cast] as ReferenceInstruction).getReference<TypeReference>()?.type
}

/** The one no-argument method on [THREAD] answering a list: the posts a reply carries, in order. */
internal fun BytecodePatchContext.threadListGetter(): Method =
    classDefBy(THREAD).methods.filter { it.parameterTypes.isEmpty() && it.returnType == LIST }
        .singleOrPatchException("$PATCH: the reply's one no-argument List getter in $THREAD")

/** The one no-argument method on [THREAD_ITEM] answering a post. */
internal fun BytecodePatchContext.itemMediaGetter(): Method =
    classDefBy(THREAD_ITEM).methods.filter { it.parameterTypes.isEmpty() && it.returnType == MEDIA }
        .singleOrPatchException("$PATCH: the post's only no-argument Media getter in $THREAD_ITEM")

/** The one no-argument method on [MEDIA] answering the post's text with its entities. */
internal fun BytecodePatchContext.mediaTextGetter(): Method =
    classDefBy(MEDIA).methods.filter {
        it.parameterTypes.isEmpty() && it.returnType == TEXT_WITH_ENTITIES &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }.singleOrPatchException("$PATCH: the post's one no-argument text getter in $MEDIA")

/** The one no-argument method on [TEXT_WITH_ENTITIES]'s class answering a String: the text itself. */
internal fun BytecodePatchContext.textBodyGetter(type: String): Method =
    classDefBy(type).methods.filter { it.parameterTypes.isEmpty() && it.returnType == STRING }
        .singleOrPatchException("$PATCH: the text's one no-argument String getter in $type")

/**
 * The helper in [MEDIA_EXT] that answers a post's caption: the one static method taking a post and
 * answering a String that calls one of the post's own getters and then its answer's String getter.
 * Threads has two no-argument caption getters, so the helper is how the caption is read without
 * having to tell them apart.
 */
internal fun BytecodePatchContext.captionHelper(): Method =
    classDefBy(MEDIA_EXT).methods.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.returnType == STRING &&
            method.parameterTypes.map(CharSequence::toString) == listOf(MEDIA) &&
            method.readsGetterThenString()
    }.singleOrPatchException("$PATCH: the caption helper in $MEDIA_EXT")

/** Whether [this] calls a no-argument post getter and then a String getter on what it answers. */
internal fun Method.readsGetterThenString(): Boolean {
    val calls = implementation?.instructions?.mapNotNull { it.getReference<MethodReference>() }.orEmpty()
    val getter = calls.firstOrNull {
        it.definingClass == MEDIA && it.parameterTypes.isEmpty() && it.name != "<init>"
    } ?: return false
    return calls.any {
        it.definingClass == getter.returnType && it.parameterTypes.isEmpty() &&
            it.returnType == STRING && it.name != "<init>"
    }
}
