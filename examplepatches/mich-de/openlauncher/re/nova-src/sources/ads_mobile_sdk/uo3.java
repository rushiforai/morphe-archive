package ads_mobile_sdk;

import android.os.Build;
import b.t2;
import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.cert.X509Certificate;
import java.util.Arrays;

/* loaded from: classes2.dex */
public final class uo3 {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f10432a = {61, 122, 18, 35, 1, -102, -93, -99, -98, -96, -29, 67, 106, -73, -64, -119, 107, -5, 79, -74, 121, -12, -34, 95, -25, -62, 63, 50, 108, -113, -103, 74};

    /* renamed from: b, reason: collision with root package name */
    public static final byte[] f10433b = {-110, -13, -34, 70, -83, 43, 97, 21, -44, 16, -54, -125, -28, -57, -125, -127, -7, 17, 102, -69, 116, -121, -79, 43, -13, 120, 58, 55, -29, -108, 95, 83};

    public static boolean a(File file) throws GeneralSecurityException {
        try {
            X509Certificate[][] x509CertificateArrQ = t2.Q(file.getAbsolutePath());
            if (x509CertificateArrQ.length != 1) {
                throw new GeneralSecurityException("APK has more than one signature.");
            }
            byte[] bArrDigest = MessageDigest.getInstance("SHA-256").digest(x509CertificateArrQ[0][0].getEncoded());
            return Arrays.equals(f10432a, bArrDigest) || (!"user".equals(Build.TYPE) && Arrays.equals(f10433b, bArrDigest));
        } catch (gg e3) {
            throw new GeneralSecurityException("Package is not signed", e3);
        } catch (IOException | RuntimeException e11) {
            throw new GeneralSecurityException("Failed to verify signatures", e11);
        }
    }
}
