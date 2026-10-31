package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.u9, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract /* synthetic */ class AbstractC2645u9 {
    public static byte[] A00;
    public static String[] A01 = {"9766QmI7GpgX53tkmMgs3wOhfalm", "jFzMZORvcmcNWTFWI7X1zB6g6", "HaOkDAN9Ib", "TzBdWvKXpojw9qkUfTAfiC3s7GvkX", "4sLwUUcBr8vq2yQ7ppMDNrhtIEp45yU", "CHCVxIC1D6S", "IbsDsuiIpDZ5QuQUlwls8N", "gieggNMTQJptfRnARSxqjUbkYMxH"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] - i12) - 115;
            if (A01[5].length() == 9) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[7] = "PyqOed2wcwdrI4SnXqFGQ6yTxny9";
            strArr[0] = "ayXSggX4OKfseoUHhaELz0kEcXXh";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{10, 11, 18, 15, 19, 15, 26, 11, 24};
    }

    static {
        A02();
    }

    public static /* synthetic */ String A01(CharSequence charSequence, CharSequence[] charSequenceArr) {
        if (charSequence == null) {
            throw new NullPointerException(A00(0, 9, 51));
        }
        StringBuilder sb2 = new StringBuilder();
        if (charSequenceArr.length > 0) {
            sb2.append(charSequenceArr[0]);
            for (int i5 = 1; i5 < charSequenceArr.length; i5++) {
                sb2.append(charSequence);
                sb2.append(charSequenceArr[i5]);
            }
        }
        return sb2.toString();
    }
}
