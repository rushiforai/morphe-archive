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
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
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
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.freeLocalsAt
import app.morphe.patches.tumblr.misc.extension.localRegisterCount
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.patches.tumblr.misc.extension.patchLog
import app.morphe.patches.tumblr.misc.extension.requireParameterIntact
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val LONG_POSTS = "$EXTENSION_PACKAGE/timeline/LongPosts;"
internal const val LONG_POSTS_READ_MORE_SHOWN_HOOK = "$LONG_POSTS->readMoreShown(Landroid/view/View;Ljava/lang/Object;)V"
internal const val LONG_POSTS_READ_MORE_HOOK = "$LONG_POSTS->readMore(Ljava/lang/Object;Landroid/view/View;)Z"
internal const val HUSH_READ_MORE_BINDER = "$EXTENSION_PACKAGE/timeline/HushReadMoreBinder;"
internal const val HUSH_TIMELINE_ITEM = "$EXTENSION_PACKAGE/timeline/HushTimelineItem;"
internal const val HUSH_EXPANDING_TIMELINE = "$EXTENSION_PACKAGE/timeline/HushExpandingTimeline;"

// Tumblr 47.0.0.108's names: the binder of the Read more row under a post's own rows (the post row
// composer's `d`, POST_COMPOSER) and the screen it hands a tap to (the timeline screen,
// TIMELINE_FRAGMENT, implements it), the row's view holder, a timeline item and the base class
// that hands back its post, and the timeline screen's list adapter, a Graywater adapter.
internal const val READ_MORE_BINDER = "Lr0h;"
internal const val READ_MORE_SCREEN = "Lqfe;"
internal const val READ_MORE_HOLDER = "Lcom/tumblr/ui/widget/graywater/viewholder/ReadMoreViewHolder;"
internal const val TIMELINE_ITEM = "Lr4g;"
internal const val TIMELINE_CARD = "La2k;"
internal const val TIMELINE_ADAPTER = "Lw4a;"
internal const val GRAYWATER_ADAPTER = "Lzx9;"
internal const val RECYCLER_ADAPTER = "Landroidx/recyclerview/widget/RecyclerView\$h;"

// Tumblr's own cut of a long post in some feeds, tag pages among them (`mm2.j`, `km2.o`): a timeline
// item's post ([COMPOSED_POST], from the post base class) drops the cut once its `l2(true)` marks it
// opened, which its `g2()` then reads, the way Tumblr's inline View post does (`ykn.l`), except when
// the server sent it with force_truncate (`af1.C1`). A capped card item is cut to its own height
// either way.
internal const val POST_BASE = "Laf1;"
internal const val CAPPED_ITEM = "Lkjh;"
private const val LIFT_CUT = "l2"
private const val CUT_LIFTED = "g2"
private const val FORCED_CUT = "C1"
private const val TIMELINEABLE = "Lcom/tumblr/rumblr/model/Timelineable;"
private const val VIEW = "Landroid/view/View;"
private const val CLICK_LISTENER = "Landroid/view/View\$OnClickListener;"
private const val BUTTON = "Landroid/widget/Button;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val LIST = "Ljava/util/List;"

private const val SCREEN_FIELD = "b"
private const val ENTRY_FIELD = "d"
private const val BUTTON_GETTER = "f1"
private const val OPEN = "x3"
private const val POST_GETTER = "l"
private const val ADAPTER_GETTER = "z5"
private const val ITEMS = "f0"
private const val REMOVE = "y0"
private const val INSERT = "U"
private const val REDRAW = "x"

private val EXITS = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW)

/**
 * Where the two hooks go: in front of [bindAt] in [bind] (`r0h.i`), the listener Tumblr is about
 * to give the row's button, with the button in [button] and the timeline item in [item]; and in
 * front of the first instruction of [tap] (`r0h.m`), the button's tap, borrowing [scratch].
 */
internal class ExpandSite(
    val bind: MutableMethod,
    val bindAt: Int,
    val button: Int,
    val item: Int,
    val tap: MutableMethod,
    val scratch: Int,
)

