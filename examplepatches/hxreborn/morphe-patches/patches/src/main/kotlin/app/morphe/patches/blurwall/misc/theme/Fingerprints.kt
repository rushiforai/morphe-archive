/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.blurwall.misc.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal

internal const val DARK_BACKGROUND_COLOR = 0xFF111318L

internal object ColorPaletteFingerprint : Fingerprint(
    name = "<clinit>",
    filters = listOf(literal(DARK_BACKGROUND_COLOR)),
)
