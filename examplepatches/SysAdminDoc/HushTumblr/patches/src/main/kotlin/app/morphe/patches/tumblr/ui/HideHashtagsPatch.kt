/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.freeLocalsAt
import app.morphe.patches.tumblr.misc.extension.parameterRegister
import app.morphe.patches.tumblr.misc.extension.requireLocals
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import app.morphe.util.writesRegister
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val PATCH = "Hide hashtags"
internal const val POST_PARTS = "$EXTENSION_PACKAGE/ui/PostParts;"
internal const val HIDE_TAGS_HOOK = "$POST_PARTS->hideTags()Z"
internal const val TV_TAGS_HOOK = "$POST_PARTS->tvTags(Ljava/lang/String;)Ljava/lang/String;"
internal const val TV_MORE_HOOK = "$POST_PARTS->tvMore(Landroid/view/View;Ljava/lang/CharSequence;)V"

/** Tumblr TV's text under a video. A view named in Tumblr's layouts, so R8 keeps its name. */
internal const val VIDEO_HUB_TEXT = "Lcom/tumblr/videohub/view/VideoHubPostCardText;"

private const val TEXT_VIEW = "Landroid/widget/TextView;"
private const val SET_TEXT = "$TEXT_VIEW->setText(Ljava/lang/CharSequence;)V"

/** What Tumblr TV splits a post's tags on, and joins them back with. */
private const val TAG_SEPARATOR = ", "

/** The row under a post holding its tags. A view named in Tumblr's layouts, so R8 keeps its name. */
internal const val WRAPPED_TAGS = "Lcom/tumblr/ui/widget/PostCardWrappedTags;"

/** A tag as Tumblr's API sends it. A model class read by name from JSON, so R8 keeps its name. */
internal const val TAG_MODEL = "Lcom/tumblr/rumblr/model/blog/TagV2;"

internal const val EMPTY_LIST = "Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;"

/**
 * Hands the method that draws a post's tags an empty tag text and an empty tag list while the
 * switch is on, so it draws none. The method keeps both in the view, and the view's own check for
 * whether the row has anything to show reads them back, so a post whose row held only tags loses
 * the row, and one with a source link, a submission credit or a badge keeps those. That's the
 * path Tumblr takes for a post with no tags. The switch is read each time a card is bound, so it
 * works without a restart.
 *
 * The method is the one instance method of [WRAPPED_TAGS] returning void that takes exactly one
 * String (the tags as text) and one List (the tags as [TAG_MODEL]s) and calls a [TAG_MODEL]
 * method. Both of the view's bind methods, for posts and for the other timeline cards with tags,
 * call it. Found by reading Tumblr 46.5.0.109 (2026-10-11).
 *
 * The check that decides whether a card gets the row at all (in the view's companion) also reads
 * the tag text, from the post itself, so a post with tags still gets the row bound. The view then
 * hides it with height zero when nothing else is in it.
 *
 * Tumblr TV writes a post's tags under the video itself when the post has no description, so
 * [resolveTvTags] hands `PostParts.tvTags` the tags there and Tumblr TV writes what comes back.
 * Right after it writes that line, `PostParts.tvMore` gets the card's "... more" label and the line,
 * since Tumblr only hides the line when it's empty and would leave the label there alone.
 */
@Suppress("unused")
val hideHashtagsPatch = bytecodePatch(
    name = PATCH,
    description = "Takes the tags off the bottom of posts in your dashboard, other feeds and Tumblr TV, and keeps" +
        " the source link. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts.",
    default = true,
) {
    category("Posts")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideHashtags")
        requireStatusMethod("postTags")
        // Found and checked before any edit, so a refusal leaves the APK as it was.
        val drawTags = resolveTagDrawer()
        val tvTags = resolveTvTags()
        drawTags.handNoTagsWhenAsked()
        // The label's hook comes later in the method, so it goes in first and the split keeps its index.
        tvTags.method.addInstructions(
            tvTags.moreAt,
            """
                iget-object v${tvTags.scratch}, v${tvTags.self}, ${tvTags.more}
                invoke-static {v${tvTags.scratch}, v${tvTags.written}}, $TV_MORE_HOOK
            """,
        )
        tvTags.method.addInstructions(
            tvTags.at,
            """
                invoke-static {v${tvTags.register}}, $TV_TAGS_HOOK
                move-result-object v${tvTags.register}
            """,
        )
        enableCapability("postTags")
        enableStatus("hideHashtags")
    }
}

