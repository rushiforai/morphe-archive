/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaiigerman

import app.fakh.patches.todaiigerman.shared.Constants.COMPATIBILITY_TODAII_GERMAN
import app.fakh.patches.shared.themedIconPatch

/** Todaii German ships bitmap launcher icons only. Its card is the Japanese edition with the German flag, without the anniversary emblem of the shipped bitmap. */
@Suppress("unused")
val todaiiGermanThemedIconPatch = themedIconPatch(
    COMPATIBILITY_TODAII_GERMAN,
    folder = "todaiigerman",
    icons = listOf("res/mipmap-anydpi-v26/ic_launcher.xml", "res/mipmap-anydpi-v26/ic_launcher_round.xml"),
    bundled = listOf("background", "foreground", "monochrome"),
)
