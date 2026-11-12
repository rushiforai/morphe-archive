// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.albums

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.Opcode
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/albums/SwipeThroughAlbumsPatch;"

// BaconReader's album viewers go to the next and previous image only with the small arrows at the screen's sides and
// the thumbnail strip: a swipe on the image does nothing. The extension makes a horizontal swipe tap the arrow on its
// side.
@Suppress("unused")
val swipeThroughAlbumsPatch = bytecodePatch(
    name = "Swipe through albums",
    description = "Goes to the next or previous image of a Reddit gallery or an Imgur album with a swipe left or right.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // Once the viewer has its views.
        listOf(RedditGalleryViewerCreateViewFingerprint, ImgurGalleryViewerCreateViewFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                addInstruction(
                    indexOfFirstInstructionReversedOrThrow(Opcode.RETURN_VOID),
                    "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->attach(Ljava/lang/Object;)V",
                )
            }
        }
    }
}
