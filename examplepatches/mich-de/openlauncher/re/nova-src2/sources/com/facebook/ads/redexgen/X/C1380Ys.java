package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Ys, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1380Ys {
    public static byte[] A03;
    public static String[] A04 = {"7VvaHwX3tfphwfCLWQfrQKIRAGdyloOa", "8J30auRI6e038TEwYpLi3vH7bvlxUiQ6", "hSwdMRFRGycphylBAB70n5Da", "mznulLX5Ll5NodqEsyQUwgMWUzAXgmUY", "cmJhU1MVkapOcnBOb7oIhNV01KwpAY2D", "s5j3KKDYzXZlMJmqYI2ZAxCcnpSFLDi0", "BZcBgqNXmD5jA968wQAMFNVVLX5zvNJl", "HgNUdEvTYIarvHFndhWfWmSF8F1sTAhB"};
    public final int A00;
    public final int A01;
    public final String A02;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 12);
            if (A04[7].charAt(21) != 'm') {
                throw new RuntimeException();
            }
            String[] strArr = A04;
            strArr[5] = "dFWB2soWDPbDDNVpSYw8EbvcmaZh5iMl";
            strArr[0] = "6qvQDYI8gJoFkmQKclqU8TmUGkIK5sJJ";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A03 = new byte[]{-75, 107, 109, -95, -74, -93, 115, -126, -108, -122, -125, -76, -79, -62, 125};
    }

    static {
        A02();
    }

    public C1380Ys(int i5, int i11, String str) {
        this.A01 = i5;
        this.A00 = i11;
        this.A02 = str;
    }

    public static C1380Ys A00(C1084Mk c1084Mk) {
        String strA01;
        c1084Mk.A0g(2);
        int profileData = c1084Mk.A0I();
        int i5 = profileData >> 1;
        int iA0I = ((profileData & 1) << 5) | ((c1084Mk.A0I() >> 3) & 31);
        if (i5 == 4 || i5 == 5 || i5 == 7) {
            strA01 = A01(7, 4, 18);
        } else if (i5 == 8) {
            strA01 = A01(11, 4, 64);
        } else if (i5 == 9) {
            strA01 = A01(3, 4, 52);
        } else {
            return null;
        }
        StringBuilder sbAppend = new StringBuilder().append(strA01);
        String strA012 = A01(1, 2, 49);
        StringBuilder sbAppend2 = sbAppend.append(strA012).append(i5);
        if (iA0I >= 10) {
            strA012 = A01(0, 1, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
        }
        return new C1380Ys(i5, iA0I, sbAppend2.append(strA012).append(iA0I).toString());
    }
}
