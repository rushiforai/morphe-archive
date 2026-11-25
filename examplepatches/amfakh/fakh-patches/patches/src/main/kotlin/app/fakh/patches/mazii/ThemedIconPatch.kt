/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.mazii

import app.fakh.patches.mazii.shared.Constants.COMPATIBILITY_MAZII
import app.fakh.patches.shared.themedIconPatch

/** Mazii has an adaptive icon without a monochrome layer, so the white wordmark is bundled as one. */
@Suppress("unused")
val maziiThemedIconPatch = themedIconPatch(
    COMPATIBILITY_MAZII,
    folder = "mazii",
    icons = listOf("res/mipmap-anydpi/ic_launcher.xml", "res/mipmap-anydpi/ic_launcher_round.xml"),
    background = "@color/ic_launcher_new_background",
    foreground = "@mipmap/ic_launcher_foreground",
)
