package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2q, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C05962q {
    public static byte[] A01;
    public static String[] A02 = {"oXhU", "2NKLQppK6LY5l6761wYVAGbbtbGHLwSm", "ftUAjZ2", "Q21JUVSb6SxPvdvGI47r2QvfcJAOIHdA", "CurmlnGBAmF4RQgKi2ZJhMvX04gq5T8o", "KfW7bKi08M5ihdN4HJFCLHteWWFiXtaE", "4teMvtUqkx", "old95Z3qR7QpwJIFOOjqq1TsnmCFJzPv"};
    public static final C05972r A03;
    public static final C05962q A04;
    public InterfaceC05982s A00 = new InterfaceC05982s() { // from class: com.facebook.ads.redexgen.X.17
        public static byte[] A00;
        public static String[] A01 = {"ndM26PUFy", "4umdDR9WrxunRPuWekHrh8YC1RwLQ273", "FjsvqisfxypgwjdxTrwp4Ify7X89ozqC", "jqbN0ycen4uYzpwYNUugeyhBZiY3xtAk", "K2rX0xBDsAkBAB0FTgODKTeT614rg5mX", "yjKczLDf1RcqQPbk19Bs68r2nrDpGbAy", "AcrfRJQHXTEZay4a1Ig8F3KJgn", "g7kyUGOua7iJEKzCQKjLSphDoP"};

        public static String A00(int i5, int i11, int i12) {
            byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
            for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 111);
                String[] strArr = A01;
                if (strArr[2].charAt(16) != strArr[4].charAt(16)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A01;
                strArr2[3] = "hmzkJ6gUk60BUKG0aKgaSDTXZQ9sY5bo";
                strArr2[1] = "NRWcRRqdmQ0ytgkJiZvRZZpjYzLHwtjy";
            }
            return new String(bArrCopyOfRange);
        }

        public static void A01() {
            A00 = new byte[]{98, 96, 119, 106, 108, 109, 64, 111, 98, 112, 112, 73, 86, 90, 72, 79, 80, 86, 81, 75, 123, 94, 75, 94, 112, 111, 99, 113, 118, 105, 111, 104, 114, 85, 104, 103, 118, 117, 110, 105, 114};
        }

        static {
            A01();
        }

        @Override // com.facebook.ads.redexgen.X.InterfaceC05982s
        public final int ALP(Class<?> cls, C05912l<?, ?> c05912l, C2Z c2z) {
            C1h.A09(cls, A00(0, 11, 108));
            C1h.A09(c05912l, A00(11, 13, 80));
            C1h.A09(c2z, A00(24, 17, 105));
            return 0;
        }
    };

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 103);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        byte[] bArr = {2, 4, 21, 10, 16, 15, -28, 13, 2, 20, 20, -32, -45, -49, -31, -38, -39, -45, -40, -34, -82, -53, -34, -53, 58, 45, 41, 59, 52, 51, 45, 50, 56, 23, 50, 37, 52, 55, 44, 51, 56};
        if (A02[3].charAt(27) == 'R') {
            throw new RuntimeException();
        }
        String[] strArr = A02;
        strArr[0] = "90aU";
        strArr[2] = "S2gr0ED";
        A01 = bArr;
    }

    static {
        A03();
        A03 = new C05972r(null);
        A04 = new C05962q();
    }

    @JvmStatic
    public static final C05962q A00() {
        return A03.A00();
    }

    public final int A04(Class<?> cls, C05912l<?, ?> c05912l, C2Z c2z) {
        C1h.A09(cls, A02(0, 11, 58));
        C1h.A09(c05912l, A02(11, 13, 3));
        C1h.A09(c2z, A02(24, 17, 93));
        return this.A00.ALP(cls, c05912l, c2z);
    }
}
