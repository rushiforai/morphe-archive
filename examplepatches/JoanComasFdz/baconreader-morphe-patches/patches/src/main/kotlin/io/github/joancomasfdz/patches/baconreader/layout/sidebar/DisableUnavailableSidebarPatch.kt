// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.sidebar

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/sidebar/DisableUnavailableSidebarPatch;"

@Suppress("unused")
val disableUnavailableSidebarPatch = bytecodePatch(
    name = "Disable unavailable sidebar",
    description = "Disables \"View Sidebar\" on Front Page, All, Popular, Friends and multireddits, " +
        "which have no sidebar.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        MainActivityOnPrepareOptionsMenuFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, $MAIN_ACTIVITY_CLASS_DESCRIPTOR->linksetKey:Lcom/onelouder/baconreader/data/LinksetKey;
                invoke-static { p1, v0 }, $EXTENSION_CLASS_DESCRIPTOR->updateSidebarItem(Landroid/view/Menu;Ljava/lang/Object;)V
            """,
        )

        listOf(MainActivityOpenLinksetFingerprint, MainActivityOnFirstLinkFingerprint).forEach { fingerprint ->
            fingerprint.method.addInstruction(
                0,
                "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->refreshMenu(Landroid/app/Activity;)V",
            )
        }
    }
}
