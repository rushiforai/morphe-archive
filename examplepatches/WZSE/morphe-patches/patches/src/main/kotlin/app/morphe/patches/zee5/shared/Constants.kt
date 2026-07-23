/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * This file is part of Morphe Patches.
 *
 * Privacy patches for the ZEE5 Android TV app (package com.graymatrix.did).
 * Goal: remove third-party analytics/tracking and advertising behavior
 * without affecting any paid/subscription functionality.
 */

package app.morphe.patches.zee5.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_ZEE5_TV = Compatibility(
        packageName = "com.graymatrix.did",
        name = "ZEE5",
        description = "ZEE5: Movies, TV Shows, Series (Android TV)",
        apkFileType = ApkFileType.APKM_REQUIRED,
        appIconColor = 0x1c1c28,
        // SHA-256 of the signing certificate (v1/JAR signed base.apk from the apkm).
        // Verified with: apksigner verify --print-certs (certificate SHA-256 digest).
        signatures = setOf(
            "95bb7db483e1090f7221540638cdffad06b9f1d5ebc7501dc5d9f737a89b19a8"
        ),
        targets = listOf(
            AppTarget(
                version = "5.78.8",
                minSdk = 21,
            )
        )
    )
}
