/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.adm.patches.shared

import app.morphe.patcher.patch.*

/**
 * ADM is distributed as an APKM (arm64-v8a, armeabi-v7a, x86, x86_64). 14.0.43 is the build this was read from.
 *
 * What the app sells: exactly one entitlement, named "Disable Ads", read from RevenueCat. There is no other
 * paid tier, so removing the ads is the whole purchase.
 */
object Constants {
    const val PACKAGE = "com.dv.adm"

    /** RevenueCat entitlement name. Present as a string in the class that consumes CustomerInfo. */
    const val ENTITLEMENT_DISABLE_ADS = "Disable Ads"

    /** The Appodeal app key passed to Appodeal.initialize(): identifies the ad bootstrap method. */
    const val APPODEAL_APP_KEY = "18b2becc3142993292bf348e92467eded74e23229100a646"

    val COMPATIBILITY_ADM = Compatibility(
        name = "ADM",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00897B,
        targets = listOf(AppTarget(version = "14.0.43")),
    )
}
