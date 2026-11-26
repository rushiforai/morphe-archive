/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tasker.patches.shared

import app.morphe.patcher.patch.*

/**
 * Tasker ships as a single APK built for arm64 and armv7. 6.7.8 is the Play build this was read from.
 *
 * The licence model is Google LVL (com.google.android.vending.licensing), wrapped by the app into a
 * three-value enum: Licensed, Unlicensed, Retry. Every feature gate is a comparison against Licensed.
 */
object Constants {
    const val PACKAGE = "net.dinglisch.android.taskerm"

    /** The app's own package prefix. A build whose package name does not start with it counts as licensed. */
    const val PACKAGE_PREFIX = "net.dinglisch.android.tasker"

    val COMPATIBILITY_TASKER = Compatibility(
        name = "Tasker",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4CAF50,
        targets = listOf(AppTarget(version = "6.7.8")),
    )
}
