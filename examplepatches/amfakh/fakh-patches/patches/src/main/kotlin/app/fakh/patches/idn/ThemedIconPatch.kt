/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.fakh.patches.shared.themedIconPatch

/** IDN Times has an adaptive icon without a monochrome layer, so the white IDN is bundled as one. */
@Suppress("unused")
val idnThemedIconPatch = themedIconPatch(
    COMPATIBILITY_IDN,
    folder = "idn",
    icons = listOf("res/mipmap-anydpi/ic_launcher.xml"),
    background = "@color/ic_launcher_background",
    foreground = "@mipmap/ic_launcher_foreground",
)
