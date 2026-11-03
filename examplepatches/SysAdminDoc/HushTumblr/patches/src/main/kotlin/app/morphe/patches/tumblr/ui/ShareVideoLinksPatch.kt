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
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
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
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val PATCH = "Share video links"
internal const val VIDEO_LINKS = "$EXTENSION_PACKAGE/ui/VideoLinks;"
internal const val VIDEO_BIND_HOOK = "$VIDEO_LINKS->bind(Landroid/view/View;Ljava/lang/String;)V"
internal const val VIDEO_PRESS_HOOK =
    "$VIDEO_LINKS->press(Landroid/view/View\$OnLongClickListener;)Landroid/view/View\$OnLongClickListener;"
internal const val VIDEO_CONTROLLER_LAYOUT = "tumblr_video_player_timeline_controller"
internal const val VIDEO_BLOCK = "Lcom/tumblr/rumblr/model/post/blocks/TumblrVideoBlock;"
internal const val VIDEO_DETAILS = "Lcom/tumblr/rumblr/model/video/VideoDetails;"
internal const val VIDEO_CONTAINER = "Lcom/tumblr/ui/widget/NewVideoPlayerContainer;"
private const val LAYOUTS = "Lcom/tumblr/R\$layout;"
private const val VIEW = "Landroid/view/View;"
private const val LONG_CLICK_LISTENER = "Landroid/view/View\$OnLongClickListener;"

internal class VideoLinkPlan(
    val binder: MutableMethod,
    val bindAt: Int,
    val container: Int,
    val address: Int,
    val controls: MutableMethod,
    val pressAt: Int,
    val listener: Int,
)

/**
 * A video in a post (`ggm.f` in 46.9.1.100) gets a player built in its container, from details that
 * carry the video's address, and timeline controls (`psl`) whose long press calls back into the
 * binder, where 46.9's callback is empty. The container and the address go to the extension right
 * after the details are built, and the controls' long-press listener goes through the extension,
 * which offers the link before handing the press to Tumblr's listener.
 */
@Suppress("unused")
val shareVideoLinksPatch = bytecodePatch(
    name = PATCH,
    description = "Long-press a video in a post to share or copy its direct link." +
        " Starts off. Turn it on in Tumblr settings > HushTumblr > Posts.",
    default = true,
) {
    category("Posts")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())
    execute {
        requireStatusMethod("shareVideoLinks")
        requireStatusMethod("videoLinkPress")
        val plan = resolveVideoLinks()
        plan.binder.addInstructions(plan.bindAt, "invoke-static { v${plan.container}, v${plan.address} }, $VIDEO_BIND_HOOK")
        plan.controls.addInstructions(
            plan.pressAt,
            "invoke-static { v${plan.listener} }, $VIDEO_PRESS_HOOK\n" +
                "move-result-object v${plan.listener}",
        )
        enableCapability("videoLinkPress")
        enableStatus("shareVideoLinks")
    }
}

private fun Instruction.buildsVideoDetails(): Boolean = methodRef()?.let {
    it.definingClass == VIDEO_DETAILS && it.name == "<init>" && it.hasShape(listOf("Ljava/lang/String;", "I", "I"), "V")
} == true

private fun Instruction.readsVideoContainer(): Boolean = opcode == Opcode.IGET_OBJECT && fieldRef()?.type == VIDEO_CONTAINER

private fun Instruction.loadsControllerLayout(): Boolean =
    fieldRef()?.let { it.definingClass == LAYOUTS && it.name == VIDEO_CONTROLLER_LAYOUT } == true

/** Refuses when a jump lands on [index]: the label stays on Tumblr's instruction, so the jump would skip the hook. */
private fun MutableMethod.requireFallthrough(index: Int, what: String) {
    requireShape(PATCH, (implementation!!.instructions[index] as BuilderInstruction).location.labels.isEmpty(), "Tumblr's code jumps to $what")
}

internal fun BytecodePatchContext.resolveVideoLinks(): VideoLinkPlan {
    requireExtensionHook(PATCH, VIDEO_BIND_HOOK)
    requireExtensionHook(PATCH, VIDEO_PRESS_HOOK)
    val binders = mutableListOf<Method>()
    val inflaters = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterNot { it.isStatic() }.forEach { method ->
            val steps = method.instructionList()
            if (method.returnType == "V" && method.parameterTypes.any { it.toString() == VIDEO_BLOCK } &&
                steps.any { it.buildsVideoDetails() } && steps.any { it.readsVideoContainer() }
            ) binders += method
            if (method.hasShape(listOf("Landroid/content/Context;"), VIEW) && steps.any { it.loadsControllerLayout() }) inflaters += method
        }
    }

    val binder = binders.only(PATCH, "the post video binder")
    val steps = binder.instructionList()
    val built = steps.indices.filter { steps[it].buildsVideoDetails() }.only(PATCH, "the binder's video details")
    val details = steps[built] as? FiveRegisterInstruction
    requireShape(PATCH, details?.registerCount == 4, "the binder's video details don't take an address, a width and a height")
    val address = details!!.registerD
    val read = (built + 1 until steps.size).firstOrNull { steps[it].readsVideoContainer() }
    requireShape(PATCH, read != null, "the binder doesn't read its video container after the video details")
    val container = (steps[read!!] as TwoRegisterInstruction).registerA
    requireShape(
        PATCH,
        container != address && steps.subList(built + 1, read).none { writesRegister(it, address) },
        "the binder replaces the video's address before it reads the container",
    )
    requireShape(PATCH, container < 16 && address < 16, "the binder keeps the container or the address above v15")

    val inflater = inflaters.only(PATCH, "the timeline video controls' inflater")
    val setup = inflater.instructionList().mapNotNull { it.methodRef() }.filter {
        it.definingClass == inflater.definingClass && it.hasShape(listOf(VIEW), "V")
    }.distinctBy { it.name }.only(PATCH, "the controls' setup")
    val controls = mutableOf(setup)
    val body = controls.instructionList()
    val presses = body.indices.filter { at ->
        body[at].methodRef()?.let { it.name == "setOnLongClickListener" && it.hasShape(listOf(LONG_CLICK_LISTENER), "V") } == true
    }.only(PATCH, "the controls' long-press listener")
    val press = body[presses] as? FiveRegisterInstruction
    requireShape(PATCH, press?.registerCount == 2, "the controls' long-press listener isn't set on one view")
    val listener = press!!.registerD
    requireShape(PATCH, listener < 16, "the controls keep their long-press listener above v15")

    val mutableBinder = mutableOf(binder)
    mutableBinder.requireFallthrough(read + 1, "the instruction after the binder's container read")
    controls.requireFallthrough(presses, "the controls' long-press listener")
    return VideoLinkPlan(mutableBinder, read + 1, container, address, controls, presses, listener)
}
