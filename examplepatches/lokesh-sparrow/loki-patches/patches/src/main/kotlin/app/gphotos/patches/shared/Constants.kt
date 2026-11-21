/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.gphotos.patches.shared

import app.morphe.patcher.patch.*

object Constants {
    const val PACKAGE = "com.google.android.apps.photos"

    /**
     * SHA-1 of the app's real signing certificate. Google Photos is key-rotated: the Android 13+ signer is the
     * current one, and it is what the app's API keys are bound to, so it is the one GmsCore presents to Google.
     */
    const val SIGNATURE = "F8456B1D9986ACF9CE21FB450B0D32B895F36885"

    /** The APKMirror upload is a bundle (base + ABI + density + language splits), so it is declared as APKM. */
    val COMPATIBILITY_GPHOTOS = Compatibility(
        name = "Google Photos",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4285F4,
        targets = listOf(
            AppTarget(version = "8.1.0.1023737660"),
            AppTarget(version = null, isExperimental = true),
        ),
    )

    /** The Pixel XL entitlement: the one device feature that grants unlimited original-quality backup. */
    const val FEATURE_UNLIMITED = "NEXUS_PRELOAD"
}
