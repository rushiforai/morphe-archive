/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.trackchecker.patches.shared

import app.morphe.patcher.patch.*

/**
 * TrackChecker Mobile ships as one APK for arm64, armv7, x86 and x86_64. 2.30.7 is the build this was read from.
 *
 * There is no paid tier: the manifest asks for no billing permission and the app has no purchase screen.
 * The only thing to remove is advertising (Yandex Mobile Ads, with AdMob as an alternative), whose ad unit
 * ids are delivered from the developer's server.
 */
object Constants {
    const val PACKAGE = "com.metalsoft.trackchecker_mobile"

    val COMPATIBILITY_TRACKCHECKER = Compatibility(
        name = "TrackChecker",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF57C00,
        targets = listOf(AppTarget(version = "2.30.7")),
    )
}
