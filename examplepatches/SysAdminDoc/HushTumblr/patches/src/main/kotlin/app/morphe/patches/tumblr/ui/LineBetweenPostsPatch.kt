/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.appClassesWithString
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.lookup.sameAs
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.freeLocalsAt
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val PATCH = "Line between posts"
internal const val POST_LINES = "$EXTENSION_PACKAGE/ui/PostLines;"
internal const val POST_GAPS_HOOK = "$POST_LINES->paintsGaps(I)I"
internal const val POST_GAP_HOOK = "$POST_LINES->paintGap(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V"
internal const val POST_ROW_HOOK = "$POST_LINES->offsetsOf(Landroid/view/View;)V"
internal const val POST_NEIGHBORS_HOOK = "$POST_LINES->between(Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val POST_DRAWN_ROW_HOOK = "$POST_LINES->drawingRow(Landroid/view/View;)V"
internal const val POST_SPACING_DEBUG = "debug_timeline_object_spacing"
private const val RECYCLER_VIEW = "Landroidx/recyclerview/widget/RecyclerView;"
private const val VIEW = "Landroid/view/View;"
private const val TIMELINEABLE = "Lcom/tumblr/rumblr/model/Timelineable;"
private const val CHILD_AT = "Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;"

/**
 * Where the hooks go. In [draw]: the debug answer at [debugRead], kept in [debugRegister], the
 * painted gap at [paint] on [registerCount] registers from [firstRegister], and the row the loop
 * has come to, [drawnRow], ready in front of [drawnRowAt]. In [offsets], the spacing's
 * getItemOffsets: the row it works out, parameter [row], and the timeline items above it and at it,
 * [above] and [here], read in front of [neighborsAt], whose payloads [payload] hands back. [scratch]
 * are two locals nothing reads from there on.
 */
internal class PostGapPlan(
    val draw: MutableMethod,
    val debugRead: Int,
    val debugRegister: Int,
    val paint: Int,
    val firstRegister: Int,
    val registerCount: Int,
    val drawnRowAt: Int,
    val drawnRow: Int,
    val offsets: MutableMethod,
    val row: Int,
    val neighborsAt: Int,
    val above: Int,
    val here: Int,
    val payload: String,
    val scratch: List<Int>,
)

/**
 * Tumblr's timeline spacing (`mxl` in 47.0.0.108) is the one list decoration that leaves a gap above
 * each row. Its draw goes over every row's gap only for a debug switch, painting it with a debug
 * red. The switch's answer goes through the extension here, and so does the paint call, so that
 * existing loop gives the line its place without any of the list's own obfuscated methods.
 *
 * The spacing leaves the same gap above a heading, a carousel or a button between posts, and a line
 * there doesn't divide two posts (#15). The spacing's getItemOffsets (`mxl.d`) reads the timeline
 * item above a row and the row's own (`w4a.G0`) to pick the gap's size (`lxl.b`); the extension gets
 * the row first and then both items' payloads (`a2k.l`), and the draw says which row it's on before
 * each gap, so the line goes only where a post sits on both sides.
 */
