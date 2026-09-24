/*
 * Copyright 2026
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.patches.pixelcamera.gallery

/**
 * Smali descriptor of the injected helper, shared by both gallery patches.
 *
 * Merged into the app by [useThirdPartyGalleryPatch] via
 * `extendWith("extensions/pixelcamera.mpe")`. The lock-screen patch depends on
 * that patch and therefore always finds the class already present.
 */
internal const val EXTENSION_CLASS =
    "Lapp/morphe/extension/pixelcamera/gallery/GalleryRedirect;"

/** Name of the compile-time switch the lock-screen patch flips. */
internal const val SECURE_SWITCH_METHOD = "redirectSecureReview"
