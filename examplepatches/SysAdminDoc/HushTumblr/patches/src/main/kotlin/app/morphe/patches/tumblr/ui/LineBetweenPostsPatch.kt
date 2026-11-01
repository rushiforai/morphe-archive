/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val PATCH = "Line between posts"
internal const val POST_LINES = "$EXTENSION_PACKAGE/ui/PostLines;"
internal const val POST_GAPS_HOOK = "$POST_LINES->paintsGaps(I)I"
internal const val POST_GAP_HOOK = "$POST_LINES->paintGap(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V"
internal const val POST_SPACING_DEBUG = "debug_timeline_object_spacing"
private const val RECYCLER_VIEW = "Landroidx/recyclerview/widget/RecyclerView;"

internal class PostGapPlan(
    val draw: MutableMethod,
    val debugRead: Int,
    val debugRegister: Int,
    val paint: Int,
    val firstRegister: Int,
    val registerCount: Int,
)

/**
 * Tumblr's timeline spacing (`prl` in 46.9.1.100) is the one list decoration that leaves a gap above
 * each post. Its draw goes over every row's gap only for a debug switch, painting it with a debug
 * red. The switch's answer goes through the extension here, and so does the paint call, so that
 * existing loop gives the line its place without any of the list's own obfuscated methods.
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
        plan.draw.addInstructions(
            plan.debugRead + 2,
            "invoke-static/range { v${plan.debugRegister} .. v${plan.debugRegister} }, $POST_GAPS_HOOK\n" +
                "move-result v${plan.debugRegister}",
        )
        enableCapability("postLine")
        enableStatus("lineBetweenPosts")
    }
}

internal fun BytecodePatchContext.resolvePostGaps(): PostGapPlan {
    requireExtensionHook(PATCH, POST_GAPS_HOOK)
    requireExtensionHook(PATCH, POST_GAP_HOOK)
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
    return PostGapPlan(mutableOf(draw), reads, kept!!.registerA, paints, paint!!.startRegister, paint.registerCount)
}
