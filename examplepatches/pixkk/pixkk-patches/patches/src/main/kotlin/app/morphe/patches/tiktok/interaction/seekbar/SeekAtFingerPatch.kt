/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.interaction.seekbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val WHAT = "Old-style seeking"
private const val EXTENSION = "Lapp/pixkk/extension/feed/SeekAtFinger;"
private const val MASK_VIEW = "Lcom/ss/android/ugc/aweme/feed/ui/seekbar/VideoSeekBarMaskView;"

/** The overlay over the feed's seek bar: every touch on the bar comes through it. */
internal object SeekBarOverlayTouchFingerprint : Fingerprint(
    definingClass = MASK_VIEW,
    name = "onTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

/**
 * The seek bar controller's drag step: the overlay hands it how far the finger moved, as a float
 * and a flag for the last call, and it adds that share of the bar's width to the progress. It
 * reads the bar's current progress through `getMProgress` and shows the bar through
 * `setSeekBarShowType`, which no other (float, boolean) method does.
 */
internal object SeekBarDragStepFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("F", "Z"),
    custom = { method, _ ->
        val names = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>()?.name }.orEmpty()
        "getMProgress" in names && "setSeekBarShowType" in names && "getMutableSeekBar" in names
    },
)

@Suppress("unused")
val seekAtFingerPatch = bytecodePatch(
    name = WHAT,
    description = "Dragging along the progress bar in the feed puts the video where your finger is " +
        "on the bar, as TikTok used to, instead of moving it by how far the finger travels. It " +
        "can be turned off in the Pixkk Patches settings.",
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    execute {
        SeekBarOverlayTouchFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION->onOverlayTouch(Landroid/view/MotionEvent;)V",
        )

        val step = SeekBarDragStepFingerprint.method
        val body = step.implementation!!
        val instructions = body.instructions.toList()
        val delta = body.registerCount - 2
        val self = body.registerCount - 3

        // progress += delta / width * 100 * speed: the add whose second operand is the delta.
        val add = instructions.indexOfFirst {
            it.opcode == Opcode.ADD_FLOAT_2ADDR && (it as TwoRegisterInstruction).registerB == delta
        }
        if (add < 0) throw PatchException("$WHAT: the drag step no longer adds the finger's move to the progress")
        val progress = (instructions[add] as TwoRegisterInstruction).registerA
        // The register the next instruction writes before reading is free to borrow.
        val clamp = instructions[add + 1]
        if (clamp.opcode != Opcode.CMPG_FLOAT) {
            throw PatchException("$WHAT: the progress is no longer clamped right after the add")
        }
        val scratch = (clamp as OneRegisterInstruction).registerA
        if (scratch == progress) throw PatchException("$WHAT: the clamp writes over the progress")
        if (progress > 15 || scratch > 15 || self > 15) {
            throw PatchException("$WHAT: the registers no longer fit a four-bit call")
        }

        val bar = instructions.mapNotNull { it.getReference<MethodReference>() }
            .firstOrNull { it.name == "getMutableSeekBar" }
            ?: throw PatchException("$WHAT: the drag step no longer reads the seek bar")
        val barCall = "${bar.definingClass}->${bar.name}(${bar.parameterTypes.joinToString("")})${bar.returnType}"
        val owner = instructions.mapNotNull { instruction ->
            instruction.getReference<FieldReference>()?.takeIf {
                instruction.opcode == Opcode.IGET_OBJECT && it.definingClass == step.definingClass &&
                    it.type == bar.definingClass &&
                    (instruction as TwoRegisterInstruction).registerB == self
            }
        }.firstOrNull() ?: throw PatchException("$WHAT: the controller no longer keeps its seek bar view")

        step.addInstructions(
            add + 1,
            """
                iget-object v$scratch, p0, ${owner.definingClass}->${owner.name}:${owner.type}
                invoke-virtual { v$scratch }, $barCall
                move-result-object v$scratch
                invoke-static { v$progress, v$scratch }, $EXTENSION->progressAt(FLandroid/view/View;)F
                move-result v$progress
            """,
        )
    }
}
