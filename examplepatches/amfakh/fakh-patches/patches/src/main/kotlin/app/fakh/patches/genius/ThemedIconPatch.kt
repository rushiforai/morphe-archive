/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.genius

import app.fakh.patches.genius.shared.Constants.COMPATIBILITY_GENIUS
import app.fakh.patches.shared.themedIconPatch

/** Genius has an adaptive icon without a monochrome layer, and its foreground is a single-color vector that tints as it is. */
@Suppress("unused")
val geniusThemedIconPatch = themedIconPatch(
    COMPATIBILITY_GENIUS,
    folder = "genius",
    icons = listOf("res/mipmap-anydpi/ic_launcher_genius.xml", "res/mipmap-anydpi/ic_launcher_genius_round.xml"),
    bundled = emptyList(),
    background = "@color/ic_launcher_background",
    foreground = "@drawable/ic_launcher_foreground_genius",
    monochrome = "@drawable/ic_launcher_foreground_genius",
)
