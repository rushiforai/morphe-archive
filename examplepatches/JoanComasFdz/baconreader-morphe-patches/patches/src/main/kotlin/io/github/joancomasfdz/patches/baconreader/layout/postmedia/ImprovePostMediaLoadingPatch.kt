// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.postmedia

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.baconreader.misc.settings.markPatchIncluded
import io.github.joancomasfdz.patches.baconreader.misc.settings.settingsPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/postmedia/PostMediaPatch;"
private const val GALLERY_EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/postmedia/RedditGalleryPatch;"

/** The OkHttp callback of PostMediaHandler.loadGifContent, used when Glide could not load the image. */
private const val GIF_FALLBACK_CALLBACK_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/PostMediaHandler\$4\$1;"

/** Its lambdas run when the response is not successful (4), no bitmap could be made (2), or rendering threw (3). */
private val GIF_FALLBACK_FAILURES = listOf(2, 3, 4)

@Suppress("unused")
val improvePostMediaLoadingPatch = bytecodePatch(
    name = "Improve post media loading",
    description = "Shows a still preview with a progress bar and the downloaded size while post media " +
        "and gallery images load, uses small previews for the thumbnails of galleries, " +
        "shows a message instead of a broken page when a RedGIFs video was deleted, " +
        "and adds options for which link post pages run JavaScript.",
) {
    dependsOn(sharedExtensionPatch, settingsPatch)

    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    execute {
        markPatchIncluded("improvePostMediaLoading")

        // Images and GIFs: when Glide fails, the app downloads the file with OkHttp. If that fails too, it only
        // logs it and keeps the loading page: show the loading bar as failed.
        mutableClassDefBy(GIF_FALLBACK_CALLBACK_CLASS_DESCRIPTOR).methods.filter { method ->
            method.name == "onFailure" || GIF_FALLBACK_FAILURES.any { method.name.startsWith("lambda\$onResponse\$$it\$") }
        }.also {
            if (it.size != GIF_FALLBACK_FAILURES.size + 1) {
                throw PatchException("Expected ${GIF_FALLBACK_FAILURES.size + 1} failure methods, found ${it.size}")
            }
        }.forEach { method ->
            method.addInstruction(
                0,
                "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onImageLoadFailed(Ljava/lang/Object;)V",
            )
        }

        // Loading overlay (still preview, size, progress), before the app resolves the media.
        PostMediaHandlerStartFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onStart(Ljava/lang/Object;)V",
        )

        // GIFs: use the app's cache loader, which reports the download progress, instead of Glide.
        LoadGifContentFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->loadGifWithProgress(Ljava/lang/Object;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :original
                    return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // Download progress of the cache loader.
        OnReceivedDataFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p1, p2 }, $EXTENSION_CLASS_DESCRIPTOR->onProgress(Ljava/lang/Object;II)V",
        )

        // Galleries: the thumbnail strip loads the full images instead of the previews (see the extension).
        // Use a preview big enough for the strip, the preview itself as thumbnail, and download the image
        // shown with a progress bar.
        GetGalleryImagesFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                val getIndex = fingerprint.instructionMatches[1].index
                val get = getInstruction<FiveRegisterInstruction>(getIndex)
                addInstructions(
                    getIndex,
                    """
                        invoke-static { v${get.registerC} }, $GALLERY_EXTENSION_CLASS_DESCRIPTOR->previewIndex(Ljava/util/List;)I
                        move-result v${get.registerD}
                    """,
                )
            }
        }

        RedditImageThumbnailFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, $GALLERY_EXTENSION_CLASS_DESCRIPTOR->thumbnail(Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :original
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        GalleryGlideFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $GALLERY_EXTENSION_CLASS_DESCRIPTOR->loadImage(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :original
                    return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // When the RedGIFs API answers with an error, the app shows RedGIFs' web page instead, which needs
        // JavaScript. Remember the error, so a deleted or missing video shows a message instead.
        RedgifsResponseFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                val messageIndex = fingerprint.instructionMatches.first().index
                val responseRegister = getInstruction<FiveRegisterInstruction>(messageIndex).registerC
                addInstruction(
                    messageIndex,
                    "invoke-static { v$responseRegister }, $EXTENSION_CLASS_DESCRIPTOR->onRedgifsError(Ljava/lang/Object;)V",
                )
            }
        }

        RedgifsCancelFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_CLASS_DESCRIPTOR->redgifsErrorMessage()Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :original
                    iget-object v1, p0, Lcom/onelouder/baconreader/imageutils/ImageHelper${'$'}4;->val${'$'}listener:Lcom/onelouder/baconreader/imageutils/ImageHelper${'$'}ImageHelperListener;
                    invoke-virtual { v1, v0 }, Lcom/onelouder/baconreader/imageutils/ImageHelper${'$'}ImageHelperListener;->onCancel(Ljava/lang/String;)V
                    return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // The web view of link posts runs JavaScript only for a list of sites from before most of today's web
        // needed it (several of them shut down), so many pages show nothing. The settings decide instead.
        EnableJavascriptFingerprint.let { fingerprint ->
            fingerprint.method.apply {
                // Right after the app sets its default (the setting of its own browser); its list is skipped.
                val defaultIndex = fingerprint.instructionMatches.first().index
                addInstructionsWithLabels(
                    defaultIndex + 1,
                    """
                        move-object/from16 v1, p1
                        invoke-static { v1 }, $EXTENSION_CLASS_DESCRIPTOR->needsJavascript(Ljava/lang/String;)Z
                        move-result v1
                        if-eqz v1, :done
                        move-object/from16 v1, p0
                        iget-object v1, v1, Lcom/onelouder/baconreader/BrowserBase;->webView:Lcom/onelouder/baconreader/PSWebView;
                        invoke-virtual { v1 }, Lcom/onelouder/baconreader/PSWebView;->getSettings()Landroid/webkit/WebSettings;
                        move-result-object v1
                        const/4 v2, 0x1
                        invoke-virtual { v1, v2 }, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V
                        :done
                        return-void
                    """,
                )
            }
        }
    }
}