/**
 * Lets Read more under a post Collapse long posts cut open the post where it is. Tumblr's post row
 * composer puts its `d` row, bound by `r0h`, under a post's own rows when they're cut. `r0h.i` binds
 * it and sets the button's tap, which reaches `r0h.m` through `r0h.h`, and that hands it to the
 * screen (`qfe.x3`) with the binder's entry id, which opens the post by itself. For each reblog
 * trail entry it cut, Tumblr copies the binder and sets the copy's entry id, so only the post's own
 * row has none. A hook in `r0h.i` hands the extension the button and its timeline item, whose post
 * comes from the item's base class through [HUSH_TIMELINE_ITEM]. The tap asks the extension first.
 * On a button under a post it cut, it reads the screen through [HUSH_READ_MORE_BINDER], which the
 * binder answers only without an entry id, and asks the timeline ([HUSH_EXPANDING_TIMELINE], added
 * to Tumblr's timeline screen) to build the item's rows again where it is: `zx9.y0` takes them out
 * and `zx9.U` builds them back without telling the list, then `x()` redraws it, the way Tumblr's
 * own refresh of the list does. First it marks the post opened for Tumblr too ([COMPOSED_POST]'s
 * `l2`), or a feed that cuts long posts itself, like a tag page, cuts the opened post again at its
 * own height. A post the server marked to cut, or a capped card, isn't opened here. The post hook
 * leaves an opened post whole from then on. On any other button, or when the timeline can't,
 * Tumblr opens the post by itself as before.
 *
 * A soft site: when one of these no longer has this shape the patch logs why and answers false,
 * so posts still collapse and Read more opens them on their own screen.
 */
