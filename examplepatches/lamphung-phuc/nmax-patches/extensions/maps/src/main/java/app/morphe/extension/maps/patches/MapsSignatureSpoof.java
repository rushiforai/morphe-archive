/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches-library
 *
 * See the included NOTICE file for §7(c) terms that apply to this code.
 * Modified for gmaps-patches: renamed-package matching, guarded metadata getters and scoped header values.
 */
package app.morphe.extension.maps.patches;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Base64;

import java.util.Locale;

@SuppressWarnings("unused")
public final class MapsSignatureSpoof {
    private static final Signature SIGNATURE = new Signature(Base64.decode(originalCertificate(), Base64.DEFAULT));
    private static final String LOWER_SHA1 = originalSha1();
    private static final String UPPER_SHA1 = LOWER_SHA1.toUpperCase(Locale.ROOT);

    private MapsSignatureSpoof() {
    }

    private static String originalPackage() { return "MAPS_ORIGINAL_PACKAGE_PLACEHOLDER"; }
    private static String patchedPackage() { return "MAPS_PATCHED_PACKAGE_PLACEHOLDER"; }
    private static String originalCertificate() { return "MAPS_ORIGINAL_CERTIFICATE_PLACEHOLDER"; }
    private static String originalSha1() { return "MAPS_ORIGINAL_SHA1_PLACEHOLDER"; }

    public static String packageHeaderValue() {
        return originalPackage();
    }

    /** Retain the original hexadecimal case; the certificate bytes always come from the input APK. */
    public static String certificateHeaderValue(Object previous) {
        if (previous instanceof String) {
            String value = (String) previous;
            if (value.length() == 40 && value.equals(value.toLowerCase(Locale.ROOT))) return LOWER_SHA1;
        }
        return UPPER_SHA1;
    }

    @androidx.annotation.RequiresApi(api = Build.VERSION_CODES.TIRAMISU)
    public static PackageInfo getPackageInfo(PackageManager pm, String packageName,
            PackageManager.PackageInfoFlags flags) throws PackageManager.NameNotFoundException {
        return spoofSignature(pm.getPackageInfo(packageName, flags));
    }

    public static PackageInfo getPackageInfo(PackageManager pm, String packageName, int flags)
            throws PackageManager.NameNotFoundException {
        return spoofSignature(pm.getPackageInfo(packageName, flags));
    }

    @SuppressWarnings("deprecation")
    private static PackageInfo spoofSignature(PackageInfo info) {
        if (info != null && (patchedPackage().equals(info.packageName) || originalPackage().equals(info.packageName))) {
            if (info.signatures != null && info.signatures.length > 0) info.signatures[0] = SIGNATURE;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P && info.signingInfo != null) {
                Signature[] signatures = info.signingInfo.getApkContentsSigners();
                if (signatures != null && signatures.length > 0) signatures[0] = SIGNATURE;
            }
        }
        return info;
    }
}
