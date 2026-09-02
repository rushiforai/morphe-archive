package app.paresh.extension.plusmessenger;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;

import org.lsposed.hiddenapibypass.HiddenApiBypass;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * Restores FCM push on the re-signed app by making PackageManager report the
 * original signing certificate for org.telegram.plus. Firebase Installations
 * checks the app's certificate SHA-1 against the API key restriction; after
 * Morphe re-signs, that check fails (FIS_AUTH_ERROR) and push dies.
 *
 * Replaces PackageInfo.CREATOR so any getPackageInfo() for this package returns
 * the original certificate. Called from ApplicationLoader.attachBaseContext,
 * before Firebase initializes.
 *
 * Based on https://github.com/L-JINBIN/ApkSignatureKillerEx
 */
@SuppressWarnings("unused")
public final class PushSignatureSpoof {

    private static final String PACKAGE_NAME = "org.telegram.plus";

    // Original developer (rafalense) X.509 certificate, DER, base64.
    // SHA-1: 49ebb949e0c74fa7a5e8b869762c7907b891941a
    private static final String SIGNATURE =
            "MIICrzCCAhgCCQDH4XYjX14GtDANBgkqhkiG9w0BAQUFADCBmzELMAkGA1UEBhMCRVMxETAPBgNV"
            + "BAgTCEFsaWNhbnRlMQ4wDAYDVQQHEwVSYWZhbDEfMB0GA1UEChMWYW5kcm9pZCBkZXZlbG9wZXIg"
            + "cGx1czEQMA4GA1UECxMHc2VjdGlvbjESMBAGA1UEAxMJcmFmYWxlbnNlMSIwIAYJKoZIhvcNAQkB"
            + "FhNyYWZhbGVuc2VAZ21haWwuY29tMB4XDTEzMDQyMjE4MzEyNloXDTQwMDkwNjE4MzEyNlowgZsx"
            + "CzAJBgNVBAYTAkVTMREwDwYDVQQIEwhBbGljYW50ZTEOMAwGA1UEBxMFUmFmYWwxHzAdBgNVBAoT"
            + "FmFuZHJvaWQgZGV2ZWxvcGVyIHBsdXMxEDAOBgNVBAsTB3NlY3Rpb24xEjAQBgNVBAMTCXJhZmFs"
            + "ZW5zZTEiMCAGCSqGSIb3DQEJARYTcmFmYWxlbnNlQGdtYWlsLmNvbTCBnzANBgkqhkiG9w0BAQEF"
            + "AAOBjQAwgYkCgYEAqQ15N+7XjRR8UGR40CwK9wE2+7R3tWPjq2qSBxfpKy3YxxNm8bOzXiyR3JEC"
            + "ZRSNUE1OyAVrb1jvnIPT2SzfZdauAAzpfYiuhdEseSrqOQtlup9hHeol+fZCKHQOidgZotuvUW8j"
            + "3v3o4fs+8HKN4/twHpmJBGlgW+QrOP7fTScCAwEAATANBgkqhkiG9w0BAQUFAAOBgQBzCLfFb/xU"
            + "D61z/HM+EmTpXoE44uXTuovTd8iBhVm4G6WAaw3txLKIlnKbgsqLVlyB2QCCUj/kFCklyT0ng4aV"
            + "FsUDZQYetxKckGFZGAlyj8nAvN//dOCiRwGotx9cyiGW9JgzcmkvCMtygd2HzD8QNQk9FL7V0Yga"
            + "kERbpd+xFQ==";

    private static boolean installed = false;

    public static synchronized void spoof() {
        if (installed) return;
        installed = true;
        try {
            Signature fakeSignature = new Signature(Base64.decode(SIGNATURE, Base64.DEFAULT));

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                HiddenApiBypass.addHiddenApiExemptions(
                        "Landroid/os/Parcel;",
                        "Landroid/content/pm",
                        "Landroid/app"
                );
            }

            Parcelable.Creator<PackageInfo> originalCreator = PackageInfo.CREATOR;
            Parcelable.Creator<PackageInfo> creator = new Parcelable.Creator<>() {
                @Override
                public PackageInfo createFromParcel(Parcel source) {
                    PackageInfo packageInfo = originalCreator.createFromParcel(source);
                    if (packageInfo.packageName != null
                            && packageInfo.packageName.equals(PACKAGE_NAME)) {
                        if (packageInfo.signatures != null && packageInfo.signatures.length > 0) {
                            packageInfo.signatures[0] = fakeSignature;
                        }
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P
                                && packageInfo.signingInfo != null) {
                            Signature[] signers = packageInfo.signingInfo.getApkContentsSigners();
                            if (signers != null && signers.length > 0) signers[0] = fakeSignature;
                            Signature[] history = packageInfo.signingInfo.getSigningCertificateHistory();
                            if (history != null) {
                                for (int i = 0; i < history.length; i++) history[i] = fakeSignature;
                            }
                        }
                    }
                    return packageInfo;
                }

                @Override
                public PackageInfo[] newArray(int size) {
                    return originalCreator.newArray(size);
                }
            };

            findField(PackageInfo.class, "CREATOR").set(null, creator);
            clearPackageInfoCache();
            clearParcelCreators();
        } catch (Throwable ignored) {
            // Never crash the app if spoofing fails.
        }
    }

    private static Field findField(Class<?> clazz, String fieldName) throws NoSuchFieldException {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            return field;
        } catch (NoSuchFieldException e) {
            while ((clazz = clazz.getSuperclass()) != null && !clazz.equals(Object.class)) {
                try {
                    Field field = clazz.getDeclaredField(fieldName);
                    field.setAccessible(true);
                    return field;
                } catch (NoSuchFieldException ignored) {
                }
            }
            throw e;
        }
    }

    private static void clearPackageInfoCache() {
        try {
            Field f = findField(PackageManager.class, "sPackageInfoCache");
            Object cache = f.get(null);
            if (cache != null) cache.getClass().getMethod("clear").invoke(cache);
        } catch (Exception ignored) {
        }
    }

    private static void clearParcelCreators() {
        try {
            Map<?, ?> mCreators = (Map<?, ?>) findField(Parcel.class, "mCreators").get(null);
            if (mCreators != null) mCreators.clear();
        } catch (Exception ignored) {
        }
        try {
            Map<?, ?> sPaired = (Map<?, ?>) findField(Parcel.class, "sPairedCreators").get(null);
            if (sPaired != null) sPaired.clear();
        } catch (Exception ignored) {
        }
    }

    private PushSignatureSpoof() {
    }
}
