/*
 * Copyright (C) 2026 rikunode
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package dev.rikunode.pupil

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Pupil 6.1.1:
 * MainComposeActivity.onResume() calls UpdateKt.checkUpdate$default(context,
 * false, 2, null). SettingsActivity calls checkUpdate(context, true) directly.
 *
 * Return early from the Kotlin default-argument bridge. This disables
 * automatic checks (and the ensuing update prompt/download) without changing
 * manual "check for update" in Settings, ordinary app notifications, or the
 * existing left-swipe patch.
 */
@Suppress("unused")
val disableAutomaticUpdateChecksPatch = bytecodePatch(
    name = "Disable automatic update checks",
    description = "Stop Pupil 6.1.1 checking for updates at startup and showing update prompts. Manual update checking in Settings remains available.",
    default = true,
) {
    compatibleWith(PupilCompatibility)

    execute {
        val method = AutomaticUpdateBridgeFingerprint.method
        val instructions = method.implementation?.instructions
            ?: error("Pupil 6.1.1 automatic update bridge has no implementation")
        require(
            instructions.size == 5 &&
                instructions[0].opcode == Opcode.AND_INT_LIT8 &&
                instructions[1].opcode == Opcode.IF_EQZ &&
                instructions[2].opcode == Opcode.CONST_4 &&
                instructions[3].opcode == Opcode.INVOKE_STATIC &&
                instructions[4].opcode == Opcode.RETURN_VOID &&
                (instructions[3] as? ReferenceInstruction)?.reference?.toString() ==
                    "Lxyz/quaver/pupil/util/UpdateKt;->checkUpdate(Landroid/content/Context;Z)V"
        ) { "Unexpected Pupil 6.1.1 update bridge bytecode; refusing patch" }

        method.addInstructions(0, "return-void")
    }
}
