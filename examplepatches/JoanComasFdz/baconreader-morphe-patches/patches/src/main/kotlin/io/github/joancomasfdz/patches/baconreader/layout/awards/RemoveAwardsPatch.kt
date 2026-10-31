// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.awards

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/awards/RemoveAwardsPatch;"

@Suppress("unused")
val removeAwardsPatch = bytecodePatch(
    name = "Remove awards",
    description = "Removes the award icons, \"Give Award\" and \"View Award Details\". " +
        "Reddit's API no longer reports awards, and giving them used Reddit's discontinued coins.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // Comment and post action bars: the award buttons are created outside the bar.
        ControlBarSetButtonFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->isAwardAction(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :add_button
                new-instance v0, Landroid/widget/LinearLayout;
                iget-object v1, p0, $CONTROL_BAR_CLASS_DESCRIPTOR->activity:Landroid/app/Activity;
                invoke-direct { v0, v1 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
                new-instance v1, $CONTROL_BAR_BUTTON_CLASS_DESCRIPTOR
                invoke-direct { v1, v0 }, $CONTROL_BAR_BUTTON_CLASS_DESCRIPTOR-><init>(Landroid/view/ViewGroup;)V
                invoke-virtual { v1, p1 }, $CONTROL_BAR_BUTTON_CLASS_DESCRIPTOR->setText(Ljava/lang/String;)$CONTROL_BAR_BUTTON_CLASS_DESCRIPTOR
                return-object v1
                :add_button
                nop
            """,
        )

        // The ⋮ menu of posts.
        ControlbarBaseOnClickFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                val showIndex = fingerprint.instructionMatches[0].index
                val popupRegister = getInstruction<FiveRegisterInstruction>(showIndex).registerC
                addInstruction(
                    showIndex,
                    "invoke-static { v$popupRegister }, $EXTENSION_CLASS_DESCRIPTOR->hideAwardMenuItems(Ljava/lang/Object;)V",
                )
            }
        }

        // Award icons of posts and comments, in lists and on the post screen.
        listOf(HideAwardIconsFingerprint, HideAwardIconsOnDetailViewFingerprint).forEach { fingerprint ->
            fingerprint.method.replaceInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // The two "Hide Reddit Awards" settings no longer do anything: don't add them to the settings lists.
        SettingsAdapterInitSettingsFingerprint.let { fingerprint ->
            // list.add(setting): its result is not used.
            listOf(1, 3).forEach { filter ->
                fingerprint.method.replaceInstruction(fingerprint.instructionMatches[filter].index, "nop")
            }
        }
    }
}
