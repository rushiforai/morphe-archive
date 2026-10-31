package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Qn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1179Qn extends Exception {
    public static byte[] A03;
    public final int A00;
    public final VC A01;
    public final boolean A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 72);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{125, 73, 88, 85, 83, 104, 78, 93, 95, 87, 28, 75, 78, 85, 72, 89, 28, 90, 93, 85, 80, 89, 88, 6, 28};
    }

    public C1179Qn(int i5, VC vc, boolean z11) {
        super(A00(0, 25, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE) + i5);
        this.A02 = z11;
        this.A00 = i5;
        this.A01 = vc;
    }
}
