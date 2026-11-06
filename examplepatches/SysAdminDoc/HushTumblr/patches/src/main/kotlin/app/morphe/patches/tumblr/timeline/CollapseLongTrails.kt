/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.freeLocalsAt
import app.morphe.patches.tumblr.misc.extension.patchLog
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val LONG_POSTS_TRAIL_HOOK = "$EXTENSION_PACKAGE/timeline/LongPosts;->trail(" +
    "Ljava/lang/Integer;Ljava/lang/Object;Ljava/util/List;Ljava/util/List;)Ljava/lang/Integer;"

// Tumblr 47.0.0.108's reblog trail entry, built from one item of a post's trail ([REBLOG_TRAIL]).
internal const val TRAIL_ENTRY = "Ln6h;"
internal const val TRAIL_ASK_LAYOUT = "Lcom/tumblr/rumblr/model/post/blocks/BlockAskLayout;"
private const val LIST = "Ljava/util/List;"
private const val INTEGER = "Ljava/lang/Integer;"
private const val INDEX_OF = "Ljava/util/List;->indexOf(Ljava/lang/Object;)I"

// The entry's fields: its blocks, its author's Read more cut (the index in the blocks of the last
// one kept, the server's truncate_after), its rows and its ask layout.
private const val BLOCKS_FIELD = "h"
private const val CUT_FIELD = "j"
private const val ROWS_FIELD = "l"
private const val ASK_FIELD = "o"

/**
 * In the trail entry's constructor [method], in front of [at], where Tumblr reads its author's cut.
 * [self] holds the entry and [free] are four locals nothing reads after [at].
 */
internal class TrailSite(val method: MutableMethod, val at: Int, val self: Int, val free: List<Int>)

/**
 * Lets Collapse long posts cut a long entry in a reblog trail. Tumblr builds each entry once, when
 * the post is read: it splits the entry's blocks into rows, then lists the rows up to its author's
 * cut, if there is one. In the feeds it draws that list with its Read more row under it (`fmf.f`),
 * and the block binders' list in `jm2` reads the same cut, so the rows stay on their own blocks.
 * The reblog editor's preview of the trail shows the whole entry with a Read more line where the
 * cut is, as it does for an author's cut. The hook goes in front of Tumblr's read of the cut and hands
 * the extension the cut, the ask layout, the rows and the blocks. The extension answers the cut to
 * keep: the author's, or for a long uncut entry the last block that fits. A post opened by itself
 * still draws every row, since Tumblr only draws a trail cut where it draws an author's.
 *
 * A soft site: when the entry no longer has this shape the patch logs why and answers false, so
 * the post's own rows still collapse.
 */
internal fun BytecodePatchContext.collapseLongTrailEntries(patch: String): Boolean {
    requireExtensionHook(patch, LONG_POSTS_TRAIL_HOOK)
    val site = try {
        resolveTrailSite(patch)
    } catch (refused: PatchException) {
        patchLog.warning("${refused.message}, so long reblog trail entries stay whole")
        return false
    }
    val (cut, ask, rows, blocks) = site.free
    site.method.addInstructions(
        site.at,
        """
            iget-object v$cut, v${site.self}, $TRAIL_ENTRY->$CUT_FIELD:$INTEGER
            iget-object v$ask, v${site.self}, $TRAIL_ENTRY->$ASK_FIELD:$TRAIL_ASK_LAYOUT
            iget-object v$rows, v${site.self}, $TRAIL_ENTRY->$ROWS_FIELD:$LIST
            iget-object v$blocks, v${site.self}, $TRAIL_ENTRY->$BLOCKS_FIELD:$LIST
            invoke-static { v$cut, v$ask, v$rows, v$blocks }, $LONG_POSTS_TRAIL_HOOK
            move-result-object v$cut
            iput-object v$cut, v${site.self}, $TRAIL_ENTRY->$CUT_FIELD:$INTEGER
        """,
    )
    return true
}

