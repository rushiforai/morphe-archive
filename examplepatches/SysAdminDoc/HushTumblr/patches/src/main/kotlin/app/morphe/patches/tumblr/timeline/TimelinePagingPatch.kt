/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
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
import app.morphe.patches.tumblr.misc.extension.localRegisterCount
import app.morphe.patches.tumblr.misc.extension.parameterRegister
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.patches.tumblr.misc.extension.requireFreeAt
import app.morphe.patches.tumblr.misc.extension.requireParameterIntact
import app.morphe.patches.tumblr.misc.extension.requireThisIntact
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.descriptor
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.patches.tumblr.ui.isJumpTarget
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

internal const val TIMELINE_PAGING = "$EXTENSION_PACKAGE/timeline/TimelinePaging;"
internal const val TIMELINE_PAGING_HOOK =
    "$TIMELINE_PAGING->onPage(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Z)I"

/** The fragment every timeline screen is built on. R8 keeps its name, and its superclasses'. */
internal const val TIMELINE_FRAGMENT = "Lcom/tumblr/ui/fragment/TimelineFragment;"

/** How many instructions the hook puts into the page delivery. */
internal const val TIMELINE_PAGING_SIZE = 18

// Shared by every timeline patch, so its messages name the hook rather than one of them.
private const val PATCH = "Timeline paging hook"

private const val PAGINATION_FRAGMENT = "Lcom/tumblr/ui/fragment/PaginationFragment;"
private const val LINKS = "Lcom/tumblr/timeline/model/link/TimelinePaginationLink;"
private const val NEXT_LINK = "Lcom/tumblr/timeline/model/link/Link;"
private const val PARCELABLE = "Landroid/os/Parcelable;"
private const val CALL = "Lretrofit2/Call;"
private const val LIST = "Ljava/util/List;"
private const val MAP = "Ljava/util/Map;"

/** The constant Tumblr's load type enum gives a next page. `TimelinePaging` reads it by this name. */
private const val PAGINATION = "PAGINATION"

/**
 * Where the hook goes in the page delivery and the members of Tumblr's it uses there, each found by
 * its shape. The member names are the ones Tumblr 46.5.0.109 has; none is written into the patch.
 */
internal class TimelinePagingPlan(
    /** `TimelineFragment.n4(type, items, links, extras, fromCache)`. */
    val delivery: MutableMethod,
    /** The instruction after Tumblr keeps `items.isEmpty()`. The hook goes in front of it. */
    val at: Int,
    /** A local that instruction writes without reading, so nothing is lost by using it before. */
    val scratch: Int,
    /** The register `items.isEmpty()` was kept in. */
    val empty: Int,
    /** `TimelinePaginationLink.d()`, the link to the next page or null. */
    val nextLink: String,
    /** `PaginationFragment.l`, true once there are no more pages. */
    val endFlag: String,
    /** `TimelineFragment.N4()`, which shows the empty view. */
    val emptyView: String,
    /** `PaginationFragment.k`, the links the next page is asked for with. */
    val linkField: String,
    /** The load type's PAGINATION constant. */
    val paging: String,
    /** `TimelineFragment.Q5(type)`, which stops the spinner a load of that type started. */
    val settle: String,
    /** `TimelineFragment.v6(type, true)`, which loads a page. */
    val load: String,
)

/**
 * Lets a feed go on to its next page when the switches took every item out of the one it loaded. It
 * has no switch or name of its own: [timelineListHookPatch] brings it, since that hook is what
 * empties a page.
 *
 * Every screen built on `TimelineFragment` gets a loaded page through one method, and an empty page
 * ends the feed there: the empty view for a first page, and for a later one a return that leaves the
 * finished request in place, which is what the list checks before it asks for more. The hook goes
 * right after Tumblr's own `items.isEmpty()` and asks `TimelinePaging.onPage`. On 0 Tumblr's code
 * runs as it is. On 1 the fragment takes the page's links, stops a refresh's spinner and loads the
 * next page, the same call its list makes at the end of a scroll. On 2 it runs a copy of Tumblr's
 * first-page branch, the empty view. Both of those return, so nothing the hook writes is read by
 * Tumblr's code. Found by reading Tumblr 46.5.0.109 (2026-10-13).
 */