@Suppress("unused")
val lineBetweenPostsPatch = bytecodePatch(
    name = PATCH,
    description = "Draws a thin line in the gap between posts, so it's easier to see where one ends and the next begins." +
        " Starts off. Turn it on in Tumblr settings > HushTumblr > Interface.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())
    execute {
        requireStatusMethod("lineBetweenPosts")
        requireStatusMethod("postLine")
        val plan = resolvePostGaps()
        // The later index first, so the earlier one still names its instruction.
        plan.draw.replaceInstruction(
            plan.paint,
            "invoke-static/range { v${plan.firstRegister} .. v${plan.firstRegister + plan.registerCount - 1} }, $POST_GAP_HOOK",
        )
        plan.draw.addInstructions(plan.drawnRowAt, "invoke-static/range { v${plan.drawnRow} .. v${plan.drawnRow} }, $POST_DRAWN_ROW_HOOK")
        plan.draw.addInstructions(
            plan.debugRead + 2,
            "invoke-static/range { v${plan.debugRegister} .. v${plan.debugRegister} }, $POST_GAPS_HOOK\n" +
                "move-result v${plan.debugRegister}",
        )
        val (aboveKind, hereKind) = plan.scratch
        plan.offsets.addInstructionsWithLabels(
            plan.neighborsAt,
            """
                const/4 v$aboveKind, 0x0
                if-eqz v${plan.above}, :hush_top
                invoke-virtual { v${plan.above} }, ${plan.payload}
                move-result-object v$aboveKind
                :hush_top
                const/4 v$hereKind, 0x0
                if-eqz v${plan.here}, :hush_bottom
                invoke-virtual { v${plan.here} }, ${plan.payload}
                move-result-object v$hereKind
                :hush_bottom
                invoke-static { v$aboveKind, v$hereKind }, $POST_NEIGHBORS_HOOK
            """,
        )
        plan.offsets.addInstructions(0, "invoke-static/range { v${plan.row} .. v${plan.row} }, $POST_ROW_HOOK")
        enableCapability("postLine")
        enableStatus("lineBetweenPosts")
    }
}

