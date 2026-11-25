/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.EXTENSION_ROOT
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.util.writesRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val PATCH = "Fit full-screen videos"
internal const val VIDEO_FIT_HOOK = "$EXTENSION_PACKAGE/ui/VideoFit;->fillsHeight(Z)Z"
internal const val VIDEO_HUB_IDS = "Lcom/tumblr/videohub/R\$id;"
internal const val VIDEO_BACKDROP = "background_image_view"

/** 0.8 as a double, the width over height below which Tumblr calls a video tall. */
private const val TALL_VIDEO_RATIO = 0x3fe999999999999aL

/** The tall branch: `const/4 [tall], 1`, then `move [flag], [tall]` at [at]. */
internal class VideoFitPlan(val constructor: MutableMethod, val at: Int, val tall: Int, val flag: Int)

private class TallBranch(val ratioAt: Int, val at: Int, val tall: Int, val flag: Int)

/**
 * Tumblr's full-screen player page (`com.tumblr.videohub.b$c` in 47.3.0.110) compares each video's
 * width over height with 0.8. Below it the page skips the blurred poster and tells the player to
 * use ExoPlayer's fixed-height mode (`ng8.i` calls `PlayerView.D(2)`), which cuts the sides off any
 * video wider than the screen's own shape. The answer for a tall video goes through the extension
 * on its way into the flag, so with the switch on the page takes the path every other video gets:
 * ExoPlayer's default fit, over the poster.
 */
@Suppress("unused")
val fitFullScreenVideosPatch = bytecodePatch(
    name = PATCH,
    description = "Shows tall videos whole in the full-screen player, instead of filling the screen's height and" +
        " cutting off the sides. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())
    execute {
        requireStatusMethod("fitFullScreenVideos")
        requireStatusMethod("fullScreenVideoFit")
        val plan = resolveVideoFit()
        plan.constructor.addInstructions(
            plan.at,
            "invoke-static { v${plan.tall} }, $VIDEO_FIT_HOOK\n" +
                "move-result v${plan.tall}",
        )
        enableCapability("fullScreenVideoFit")
        enableStatus("fitFullScreenVideos")
    }
}

private fun Instruction.loadsBackdrop(): Boolean =
    fieldRef()?.let { it.definingClass == VIDEO_HUB_IDS && it.name == VIDEO_BACKDROP } == true

/** Finds `ratio < 0.8 ? flag = 1 : flag = 0`, followed by the branch on the flag. */
private fun tallBranch(steps: List<Instruction>): TallBranch? {
    for (ratioAt in 0 until steps.size - 7) {
        val ratio = steps[ratioAt]
        if (ratio.opcode != Opcode.CONST_WIDE || (ratio as WideLiteralInstruction).wideLiteral != TALL_VIDEO_RATIO) continue
        val compare = steps[ratioAt + 1]
        val branch = steps[ratioAt + 2]
        val yes = steps[ratioAt + 3]
        val take = steps[ratioAt + 4]
        val no = steps[ratioAt + 6]
        val test = steps[ratioAt + 7]
        if (compare.opcode != Opcode.CMPG_DOUBLE || branch.opcode != Opcode.IF_GEZ || yes.opcode != Opcode.CONST_4 ||
            take.opcode != Opcode.MOVE || steps[ratioAt + 5].opcode != Opcode.GOTO || no.opcode != Opcode.MOVE ||
            test.opcode != Opcode.IF_NEZ
        ) continue
        val result = (compare as ThreeRegisterInstruction).registerA
        val tall = (yes as OneRegisterInstruction).registerA
        val flag = (take as TwoRegisterInstruction).registerA
        if ((compare as ThreeRegisterInstruction).registerC != (ratio as OneRegisterInstruction).registerA) continue
        if ((branch as OneRegisterInstruction).registerA != result || (yes as NarrowLiteralInstruction).narrowLiteral != 1) continue
        if ((take as TwoRegisterInstruction).registerB != tall || (no as TwoRegisterInstruction).registerA != flag) continue
        if ((test as OneRegisterInstruction).registerA != flag) continue
        return TallBranch(ratioAt, ratioAt + 4, tall, flag)
    }
    return null
}

private fun MutableMethod.jumpTarget(index: Int): Int =
    (implementation!!.instructions[index] as BuilderOffsetInstruction).target.location.index

internal fun BytecodePatchContext.resolveVideoFit(): VideoFitPlan {
    requireExtensionHook(PATCH, VIDEO_FIT_HOOK)
    val found = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filter { it.name == "<init>" }.forEach { method ->
            val steps = method.instructionList()
            if (steps.any { it.loadsBackdrop() } && tallBranch(steps) != null) found += method
        }
    }
    val constructor = mutableOf(found.only(PATCH, "the full-screen video page's constructor"))
    val steps = constructor.instructionList()
    val branch = tallBranch(steps)
    requireShape(PATCH, branch != null, "the full-screen video page no longer picks a tall video's mode")
    branch!!
    requireShape(PATCH, branch.tall < 16, "the tall video answer sits in a register the hook can't name")
    requireShape(
        PATCH,
        constructor.jumpTarget(branch.ratioAt + 2) == branch.ratioAt + 6 &&
            constructor.jumpTarget(branch.ratioAt + 5) == branch.ratioAt + 7,
        "the tall video branch jumps somewhere new",
    )
    requireShape(
        PATCH,
        (constructor.implementation!!.instructions[branch.at] as BuilderInstruction).location.labels.isEmpty(),
        "Tumblr's code jumps to the tall video answer",
    )
    val builds = steps.indices.filter { at ->
        at > branch.at && steps[at].opcode == Opcode.INVOKE_DIRECT_RANGE && steps[at].methodRef()?.let {
            it.definingClass == constructor.definingClass && it.parameterTypes.count { type -> type.toString() == "Z" } == 1
        } == true
    }
    val build = builds.only(PATCH, "the page's player builder call")
    val call = steps[build].methodRef()!!
    val before = call.parameterTypes.takeWhile { it.toString() != "Z" }
    val slot = 1 + before.sumOf { type -> (if (type.toString() == "J" || type.toString() == "D") 2 else 1).toInt() }
    requireShape(
        PATCH,
        (steps[build] as RegisterRangeInstruction).startRegister + slot == branch.flag,
        "the player builder doesn't take the tall video flag",
    )
    requireShape(
        PATCH,
        steps.subList(branch.ratioAt + 7, build).none { writesRegister(it, branch.flag) },
        "the page changes the tall video flag before it builds the player",
    )
    return VideoFitPlan(constructor, branch.at, branch.tall, branch.flag)
}
