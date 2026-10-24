/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.netanalyzer.misc.lan

import app.morphe.patcher.Fingerprint
import app.morphe.patches.netanalyzer.shared.composable

internal const val LAN_SCAN_SCREEN = "LanScanScreen"

internal object LanScanScreenFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(composable(LAN_SCAN_SCREEN)),
)