/** The tags row's tag drawer, throwing when this build has none, several, or one with no local. */
internal fun BytecodePatchContext.resolveTagDrawer(): MutableMethod {
    requireExtensionHook(PATCH, HIDE_TAGS_HOOK)
    val view = classDefByOrNull(WRAPPED_TAGS) ?: throw PatchException("$PATCH: Tumblr's $WRAPPED_TAGS wasn't found")
    val drawer = view.methods
        .filter { method ->
            !method.isStatic() && method.returnType == "V" &&
                method.parameterTypes.count { it.toString() == "Ljava/lang/String;" } == 1 &&
                method.parameterTypes.count { it.toString() == "Ljava/util/List;" } == 1 &&
                method.instructionList().any { it.methodRef()?.definingClass == TAG_MODEL }
        }
        .only(PATCH, "the method that draws a post's tags")
    return mutableOf(drawer).also { it.requireLocals(PATCH, 1) }
}

/**
 * Where Tumblr TV's tags go to the extension: in front of instruction [at], with the tags in
 * [register]. In front of [moreAt], right after the line is written, [scratch] is loaded with the
 * card's "more" label, field [more] of the view in [self], and handed to the extension with the
 * line Tumblr wrote, in [written].
 */
internal class TvTagsSite(
    val method: MutableMethod,
    val at: Int,
    val register: Int,
    val moreAt: Int,
    val more: String,
    val self: Int,
    val written: Int,
    val scratch: Int,
)

/**
 * The place Tumblr TV splits a post's tags to write them under the video, and the place it then
 * writes the line, throwing when this build has none, several, or one the hooks can't go in.
 *
 * The split is the one call in an instance method of [VIDEO_HUB_TEXT] returning void that takes
 * (String, String, boolean) and returns a List, with [TAG_SEPARATOR] as its second argument
 * (Kotlin's `split`, index 22 of `Z` in 46.5.0.109). The hook goes right in front of it, on its
 * first argument, the tags as one String. Tumblr TV takes that path only for a post with no
 * description, and joins the pieces back with the same separator, so empty tags write an empty line.
 *
 * The line is written by the one `setText` after the split on a [TEXT_VIEW] the view keeps in a
 * field, read just before it. The view keeps two text views, the line and its "... more" label
 * (`z` and `A` in 47.0.0.108), so the label is the other one. Its hook goes right after `setText`,
 * whose field read is where the description path jumps to meet the tag path (address 0x46 of
 * `Z` in 47.0.0.108), borrowing a local nothing reads from there on.
 */
