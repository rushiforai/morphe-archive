/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.kompas

import app.fakh.patches.kompas.shared.Constants.COMPATIBILITY_KOMPAS
import app.fakh.patches.shared.themedIconPatch

/** Kompas ships a bitmap launcher icon only, so the logo is lifted off the black tile into a foreground, plus a monochrome layer with the K cut out. */
@Suppress("unused")
val kompasThemedIconPatch = themedIconPatch(
    COMPATIBILITY_KOMPAS,
    folder = "kompas",
    icons = listOf("res/mipmap-anydpi-v26/ic_launcher_bgblack_new.xml"),
    bundled = listOf("foreground", "monochrome"),
    background = "#000000",
)
