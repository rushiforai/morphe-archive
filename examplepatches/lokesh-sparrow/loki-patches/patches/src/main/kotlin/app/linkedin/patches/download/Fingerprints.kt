/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.download

import app.morphe.patcher.Fingerprint

private const val MEDIA_VIEWER = "Lcom/linkedin/android/media/pages/mediaviewer"

/** `onBind(ViewData, ViewDataBinding)` of the full screen viewers. None of these classes are obfuscated. */
private fun viewerPresenter(className: String) = Fingerprint(
    definingClass = "$MEDIA_VIEWER/$className;",
    name = "onBind",
    returnType = "V",
    parameters = listOf(
        "Lcom/linkedin/android/architecture/viewdata/ViewData;",
        "Landroidx/databinding/ViewDataBinding;",
    ),
)

internal val mediaViewerOnBindFingerprints = listOf(
    // A single photo.
    viewerPresenter("MediaViewerImagePresenter"),
    // One page of a carousel.
    viewerPresenter("MultiPhotoImagePresenter"),
    // A video.
    viewerPresenter("MediaViewerVideoPresenter"),
)
