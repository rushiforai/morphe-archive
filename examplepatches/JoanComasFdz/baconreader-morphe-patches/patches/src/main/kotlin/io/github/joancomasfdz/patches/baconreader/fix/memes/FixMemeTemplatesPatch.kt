// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.memes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/memes/FixMemeTemplatesPatch;"

@Suppress("unused")
val fixMemeTemplatesPatch = bytecodePatch(
    name = "Fix meme templates",
    description = "Fixes the meme templates of the drawing screen not loading, with Imgflip's most used templates.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // The templates were on BaconReader's server, which answers 404 for all of them.
        // The grid now shows Imgflip's thumbnails.
        MemeImagesStaticInitializerFingerprint.let { fingerprint ->
            fingerprint.method.addInstructions(
                fingerprint.instructionMatches.first().index,
                """
                    invoke-static { }, $EXTENSION_CLASS_DESCRIPTOR->getTemplateUrls()[Ljava/lang/String;
                    move-result-object v0
                    sput-object v0, Lcom/handmark/drawchat/bitmapfun/provider/Images;->imageUrls:[Ljava/lang/String;
                """,
            )
        }

        // The app saves the grid's thumbnail as the background. Download the full template instead.
        // The method has a single local register (v0), so the item goes in p4, the unused id (a long, p4 and p5),
        // which the app overwrites before reading it.
        MemeGridItemClickFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual { p0 }, Lcom/handmark/drawchat/bitmapfun/ui/ImageGridFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;
                    move-result-object v0
                    invoke-virtual { p1, p3 }, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;
                    move-result-object p4
                    invoke-static { v0, p4 }, $EXTENSION_CLASS_DESCRIPTOR->onTemplateClick(Landroid/app/Activity;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :app_handles_click
                    return-void
                """,
                ExternalLabel("app_handles_click", getInstruction(0)),
            )
        }
    }
}