/** Finds the entry's constructor and checks its shape, refusing with a reason before any edit. */
internal fun BytecodePatchContext.resolveTrailSite(patch: String): TrailSite {
    val entry = classDefByOrNull(TRAIL_ENTRY)
    requireShape(patch, entry != null && !AccessFlags.INTERFACE.isSet(entry.accessFlags), "Tumblr's reblog trail entry is missing")
    fun holds(name: String, type: String) =
        entry!!.fields.any { it.name == name && it.type == type && !AccessFlags.STATIC.isSet(it.accessFlags) }
    requireShape(
        patch,
        holds(BLOCKS_FIELD, LIST) && holds(CUT_FIELD, INTEGER) && holds(ROWS_FIELD, LIST) && holds(ASK_FIELD, TRAIL_ASK_LAYOUT),
        "Tumblr's reblog trail entry no longer keeps its blocks, cut, rows and ask layout",
    )
    val method = entry!!.methods.filter { it.name == "<init>" && it.hasShape(listOf(REBLOG_TRAIL), "V") }
        .only(patch, "the reblog trail entry's constructor")
    val steps = method.instructionList()

    // Tumblr reads the cut once the rows are built: the first read of it, right after a call on itself.
    val at = steps.indices.firstOrNull { steps[it].opcode == Opcode.IGET_OBJECT && steps[it].fieldRef()?.isEntry(CUT_FIELD, INTEGER) == true }
    requireShape(patch, at != null && at > 0, "the reblog trail entry's constructor no longer reads its author's cut")
    val read = steps[at!!] as TwoRegisterInstruction
    val self = read.registerB
    val built = steps[at - 1]
    requireShape(
        patch,
        built.opcode == Opcode.INVOKE_DIRECT && built.methodRef()?.let { it.definingClass == TRAIL_ENTRY && it.name != "<init>" && it.hasShape(emptyList(), "V") } == true &&
            (built as FiveRegisterInstruction).registerCount == 1 && built.registerC == self,
        "the reblog trail entry no longer reads its author's cut right after building its rows",
    )
    val tested = steps.getOrNull(at + 1)
    requireShape(
        patch,
        tested?.opcode == Opcode.IF_EQZ && (tested as OneRegisterInstruction).registerA == read.registerA,
        "the reblog trail entry no longer tests whether its author cut it",
    )
    // The cut is an index into the blocks: Tumblr stops listing rows at the block found there.
    requireShape(
        patch,
        (at + 1 until steps.size).any { k ->
            steps[k].opcode == Opcode.INVOKE_INTERFACE && steps[k].methodRef()?.toString() == INDEX_OF &&
                steps[k - 1].opcode == Opcode.IGET_OBJECT && steps[k - 1].fieldRef()?.isEntry(BLOCKS_FIELD, LIST) == true &&
                (steps[k - 1] as TwoRegisterInstruction).registerA == (steps[k] as FiveRegisterInstruction).registerC
        },
        "the reblog trail entry no longer finds its cut by a block's index",
    )
    requireShape(
        patch,
        (at until steps.size).none { steps[it].opcode == Opcode.IPUT_OBJECT && steps[it].fieldRef()?.isEntry(CUT_FIELD, INTEGER) == true },
        "the reblog trail entry sets its cut again after reading it",
    )
    // dexlib2 keeps a label on its instruction, so a jump to the read would skip the hook. The rows
    // are built just before, and only an ordinary step from there may reach the read.
    val flow = ControlFlow.of(method)
    requireShape(
        patch,
        flow.instructions.indices.filter { at in flow.normal[it] || at in flow.exceptional[it] } == listOf(at - 1) &&
            at !in flow.exceptional[at - 1],
        "Tumblr's code can jump straight to the reblog trail entry's read of its cut",
    )
    requireShape(patch, self < 16, "the reblog trail entry's constructor keeps itself in v$self, past v15")
    val free = method.freeLocalsAt(patch, at, 4, reads = listOf(self))
    return TrailSite(mutableOf(method), at, self, free)
}

private fun FieldReference.isEntry(name: String, type: String) = definingClass == TRAIL_ENTRY && this.name == name && this.type == type
