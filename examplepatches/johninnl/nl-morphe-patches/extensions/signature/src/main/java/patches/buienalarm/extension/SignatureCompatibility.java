/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches-library
 * See the repository LICENSE and NOTICE for GPLv3 Section 7 terms.
 *
 * Adapted for Buienalarm patches (2026-10-26): scope checks to the requested
 * package, inject the original input certificate through a getter, decode it
 * lazily, and leave metadata unchanged if a compatibility operation fails.
 */
package patches.buienalarm.extension;

import android.annotation.TargetApi;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Base64;
import android.util.Log;

@SuppressWarnings("unused")
public final class SignatureCompatibility {
    private static final String PACKAGE_NAME = "org.yoki.android.buienalarm";
    private static Signature originalSignature;

    private SignatureCompatibility() {}

    /** The patch replaces this return value with the input APK's public certificate. */
    public static String getOriginalCertificate() {
        return "ORIGINAL_CERTIFICATE_PLACEHOLDER";
    }

    public static PackageInfo getPackageInfo(PackageManager pm, String packageName, int flags)
            throws PackageManager.NameNotFoundException {
        return originalIdentity(pm.getPackageInfo(packageName, flags), packageName);
    }

    @TargetApi(33)
    public static PackageInfo getPackageInfo(PackageManager pm, String packageName,
                                            PackageManager.PackageInfoFlags flags)
            throws PackageManager.NameNotFoundException {
        return originalIdentity(pm.getPackageInfo(packageName, flags), packageName);
    }

    private static synchronized Signature signature() {
        if (originalSignature == null) {
            originalSignature = new Signature(Base64.decode(getOriginalCertificate(), Base64.DEFAULT));
        }
        return originalSignature;
    }

    @SuppressWarnings("deprecation")
    static PackageInfo originalIdentity(PackageInfo info, String requestedPackage) {
        if (info == null || !PACKAGE_NAME.equals(requestedPackage) || !PACKAGE_NAME.equals(info.packageName)) {
            return info;
        }
        try {
            Signature signature = signature();
            if (info.signatures != null && info.signatures.length == 1) {
                info.signatures[0] = signature;
            }
            if (Build.VERSION.SDK_INT >= 28 && info.signingInfo != null) {
                Signature[] signers = info.signingInfo.getApkContentsSigners();
                if (signers != null && signers.length == 1) {
                    signers[0] = signature;
                }
            }
        } catch (RuntimeException error) {
            Log.w("BuienalarmCompatibility", "Could not preserve original app identity", error);
        }
        return info;
    }
}
