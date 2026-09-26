/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.misc.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Reports Ather's own signing certificate to Google.
 *
 * Ather's Google API key is restricted to the package name plus the signing
 * certificate, and every Google SDK call sends that certificate in the
 * `X-Android-Cert` header. A build signed with a different key therefore fails
 * after the OTP step: Firebase Installations, Firebase Auth and Remote Config are
 * all rejected and the app cannot resolve the user's database URL.
 *
 * This patch rewrites the certificate-hash helper to return the SHA-1 of Ather's
 * original certificate, so the re-signed build is accepted. The value is public
 * information (it is part of every Ather APK) and cannot be used to sign anything.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321):
 * ```
 * .method public static e(Landroid/content/Context;Ljava/lang/String;)[B
 *     .locals 1
 *     const/16 v0, 0x14
 *     new-array v0, v0, [B
 *     fill-array-data v0, :ather_cert_sha1
 *     return-object v0
 *     :ather_cert_sha1
 *     .array-data 1
 *         0x38t 0x56t 0x07t 0xf0t 0x69t 0x26t 0xcet 0xd3t 0xc0t 0x63t
 *         0x09t 0x14t 0xbct 0x6bt 0x78t 0xact 0x2bt 0xa9t 0x92t 0x11t
 *     .end array-data
 * .end method
 * ```
 */
@Suppress("unused")
val signingCertificatePatch = bytecodePatch(
    name = "Report Ather's signing certificate",
    description = "Reports Ather's own signing-certificate hash to Google's APIs, so " +
        "Firebase login and live vehicle data keep working after the app is re-signed.",
) {
    compatibleWith("com.athermobileapp")

    execute {
        PackageCertificateHashFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x14
                new-array v0, v0, [B
                fill-array-data v0, :ather_cert_sha1
                return-object v0
                :ather_cert_sha1
                .array-data 1
                    0x38t 0x56t 0x07t 0xf0t 0x69t 0x26t 0xcet 0xd3t 0xc0t 0x63t
                    0x09t 0x14t 0xbct 0x6bt 0x78t 0xact 0x2bt 0xa9t 0x92t 0x11t
                .end array-data
            """,
        )
    }
}
