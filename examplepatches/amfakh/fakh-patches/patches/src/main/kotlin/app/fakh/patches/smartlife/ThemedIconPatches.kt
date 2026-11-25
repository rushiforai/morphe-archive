/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.smartlife

import app.fakh.patches.shared.themedIconPatch
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_BARDI
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_KRISBOW
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_TUYA_SMART

/** Smart Life has an adaptive icon without a monochrome layer, and its foreground is a white house on transparent, which tints as it is. */
@Suppress("unused")
val smartLifeThemedIconPatch = themedIconPatch(
    COMPATIBILITY_SMARTLIFE,
    folder = "smartlife",
    icons = listOf("res/mipmap-anydpi-v26/ic_launcher.xml"),
    bundled = emptyList(),
    background = "@drawable/android8backgroundicon",
    foreground = "@drawable/android8foregroundicon",
    monochrome = "@drawable/android8foregroundicon",
)

/** Tuya Smart has an adaptive icon without a monochrome layer, so the white t is bundled as one. */
@Suppress("unused")
val tuyaSmartThemedIconPatch = themedIconPatch(
    COMPATIBILITY_TUYA_SMART,
    folder = "tuya",
    icons = listOf("res/mipmap-anydpi-v26/ic_launcher.xml"),
    background = "@drawable/ic_thing_launcher_back",
    foreground = "@drawable/ic_thing_launcher_fore",
)

/** BARDI ships a bitmap launcher icon only, so the wordmark is lifted off the teal tile into a foreground, plus a monochrome layer. */
@Suppress("unused")
val bardiThemedIconPatch = themedIconPatch(
    COMPATIBILITY_BARDI,
    folder = "bardi",
    icons = listOf("res/mipmap-anydpi-v26/a007595.xml"),
    bundled = listOf("foreground", "monochrome"),
    background = "#42BBC4",
)

/** SYNC by Krisbow ships a bitmap launcher icon only, so the logo is lifted off the gradient tile into a foreground, plus a monochrome layer. */
@Suppress("unused")
val krisbowThemedIconPatch = themedIconPatch(
    COMPATIBILITY_KRISBOW,
    folder = "krisbow",
    icons = listOf("res/mipmap-anydpi-v26/a504742.xml"),
    bundled = listOf("background", "foreground", "monochrome"),
)
