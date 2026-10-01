/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.app.Application;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Base64;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * Answers TikTok's own checks of how it was signed and installed the way the Play Store build
 * would. A patched TikTok is re-signed with the patcher's key and installed by Morphe Manager, and
 * both go out with TikTok's reports: AppLog's {@code sig_hash} and the security SDK's callbacks,
 * which hand its native side the signing certificate and the install source.
 *
 * <p>Every one of TikTok's own reads of its certificate goes through one cached
 * {@code getPackageInfo} wrapper, which the patch answers from {@link #packageInfo}. The security
 * SDK's install source callback goes through {@link #installer} and {@link #originator}. What
 * TikTok's native code reads for itself, from the APK on disk, is out of reach here.
 */
@SuppressWarnings("unused")
public final class StoreIdentity {
    /** The Play Store, which installs the build a store user has. */
    static final String STORE = "com.android.vending";

    /**
     * TikTok's own signing certificate (CN=musical.ly) as DER, the bytes
     * {@link Signature#toByteArray()} gives on a store build. Its SHA-256 is the
     * {@code 9041803e...ab5ba} digest Morphe Manager holds a picked APK to.
     */
    static final String CERTIFICATE =
            "MIIDhzCCAm+gAwIBAgIEMsei9zANBgkqhkiG9w0BAQsFADB0MQswCQYDVQQGEwI4NjERMA8GA1UECBMIU2hh"
            + "bmdoYWkxETAPBgNVBAcTCFNoYW5naGFpMRgwFgYDVQQKEw9tdXNpY2FsLmx5IEluYy4xEDAOBgNVBAsTB2Fu"
            + "ZHJvaWQxEzARBgNVBAMTCm11c2ljYWwubHkwHhcNMTUwNDI4MDQyNzE3WhcNNDAwNDIxMDQyNzE3WjB0MQsw"
            + "CQYDVQQGEwI4NjERMA8GA1UECBMIU2hhbmdoYWkxETAPBgNVBAcTCFNoYW5naGFpMRgwFgYDVQQKEw9tdXNp"
            + "Y2FsLmx5IEluYy4xEDAOBgNVBAsTB2FuZHJvaWQxEzARBgNVBAMTCm11c2ljYWwubHkwggEiMA0GCSqGSIb3"
            + "DQEBAQUAA4IBDwAwggEKAoIBAQCvEuNMCwMeQebJmsO2NtQlOqdYTrya5MWSRLApebgJaSefMubj3+AaDXy2"
            + "7UAA6JI92Q1xcaM3hk9qZMWQ2yBLqrl/AT/ox97+PKtMFrJMtpWaPP+5kFcjwKERbQAqnP1yHB56Fjg9R+J+"
            + "1Dh/jcy6bkTVdB2ly3opX4wytSdQw+1aVvSU/z1mfKPVnJw1c79oVmdyebhNRdgMU7OpQZEau+mxXOpjar+b"
            + "pj6ZssntevpI+i8JaB/dVZ9Hkuz1omBAAY76971BGtsNUuKlrYQkp3b1Q1g6fpJsawM3yqSu+iP5r+UsmTOh"
            + "/G5zvJPbjU4qtFDC3pBkjdGc19CcVlK/AgMBAAGjITAfMB0GA1UdDgQWBBQi6xoMVEjV/7KBd/FF3/fs9sH+"
            + "ITANBgkqhkiG9w0BAQsFAAOCAQEALzQnY5WC+mmWAssIZZuq9yLMEc4uKXhBMPa0alogY36uTxkQaiQzqthD"
            + "Ph8+JsKQSJVmb59PRhw283ApwlHHBg2cVUU605A3WjS7eFWQAjhZAEbXYY4CosyRvr+aH6250iC8ksGEcjw2"
            + "a2y//pOLsK6AL5YPhwOdG3xhO6hCgoRbl/zsrXRo3s6j2Db3VFNpGT3wTXQGxqAtC/cN/zZHbT1LV4wikpa/"
            + "ijVwSf5+V3mTcH0pQsSZiyM1wNqWiUr71jihfYY8l/f94qh4Rfh7dwIA3y6OtyCtP0+p/Oieop5s+i/Q08Tn"
            + "6xDztKKaUNvqO9pv83jB0UvACa9m2woW0g==";

    @Nullable
    private static volatile Signature[] original;
    /** TikTok's own package with GET_SIGNATURES alone, which is how every reader of it asks. */
    @Nullable
    private static volatile PackageInfo signedOnly;
    private static volatile boolean logged;

    private StoreIdentity() {
    }

    /**
     * From the head of TikTok's cached {@code getPackageInfo}: TikTok's own package asked for with
     * its signatures comes back carrying TikTok's certificate. Null lets TikTok's lookup run.
     */
    @Nullable
    public static PackageInfo packageInfo(PackageManager manager, String packageName, int flags) {
        if ((flags & PackageManager.GET_SIGNATURES) == 0 || !Settings.STORE_IDENTITY.get()) return null;
        if (packageName == null || !packageName.equals(ownPackage())) return null;
        try {
            if (flags == PackageManager.GET_SIGNATURES) {
                PackageInfo cached = signedOnly;
                if (cached != null) return cached;
            }
            PackageInfo info = manager.getPackageInfo(packageName, flags);
            info.signatures = signatures();
            if (flags == PackageManager.GET_SIGNATURES) signedOnly = info;
            if (!logged) {
                logged = true;
                Logger.printInfo(() -> "Store identity: TikTok's certificate answered a signature read");
            }
            return info;
        } catch (Exception ex) {
            Logger.printException(() -> "Store identity: package lookup failed", ex);
            return null;
        }
    }

    /**
     * In place of {@link PackageManager#getInstallerPackageName(String)}: the Play Store for
     * TikTok's own package, and the real installer for anything else it asks about. The patch
     * puts this in front of each call site.
     */
    @Nullable
    public static String installerFor(PackageManager manager, String packageName) {
        String actual;
        try {
            actual = manager.getInstallerPackageName(packageName);
        } catch (Exception ex) {
            actual = null;
        }
        if (!Settings.STORE_IDENTITY.get()) return actual;
        return packageName != null && packageName.equals(ownPackage()) ? STORE : actual;
    }

    static Signature[] signatures() {
        Signature[] known = original;
        if (known == null) {
            known = new Signature[]{new Signature(Base64.decode(CERTIFICATE, Base64.DEFAULT))};
            original = known;
        }
        return known.clone();
    }

    /** TikTok's package name, even before the extension has been handed a context. */
    @Nullable
    static String ownPackage() {
        Context context = Utils.getContext();
        if (context != null) return context.getPackageName();
        if (Build.VERSION.SDK_INT < 28) return null;
        String process = Application.getProcessName();
        if (process == null) return null;
        int colon = process.indexOf(':');
        return colon < 0 ? process : process.substring(0, colon);
    }
}
