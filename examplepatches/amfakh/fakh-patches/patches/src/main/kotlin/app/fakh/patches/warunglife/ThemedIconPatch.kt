/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.warunglife

import app.fakh.patches.warunglife.shared.Constants.COMPATIBILITY_WARUNGLIFE
import app.fakh.patches.shared.themedIconPatch

/** Warung Life has an adaptive icon without a monochrome layer, so its logo silhouette is bundled as one. */
@Suppress("unused")
val warungLifeThemedIconPatch = themedIconPatch(
    COMPATIBILITY_WARUNGLIFE,
    folder = "warunglife",
    icons = listOf("res/mipmap-anydpi-v26/icon.xml"),
    background = "@mipmap/icon_background",
    foreground = "@mipmap/icon_foreground",
)
