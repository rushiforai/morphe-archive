/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package dev.chuk.patches.tidal.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_TIDAL = Compatibility(
        name = "TIDAL",
        packageName = "com.aspiro.tidal",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        signatures = setOf(
            "2e8a4794a95418367e36c84303feb43774919d6a351129d23d0fcf1b0b729454"
        ),
        targets = listOf(
            // The patch hooks structural entry points instead of app specific code, so it is
            // expected to keep working with newer versions as well.
            AppTarget(
                version = null,
                minSdk = 29
            ),
            AppTarget(
                version = "2.202.0",
                minSdk = 29
            )
        )
    )
}
