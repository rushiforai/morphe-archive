// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.imgur

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/imgur/FixImgurApiPatch;"

@Suppress("unused")
val fixImgurApiPatch = bytecodePatch(
    name = "Fix Imgur API",
    description = "Fixes Imgur albums and galleries not loading, and image uploads in comments and posts failing.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // The app calls Imgur's API through a RapidAPI proxy whose subscription ended (403 for every request).
        // Imgur's own API accepts the same requests and client ID.
        GetImgurBaseUrlFingerprint.method.replaceInstructions(
            0,
            """
                const-string v0, "https://api.imgur.com/3/"
                return-object v0
            """,
        )

        // Imgur's own API rejects the upload without a content type.
        ImgurUploadFingerprint.method.apply {
            val authorizationIndex = ImgurUploadFingerprint.instructionMatches[0].index
            val connectionRegister = getInstruction<FiveRegisterInstruction>(authorizationIndex).registerD
            addInstruction(
                authorizationIndex + 1,
                "invoke-static { v$connectionRegister }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->setUploadContentType(Ljava/net/HttpURLConnection;)V",
            )
        }
    }
}
