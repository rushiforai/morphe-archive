/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaii

import app.fakh.patches.todaii.shared.Constants.COMPATIBILITY_TODAII
import app.fakh.patches.shared.themedIconPatch

/** Todaii ships bitmap launcher icons only, so the news card is lifted off the purple tile into a foreground, plus a monochrome card with its text cut out. */
@Suppress("unused")
val todaiiThemedIconPatch = themedIconPatch(
    COMPATIBILITY_TODAII,
    folder = "todaii",
    icons = listOf("res/mipmap-anydpi-v26/ic_launcher.xml", "res/mipmap-anydpi-v26/ic_launcher_round.xml"),
    bundled = listOf("background", "foreground", "monochrome"),
)
