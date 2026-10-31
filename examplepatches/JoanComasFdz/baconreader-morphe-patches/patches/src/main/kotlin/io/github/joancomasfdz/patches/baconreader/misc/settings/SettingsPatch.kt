// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch

private const val ACTIVITY_HOOK_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/settings/BaconReaderActivityHook;"
private const val DRAWER_FOOTER_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/settings/DrawerVersionFooter;"

/**
 * Adds a "Patches" entry at the end of BaconReader's settings menu, with the settings of the other patches,
 * and shows the version of the patches at the bottom of the drawer.
 * Patches with settings depend on it and call [markPatchIncluded].
 */
internal val settingsPatch = bytecodePatch(
    description = "Adds the settings of the patches to BaconReader.",
) {
    dependsOn(sharedExtensionPatch)

    execute {
        // The settings are shown in GoogleApiActivity, as adding an activity fails for root installations.
        // The activity keeps its own behavior unless it is opened for the settings.
        GoogleApiActivityOnCreateFingerprint.let { fingerprint ->
            val superclass = fingerprint.classDef.superclass
            fingerprint.method.addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, $ACTIVITY_HOOK_CLASS_DESCRIPTOR->isSettingsIntent(Landroid/app/Activity;)Z
                    move-result v0
                    if-eqz v0, :original
                    invoke-super { p0, p1 }, $superclass->onCreate(Landroid/os/Bundle;)V
                    invoke-static { p0 }, $ACTIVITY_HOOK_CLASS_DESCRIPTOR->initialize(Landroid/app/Activity;)V
                    return-void
                """,
                ExternalLabel("original", fingerprint.method.getInstruction(0)),
            )
        }

        // The settings menu shows the titles of the app's sections. Add the entry of the patches to them.
        SettingsMenuInitAdapterFingerprint.let { fingerprint ->
            val sectionTitlesIndex = fingerprint.instructionMatches.first().index
            val register = fingerprint.method.getInstruction<OneRegisterInstruction>(sectionTitlesIndex).registerA

            fingerprint.method.addInstructions(
                sectionTitlesIndex + 1,
                """
                    invoke-static { v$register }, $ACTIVITY_HOOK_CLASS_DESCRIPTOR->addSettingsMenuEntry([Ljava/lang/String;)[Ljava/lang/String;
                    move-result-object v$register
                """,
            )
        }

        // Clicking the entry of the patches opens their settings instead of a section of the app.
        SettingsActivityOpenFragmentFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $ACTIVITY_HOOK_CLASS_DESCRIPTOR->handleSettingsMenuClick(Landroid/app/Activity;I)Z
                move-result v0
                if-eqz v0, :original
                return-void
            """,
            ExternalLabel("original", SettingsActivityOpenFragmentFingerprint.method.getInstruction(0)),
        )

        // The version of the patches at the bottom of the drawer, as in baconreader-reseam-patches.
        // p0 is above v15 in this method, so the call needs the range form.
        DrawerHandlerUpdateDrawerFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $DRAWER_FOOTER_CLASS_DESCRIPTOR->addVersionFooter(Ljava/lang/Object;)V",
        )
    }
}
