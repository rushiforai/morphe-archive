// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.accountcolors

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.baconreader.misc.settings.markPatchIncluded
import io.github.joancomasfdz.patches.baconreader.misc.settings.settingsPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/accountcolors/AccountColorsPatch;"

// BaconReader switches between several Reddit accounts from the menu, but every account looks the same once it is in
// use: only the menu's header names it.
@Suppress("unused")
val accountColorsPatch = bytecodePatch(
    name = "Account colors",
    description = "Lets you pick a color for each account in the menu, and shows the color of the account in use " +
        "as a line under the toolbars.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch, settingsPatch)

    execute {
        markPatchIncluded("accountColors")

        ApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->init(Landroid/app/Application;)V",
        )

        // The row's text, whose parent is the row; v0 is set first in the method, so it is free here.
        DrawerHolderUpdateViewFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, $DRAWER_HOLDER_DESCRIPTOR->textView:Landroid/widget/TextView;
                invoke-static { v0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->bindRow(Landroid/widget/TextView;$DRAWER_ITEM_DESCRIPTOR)V
            """,
        )

        // At the start, so the instructions other patches find around setItems stay where they are.
        DrawerHandlerUpdateDrawerFingerprint.method.addInstruction(
            0,
            "invoke-static { }, $EXTENSION_CLASS_DESCRIPTOR->onDrawerUpdated()V",
        )

        RemoveAccountClickFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                val removeIndex = fingerprint.instructionMatches[0].index
                val nameRegister = getInstruction<FiveRegisterInstruction>(removeIndex).registerD
                addInstruction(
                    removeIndex,
                    "invoke-static { v$nameRegister }, $EXTENSION_CLASS_DESCRIPTOR->onAccountRemoved(Ljava/lang/String;)V",
                )
            }
        }
    }
}
