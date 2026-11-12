// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.albums

import app.morphe.patcher.Fingerprint

/** A Reddit gallery's viewer sets up its views: its image, its arrows and its thumbnail strip. */
internal object RedditGalleryViewerCreateViewFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/reddit_gallery/RedditGalleryViewer;",
    name = "createView",
    returnType = "V",
    parameters = listOf("Landroid/widget/LinearLayout;"),
)

/** An Imgur album's viewer sets up its views: its image, its video, its arrows and its thumbnail strip. */
internal object ImgurGalleryViewerCreateViewFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/imgur_gallery/ImgurGalleryViewer;",
    name = "createView",
    returnType = "V",
    parameters = listOf("Landroid/widget/LinearLayout;"),
)
