/*
 * Copyright (C) 2026 rikunode
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package dev.rikunode.pupil

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/*
 * Pupil v6.1.1 is Jetpack Compose: its gallery cards are rendered by
 * SwipeRevealBox, which uses AnchoredDraggableElement to reveal actions.
 * APK release is R8-minified and inlines the anchoredDraggable(...) extension.
 *
 * Only call site of "new AnchoredDraggableElement" in the released APK is
 * SwipeRevealBoxKt.SwipeRevealBox. We disable this element's 'enabled'
 * constructor flag, and ensure recomposition doesn't re-enable it.
 *
 * Do NOT patch the old com.daimajia.swipe.SwipeLayout: it no longer exists.
 */
@Suppress("unused")
val disableGalleryLeftSwipePatch = bytecodePatch(
    name = "Disable gallery left swipe",
    description = "Disable the left-swipe action tray on Pupil 6.1.1 gallery cards. Preserve taps, long taps, reader gestures and vertical scrolling.",
    default = true,
) {
    compatibleWith(PupilCompatibility)

    execute {
        val create = AnchoredElementCreateFingerprint.method
        val update = AnchoredElementUpdateFingerprint.method

        // Exact release 6.1.1's dex instruction indices.
        // Fail closed if the release APK changes or the R8 optimizer changes.
        fun requireOne(indexName: String, instruction: Any, register: Int) {
            val literal = instruction as? NarrowLiteralInstruction
            val singleRegister = instruction as? OneRegisterInstruction
            require(literal?.narrowLiteral == 1 &&
                singleRegister?.registerA == register &&
                (instruction as com.android.tools.smali.dexlib2.iface.instruction.Instruction).opcode == Opcode.CONST_4
            ) { "Pupil 6.1.1 unexpected $indexName layout; refusing patch" }
        }

        val createInstructions = create.implementation?.instructions
            ?: error("Pupil 6.1.1 create method has no implementation")
        require(createInstructions.size == 10) {
            "Pupil 6.1.1 unexpected create method length"
        }
        requireOne("create", createInstructions[3], 3)

        val updateInstructions = update.implementation?.instructions
            ?: error("Pupil 6.1.1 update method has no implementation")
        require(updateInstructions.size == 26) {
            "Pupil 6.1.1 unexpected update method length"
        }
        requireOne("update", updateInstructions[22], 2)

        // In create(), v3 is the 'enabled' argument to DragGestureNode.<init>.
        create.replaceInstruction(3, "const/4 v3, 0x0")

        // In update(), v2 is the 'enabled' argument to DragGestureNode.update.
        // Fixing BOTH call sites keeps dragging off across recompositions.
        update.replaceInstruction(22, "const/4 v2, 0x0")
    }
}
