// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.vodafone

import app.keropatches.core.AppDefinition
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Everything this bundle knows about the stock Ana Vodafone application.
 *
 * The signing certificate is that of the unmodified application and is used to
 * refuse a repackaged or third-party build. It is a public fact about the APK,
 * not a secret.
 *
 * The stock distribution is an APKM bundle: the base APK carries no native
 * libraries, so the ABI splits have to be present for the patched result to
 * install and run.
 */
object VodafoneApp {
    const val PACKAGE_NAME = "com.emeint.android.myservices"
    const val VERSION_NAME = "2026.11.1"
    const val VERSION_CODE = 1246

    /**
     * SHA-256 of the Ana Vodafone signing certificate, taken from the stock
     * bundle. Subject of the certificate: `CN=EME International, O=EMEINT,
     * L=Cairo, ST=El Maadi, C=20`.
     */
    const val SIGNING_CERTIFICATE_SHA256 =
        "7671c18d28517819385163cccb7c76e4ce4a083d05866403fac5ba0547b95485"

    val compatibility = Compatibility(
        packageName = PACKAGE_NAME,
        name = "Ana Vodafone",
        description = "Telecom services and account management.",
        apkFileType = ApkFileType.APKM_REQUIRED,
        signatures = setOf(SIGNING_CERTIFICATE_SHA256),
        targets = listOf(
            AppTarget(
                version = VERSION_NAME,
                versionCode = VERSION_CODE,
                minSdk = 24,
            ),
        ),
    )

    val definition = AppDefinition(
        id = "vodafone",
        compatibility = compatibility,
        specDirectory = "docs/specs/vodafone",
    )
}
