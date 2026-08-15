/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_MYOOREDOO = Compatibility(
        name = "My Ooredoo",
        packageName = "com.algeria.selfcare.app.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x113C8A,
        // Do not restrict this to the Play certificate. Morphe re-signs patched APKs,
        // and some stable distributions are delivered as verified APK/XAPK variants.
        signatures = null,
        targets = listOf(
            AppTarget(version = "1.5.13", minSdk = 24, isExperimental = false),
        ),
    )
}
