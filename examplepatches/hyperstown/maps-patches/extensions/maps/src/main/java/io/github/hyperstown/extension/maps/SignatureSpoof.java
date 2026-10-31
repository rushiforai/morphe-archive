/*
 * Adapted from gmaps-patches by fangkampanat, https://github.com/fangkampanat/gmaps-patches,
 * which adapts the signature spoofing of Morphe, https://github.com/MorpheApp/morphe-patches-library/pull/61
 * See the included NOTICE file for the GPLv3 section 7 terms that apply to this code.
 */

package io.github.hyperstown.extension.maps;

import android.annotation.TargetApi;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Base64;

import java.util.Locale;

@SuppressWarnings("unused")
public final class SignatureSpoof {
    private static final Signature SIGNATURE = new Signature(Base64.decode(originalCertificate(), Base64.DEFAULT));
    private static final String LOWER_CASE_SHA1 = originalSha1();
    private static final String UPPER_CASE_SHA1 = LOWER_CASE_SHA1.toUpperCase(Locale.ROOT);

    private SignatureSpoof() {
    }

    // Filled in during patching.
    private static String originalPackage() {
        return "ORIGINAL_PACKAGE_PLACEHOLDER";
    }

    private static String patchedPackage() {
        return "PATCHED_PACKAGE_PLACEHOLDER";
    }

    private static String originalCertificate() {
        return "ORIGINAL_CERTIFICATE_PLACEHOLDER";
    }

    private static String originalSha1() {
        return "ORIGINAL_SHA1_PLACEHOLDER";
    }

    /**
     * Injection point: value of the X-Android-Package request header.
     */
    public static String packageHeaderValue() {
        return originalPackage();
    }

    /**
     * Injection point: value of the X-Android-Cert request header, in the case Maps used.
     */
    public static String certificateHeaderValue(Object original) {
        if (original instanceof String) {
            String value = (String) original;
            if (value.length() == 40 && value.equals(value.toLowerCase(Locale.ROOT))) return LOWER_CASE_SHA1;
        }
        return UPPER_CASE_SHA1;
    }

    /**
     * Injection point: replaces PackageManager.getPackageInfo.
     */
    @TargetApi(Build.VERSION_CODES.TIRAMISU)
    public static PackageInfo getPackageInfo(PackageManager packageManager, String packageName,
                                             PackageManager.PackageInfoFlags flags)
            throws PackageManager.NameNotFoundException {
        return spoofSignature(packageManager.getPackageInfo(packageName, flags));
    }

    /**
     * Injection point: replaces PackageManager.getPackageInfo.
     */
    public static PackageInfo getPackageInfo(PackageManager packageManager, String packageName, int flags)
            throws PackageManager.NameNotFoundException {
        return spoofSignature(packageManager.getPackageInfo(packageName, flags));
    }

    @SuppressWarnings("deprecation")
    private static PackageInfo spoofSignature(PackageInfo info) {
        if (info == null) return null;
        if (!patchedPackage().equals(info.packageName) && !originalPackage().equals(info.packageName)) return info;

        if (info.signatures != null && info.signatures.length > 0) {
            info.signatures[0] = SIGNATURE;
        }
        if (info.signingInfo != null) {
            Signature[] signers = info.signingInfo.getApkContentsSigners();
            if (signers != null && signers.length > 0) signers[0] = SIGNATURE;
        }
        return info;
    }
}
