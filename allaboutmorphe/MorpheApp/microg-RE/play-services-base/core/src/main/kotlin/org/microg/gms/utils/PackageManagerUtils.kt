/*
 * SPDX-FileCopyrightText: 2022 microG Project Team
 * SPDX-License-Identifier: Apache-2.0
 */

package org.microg.gms.utils

import android.content.pm.PackageManager
import android.content.pm.PackageManager.NameNotFoundException
import android.content.pm.Signature
import android.util.Base64
import java.security.MessageDigest

@Suppress("DEPRECATION")
fun PackageManager.getSignaturesCompat(packageName: String): Array<Signature> = try {
    val packageInfo = if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.P) {
        getPackageInfo(packageName, PackageManager.GET_SIGNING_CERTIFICATES)
    } else {
        getPackageInfo(packageName, PackageManager.GET_SIGNATURES)
    }

    when {
        android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.P -> {
            packageInfo.signingInfo?.apkContentsSigners ?: emptyArray()
        }
        else -> {
            packageInfo.signatures ?: emptyArray()
        }
    }
} catch (e: NameNotFoundException) {
    emptyArray()
}

fun PackageManager.getApplicationLabel(packageName: String): CharSequence = try {
    getApplicationLabel(getApplicationInfo(packageName, 0))
} catch (e: Exception) {
    packageName
}

fun ByteArray.toBase64(vararg flags: Int): String =
    Base64.encodeToString(this, flags.fold(0) { acc, f -> acc or f })

fun ByteArray.toHexString(separator: String = ""): String =
    joinToString(separator) { "%02x".format(it) }

fun PackageManager.getFirstSignatureDigest(packageName: String, algorithm: String): ByteArray? =
    getSignaturesCompat(packageName).firstOrNull()?.digest(algorithm)

fun Signature.digest(algorithm: String): ByteArray =
    MessageDigest.getInstance(algorithm).digest(toByteArray())