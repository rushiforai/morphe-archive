/*
 * Copyright 2026
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.patches.pixelcamera.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {

    /**
     * The official Pixel Camera app.
     *
     * Verified against a Pixel 10 Pro XL (`mustang`, build `CP2A.260705.006`,
     * Android 17 / SDK 37) by pulling the installed package with
     * `adb shell pm path com.google.android.GoogleCamera`:
     *
     * ```
     * package     : com.google.android.GoogleCamera
     * versionCode : 69481630
     * versionName : 10.4.117.936816638.14
     * minSdk      : 37   targetSdk : 37
     * ```
     *
     * `signatures` is the SHA-256 of the v2/v3 signing certificate of that
     * base.apk, produced by `python tools/apksigcert.py base.apk`. It is
     * Google's release key; a bundle that does not match this digest is not the
     * official app.
     *
     * Pixel Camera is distributed as an app bundle - on the device it is
     * base.apk plus ~20 `split_*` dynamic feature modules, so [ApkFileType.APKM]
     * is declared. All DEX code lives in base.apk; the splits carry only assets
     * and a handful of feature-specific `.so` files.
     */
    val COMPATIBILITY_PIXEL_CAMERA = Compatibility(
        name = "Pixel Camera",
        packageName = "com.google.android.GoogleCamera",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4285F4,
        signatures = setOf(
            "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83"
        ),
        targets = listOf(
            AppTarget(
                version = "10.4.117.936816638.14",
                minSdk = 37,
                description = "Verified on Pixel 10 Pro XL, Android 17 (CP2A.260705.006)."
            )
        )
    )
}
