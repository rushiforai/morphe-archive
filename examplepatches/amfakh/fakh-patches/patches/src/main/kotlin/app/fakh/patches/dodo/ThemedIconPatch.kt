/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.dodo

import app.fakh.patches.dodo.shared.Constants.COMPATIBILITY_DODO
import app.fakh.patches.shared.themedIconPatch

/** DoDo Music has an adaptive icon without a monochrome layer, so the line art of the dog is bundled as one. */
@Suppress("unused")
val dodoThemedIconPatch = themedIconPatch(
    COMPATIBILITY_DODO,
    folder = "dodo",
    icons = listOf("res/mipmap-anydpi-v26/ic_launcher.xml", "res/mipmap-anydpi-v26/ic_launcher_round.xml"),
    background = "@color/ic_launcher_background",
    foreground = "@mipmap/ic_launcher_foreground",
)
