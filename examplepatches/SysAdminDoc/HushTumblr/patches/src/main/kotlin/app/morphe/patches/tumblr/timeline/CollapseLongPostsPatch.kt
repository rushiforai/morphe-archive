/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.freeLocalsAt
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Collapse long posts"
internal const val LONG_POSTS_POST_HOOK =
    "$EXTENSION_PACKAGE/timeline/LongPosts;->post(Ljava/lang/Object;ZLjava/util/List;)Ljava/util/List;"
internal const val HUSH_BLOCK_ROW = "$EXTENSION_PACKAGE/timeline/HushBlockRow;"
private const val LIST = "Ljava/util/List;"
private const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"

// Tumblr 47.0.0.108's names: the class that lists a post's rows for the timeline, the post as it
// holds it, one row of blocks, and the screen's timeline, whose n() is Tumblr's own test for
// whether this screen draws an author's Read more cut (true in the feeds, false on a post opened
// by itself).
internal const val POST_COMPOSER = "Lfmf;"
internal const val COMPOSED_POST = "Ljm2;"
internal const val BLOCK_ROW = "Ltj2;"
internal const val TIMELINE_SCREEN = "Ljtl;"

private const val TIMELINE_FIELD = "m"
private const val READ_MORE_FIELD = "d"
private const val DRAWS_CUTS = "n"

/**
 * The hook's place: in front of [at], Tumblr's call that appends [rows] for a post it didn't cut,
 * with [post] still holding the post they came from.
 */
internal class PostSite(
    val method: MutableMethod,
    val at: Int,
    val composer: Int,
    val post: Int,
    val rows: Int,
    val cut: Int,
    val scratch: Int,
)

internal class CollapseLongPostsPlan(val post: PostSite)

/**
 * Tumblr lists the rows it draws for a post in the timeline (`fmf.h` in 47.0.0.108). When the
 * author cut a post with a Read more, it appends only the post's own rows above the cut and then
 * its own Read more row, whose tap opens the post by itself. For a post the author didn't cut, the
 * hook goes in front of the call that appends every one of the post's own rows. It hands them to
 * the extension with the post, and when it answers a shorter list, Tumblr draws that list as its
 * cut, Read more row and all. Tumblr's block row answers the extension's [HUSH_BLOCK_ROW] with its
 * blocks, so the extension can tell how tall each row is. The post is never changed. Read more under
 * a post this cut opens it where it is ([expandLongPostsInPlace]).
 *
 * This hook cuts only the post's own rows. Tumblr's block binders find their row by counting the
 * rows drawn before them and reading that index from a list it built with the post (`jm2`'s trail
 * rows, then its own rows). The own rows come last, so dropping the end of them leaves every
 * earlier index in place, the same as an author's cut does. Dropping rows from a trail entry here
 * would shift every row after it onto the wrong block, so a long trail entry is cut where Tumblr
 * builds it instead ([collapseLongTrailEntries]), before `jm2` or this list reads it.
 */
