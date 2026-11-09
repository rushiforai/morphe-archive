// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.selecttext

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/selecttext/SelectTextPatch;"

/**
 * The item of the post menu, and the dialog's text, made in code: these ids, added to the app's ids, name them. The
 * extension finds them by name, and the e2e tests the text.
 */
private val selectTextIdsResourcePatch = resourcePatch {
    execute {
        document("res/values/ids.xml").use { ids ->
            val resources = ids.getElementsByTagName("resources").item(0)
            listOf(
                "baconreader_patches_select_text",
                "baconreader_patches_selected_text",
            ).forEach { name ->
                resources.appendChild(
                    ids.createElement("item").apply {
                        setAttribute("type", "id")
                        setAttribute("name", name)
                    },
                )
            }
        }
    }
}

// BaconReader can't select a part of a post or comment: their text views take a tap and a long press for the list
// (showing the action bar), and "Copy" copies the whole text as markdown. A dialog shows the text as the app draws
// it, where it can be selected.
@Suppress("unused")
val selectTextPatch = bytecodePatch(
    name = "Select text",
    description = "Adds \"Select text\" to the menus of posts and comments, which shows their text in a dialog " +
        "where any part of it can be selected and copied.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch, selectTextIdsResourcePatch)

    execute {
        // Right after the action bar of a comment keeps its "Copy" button. v4 and v6 are written before they're read
        // again, in the next button's setup.
        PostControlBarUpdateButtonsFingerprint.let { fingerprint ->
            fingerprint.method.addInstructions(
                fingerprint.instructionMatches[0].index + 1,
                """
                    iget-object v4, p0, Lcom/onelouder/baconreader/controlbar/ControlBar;->activity:Landroid/app/Activity;
                    iget-object v6, p0, $POST_CONTROL_BAR_CLASS_DESCRIPTOR->post:Lcom/onelouder/baconreader/reddit/ThingData;
                    invoke-static { p0, v4, v6 }, $EXTENSION_CLASS_DESCRIPTOR->addButton(Lcom/onelouder/baconreader/controlbar/ControlBar;Landroid/app/Activity;Lcom/onelouder/baconreader/reddit/ThingData;)V
                """,
            )
        }

        // Right after the post bar sets up its ⋮ menu. v0 is written again before it's read.
        ControlbarBaseDrawBarFingerprint.let { fingerprint ->
            fingerprint.method.addInstructions(
                fingerprint.instructionMatches[0].index + 1,
                """
                    iget-object v0, p0, $CONTROLBAR_BASE_CLASS_DESCRIPTOR->morePopup:Landroidx/appcompat/widget/PopupMenu;
                    invoke-static { v0 }, $EXTENSION_CLASS_DESCRIPTOR->addMenuItem(Ljava/lang/Object;)V
                """,
            )
        }

        ControlbarBaseOnActionFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, $CONTROLBAR_BASE_CLASS_DESCRIPTOR->activity:Landroid/app/Activity;
                    iget-object v1, p0, $CONTROLBAR_BASE_CLASS_DESCRIPTOR->link:Lcom/onelouder/baconreader/reddit/Link;
                    invoke-static { p1, v0, v1 }, $EXTENSION_CLASS_DESCRIPTOR->onPostAction(ILandroid/app/Activity;Lcom/onelouder/baconreader/reddit/Link;)Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
