/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.hook

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.freeLocalsAt
import app.morphe.patches.facebook.shared.FEED_STORY_CATEGORY
import app.morphe.patches.facebook.shared.FEED_UNIT_EDGE
import app.morphe.util.ControlFlow
import app.morphe.util.literalReads
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * The other way an edge gets into the news feed.
 *
 * addNewEdgeToCollection adds an edge. A swap puts one in another's place: a feed data loader asks
 * for it with doSwapEdge, its state machine hands the request to FeedUnitCollectionManager's
 * onEdgeSwapped, and that posts a Runnable which takes the incoming edge from its holder and has the
 * feed collection replace the old edge with it. The replace never calls addNewEdgeToCollection, so
 * the funnel guard never sees the new edge, and neither does the "News feed posts" count.
 *
 * Read from 577 and 580 (2026-09-28). The runnable keeps its Redex name,
 * FeedUnitCollectionManager$onEdgeSwapped$1 (`LX/h6q;` in 577, `LX/3dG;` in 580). Its run() takes
 * the edge from its holder, casts it to GraphQLFeedUnitEdge, and makes one call handing the edge and
 * the old edge's key to the collection, the replace (`EVB` in 577, `EXv` in 580). It logs "Edge swap
 * dropped" with "sizeBefore" and "sizeAfter" when the collection came out smaller, and no other
 * method of either build loads any of the three. Every trigger read on both builds asks for a
 * SPONSORED edge: the feed supply's ad hot-swap ("feed_supply_hotswap_trigger") takes the best ad of
 * its pool ("pool_best_ad"), whose edges never went through the funnel, and on 580 the main feed's
 * data loader swaps a fresh ad over the last unseen one. All of it sits behind server-side
 * MobileConfig flags.
 *
 * The guard goes right after the cast, before the runnable touches anything, and asks the extension
 * about the edge the way the funnel guard does. Returning there leaves the old edge where it was.
 */

/** Kept literal: the log line of the swap runnable, the one method in both builds holding it. */
internal const val EDGE_SWAP_DROPPED = "Edge swap dropped"

/**
 * Kept literals: the two sizes the same log line reports, which only the swap runnable loads. The
 * mutation contract names the runnable by these, since a contract's strings can't hold a space.
 */
internal const val SIZE_BEFORE = "sizeBefore"
internal const val SIZE_AFTER = "sizeAfter"

internal const val HIDE_SWAPPED_EDGE =
    "$EXTENSION_PACKAGE/feed/FeedFilter;->hideSwappedEdge(Ljava/lang/Object;Ljava/lang/Object;)Z"

private const val RUNNABLE = "Ljava/lang/Runnable;"

/** How a refusal of the swap guard names it. */
private const val SWAP_GUARD = "Feed filter (edge swap)"

/** Where the swap guard goes: [method], the index right after the incoming edge's cast, and the edge's register. */
internal data class SwapGuard(val method: Method, val index: Int, val edge: Int)

