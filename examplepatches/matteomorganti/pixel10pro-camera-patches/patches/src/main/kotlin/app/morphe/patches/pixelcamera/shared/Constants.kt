/*
 * Copyright 2026 pixel10pro-camera-patches contributors
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.patches.pixelcamera.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {

    const val PIXEL_CAMERA_PACKAGE = "com.google.android.GoogleCamera"

    /** The only Pixel Camera build this bundle is written and verified for. */
    const val PIXEL_CAMERA_VERSION = "11.1.040.982810059.19"
    const val PIXEL_CAMERA_VERSION_CODE = 69703284

    /**
     * The single compatibility declaration used by every patch in this bundle.
     *
     * Pixel Camera 11.1.040.982810059.19, versionCode 69703284, distributed as
     * an APKM (base.apk + feature/asset splits; all DEX code is in base.apk).
     * Target device: Pixel 10 Pro (`blazer`, Tensor G5).
     *
     * `signatures` is Google's release-key SHA-256 for Pixel Camera, as recorded
     * by Gamer92000/pixelcamera-patches (tools/apksigcert.py) and re-checked
     * against the 11.1.040 base.apk (see WORKLOG.md). minSdk 37 is read from the
     * 11.1.040 base.apk manifest.
     */
    val COMPATIBILITY_PIXEL_CAMERA = Compatibility(
        name = "Pixel Camera",
        packageName = PIXEL_CAMERA_PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4285F4,
        signatures = setOf(
            "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83"
        ),
        targets = listOf(
            AppTarget(
                version = PIXEL_CAMERA_VERSION,
                versionCode = PIXEL_CAMERA_VERSION_CODE,
                minSdk = 37,
                description = "Pixel Camera 11.1.040 (versionCode 69703284) for Pixel 10 Pro (Tensor G5)."
            )
        )
    )
}
