/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.splitwise.patches.shared

import app.morphe.patcher.patch.*

/**
 * Splitwise ships as one APK, not a bundle, so the compatibility is declared as APK. 26.11.1 is the build the
 * fingerprints were read from; anything else is offered as experimental.
 */
object Constants {
    const val PACKAGE = "com.Splitwise.SplitwiseMobile"

    val COMPATIBILITY_SPLITWISE = Compatibility(
        name = "Splitwise",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2F7D5B,
        targets = listOf(AppTarget(version = "26.11.1"), AppTarget(version = null, isExperimental = true)),
    )
}