/** The registers a call reads, in order, whether it's written as a range or not. */
private fun Instruction.callRegisters(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

/** Whether this is the swap: an instance call handing the collection an edge and the old edge's key. */
private fun Instruction.isSwap(): Boolean {
    if (!opcode.name.startsWith("invoke") || opcode.name.startsWith("invoke-static")) return false
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return call.returnType == "V" &&
        call.parameterTypes.map { it.toString() } == listOf(FEED_UNIT_EDGE, "Ljava/lang/String;")
}

/**
 * Where the swap guard goes in [owner], or null when it isn't the swap runnable: a Runnable whose
 * instance run() loads [EDGE_SWAP_DROPPED], [SIZE_BEFORE] and [SIZE_AFTER], casts a value to
 * GraphQLFeedUnitEdge, and makes one swap call, whose edge is that cast's value and no other. Only
 * the cast leads to the instruction after it, so no branch can go round the guard put there.
 */
internal fun swapGuard(owner: ClassDef): SwapGuard? {
    if (owner.interfaces.none { it.toString() == RUNNABLE }) return null
    val run = owner.methods.singleOrNull {
        it.name == "run" && it.returnType == "V" && it.parameterTypes.isEmpty() &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: return null
    if (listOf(EDGE_SWAP_DROPPED, SIZE_BEFORE, SIZE_AFTER).any { !holdsString(run, it) }) return null
    val code = run.implementation?.instructions?.toList() ?: return null

    val cast = code.indexOfFirst {
        it.opcode == Opcode.CHECK_CAST && (it as ReferenceInstruction).reference.toString() == FEED_UNIT_EDGE
    }
    if (cast < 0 || cast + 1 >= code.size) return null
    val edge = (code[cast] as OneRegisterInstruction).registerA
    val swap = code.indices.singleOrNull { code[it].isSwap() } ?: return null
    if (code[swap].callRegisters().getOrNull(1) != edge || swap !in run.literalReads(cast)) return null
    // No other write to the edge's register reaches the swap: the edge swapped in is the one cast.
    val otherEdges = code.indices.filter { index ->
        val instruction = code[index]
        index != cast && instruction.opcode.setsRegister() && !instruction.opcode.setsWideRegister() &&
            (instruction as? OneRegisterInstruction)?.registerA == edge && swap in run.literalReads(index)
    }
    if (otherEdges.isNotEmpty()) return null

    val flow = ControlFlow.of(run)
    val into = cast + 1
    if (flow.normal[cast] != listOf(into)) return null
    if (flow.normal.indices.any { it != cast && into in flow.normal[it] } || flow.exceptional.any { into in it }) return null
    return SwapGuard(run, into, edge)
}

/**
 * The swap runnable's guard point: exactly one class holding [EDGE_SWAP_DROPPED] answers
 * [swapGuard]. A build with none would leave the swap open with nothing to say so, and with two the
 * guard could go on the wrong one, so either stops the patch.
 */
internal fun BytecodePatchContext.edgeSwapGuard(): SwapGuard {
    val holders = classDefByStrings(EDGE_SWAP_DROPPED, StringComparisonType.EQUALS)
    val guards = holders.mapNotNull(::swapGuard)
    return guards.singleOrNull() ?: throw PatchException(
        "$SWAP_GUARD: expected one Runnable whose run() holds \"$EDGE_SWAP_DROPPED\" and swaps a cast " +
            "GraphQLFeedUnitEdge into the feed, found ${guards.size}" +
            if (guards.isEmpty()) {
                " among ${holders.count()} class(es) holding the string."
            } else {
                ": " + guards.joinToString { it.method.definingClass } + "."
            },
    )
}

/**
 * Right after the runnable casts the incoming edge, asks the extension about it with its story
 * category and its feed unit, read by the funnel guard's own getters, and returns before the swap
 * when told to. The edge is read through the range form, which names any register; the category and
 * the unit go to the extension through a 4-bit call, so both borrowed registers are free locals no
 * higher than v15.
 */
internal fun MutableMethod.guardEdgeSwap(guard: SwapGuard, categoryGetter: String, feedUnit: Method) {
    val (category, unit) = freeLocalsAt(SWAP_GUARD, guard.index, 2)
    val edge = "v${guard.edge} .. v${guard.edge}"
    addInstructionsWithLabels(
        guard.index,
        """
            invoke-virtual/range { $edge }, $FEED_UNIT_EDGE->$categoryGetter()$FEED_STORY_CATEGORY
            move-result-object v$category
            invoke-virtual/range { $edge }, $FEED_UNIT_EDGE->${feedUnit.name}()${feedUnit.returnType}
            move-result-object v$unit
            invoke-static { v$category, v$unit }, $HIDE_SWAPPED_EDGE
            move-result v$category
            if-eqz v$category, :swap
            return-void
        """,
        ExternalLabel("swap", getInstruction(guard.index)),
    )
}
