/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.truecaller.patches.shared

import app.morphe.patcher.patch.*

/**
 * Truecaller ships as an app bundle (arm64 + armv7 only, no x86_64), so compatibility is APKM. The two newest stable
 * releases are supported; the hooks find Truecaller's obfuscated classes by what they do, not by name, so a newer
 * release is offered as experimental.
 */
object Constants {
    const val PACKAGE = "com.truecaller"

    val COMPATIBILITY_TRUECALLER = Compatibility(
        name = "Truecaller",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0B6EFD,
        targets = listOf(
            AppTarget(version = "26.43.5"),
            AppTarget(version = "26.44.6"),
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