internal fun BytecodePatchContext.expandLongPostsInPlace(patch: String): Boolean {
    requireExtensionHook(patch, LONG_POSTS_READ_MORE_SHOWN_HOOK)
    requireExtensionHook(patch, LONG_POSTS_READ_MORE_HOOK)
    val site = try {
        resolveExpandSite(patch)
    } catch (refused: PatchException) {
        patchLog.warning("${refused.message}, so Read more opens a post it cut on its own screen")
        return false
    }
    site.bind.addInstructions(site.bindAt, "invoke-static { v${site.button}, v${site.item} }, $LONG_POSTS_READ_MORE_SHOWN_HOOK")
    val binder = site.tap.localRegisterCount()
    val view = site.tap.parameterRegisterNumber(0)
    site.tap.addInstructionsWithLabels(
        0,
        """
            invoke-static { v$binder, v$view }, $LONG_POSTS_READ_MORE_HOOK
            move-result v${site.scratch}
            if-eqz v${site.scratch}, :hush_open
            return-void
        """,
        ExternalLabel("hush_open", site.tap.getInstruction(0)),
    )

    val readMore = mutableClassDefBy(READ_MORE_BINDER)
    readMore.interfaces.add(HUSH_READ_MORE_BINDER)
    readMore.methods.add(
        ImmutableMethod(
            READ_MORE_BINDER, "hushReadMoreScreen", emptyList(), OBJECT, AccessFlags.PUBLIC.value,
            null, null, MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, $READ_MORE_BINDER->$ENTRY_FIELD:$STRING
                    if-nez v0, :hush_entry
                    iget-object v0, p0, $READ_MORE_BINDER->$SCREEN_FIELD:$READ_MORE_SCREEN
                    return-object v0
                    :hush_entry
                    const/4 v0, 0x0
                    return-object v0
                """,
            )
        },
    )
    val card = mutableClassDefBy(TIMELINE_CARD)
    card.interfaces.add(HUSH_TIMELINE_ITEM)
    card.methods.add(
        ImmutableMethod(
            TIMELINE_CARD, "hushPost", emptyList(), OBJECT, AccessFlags.PUBLIC.value,
            null, null, MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    invoke-virtual { p0 }, $TIMELINE_CARD->$POST_GETTER()$TIMELINEABLE
                    move-result-object v0
                    return-object v0
                """,
            )
        },
    )
    val timeline = mutableClassDefBy(TIMELINE_FRAGMENT)
    timeline.interfaces.add(HUSH_EXPANDING_TIMELINE)
    timeline.methods.add(
        ImmutableMethod(
            TIMELINE_FRAGMENT, "hushExpandPost", listOf(ImmutableMethodParameter(OBJECT, null, null)), "Z",
            AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(6),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual { p0 }, $TIMELINE_FRAGMENT->$ADAPTER_GETTER()$TIMELINE_ADAPTER
                    move-result-object v0
                    if-eqz v0, :hush_no
                    invoke-virtual { v0 }, $GRAYWATER_ADAPTER->$ITEMS()$LIST
                    move-result-object v1
                    invoke-interface { v1, p1 }, $LIST->indexOf($OBJECT)I
                    move-result v1
                    if-ltz v1, :hush_no
                    instance-of v2, p1, $CAPPED_ITEM
                    if-nez v2, :hush_no
                    instance-of v2, p1, $TIMELINE_CARD
                    if-eqz v2, :hush_no
                    move-object v2, p1
                    check-cast v2, $TIMELINE_CARD
                    invoke-virtual { v2 }, $TIMELINE_CARD->$POST_GETTER()$TIMELINEABLE
                    move-result-object v2
                    instance-of v3, v2, $COMPOSED_POST
                    if-eqz v3, :hush_no
                    check-cast v2, $COMPOSED_POST
                    invoke-virtual { v2 }, $POST_BASE->$FORCED_CUT()Z
                    move-result v3
                    if-nez v3, :hush_no
                    const/4 v3, 0x1
                    invoke-virtual { v2, v3 }, $COMPOSED_POST->$LIFT_CUT(Z)V
                    const/4 v2, 0x0
                    invoke-virtual { v0, v1, v2 }, $GRAYWATER_ADAPTER->$REMOVE(IZ)$OBJECT
                    invoke-virtual { v0, v1, p1, v2 }, $GRAYWATER_ADAPTER->$INSERT(I${OBJECT}Z)V
                    invoke-virtual { v0 }, $RECYCLER_ADAPTER->$REDRAW()V
                    const/4 v0, 0x1
                    return v0
                    :hush_no
                    const/4 v0, 0x0
                    return v0
                """,
            )
        },
    )
    return true
}

/** Finds the binder's bind and tap, the item's post and the timeline's adapter, refusing with a reason before any edit. */
internal fun BytecodePatchContext.resolveExpandSite(patch: String): ExpandSite {
    requireBridge(patch, HUSH_READ_MORE_BINDER, "hushReadMoreScreen", emptyList(), OBJECT)
    requireBridge(patch, HUSH_TIMELINE_ITEM, "hushPost", emptyList(), OBJECT)
    requireBridge(patch, HUSH_EXPANDING_TIMELINE, "hushExpandPost", listOf(OBJECT), "Z")

    val binder = classDefByOrNull(READ_MORE_BINDER)
    requireShape(patch, binder != null && !AccessFlags.INTERFACE.isSet(binder.accessFlags), "Tumblr's Read more binder is missing")
    requireShape(
        patch,
        HUSH_READ_MORE_BINDER !in binder!!.interfaces && binder.methods.none { it.name == "hushReadMoreScreen" },
        "Tumblr's Read more binder is already bridged",
    )
    requireShape(
        patch,
        binder.instanceField(SCREEN_FIELD)?.let {
            it.type == READ_MORE_SCREEN && AccessFlags.PRIVATE.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags)
        } == true && binder.instanceField(ENTRY_FIELD)?.type == STRING,
        "Tumblr's Read more binder no longer keeps the screen it hands a tap to and the trail entry it opens",
    )
    requireShape(
        patch,
        classDefByOrNull(TIMELINE_FRAGMENT)?.interfaces?.contains(READ_MORE_SCREEN) == true,
        "Tumblr's timeline screen no longer takes a Read more tap",
    )
    requireTimelineCard(patch)

    // r0h.m: the tap, which reads the screen first and hands it the button and the entry id.
    val tap = binder.methods.filter { method ->
        !method.isStatic() && method.hasShape(listOf(VIEW), "V") && method.instructionList().count { it.opens() } == 1
    }.only(patch, "the Read more tap")
    val tapSteps = tap.instructionList()
    val self = tap.localRegisterCount()
    val viewAt = tap.parameterRegisterNumber(0)
    val first = tapSteps.firstOrNull()
    requireShape(
        patch,
        first?.opcode == Opcode.IGET_OBJECT && first.fieldRef()?.let { it.definingClass == READ_MORE_BINDER && it.name == SCREEN_FIELD } == true &&
            (first as TwoRegisterInstruction).registerB == self &&
            tapSteps.any { it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.let { field -> field.definingClass == READ_MORE_BINDER && field.name == ENTRY_FIELD } == true },
        "the Read more tap no longer hands the button and the trail entry to the screen",
    )
    requireShape(patch, self < 16 && viewAt < 16, "the Read more tap keeps its binder or button past v15")
    val scratch = tap.freeLocalsAt(patch, 0, 1, highest = 255, reads = listOf(self, viewAt)).single()

    // r0h.h: the static step the button's listener calls, which only calls the tap above.
    val entry = binder.methods.filter { it.isStatic() && it.hasShape(listOf(READ_MORE_BINDER, VIEW), "V") }
        .only(patch, "the Read more tap's entry")
    val entrySteps = entry.instructionList()
    val call = entrySteps.firstOrNull()
    requireShape(
        patch,
        entrySteps.size == 2 && entrySteps[1].opcode == Opcode.RETURN_VOID && call?.opcode == Opcode.INVOKE_DIRECT &&
            call.methodRef()?.let { it.definingClass == READ_MORE_BINDER && it.name == tap.name && it.hasShape(listOf(VIEW), "V") } == true &&
            (call as FiveRegisterInstruction).registerCount == 2 &&
            call.registerC == entry.parameterRegisterNumber(0) && call.registerD == entry.parameterRegisterNumber(1),
        "the Read more tap's entry no longer goes straight to the tap",
    )

    // r0h.i: binds the row, takes its button and gives it a listener that calls the entry above.
    val bind = binder.methods.filter {
        !it.isStatic() && it.hasShape(listOf(TIMELINE_ITEM, READ_MORE_HOLDER, LIST, "I"), "V")
    }.only(patch, "the Read more row's bind")
    val bindSteps = bind.instructionList()
    val take = bindSteps.indices.filter { index ->
        bindSteps[index].opcode == Opcode.INVOKE_VIRTUAL && bindSteps[index].methodRef()?.let {
            it.definingClass == READ_MORE_HOLDER && it.name == BUTTON_GETTER && it.hasShape(emptyList(), BUTTON)
        } == true
    }.only(patch, "the Read more row's button")
    val moved = bindSteps.getOrNull(take + 1)
    requireShape(patch, moved?.opcode == Opcode.MOVE_RESULT_OBJECT, "the Read more row's bind doesn't keep its button")
    val button = (moved as OneRegisterInstruction).registerA
    val bindAt = listenerMadeAt(bindSteps, button, entry)
    requireShape(
        patch,
        bindAt != null && bindAt > take + 1 && endsOnce(bind) && bind.straightAfter(take + 1, bindAt) &&
            (take + 2 until bindAt).none { bindSteps[it].writes(button) },
        "the Read more row's bind no longer gives its button a tap that reaches the binder's tap",
    )
    bind.requireParameterIntact(patch, 0, listOf(bindAt!!))
    val item = bind.parameterRegisterNumber(0)
    requireShape(patch, button < 16 && item < 16 && button != item, "the Read more row's bind keeps its button or item out of the hook's reach")

    requireTimelineAdapter(patch)
    requirePostCut(patch)
    return ExpandSite(mutableOf(bind), bindAt, button, item, mutableOf(tap), scratch)
}

/** Throws unless the extension's [face] is an interface with one public abstract [name]. */
private fun BytecodePatchContext.requireBridge(patch: String, face: String, name: String, parameters: List<String>, result: String) {
    val contract = classDefByOrNull(face)
    requireShape(
        patch,
        contract != null && AccessFlags.INTERFACE.isSet(contract.accessFlags) && contract.methods.count() == 1 &&
            contract.methods.all {
                it.name == name && it.hasShape(parameters, result) &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.ABSTRACT.isSet(it.accessFlags)
            },
        "the extension's $face bridge is missing or changed",
    )
}

/** Throws unless a timeline item's base class hands back its post through a public getter and isn't bridged yet. */
private fun BytecodePatchContext.requireTimelineCard(patch: String) {
    val card = classDefByOrNull(TIMELINE_CARD)
    requireShape(
        patch,
        card != null && !AccessFlags.INTERFACE.isSet(card.accessFlags) && classDefByOrNull(TIMELINE_ITEM)?.superclass == TIMELINE_CARD,
        "Tumblr's timeline item no longer comes from its card base class",
    )
    requireShape(
        patch,
        HUSH_TIMELINE_ITEM !in card!!.interfaces && card.methods.none { it.name == "hushPost" },
        "Tumblr's timeline card is already bridged",
    )
    requireShape(patch, card.hasPublic(POST_GETTER, emptyList(), TIMELINEABLE), "Tumblr's timeline card no longer hands back its post")
}

/** Throws unless the timeline screen reaches its list's adapter and that adapter can build an item again quietly. */
private fun BytecodePatchContext.requireTimelineAdapter(patch: String) {
    val timeline = classDefByOrNull(TIMELINE_FRAGMENT)
    requireShape(patch, timeline != null && !AccessFlags.INTERFACE.isSet(timeline.accessFlags), "Tumblr's timeline screen is missing")
    requireShape(
        patch,
        HUSH_EXPANDING_TIMELINE !in timeline!!.interfaces && timeline.methods.none { it.name == "hushExpandPost" },
        "Tumblr's timeline screen is already bridged",
    )
    requireShape(
        patch,
        timeline.methods.any {
            it.name == ADAPTER_GETTER && it.hasShape(emptyList(), TIMELINE_ADAPTER) && !it.isStatic() &&
                !AccessFlags.PRIVATE.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags)
        },
        "Tumblr's timeline screen no longer hands out its list's adapter",
    )
    requireShape(patch, classDefByOrNull(TIMELINE_ADAPTER)?.superclass == GRAYWATER_ADAPTER, "Tumblr's timeline adapter is no longer a Graywater adapter")
    val graywater = classDefByOrNull(GRAYWATER_ADAPTER)
    requireShape(
        patch,
        graywater != null && graywater.superclass == RECYCLER_ADAPTER &&
            graywater.hasPublic(ITEMS, emptyList(), LIST) &&
            graywater.hasPublic(REMOVE, listOf("I", "Z"), OBJECT) &&
            graywater.hasPublic(INSERT, listOf("I", OBJECT, "Z"), "V") &&
            classDefByOrNull(RECYCLER_ADAPTER)?.hasPublic(REDRAW, emptyList(), "V") == true,
        "Tumblr's Graywater adapter no longer takes an item out and back in without telling the list",
    )
}

/**
 * Throws unless a timeline post can be marked opened for Tumblr's own cut: the post class comes from
 * the post base class, its [LIFT_CUT] only sets the boolean its [CUT_LIFTED] only reads, the base's
 * [FORCED_CUT] only reads one of its own, and the capped card is a timeline item.
 */
private fun BytecodePatchContext.requirePostCut(patch: String) {
    val post = classDefByOrNull(COMPOSED_POST)
    val base = classDefByOrNull(POST_BASE)
    requireShape(
        patch,
        post != null && base != null && post.superclass == POST_BASE && classDefByOrNull(CAPPED_ITEM)?.superclass == TIMELINE_ITEM,
        "Tumblr's timeline post or capped card is missing",
    )
    requireShape(
        patch,
        post!!.movedFlag(LIFT_CUT, listOf("Z"), "V", Opcode.IPUT_BOOLEAN, Opcode.RETURN_VOID)
            ?.let { it == post.movedFlag(CUT_LIFTED, emptyList(), "Z", Opcode.IGET_BOOLEAN, Opcode.RETURN) } == true &&
            base!!.movedFlag(FORCED_CUT, emptyList(), "Z", Opcode.IGET_BOOLEAN, Opcode.RETURN) != null,
        "Tumblr's timeline post no longer drops its own cut or reads the server's cut",
    )
}

/** The one boolean of this class that its public [name] of this shape only [moves], then [exits], or null. */
private fun ClassDef.movedFlag(name: String, parameters: List<String>, result: String, moves: Opcode, exits: Opcode): FieldReference? {
    if (!hasPublic(name, parameters, result)) return null
    val steps = methods.single { it.name == name && it.hasShape(parameters, result) }.instructionList()
    if (steps.size != 2 || steps[0].opcode != moves || steps[1].opcode != exits) return null
    return steps[0].fieldRef()?.takeIf { it.definingClass == type && it.type == "Z" }
}

private fun ClassDef.instanceField(name: String) = fields.singleOrNull { it.name == name && !AccessFlags.STATIC.isSet(it.accessFlags) }

private fun ClassDef.hasPublic(name: String, parameters: List<String>, result: String) = methods.any {
    it.name == name && it.hasShape(parameters, result) && !it.isStatic() &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags)
}

private fun Instruction.opens(): Boolean = opcode == Opcode.INVOKE_INTERFACE && methodRef()?.let {
    it.definingClass == READ_MORE_SCREEN && it.name == OPEN && it.hasShape(listOf(VIEW, STRING), "V")
} == true

/** Whether [method] leaves only through the return-void at its end. */
private fun endsOnce(method: Method): Boolean {
    val steps = method.instructionList()
    return steps.size > 1 && steps.last().opcode == Opcode.RETURN_VOID && steps.count { it.opcode in EXITS } == 1
}

/**
 * Whether each instruction after [from] up to [to] is reached only by stepping from the one before
 * it. dexlib2 keeps a label on its instruction, so a jump there would skip code put in front of it.
 */
private fun Method.straightAfter(from: Int, to: Int): Boolean {
    val flow = ControlFlow.of(this)
    return (from + 1..to).all { at ->
        flow.instructions.indices.filter { at in flow.normal[it] || at in flow.exceptional[it] } == listOf(at - 1) &&
            at !in flow.exceptional[at - 1]
    }
}

/**
 * Where [steps] make the listener they set as [button]'s tap, once, when that listener's onClick
 * hands the view to [entry] once. Null otherwise.
 */
private fun BytecodePatchContext.listenerMadeAt(steps: List<Instruction>, button: Int, entry: Method): Int? {
    val set = steps.indices.singleOrNull { index ->
        steps[index].opcode == Opcode.INVOKE_VIRTUAL && steps[index].methodRef()?.let {
            it.name == "setOnClickListener" && it.hasShape(listOf(CLICK_LISTENER), "V")
        } == true
    } ?: return null
    val call = steps[set] as FiveRegisterInstruction
    if (call.registerCount != 2 || call.registerC != button) return null
    val made = steps.subList(0, set).indexOfLast { it.writes(call.registerD) }
    if (made < 0 || steps[made].opcode != Opcode.NEW_INSTANCE) return null
    val type = ((steps[made] as ReferenceInstruction).reference as TypeReference).type
    val click = classDefByOrNull(type)?.methods?.singleOrNull { it.name == "onClick" && it.hasShape(listOf(VIEW), "V") } ?: return null
    val calls = click.instructionList().count { step ->
        step.opcode == Opcode.INVOKE_STATIC && step.methodRef()?.let {
            it.definingClass == entry.definingClass && it.name == entry.name && it.hasShape(listOf(READ_MORE_BINDER, VIEW), "V")
        } == true
    }
    return if (calls == 1) made else null
}

private fun Instruction.writes(register: Int): Boolean {
    val target = (this as? OneRegisterInstruction)?.registerA ?: return false
    return opcode.setsRegister() && (target == register || (opcode.setsWideRegister() && target + 1 == register))
}