internal val timelinePagingPatch = bytecodePatch {
    dependsOn(settingsPatch, tumblrExtensionPatch)

    execute {
        // Everything is found before the edit, so a refusal leaves the APK as it was.
        applyTimelinePaging(resolveTimelinePaging())
    }
}

/** Finds the page delivery and what the hook uses in it, throwing when this build's differs. */
internal fun BytecodePatchContext.resolveTimelinePaging(): TimelinePagingPlan {
    requireExtensionHook(PATCH, TIMELINE_PAGING_HOOK)
    val owner = classDefByOrNull(TIMELINE_FRAGMENT)
    requireShape(PATCH, owner != null, "Tumblr's $TIMELINE_FRAGMENT wasn't found")
    val delivery = owner!!.methods.filter { method ->
        val parameters = method.parameterTypes.map(CharSequence::toString)
        !method.isStatic() && method.returnType == "V" && method.implementation != null &&
            parameters.size == 5 && parameters.drop(1) == listOf(LIST, LINKS, MAP, "Z")
    }.only(PATCH, "the method a timeline fragment gets its loaded page through")
    val mode = delivery.parameterTypes[0].toString()
    val body = delivery.instructionList()
    val self = delivery.localRegisterCount()
    val type = delivery.parameterRegisterNumber(0)
    val items = delivery.parameterRegisterNumber(1)
    val links = delivery.parameterRegisterNumber(2)
    // Every register the hook names goes into a four-bit operand.
    requireShape(PATCH, delivery.implementation!!.registerCount <= 16, "the page delivery has more than 16 registers")
    requireShape(PATCH, delivery.implementation!!.tryBlocks.isEmpty(), "the page delivery gained a try block")

    val asked = body.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_INTERFACE && instruction.takes(items) &&
            instruction.methodRef()?.let { it.definingClass == LIST && it.name == "isEmpty" && it.hasShape(emptyList(), "Z") } == true
    }
    requireShape(PATCH, asked >= 0 && asked + 5 < body.size, "the page delivery no longer asks whether its items are empty")
    val at = asked + 2
    val kept = body[asked + 1]
    val one = body[at]
    val branch = body[at + 1]
    val constant = body[at + 2]
    val compare = body[at + 3]
    requireShape(
        PATCH,
        kept.opcode == Opcode.MOVE_RESULT && one.opcode == Opcode.CONST_4 &&
            (one as NarrowLiteralInstruction).narrowLiteral == 1 && branch.opcode == Opcode.IF_EQZ &&
            constant.opcode == Opcode.SGET_OBJECT && compare.opcode == Opcode.IF_NE,
        "the page delivery no longer tells an empty next page from an empty first page the way the hook expects",
    )
    val empty = (kept as OneRegisterInstruction).registerA
    val scratch = (one as OneRegisterInstruction).registerA
    val paging = constant.fieldRef()!!
    val compared = (compare as TwoRegisterInstruction).let { setOf(it.registerA, it.registerB) }
    requireShape(
        PATCH,
        (branch as OneRegisterInstruction).registerA == empty && paging.name == PAGINATION && paging.type == mode &&
            paging.definingClass == mode && compared == setOf(type, (constant as OneRegisterInstruction).registerA),
        "the page delivery no longer compares its load type with $PAGINATION on an empty page",
    )
    // Nothing branches past the question or into the hook, so it runs once a page, right after the
    // answer. 47.0.0.108 skips one call on the last parameter first (`if-nez`, then `k6(Map)`), a
    // forward branch that lands at or before the question, so every path still meets the hook once.
    val addresses = body.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    requireShape(
        PATCH,
        (0 until at).all { index ->
            val instruction = body[index]
            instruction.opcode.canContinue() && (instruction !is OffsetInstruction ||
                addresses.indexOf(addresses[index] + instruction.codeOffset) in (index + 1)..asked)
        } && !delivery.isJumpTarget(at),
        "the page delivery branches before it has asked whether its items are empty",
    )
    requireShape(PATCH, scratch != empty && empty !in setOf(self, type, links), "the page delivery keeps the answer over a value the hook reads")
    delivery.requireFreeAt(PATCH, at, listOf(scratch))
    delivery.requireThisIntact(PATCH, listOf(at))
    delivery.requireParameterIntact(PATCH, 0, listOf(at))
    delivery.requireParameterIntact(PATCH, 2, listOf(at))

    // Tumblr's branch for an empty first page: no more pages, then the empty view. The hook runs a copy.
    val first = addresses.indexOf(addresses[at + 3] + (compare as OffsetInstruction).codeOffset)
    requireShape(PATCH, first > at + 3 && first + 2 < body.size, "the empty first page's branch moved")
    val flag = body[first]
    val show = body[first + 1]
    val endFlag = flag.fieldRef()
    val emptyView = show.methodRef()
    requireShape(
        PATCH,
        flag.opcode == Opcode.IPUT_BOOLEAN && (flag as TwoRegisterInstruction).registerA == scratch && flag.registerB == self &&
            endFlag != null && endFlag.definingClass == PAGINATION_FRAGMENT && endFlag.type == "Z" &&
            show.opcode == Opcode.INVOKE_VIRTUAL && show.takes(self) && emptyView != null &&
            emptyView.definingClass == TIMELINE_FRAGMENT && emptyView.hasShape(emptyList(), "V") &&
            body[first + 2].opcode == Opcode.RETURN_VOID,
        "an empty first page no longer sets one flag and shows the empty view",
    )

    val nextLink = body.filter { instruction ->
        instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction.takes(links) &&
            instruction.methodRef()?.let { it.definingClass == LINKS && it.hasShape(emptyList(), NEXT_LINK) } == true
    }.map { it.methodRef()!!.descriptor() }.distinct().only(PATCH, "the next link's getter in the page delivery")

    // Where Tumblr takes a page's links for the next load, and says there are more pages.
    val store = body.indices.filter { index ->
        val instruction = body[index]
        instruction.opcode == Opcode.IPUT_OBJECT && (instruction as TwoRegisterInstruction).registerA == links &&
            instruction.registerB == self &&
            instruction.fieldRef()?.let { it.definingClass == PAGINATION_FRAGMENT && it.type == PARCELABLE } == true
    }.only(PATCH, "the store of a page's links")
    requireShape(
        PATCH,
        store > at && body.getOrNull(store + 1)?.let { it.opcode == Opcode.IPUT_BOOLEAN && it.fieldRef()?.descriptor() == endFlag!!.descriptor() } == true,
        "the page delivery no longer clears its last-page flag beside the links it stores",
    )

    // Where Tumblr drops the finished request, and stops the spinner the load started.
    val dropped = body.indices.filter { index ->
        val instruction = body[index]
        instruction.opcode == Opcode.IPUT_OBJECT && (instruction as TwoRegisterInstruction).registerB == self &&
            instruction.fieldRef()?.let { it.definingClass == TIMELINE_FRAGMENT && it.type == CALL } == true
    }.only(PATCH, "the store that drops the finished request")
    val settled = body.getOrNull(dropped + 1)
    val settle = settled?.methodRef()
    requireShape(
        PATCH,
        dropped > at && settled != null && settled.opcode == Opcode.INVOKE_VIRTUAL && settled.takes(self, type) &&
            settle != null && settle.definingClass == TIMELINE_FRAGMENT && settle.hasShape(listOf(mode), "V"),
        "the page delivery no longer settles its load right after dropping the request",
    )

    val load = owner.methods.filter { method ->
        !method.isStatic() && !AccessFlags.PRIVATE.isSet(method.accessFlags) && method.implementation != null &&
            method.hasShape(listOf(mode, "Z"), "V")
    }.only(PATCH, "the method a timeline fragment loads a page with")
    // Tumblr's own next-page call, made when a scroll nears the end: load(PAGINATION, true).
    requireShape(
        PATCH,
        owner.methods.any { it.loadsNextPage(paging.descriptor(), load.descriptor()) },
        "nothing in the fragment loads its next page with $PAGINATION and true any more",
    )

    // The extension tells a next page by the constant's name(), which is what its <clinit> passes.
    val loadType = classDefByOrNull(mode)
    val named = loadType?.methods?.singleOrNull { it.name == "<clinit>" }?.instructionList().orEmpty()
    val name = named.indexOfFirst { it.stringRef() == PAGINATION }
    val constantStored = named.drop(name + 1).firstOrNull { it.opcode == Opcode.SPUT_OBJECT }?.fieldRef()
    requireShape(
        PATCH,
        loadType != null && AccessFlags.ENUM.isSet(loadType.accessFlags) && name >= 0 &&
            constantStored?.descriptor() == paging.descriptor(),
        "the load type's $PAGINATION constant is no longer named $PAGINATION",
    )

    return TimelinePagingPlan(
        delivery = mutableOf(delivery),
        at = at,
        scratch = scratch,
        empty = empty,
        nextLink = nextLink,
        endFlag = endFlag!!.descriptor(),
        emptyView = emptyView!!.descriptor(),
        linkField = body[store].fieldRef()!!.descriptor(),
        paging = paging.descriptor(),
        settle = settle!!.descriptor(),
        load = load.descriptor(),
    )
}

