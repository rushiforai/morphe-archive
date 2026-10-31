// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.detailvideo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.baconreader.misc.settings.markPatchIncluded
import io.github.joancomasfdz.patches.baconreader.misc.settings.settingsPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/detailvideo/DetailVideoPatch;"

// BaconReader starts every video as soon as the detail view of a post shows it, on mobile data too,
// and has no setting to wait for a tap.
@Suppress("unused")
val videoAutoplayInDetailViewPatch = bytecodePatch(
    name = "Video autoplay in detail view",
    description = "Adds a setting to stop videos, such as v.redd.it videos, from loading and playing by " +
        "themselves in a post's detail view: the post shows its preview image, and a tap on it plays the video.",
) {
    dependsOn(sharedExtensionPatch, settingsPatch)

    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    execute {
        markPatchIncluded("videoAutoplayInDetailView")

        // displayVideo(context, url): when the setting is off in the detail view, the extension shows the
        // preview and the method returns. A tap calls the method again, which the extension lets through.
        DisplayVideoFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p0 .. p2 }, $EXTENSION_CLASS_DESCRIPTOR->deferVideo(Ljava/lang/Object;Landroid/content/Context;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :original
                    return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
