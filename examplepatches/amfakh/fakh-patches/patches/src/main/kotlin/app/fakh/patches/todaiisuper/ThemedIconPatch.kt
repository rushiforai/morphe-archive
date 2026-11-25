/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaiisuper

import app.fakh.patches.shared.themedIconPatch
import app.fakh.patches.todaiisuper.shared.Constants.COMPATIBILITY_TODAII_SUPER

/** Todaii Super ships a bitmap launcher icon only (drawable/ic_app_icon), so the news card is lifted off the green tile into a foreground, plus a monochrome card with its text cut out. */
@Suppress("unused")
val todaiiSuperThemedIconPatch = themedIconPatch(
    COMPATIBILITY_TODAII_SUPER,
    folder = "todaiisuper",
    icons = listOf("res/drawable-anydpi-v26/ic_app_icon.xml"),
    bundled = listOf("background", "foreground", "monochrome"),
)
