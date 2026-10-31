// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.savemedia

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/savemedia/VideoAudioPatch;"

@Suppress("unused")
val saveVideosWithSoundPatch = bytecodePatch(
    name = "Save videos with sound",
    description = "Adds the sound to Reddit videos saved with \"Save to device\", which were saved without it.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // Reddit videos keep the sound in a separate file: the app saves only the picture (fallback_url).
        // After each download into the file (a first try, then a retry with the full url), add the audio track
        // when it succeeded. Not before the method's return: it is a branch target.
        DownloadIntoFolderFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                // The download calls and their move-result, from the last one so the indices do not move.
                listOf(2, 0).map { fingerprint.instructionMatches[it].index }.forEach { index ->
                    val file = getInstruction<FiveRegisterInstruction>(index).registerE
                    val result = getInstruction<OneRegisterInstruction>(index + 1).registerA
                    addInstruction(
                        index + 2,
                        "invoke-static { p0, v$result, v$file }, $EXTENSION_CLASS_DESCRIPTOR->" +
                            "onDownloaded(Landroid/content/Context;ZLjava/lang/Object;)V",
                    )
                }
            }
        }
    }
}
