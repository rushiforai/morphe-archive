// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.embedcommentimages

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.fix.imgur.fixImgurApiPatch
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.baconreader.misc.settings.markPatchIncluded
import io.github.joancomasfdz.patches.baconreader.misc.settings.settingsPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR =
    "$EXTENSION_PACKAGE/embedcommentimages/EmbedCommentImagesPatch;"

/**
 * The views the images and videos are shown in are made in code: these ids, added to the app's ids, name them, a GIF's
 * apart from an image's, and the full-screen viewer, so the e2e tests find them. The extension finds them by name.
 */
private val commentImageIdsResourcePatch = resourcePatch {
    execute {
        document("res/values/ids.xml").use { ids ->
            val resources = ids.getElementsByTagName("resources").item(0)
            listOf(
                "baconreader_patches_comment_image",
                "baconreader_patches_comment_gif",
                "baconreader_patches_comment_video",
                "baconreader_patches_image_viewer",
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

@Suppress("unused")
val embedCommentImagesPatch = bytecodePatch(
    name = "Embed comment images",
    description = "Adds options to show GIFs, image links, Imgur albums and emotes in comments and posts as images, " +
        "play videos uploaded in comments and video links, show bare YouTube links with the video title and thumbnail, " +
        "and show bare X and Bluesky links as the post.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch, settingsPatch, fixImgurApiPatch, commentImageIdsResourcePatch)

    execute {
        markPatchIncluded("embedCommentImages")

        // While images are shown, stop the app from replacing the <img> tag with a "GIF" link.
        HandleGifLinkInCommentFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_CLASS_DESCRIPTOR->skipGifLink()Z
                    move-result v0
                    if-eqz v0, :original
                    return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        /** Calls the extension right after the matched TextView.setText. */
        fun Fingerprint.embedAfterSetText() = method.apply {
            val index = instructionMatches[0].index
            val textViewRegister = getInstruction<FiveRegisterInstruction>(index).registerC
            addInstruction(
                index + 1,
                "invoke-static { v$textViewRegister }, $EXTENSION_CLASS_DESCRIPTOR->embed(Landroid/widget/TextView;)V",
            )
        }

        // The comment's markdown, to find the real emote images (p1 is the Comment).
        CommentHolderUpdateViewFingerprint.embedAfterSetText().addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->setCommentSource(Ljava/lang/Object;)V",
        )

        DetailLinkFragmentUpdateSelftextFingerprint.embedAfterSetText()
        // Card mode shows the post text in a list, one TextView per row: YouTube titles and thumbnails are
        // drawn in the text, but there is no room for images under it, so they stay links.
        SelftextAdapterGetViewFingerprint.embedAfterSetText()
        // Image, GIF and video posts show their text under the media.
        PostMediaHandlerConstructorFingerprint.embedAfterSetText()
    }
}