internal fun BytecodePatchContext.resolveTvTags(): TvTagsSite {
    requireExtensionHook(PATCH, TV_TAGS_HOOK)
    requireExtensionHook(PATCH, TV_MORE_HOOK)
    val view = classDefByOrNull(VIDEO_HUB_TEXT) ?: throw PatchException("$PATCH: Tumblr's $VIDEO_HUB_TEXT wasn't found")
    val (writer, split) = view.methods
        .filter { method -> !method.isStatic() && method.returnType == "V" }
        .flatMap { method ->
            val body = method.instructionList()
            body.indices.filter { body.splitsTagsAt(it) }.map { method to it }
        }
        .only(PATCH, "the place Tumblr TV splits a post's tags")
    val body = writer.instructionList()
    val tags = body[split].namedRegisters().first()
    requireShape(PATCH, tags <= 15, "Tumblr TV's tags are in v$tags, past what the added call can name")
    requireShape(PATCH, !writer.isJumpTarget(split), "something in Tumblr TV's post text jumps straight to its tag split")

    val write = body.indices.filter { it > split && body.writesLineAt(it) }
        .only(PATCH, "the place Tumblr TV writes a post's line")
    requireShape(PATCH, writer.isJumpTarget(write - 1),
        "Tumblr TV's post text doesn't write its line where the description and the tags meet")
    val read = body[write - 1] as TwoRegisterInstruction
    val line = body[write - 1].fieldRef()!!.name
    val labels = view.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == TEXT_VIEW }
    requireShape(PATCH, labels.size == 2 && labels.count { it.name == line } == 1,
        "Tumblr TV's post text keeps ${labels.size} text views, not just its line and its \"more\" label")
    val more = labels.single { it.name != line }
    val self = read.registerB
    val written = body[write].namedRegisters()[1]
    requireShape(PATCH, write + 1 < body.size && !writer.isJumpTarget(write + 1),
        "something in Tumblr TV's post text jumps straight past where it writes its line")
    requireShape(PATCH, self <= 15 && written <= 15, "Tumblr TV's line or its view is past what the added call can name")
    val scratch = writer.freeLocalsAt(PATCH, write + 1, 1, reads = listOf(self, written)).single()
    return TvTagsSite(mutableOf(writer), split, tags, write + 1, "$VIDEO_HUB_TEXT->${more.name}:$TEXT_VIEW", self, written, scratch)
}

/** A [SET_TEXT] call at [index] on a [TEXT_VIEW] read from a [VIDEO_HUB_TEXT] field just before it. */
private fun List<Instruction>.writesLineAt(index: Int): Boolean {
    if (index == 0) return false
    val call = this[index]
    val ref = call.methodRef() ?: return false
    if (call.opcode != Opcode.INVOKE_VIRTUAL || "${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}" != SET_TEXT) return false
    val read = this[index - 1]
    val field = read.fieldRef() ?: return false
    return read.opcode == Opcode.IGET_OBJECT && field.definingClass == VIDEO_HUB_TEXT && field.type == TEXT_VIEW &&
        (read as TwoRegisterInstruction).registerA == call.namedRegisters().first()
}

/** A static `(String, String, boolean)List` call at [index] whose second argument was loaded as [TAG_SEPARATOR]. */
private fun List<Instruction>.splitsTagsAt(index: Int): Boolean {
    val call = this[index]
    if (call.opcode != Opcode.INVOKE_STATIC) return false
    val ref = call.methodRef() ?: return false
    if (!ref.hasShape(listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z"), "Ljava/util/List;")) return false
    val registers = call.namedRegisters()
    val separator = registers.getOrNull(1) ?: return false
    if (registers.first() == separator) return false
    val loaded = (index - 1 downTo 0).firstOrNull { writesRegister(this[it], separator) } ?: return false
    return this[loaded].stringRef() == TAG_SEPARATOR
}

/** The declared index of the drawer's one parameter of [type]. */
internal fun MutableMethod.tagParameter(type: String): Int =
    parameterTypes.indexOfFirst { it.toString() == type }

/**
 * Puts the question in front of the drawer's first instruction: on true its tag text becomes ""
 * and its tag list the shared empty list, and on false nothing changes. Borrows v0, which holds
 * nothing before the method's own first instruction.
 */
private fun MutableMethod.handNoTagsWhenAsked() {
    val text = parameterRegister(tagParameter("Ljava/lang/String;"))
    val list = parameterRegister(tagParameter("Ljava/util/List;"))
    val first = getInstruction(0)
    addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $HIDE_TAGS_HOOK
            move-result v0
            if-eqz v0, :hush_keep
            const-string $text, ""
            sget-object $list, $EMPTY_LIST
        """,
        ExternalLabel("hush_keep", first),
    )
}
