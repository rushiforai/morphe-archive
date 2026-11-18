// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami

import app.keropatches.core.AppDefinition
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Everything this bundle knows about the stock Anghami application.
 *
 * The signing certificate is that of the unmodified application and is used to
 * refuse a repackaged or third-party build. It is a public fact about the APK,
 * not a secret.
 */
object AnghamiApp {
    const val PACKAGE_NAME = "com.anghami"
    const val VERSION_NAME = "8.0.28"
    const val VERSION_CODE = 8000280

    /**
     * SHA-256 of the Anghami signing certificate, taken from the stock bundle.
     * Subject of the certificate: O=Anghami, C=LB.
     */
    const val SIGNING_CERTIFICATE_SHA256 =
        "5e5d1b3609403e1db445d142ef36433a2ad2008030281d437d9e632c01c45659"

    val compatibility = Compatibility(
        packageName = PACKAGE_NAME,
        name = "Anghami",
        description = "Music and podcast streaming.",
        apkFileType = ApkFileType.APKM_REQUIRED,
        signatures = setOf(SIGNING_CERTIFICATE_SHA256),
        targets = listOf(
            AppTarget(
                version = VERSION_NAME,
                versionCode = VERSION_CODE,
                minSdk = 23,
            ),
        ),
    )

    val definition = AppDefinition(
        id = "anghami",
        compatibility = compatibility,
        specDirectory = "docs/specs/anghami",
    )
}
