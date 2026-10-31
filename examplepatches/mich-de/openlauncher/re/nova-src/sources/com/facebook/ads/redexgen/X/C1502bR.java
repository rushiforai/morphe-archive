package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.bR, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1502bR {
    public static byte[] A07;
    public InterfaceC1534bx A05;
    public int A04 = 60000;
    public int A03 = 100;
    public int A00 = 10000;
    public int A02 = 8000;
    public int A01 = 3;
    public Map<String, String> A06 = new HashMap();

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 68);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A07 = new byte[]{49, 29, 4, 21, 17, 9, 17, 92, 14, 25, 8, 14, 21, 25, 15, 92, 17, 9, 15, 8, 92, 30, 25, 92, 30, 25, 8, 11, 25, 25, 18, 92, 77, 92, 29, 18, 24, 92, 77, 68};
    }

    public final C1502bR A02(int i5) {
        this.A00 = i5;
        return this;
    }

    public final C1502bR A03(int i5) {
        if (i5 >= 1 && i5 <= 18) {
            this.A01 = i5;
            return this;
        }
        throw new IllegalArgumentException(A00(0, 40, 56));
    }

    public final C1502bR A04(int i5) {
        this.A02 = i5;
        return this;
    }

    public final C1502bR A05(int i5) {
        this.A03 = i5;
        return this;
    }

    public final C1502bR A06(int i5) {
        this.A04 = i5;
        return this;
    }

    public final C1502bR A07(InterfaceC1534bx interfaceC1534bx) {
        this.A05 = interfaceC1534bx;
        return this;
    }

    public final C1502bR A08(Map<String, String> requestHeaders) {
        this.A06 = requestHeaders;
        return this;
    }

    public final C1501bQ A09() {
        return new C1501bQ(this.A04, this.A00, this.A02, this.A03, this.A01, this.A06, this.A05);
    }
}
