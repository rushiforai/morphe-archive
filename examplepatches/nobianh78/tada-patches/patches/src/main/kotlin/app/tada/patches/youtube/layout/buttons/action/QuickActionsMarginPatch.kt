/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.layout.buttons.action

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/QuickActionsMarginPatch;"

internal val quickActionsMarginPatch = bytecodePatch(
    description = "Injects a configurable top margin into the quick actions container view."
) {
    dependsOn(
        sharedExtensionPatch,
    )

    execute {
        QuickActionsElementSyntheticFingerprint.let {
            it.method.apply {
                val checkCastIndex = it.instructionMatches.last().index
                val insertRegister = getInstruction<OneRegisterInstruction>(checkCastIndex).registerA

                addInstruction(
                    checkCastIndex + 1,
                    "invoke-static { v$insertRegister }, $EXTENSION_CLASS->setQuickActionsMargin(Landroid/view/View;)V"
                )
            }
        }
    }
}
