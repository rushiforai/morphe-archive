package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.util.Log;
import android.webkit.MimeTypeMap;
import java.io.Closeable;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.dV, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1630dV {
    public static byte[] A00;
    public static String[] A01 = {"QXuoBnzEZEqlDLe5TpAidegf9xy2rJp2", "7apJybU8hnrRo", "EvQoHUlErOdPjfZNSaWf5ex2DDXDJXA1", "LIt45BVzQE0lSVvxtilRjadurhGFSSrG", "9jmWu3moBjPGR65ZxocrWcXRtVvlqMhB", "hX1BVtAkwY1", "CWSYCufe5irzp", "Wu9WCcWe3gi"};
    public static final String A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A01;
            if (strArr[6].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            A01[4] = "LolPYNkjpkoFXTyLy0qz6zydFiEDgDZo";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 57);
            i13++;
        }
    }

    public static void A04() {
        A00 = new byte[]{118, -127, -125, -55, -71, -26, -26, -29, -26, -108, -41, -32, -29, -25, -35, -30, -37, -108, -26, -39, -25, -29, -23, -26, -41, -39, -49, -58, -73};
    }

    static {
        A04();
        A02 = C1630dV.class.getSimpleName();
    }

    public static String A01(String str) {
        MimeTypeMap singleton = MimeTypeMap.getSingleton();
        String extension = MimeTypeMap.getFileExtensionFromUrl(str);
        if (TextUtils.isEmpty(extension)) {
            return null;
        }
        return singleton.getMimeTypeFromExtension(extension);
    }

    public static String A02(String str) {
        try {
            return A03(MessageDigest.getInstance(A00(26, 3, 73)).digest(str.getBytes()));
        } catch (NoSuchAlgorithmException e3) {
            throw new IllegalStateException(e3);
        }
    }

    public static String A03(byte[] bArr) {
        StringBuffer stringBuffer = new StringBuffer();
        for (byte b11 : bArr) {
            stringBuffer.append(String.format(Locale.US, A00(0, 4, 24), Byte.valueOf(b11)));
        }
        return stringBuffer.toString();
    }

    public static void A05(Closeable closeable) throws IOException {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e3) {
                String str = A02;
                String strA00 = A00(4, 22, 59);
                if (A01[4].charAt(22) == 'e') {
                    throw new RuntimeException();
                }
                String[] strArr = A01;
                strArr[6] = "hmoa1I9H2M6aQ";
                strArr[1] = "N2TaSuAno7v4j";
                Log.e(str, strA00, e3);
            }
        }
    }
}
