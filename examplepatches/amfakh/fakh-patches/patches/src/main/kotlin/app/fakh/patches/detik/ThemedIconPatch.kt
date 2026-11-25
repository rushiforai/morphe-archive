/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.detik

import app.fakh.patches.detik.shared.Constants.COMPATIBILITY_DETIK
import app.fakh.patches.shared.themedIconPatch

/** detikcom ships a bitmap launcher icon only (drawable/ic_launcher), so the white d is lifted off the gradient circle into a foreground, plus a monochrome layer. */
@Suppress("unused")
val detikThemedIconPatch = themedIconPatch(
    COMPATIBILITY_DETIK,
    folder = "detik",
    icons = listOf("res/drawable-anydpi-v26/ic_launcher.xml"),
    bundled = listOf("background", "foreground", "monochrome"),
)
