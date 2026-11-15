/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.truecaller.patches.shared

import app.morphe.patcher.patch.*

/**
 * Truecaller ships as an app bundle (arm64 + armv7 only, no x86_64), so compatibility is APKM. 26.43.5 is the
 * build every fingerprint here was read from; Truecaller's own classes are obfuscated and change with each
 * release, so anything else is offered as experimental only.
 */
object Constants {
    const val PACKAGE = "com.truecaller"

    val COMPATIBILITY_TRUECALLER = Compatibility(
        name = "Truecaller",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0B6EFD,
        targets = listOf(AppTarget(version = "26.43.5"), AppTarget(version = null, isExperimental = true)),
    )
}
