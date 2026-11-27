package local.privacy;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Base64;

import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/** Adapts only the installed APK certificate's public fingerprint. */
public final class SignerCompat {
    private static final byte[] ORIGINAL_CERT_SHA256 = hex(
        "e6b27144a27660b1e00608fa45d319065d97d0a71fb54b8ca1756e8346ec29dd");
    private static volatile Context app;
    private static volatile byte[] installedCertSha256;

    private SignerCompat() { }

    public static void init(Context context) {
        app = context.getApplicationContext();
    }

    private static byte[] hex(String value) {
        byte[] result = new byte[value.length() / 2];
        for (int i = 0; i < result.length; i++)
            result[i] = (byte) Integer.parseInt(value.substring(i * 2, i * 2 + 2), 16);
        return result;
    }

    public static byte[] installedCertificateHash() {
        byte[] cached = installedCertSha256;
        if (cached != null) return cached;
        Context context = app;
        if (context == null) return null;
        try {
            PackageManager pm = context.getPackageManager();
            int flags = Build.VERSION.SDK_INT >= 28
                ? PackageManager.GET_SIGNING_CERTIFICATES : PackageManager.GET_SIGNATURES;
            PackageInfo info = pm.getPackageInfo(context.getPackageName(), flags);
            Signature[] signatures = Build.VERSION.SDK_INT >= 28 && info.signingInfo != null
                ? info.signingInfo.getApkContentsSigners() : info.signatures;
            if (signatures == null || signatures.length != 1) return null;
            byte[] result = java.security.MessageDigest.getInstance("SHA-256")
                .digest(signatures[0].toByteArray());
            installedCertSha256 = result;
            return result;
        } catch (Exception ignored) {
            return null;
        }
    }

    public static byte[] identity(byte[] digest) {
        byte[] installed = installedCertificateHash();
        return installed != null && Arrays.equals(digest, installed)
            ? ORIGINAL_CERT_SHA256.clone() : digest;
    }

    public static Set<String> withInstalledSigner(Set<String> vendorAllowed) {
        Set<String> result = new HashSet<>();
        if (vendorAllowed != null) result.addAll(vendorAllowed);
        byte[] once = installedCertificateHash();
        if (once == null) return result;
        try {
            byte[] twice = java.security.MessageDigest.getInstance("SHA-256").digest(once);
            result.add(Base64.encodeToString(twice, Base64.NO_WRAP));
            StringBuilder colonHex = new StringBuilder();
            for (byte b : twice) {
                if (colonHex.length() > 0) colonHex.append(':');
                colonHex.append(String.format(java.util.Locale.US, "%02X", b & 0xff));
            }
            result.add(colonHex.toString());
        } catch (NoSuchAlgorithmException ignored) { }
        return result;
    }
}
