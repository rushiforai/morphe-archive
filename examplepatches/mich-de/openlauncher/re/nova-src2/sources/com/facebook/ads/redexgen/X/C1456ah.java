package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.ah, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1456ah {
    public static byte[] A09;
    public int A00;
    public int A01;
    public long A02;
    public int A03;
    public int A04;
    public final int A05;
    public final C1084Mk A06;
    public final C1084Mk A07;
    public final boolean A08;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 112);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A09 = new byte[]{84, 87, 96, 97, 98, 77, 81, 86, 99, 92, 89, 14, 91, 99, 97, 98, 14, 80, 83, 14, 31};
    }

    public C1456ah(C1084Mk c1084Mk, C1084Mk c1084Mk2, boolean z11) throws L9 {
        this.A07 = c1084Mk;
        this.A06 = c1084Mk2;
        this.A08 = z11;
        c1084Mk2.A0f(12);
        this.A05 = c1084Mk2.A0L();
        c1084Mk.A0f(12);
        this.A04 = c1084Mk.A0L();
        AbstractC1385Yx.A01(c1084Mk.A0C() == 1, A00(0, 21, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
        this.A00 = -1;
    }

    public final boolean A02() {
        long jA0Q;
        int iA0L;
        int i5 = this.A00 + 1;
        this.A00 = i5;
        if (i5 == this.A05) {
            return false;
        }
        if (this.A08) {
            jA0Q = this.A06.A0R();
        } else {
            jA0Q = this.A06.A0Q();
        }
        this.A02 = jA0Q;
        if (this.A00 == this.A03) {
            this.A01 = this.A07.A0L();
            this.A07.A0g(4);
            int i11 = this.A04 - 1;
            this.A04 = i11;
            if (i11 > 0) {
                iA0L = this.A07.A0L() - 1;
            } else {
                iA0L = -1;
            }
            this.A03 = iA0L;
        }
        return true;
    }
}
