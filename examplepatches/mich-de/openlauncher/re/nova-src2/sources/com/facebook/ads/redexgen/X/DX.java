package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class DX extends AbstractRunnableC2319oq {
    public static byte[] A01;
    public static String[] A02 = {"4qrMQlq4f90xl1sy4BzZM", "TcWoGCf457Qot5JyT1l2C", "saLQkhnkoxI5nJaIrtjAxQtmEyR3", "z6v9quSHtiIGt9EK5mEYj706uJD6", "bFad0nk8xPS9ndShlqLlSujGxs36pdRI", "6trDbbUtZicDuXYkeWIP0roMCqYrQYo", "jn4cH53pZ3UPJni0h7BbN5PLusC2Bi2v", "yFv6h44bSGU1wJ6ZfOcWL3O4oMR1XmQT"};
    public final /* synthetic */ C6C A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] - i12) - 118;
            if (A02[5].length() != 31) {
                throw new RuntimeException();
            }
            String[] strArr = A02;
            strArr[0] = "MzDMZ7tTu5yBCDFfOWXXt";
            strArr[1] = "2jCL4DZ8aFTQz1DFqzIUv";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-48, -29, -34, -33, -23, -102, -15, -37, -19, -102, -24, -33, -16, -33, -20, -102, -22, -20, -33, -22, -37, -20, -33, -34};
    }

    static {
        A01();
    }

    public DX(C6C c6c) {
        this.A00 = c6c;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (!this.A00.A0H) {
            this.A00.A0W(A00(0, 24, 4));
        }
    }
}
