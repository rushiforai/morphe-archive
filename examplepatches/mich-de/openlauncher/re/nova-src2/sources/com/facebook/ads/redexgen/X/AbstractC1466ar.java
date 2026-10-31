package com.facebook.ads.redexgen.X;

import android.util.Base64;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Set;
import javax.annotation.Nullable;
import javax.net.ssl.HttpsURLConnection;

/* renamed from: com.facebook.ads.redexgen.X.ar, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1466ar {
    public static byte[] A00;

    static {
        A02();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 1);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{99, 120, 113, 29, 1, 58, 1, 14, 13, 3, 10, 79, 27, 0, 79, 9, 6, 1, 11, 79, 25, 14, 3, 6, 11, 79, 12, 10, 29, 27, 6, 9, 6, 12, 14, 27, 10, 79, 0, 29, 79, 31, 26, 13, 3, 6, 12, 79, 4, 10, 22, 65};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 10 out of bounds for length 9
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static void A03(@Nullable HttpsURLConnection httpsURLConnection, @Nullable Set<String> set, Set<String> set2) throws Exception {
        String strA00 = A00(0, 5, 49);
        try {
            for (Certificate certificate : httpsURLConnection.getServerCertificates()) {
                X509Certificate x509Certificate = (X509Certificate) certificate;
                String strA01 = A01(x509Certificate.getEncoded(), strA00);
                if (set != null && set.contains(strA01)) {
                    return;
                }
                String strA012 = A01(x509Certificate.getPublicKey().getEncoded(), strA00);
                if (set2 != null && set2.contains(strA012)) {
                    return;
                }
            }
            throw new CertificateException(A00(5, 47, 110));
        } catch (Exception e3) {
            throw e3;
        }
    }

    public static String A01(byte[] bArr, String str) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance(str);
        digest.reset();
        return Base64.encodeToString(digest.digest(bArr), 0);
    }
}
