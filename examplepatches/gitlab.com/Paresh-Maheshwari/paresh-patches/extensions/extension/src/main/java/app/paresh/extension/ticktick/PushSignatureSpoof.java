package app.paresh.extension.ticktick;

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
 * Restores FCM push (task/reminder notifications) on the re-signed app by making
 * PackageManager report TickTick's original signing certificate for com.ticktick.task.
 * Firebase Installations checks the app's certificate against the API key restriction;
 * after Morphe re-signs, that check fails (FIS_AUTH_ERROR) and push reminders stop.
 *
 * Replaces PackageInfo.CREATOR so any getPackageInfo() for this package returns the
 * original certificate. Called from TickTickApplicationBase.attachBaseContext, before
 * Firebase initializes.
 *
 * Based on https://github.com/L-JINBIN/ApkSignatureKillerEx
 */
@SuppressWarnings("unused")
public final class PushSignatureSpoof {

    private static final String PACKAGE_NAME = "com.ticktick.task";

    // Original developer (CN=Jun Yuan / Dayup.org) X.509 certificate, DER, base64.
    // SHA-1: 6711de2604b48fc736cbb9e29b8eb834651605b3
    private static final String SIGNATURE =
            "MIICUzCCAbygAwIBAgIESjRCCDANBgkqhkiG9w0BAQUFADBtMQ4wDAYDVQQGEwVDaGluYTERMA8G"
            + "A1UECBMIWmhlamlhbmcxETAPBgNVBAcTCEhhbmd6aG91MRIwEAYDVQQKEwlEYXl1cC5vcmcxDjAM"
            + "BgNVBAsTBURheXVwMREwDwYDVQQDEwhKdW4gWXVhbjAgFw0wOTA2MTQwMDE5MjBaGA8yMTA5MDUy"
            + "MTAwMTkyMFowbTEOMAwGA1UEBhMFQ2hpbmExETAPBgNVBAgTCFpoZWppYW5nMREwDwYDVQQHEwhI"
            + "YW5nemhvdTESMBAGA1UEChMJRGF5dXAub3JnMQ4wDAYDVQQLEwVEYXl1cDERMA8GA1UEAxMISnVu"
            + "IFl1YW4wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJQE6TM81Oq3XPUN057HPqKkuN+6OFbd"
            + "GD4JJ5qjGlIgykmz8GFP9ySVpvyEntMiLNWu9tpqETAsnDI0omyZadICtqfxeumP2zWjZP+kUFSU"
            + "4T5qqPmTHjeujdGpWl+CmtV32F2Uw2Rnc0S07lNdTH0mFKoKBvB5J9RhcnKqE5lNAgMBAAEwDQYJ"
            + "KoZIhvcNAQEFBQADgYEAiD7BHyTaMGEz41ekB9HzSl+6ZY92z142eXWqRrXsm47Mps9PL4P8Plav"
            + "KrQhBBnWNedib+GYK1mLRoZlYilnirh9Ygi/SHgEbuRDI9sBjdCsNODB7X+NWR+FbLQJlHxb8YkA"
            + "1AQnOwkgsRVjKH2b6Pk15ocKOkl+59EPXs7aOYE=";

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
