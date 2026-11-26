/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.idm.patches.shared

import app.morphe.patcher.patch.*

/**
 * 1DM (the free build) ships as an APKM for arm64, armv7, x86 and x86_64. 20.0 / 30257 is the build this was read from.
 *
 * 1DM+ is a separate paid package, not a flag inside this app: the only references to
 * `idm.internet.download.manager.plus` here are an ad banner and an Intent that opens its Play page.
 * What can be removed is advertising, served through Appodeal with a long mediation tail.
 */
object Constants {
    const val PACKAGE = "idm.internet.download.manager"

    /** Appodeal's public facade. Un-obfuscated and stable, so the hooks survive version bumps. */
    const val APPODEAL = "Lcom/appodeal/ads/Appodeal;"

    val COMPATIBILITY_IDM = Compatibility(
        name = "1DM",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x3F51B5,
        targets = listOf(AppTarget(version = "20.0")),
    )
}
