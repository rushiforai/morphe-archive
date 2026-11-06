// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.embedcommentimages

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
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
 * apart from an image's, the full-screen viewer, an Imgur album and its "1 / 3" counter, and the copies of a text that
 * show what follows each of its media links, so the e2e tests find them.
 * The extension finds them by name.
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
                "baconreader_patches_comment_album",
                "baconreader_patches_album_counter",
                "baconreader_patches_text_after_media",
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

        /** Calls the extension's [extensionMethod] right after the matched TextView.setText. */
        fun Fingerprint.embedAfterSetText(extensionMethod: String = "embed") = method.apply {
            val index = instructionMatches[0].index
            val textViewRegister = getInstruction<FiveRegisterInstruction>(index).registerC
            addInstruction(
                index + 1,
                "invoke-static { v$textViewRegister }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->$extensionMethod(Landroid/widget/TextView;)V",
            )
        }

        // The comment's markdown, to find the real emote images (p1 is the Comment). A comment's text is cut at
        // its bare media links, which its media replace.
        CommentHolderUpdateViewFingerprint.embedAfterSetText("embedComment").addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->setCommentSource(Ljava/lang/Object;)V",
        )

        // The copies of the comment body that show the text after a media link get its touch listener too.
        CommentHolderConstructorFingerprint.method.apply {
            val setTouchListenerIndex = CommentHolderConstructorFingerprint.instructionMatches[1].index
            val setTouchListener = getInstruction<FiveRegisterInstruction>(setTouchListenerIndex)
            addInstruction(
                setTouchListenerIndex + 1,
                "invoke-static { v${setTouchListener.registerC}, v${setTouchListener.registerD} }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->rememberTouch(Landroid/view/View;Landroid/view/View\$OnTouchListener;)V",
            )
        }

        // A post's text is cut at its bare media links, which its media replace, and its images start at full
        // width.
        DetailLinkFragmentUpdateSelftextFingerprint.embedAfterSetText("embedPostText")
        // Card mode shows the post text in a list whose rows are a TextView alone, so each row is put in a
        // column where its images go under the text. The column goes in after the call above, which finds
        // setText by its index in the unchanged method.
        SelftextAdapterGetViewFingerprint.embedAfterSetText("embedPostText").apply {
            val inflateIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL && getReference<MethodReference>()?.let {
                    it.definingClass == "Landroid/view/LayoutInflater;" && it.name == "inflate"
                } == true
            }
            val rowRegister = getInstruction<OneRegisterInstruction>(inflateIndex + 1).registerA
            addInstructions(
                inflateIndex + 2,
                """
                    invoke-static { v$rowRegister }, $EXTENSION_CLASS_DESCRIPTOR->columnFor(Landroid/view/View;)Landroid/view/View;
                    move-result-object v$rowRegister
                """,
            )
        }
        // Image, GIF and video posts show their text under the media.
        PostMediaHandlerConstructorFingerprint.embedAfterSetText()
    }
}

