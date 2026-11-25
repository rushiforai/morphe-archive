/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.cnn

import app.fakh.patches.cnn.shared.Constants.COMPATIBILITY_CNN
import app.fakh.patches.shared.themedIconPatch

/** CNN Indonesia ships a bitmap launcher icon only, so the logo is lifted off the red square into a foreground over a solid red background, plus a monochrome layer. */
@Suppress("unused")
val cnnThemedIconPatch = themedIconPatch(
    COMPATIBILITY_CNN,
    folder = "cnn",
    icons = listOf("res/mipmap-anydpi-v26/ic_launcher.xml"),
    bundled = listOf("foreground", "monochrome"),
    background = "#CD0707",
)