/**
 * Puts the question in front of [TimelinePagingPlan.at]. The scratch local holds the next link, then
 * the answer, then the PAGINATION constant. The register holding `items.isEmpty()` is written only
 * on the two paths that return, where it becomes the `true` both of them pass on.
 */
internal fun applyTimelinePaging(plan: TimelinePagingPlan) {
    val delivery = plan.delivery
    val type = delivery.parameterRegister(0)
    val links = delivery.parameterRegister(2)
    val scratch = "v${plan.scratch}"
    val empty = "v${plan.empty}"
    delivery.addInstructionsWithLabels(
        plan.at,
        """
            const/4 $scratch, 0x0
            if-eqz $links, :hush_ask
            invoke-virtual { $links }, ${plan.nextLink}
            move-result-object $scratch
            :hush_ask
            invoke-static { p0, $type, $scratch, $empty }, $TIMELINE_PAGING_HOOK
            move-result $scratch
            if-eqz $scratch, :hush_stock
            const/4 $empty, 0x1
            if-eq $scratch, $empty, :hush_next
            iput-boolean $empty, p0, ${plan.endFlag}
            invoke-virtual { p0 }, ${plan.emptyView}
            return-void
            :hush_next
            iput-object $links, p0, ${plan.linkField}
            sget-object $scratch, ${plan.paging}
            if-eq $type, $scratch, :hush_load
            invoke-virtual { p0, $type }, ${plan.settle}
            :hush_load
            invoke-virtual { p0, $scratch, $empty }, ${plan.load}
            return-void
        """,
        ExternalLabel("hush_stock", delivery.getInstruction(plan.at)),
    )
}

/** Whether the instruction is an invoke on exactly [registers], in order. */
private fun Instruction.takes(vararg registers: Int): Boolean {
    val call = this as? FiveRegisterInstruction ?: return false
    return listOf(call.registerC, call.registerD, call.registerE).take(call.registerCount) == registers.toList()
}

/** Whether the method calls [load] on a [paging] constant it just read and a `true` it just made. */
private fun com.android.tools.smali.dexlib2.iface.Method.loadsNextPage(paging: String, load: String): Boolean {
    val body = instructionList()
    return (2 until body.size).any { index ->
        val call = body[index] as? FiveRegisterInstruction
        val read = body[index - 2]
        val flag = body[index - 1]
        call != null && body[index].opcode == Opcode.INVOKE_VIRTUAL && body[index].methodRef()?.descriptor() == load &&
            call.registerCount == 3 && read.opcode == Opcode.SGET_OBJECT && read.fieldRef()?.descriptor() == paging &&
            (read as OneRegisterInstruction).registerA == call.registerD && flag.opcode == Opcode.CONST_4 &&
            (flag as OneRegisterInstruction).registerA == call.registerE && (flag as NarrowLiteralInstruction).narrowLiteral == 1
    }
}
