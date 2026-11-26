/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.smtgpm.patches.belote.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal object Constants {
    const val PACKAGE_NAME = "com.gameduell.mobile.belote"
    const val VERSION = "2.12.9"
    const val VERSION_CODE = 2216

    /** SHA-1 of GameDuell's signing certificate, for MicroG-RE signature spoofing. */
    const val SIGNER_SHA1 = "8be911a94d207f9ae65d4e25ecc872748eec3dd5"

    val COMPATIBILITY_BELOTE = Compatibility(
        name = "Belote.com",
        packageName = PACKAGE_NAME,
        // The Play Store build is a split APK (base + arm64 config split).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1F6F43,
        signatures = setOf(
            // SHA-256 of GameDuell's signing certificate.
            "bf4878918606c0d31601400aea006f25ec223ca0eacf219ad5ac67d510d51e93",
        ),
        targets = listOf(
            AppTarget(
                version = VERSION,
                // Native patches target this exact arm64 libil2cpp.so.
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to VERSION_CODE),
                description = "arm64-v8a only.",
            ),
        ),
    )
}
