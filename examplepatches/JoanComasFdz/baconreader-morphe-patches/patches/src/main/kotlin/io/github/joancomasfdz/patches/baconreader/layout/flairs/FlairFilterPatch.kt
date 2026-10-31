// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.flairs

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/flairs/FlairFilterPatch;"

@Suppress("unused")
val flairFilterPatch = bytecodePatch(
    name = "Flair filter",
    description = "Adds a \"Flair\" button to the sort bar of subreddits, to show only the posts with the chosen flairs.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // Show the control, with the flairs of the feed's query, whenever a feed is opened.
        OpenLinksetFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onOpenLinkset(Landroid/app/Activity;)V",
        )

        // Remember the flairs of the loaded posts: the list for subreddits whose flairs are not public.
        AddToLinksetFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->onListingLoaded(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}