@Suppress("unused")
val collapseLongPostsPatch = bytecodePatch(
    name = PATCH,
    description = "Cuts long posts in your timelines to about a screen, with Tumblr's own Read more row" +
        " under them. Tap it and the whole post opens right there in the timeline. A long entry in a reblog trail gets cut" +
        " the same way, and its Read more opens the post." +
        " Asks keep Tumblr's layout. Starts off." +
        " Turn it on in Tumblr settings > HushTumblr > Posts, where you can make the cut half a screen or two screens instead.",
    default = true,
) {
    category("Posts")
    dependsOn(settingsPatch, tumblrExtensionPatch, postBridgePatch)
    compatibleWith(*AppCompatibilities.tumblr())
    execute {
        requireStatusMethod("collapseLongPosts")
        requireStatusMethod("longPostRows")
        requireStatusMethod("longTrailRows")
        requireStatusMethod("longPostExpand")
        val site = resolveCollapseLongPosts().post
        site.method.addInstructionsWithLabels(
            site.at,
            """
                iget-object v${site.scratch}, v${site.composer}, $POST_COMPOSER->$TIMELINE_FIELD:$TIMELINE_SCREEN
                invoke-virtual { v${site.scratch} }, $TIMELINE_SCREEN->$DRAWS_CUTS()Z
                move-result v${site.scratch}
                invoke-static { v${site.post}, v${site.scratch}, v${site.rows} }, $LONG_POSTS_POST_HOOK
                move-result-object v${site.scratch}
                if-eqz v${site.scratch}, :hush_keep
                const/4 v${site.cut}, 0x1
                move-object v${site.rows}, v${site.scratch}
            """,
            ExternalLabel("hush_keep", site.method.getInstruction(site.at)),
        )
        val row = mutableClassDefBy(BLOCK_ROW)
        row.interfaces.add(HUSH_BLOCK_ROW)
        row.methods.add(
            ImmutableMethod(
                BLOCK_ROW, "hushBlocks", emptyList(), LIST, AccessFlags.PUBLIC.value,
                null, null, MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        iget-object v0, p0, $BLOCK_ROW->a:$IMMUTABLE_LIST
                        return-object v0
                    """,
                )
            },
        )
        enableCapability("longPostRows")
        // A soft site: without it, posts still collapse and trail entries stay whole.
        if (collapseLongTrailEntries(PATCH)) enableCapability("longTrailRows")
        // Another: without it, Read more opens a post this cut on its own screen.
        if (expandLongPostsInPlace(PATCH)) enableCapability("longPostExpand")
        enableStatus("collapseLongPosts")
    }
}

/** Every target, register and class is checked before anything changes. */
internal fun BytecodePatchContext.resolveCollapseLongPosts(): CollapseLongPostsPlan {
    requireExtensionHook(PATCH, LONG_POSTS_POST_HOOK)
    val contract = classDefByOrNull(HUSH_BLOCK_ROW)
    requireShape(
        PATCH,
        contract != null && AccessFlags.INTERFACE.isSet(contract.accessFlags) && contract.methods.count() == 1 &&
            contract.methods.all {
                it.name == "hushBlocks" && it.hasShape(emptyList(), LIST) &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.ABSTRACT.isSet(it.accessFlags)
            },
        "the extension's block row bridge is missing or changed",
    )
    val row = classDefByOrNull(BLOCK_ROW)
    requireShape(
        PATCH,
        row != null && !AccessFlags.INTERFACE.isSet(row.accessFlags) && row.superclass == "Ljava/lang/Object;",
        "Tumblr's block row class is missing",
    )
    requireShape(PATCH, HUSH_BLOCK_ROW !in row!!.interfaces && row.methods.none { it.name == "hushBlocks" }, "Tumblr's block row is already bridged")
    requireShape(
        PATCH,
        row.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == IMMUTABLE_LIST }.let { lists ->
            lists.size == 1 && lists[0].name == "a" &&
                AccessFlags.PRIVATE.isSet(lists[0].accessFlags) && AccessFlags.FINAL.isSet(lists[0].accessFlags)
        },
        "Tumblr's block row no longer keeps its blocks in one list",
    )

    val composer = classDefByOrNull(POST_COMPOSER)
    requireShape(PATCH, composer != null && !AccessFlags.INTERFACE.isSet(composer.accessFlags), "Tumblr's post row composer is missing")
    requireShape(
        PATCH,
        composer!!.fields.any { it.name == TIMELINE_FIELD && it.type == TIMELINE_SCREEN && !AccessFlags.STATIC.isSet(it.accessFlags) } &&
            composer.fields.any { it.name == READ_MORE_FIELD && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "Tumblr's post row composer no longer holds its timeline and Read more row",
    )
    requireShape(
        PATCH,
        classDefByOrNull(TIMELINE_SCREEN)?.methods?.any {
            it.name == DRAWS_CUTS && it.hasShape(emptyList(), "Z") && !it.isStatic() && AccessFlags.PUBLIC.isSet(it.accessFlags)
        } == true,
        "Tumblr's timeline no longer answers whether it draws a Read more cut",
    )
    val post = resolvePostSite(composer.methods.filter {
        it.name == "h" && it.hasShape(listOf("Lr4g;", "I"), LIST) && !it.isStatic()
    }.only(PATCH, "the post row composer"))
    return CollapseLongPostsPlan(post)
}

/** The call appending every row of a post Tumblr didn't cut, its branch, and the Read more row that follows. */
private fun BytecodePatchContext.resolvePostSite(method: Method): PostSite {
    val steps = method.instructionList()
    val all = steps.indices.filter {
        steps[it].opcode == Opcode.INVOKE_VIRTUAL && steps[it].methodRef()?.let { call ->
            call.definingClass == COMPOSED_POST && call.name == "g" && call.hasShape(emptyList(), LIST)
        } == true
    }.only(PATCH, "the post's every-row list")
    val read = steps[all] as FiveRegisterInstruction
    val moved = steps.getOrNull(all + 1)
    val append = steps.getOrNull(all + 2)
    requireShape(
        PATCH,
        moved?.opcode == Opcode.MOVE_RESULT_OBJECT && append?.opcode == Opcode.INVOKE_DIRECT &&
            append.methodRef()?.let { it.definingClass == POST_COMPOSER && it.hasShape(listOf(LIST, LIST), "Z") } == true &&
            (append as FiveRegisterInstruction).registerCount == 3,
        "the post row composer doesn't append every row right after reading them",
    )
    val rows = (moved as OneRegisterInstruction).registerA
    val call = append as FiveRegisterInstruction
    val composer = call.registerC
    requireShape(PATCH, call.registerE == rows, "the post row composer appends a different list than the post's rows")
    // The post the rows came from: the list's read is on it, and only the rows' move lies between.
    val post = read.registerC
    requireShape(
        PATCH,
        read.registerCount == 1 && post < 16 && post != rows && post != composer,
        "the post row composer reads the post's rows from a register the hook can't hand on",
    )

    // Every row is read only when the composer's cut flag was false: the one branch there tests it.
    val flow = ControlFlow.of(method)
    val into = flow.instructions.indices.filter { all in flow.normal[it] || all in flow.exceptional[it] }
    val branch = into.singleOrNull()
    requireShape(
        PATCH,
        branch != null && steps[branch].opcode == Opcode.IF_EQZ && branch != all - 1,
        "the post's every-row list isn't read only when Tumblr didn't cut the post",
    )
    val cut = (steps[branch!!] as OneRegisterInstruction).registerA
    // That flag is what puts Tumblr's Read more row under the rows: the next test of it adds the row.
    val readMore = steps.indices.firstOrNull { it > all + 2 && cut in steps[it].namedRegisters() }
    val added = readMore?.let { steps.getOrNull(it + 1) }
    requireShape(
        PATCH,
        readMore != null && steps[readMore].opcode == Opcode.IF_EQZ && added?.opcode == Opcode.IGET_OBJECT &&
            added.fieldRef()?.let { it.definingClass == POST_COMPOSER && it.name == READ_MORE_FIELD } == true &&
            (added as TwoRegisterInstruction).registerB == composer,
        "the post row composer no longer adds its Read more row on the flag it cuts a post with",
    )
    requireShape(
        PATCH,
        listOf(rows, composer, cut).all { it < 16 } && cut != rows && cut != composer && cut != post,
        "the post row composer keeps the rows, itself or its cut flag out of the hook's reach",
    )
    // The hook rewrites both, so nothing past the append and the Read more test may read them again.
    val liveness = RegisterLiveness.of(method)
    requireShape(
        PATCH,
        rows !in liveness.liveInto(all + 3) && flow.normal[readMore!!].none { cut in liveness.liveInto(it) },
        "the post row composer reads the post's rows or its cut flag again further down",
    )
    val scratch = method.freeLocalsAt(PATCH, all + 2, 1, reads = listOf(rows, composer, post)).single()
    return PostSite(mutableOf(method), all + 2, composer, post, rows, cut, scratch)
}
