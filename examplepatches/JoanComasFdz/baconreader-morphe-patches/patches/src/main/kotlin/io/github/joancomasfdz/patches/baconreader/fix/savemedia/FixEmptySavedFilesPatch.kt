// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.savemedia

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/savemedia/FixEmptySavedFilesPatch;"

@Suppress("unused")
val fixEmptySavedFilesPatch = bytecodePatch(
    name = "Fix empty saved files",
    description = "Fixes saving media to the device also creating an empty file.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // The app creates "<title>.jpg" first, then downloads to "<title>.<extension of the URL>".
        // Before each download, remove the first file if it is another, empty file.
        DownloadToFileFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p2 }, $EXTENSION_CLASS_DESCRIPTOR->onDownloadTarget(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}