internal fun BytecodePatchContext.resolvePostGaps(): PostGapPlan {
    for (hook in listOf(POST_GAPS_HOOK, POST_GAP_HOOK, POST_ROW_HOOK, POST_NEIGHBORS_HOOK, POST_DRAWN_ROW_HOOK)) {
        requireExtensionHook(PATCH, hook)
    }
    val owner = appClassesWithString(POST_SPACING_DEBUG).filter { candidate ->
        candidate.superclass?.startsWith("Landroidx/recyclerview/widget/RecyclerView\$") == true
    }.only(PATCH, "the list decoration with the timeline spacing's debug switch")
    val debug = owner.methods.filter { method ->
        !method.isStatic() && method.hasShape(emptyList(), "Z") && POST_SPACING_DEBUG in method.strings()
    }.only(PATCH, "the timeline spacing's debug check")
    val draw = owner.methods.filter { method ->
        val types = method.parameterTypes.map(CharSequence::toString)
        !method.isStatic() && method.returnType == "V" && types.size == 3 &&
            types[0] == "Landroid/graphics/Canvas;" && types[1] == RECYCLER_VIEW &&
            method.instructionList().any { it.methodRef()?.sameAs(debug) == true }
    }.only(PATCH, "the timeline spacing's draw")
    val steps = draw.instructionList()
    val reads = steps.indices.filter { steps[it].methodRef()?.sameAs(debug) == true }.only(PATCH, "the draw's debug check")
    val kept = steps.getOrNull(reads + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction
    requireShape(PATCH, kept != null, "the draw doesn't keep the debug check's answer")
    val paints = steps.indices.filter { at ->
        steps[at].methodRef()?.let { it.definingClass == "Landroid/graphics/Canvas;" && it.name == "drawRect" &&
            it.hasShape(listOf("F", "F", "F", "F", "Landroid/graphics/Paint;"), "V") } == true
    }.only(PATCH, "the draw's one painted gap")
    val paint = steps[paints] as? RegisterRangeInstruction
    requireShape(PATCH, paint != null && paints > reads, "the draw doesn't paint its gaps after the debug check")
    val children = steps.indices.filter { steps[it].methodRef()?.toString() == CHILD_AT }.only(PATCH, "the draw's row lookup")
    val child = steps.getOrNull(children + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction
    requireShape(
        PATCH,
        child != null && children > reads + 1 && children + 2 < paints && draw.fallsThroughOnly(children + 2),
        "the draw doesn't take each row it paints a gap for before the paint",
    )
    val neighbors = resolveRowNeighbors(owner.methods)
    return PostGapPlan(
        mutableOf(draw), reads, kept!!.registerA, paints, paint!!.startRegister, paint.registerCount,
        children + 2, child!!.registerA,
        neighbors.offsets, neighbors.row, neighbors.at, neighbors.above, neighbors.here, neighbors.payload, neighbors.scratch,
    )
}

private class RowNeighbors(
    val offsets: MutableMethod,
    val row: Int,
    val at: Int,
    val above: Int,
    val here: Int,
    val payload: String,
    val scratch: List<Int>,
)

/**
 * The spacing's getItemOffsets and, in it, the two timeline items it hands the gap's size picker,
 * the one above the row and the row's own, each read by position just before.
 */
private fun BytecodePatchContext.resolveRowNeighbors(methods: Iterable<Method>): RowNeighbors {
    val offsets = methods.filter { method ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf("Landroid/graphics/Rect;", VIEW, RECYCLER_VIEW, "Landroidx/recyclerview/widget/RecyclerView\$a0;") &&
            !method.isStatic() && method.returnType == "V" && method.implementation != null
    }.only(PATCH, "the timeline spacing's offsets")
    val steps = offsets.instructionList()
    val pickers = steps.indices.filter { at ->
        steps[at].methodRef()?.let { ref ->
            val types = ref.parameterTypes.map(CharSequence::toString)
            ref.returnType == "I" && types.size == 2 && types[0] == types[1] && types[0].startsWith("L") &&
                !types[0].startsWith("Landroid") && !types[0].startsWith("Ljava")
        } == true
    }.only(PATCH, "the offsets' gap size picker")
    val card = steps[pickers].methodRef()!!.parameterTypes[0].toString()
    val itemReads = steps.indices.filter { at ->
        at < pickers && steps[at].opcode == Opcode.INVOKE_VIRTUAL &&
            steps[at].methodRef()?.let { it.returnType == card && it.hasShape(listOf("I"), card) } == true &&
            steps.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }
    requireShape(PATCH, itemReads.size == 2, "the offsets read ${itemReads.size} timeline items before the gap size, not 2")
    val above = (steps[itemReads[0] + 1] as OneRegisterInstruction).registerA
    val here = (steps[itemReads[1] + 1] as OneRegisterInstruction).registerA
    val at = itemReads[1] + 2
    requireShape(
        PATCH,
        above != here && steps[pickers].namedRegisters().drop(1) == listOf(above, here) && at <= pickers &&
            (at until pickers).none { k -> writesEither(steps[k], above, here) } && offsets.fallsThroughOnly(at),
        "the gap size picker doesn't take the item above the row and the row's own as they were read",
    )
    val cardClass = classDefByOrNull(card)
    requireShape(
        PATCH,
        cardClass != null && !AccessFlags.INTERFACE.isSet(cardClass.accessFlags),
        "the timeline item the spacing reads isn't a class",
    )
    val payload = cardClass!!.methods.filter { method ->
        !method.isStatic() && method.hasShape(emptyList(), TIMELINEABLE)
    }.only(PATCH, "the timeline item's payload")
    val row = offsets.parameterRegisterNumber(1)
    val scratch = offsets.freeLocalsAt(PATCH + ": the item payloads", at, 2, reads = listOf(above, here))
    return RowNeighbors(mutableOf(offsets), row, at, above, here, "$card->${payload.name}()$TIMELINEABLE", scratch)
}

private fun writesEither(step: Instruction, first: Int, second: Int): Boolean =
    step.opcode.setsRegister() && step is OneRegisterInstruction && (step.registerA == first || step.registerA == second ||
        step.opcode.setsWideRegister() && (step.registerA + 1 == first || step.registerA + 1 == second))

/** Whether instruction [at] is reached only by falling through from the one before it. */
private fun Method.fallsThroughOnly(at: Int): Boolean {
    val flow = ControlFlow.of(this)
    if (at <= 0 || at >= flow.instructions.size || at !in flow.normal[at - 1]) return false
    return flow.normal.indices.none { k -> k != at - 1 && at in flow.normal[k] } && flow.exceptional.none { at in it }
}
