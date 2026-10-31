package io.github.emotionbug.patches.runtime;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.util.Base64;
import java.security.MessageDigest;

/** Matches nq5.R's original signing-history certificate encoding, without changing its checks. */
public final class RecorderIdentity {
    private RecorderIdentity() {}

    public static String certificate(Context context) {
        if (context == null || !"com.skt.prod.dialer".equals(context.getPackageName()))
            throw new SecurityException("Recorder identity requires the original application context");
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(
                context.getPackageName(), PackageManager.GET_SIGNING_CERTIFICATES);
            if (info.signingInfo == null) throw new SecurityException("Missing signing information");
            Signature[] history = info.signingInfo.getSigningCertificateHistory();
            if (history == null || history.length == 0) throw new SecurityException("Missing signing history");
            return Base64.encodeToString(MessageDigest.getInstance("SHA-256")
                .digest(history[0].toByteArray()), Base64.NO_WRAP);
        } catch (PackageManager.NameNotFoundException | java.security.NoSuchAlgorithmException failure) {
            throw new SecurityException("Cannot establish recorder certificate identity", failure);
        }
    }
}
