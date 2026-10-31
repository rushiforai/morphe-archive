package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class PD implements InterfaceC1458aj {
    public static byte[] A03;
    public final int A00;
    public final int A01;
    public final C1084Mk A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 65);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{66, 78, 29, 26, 29, 20, 78, 29, 15, 3, 30, 2, 11, 78, 29, 7, 20, 11, 84, 78, 78, 123, 96, 98, 95, 110, 125, 124, 106, 125, 124, 16, 36, 53, 56, 62, 113, 34, 48, 60, 33, 61, 52, 113, 34, 56, 43, 52, 113, 60, 56, 34, 60, 48, 37, 50, 57, AbstractJsonLexerKt.TC_INVALID, 113, 34, 37, 34, 53, 113, 34, 48, 60, 33, 61, 52, 113, 34, 56, 43, 52, 107, 113, 45, 57, 40, 37, 35, 99, 62, 45, 59};
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0034  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public PD(PE pe2, VC vc) {
        this.A02 = pe2.A00;
        this.A02.A0f(12);
        int iA0L = this.A02.A0L();
        if (A00(77, 9, 13).equals(vc.A0W)) {
            int i5 = vc.A0C;
            int fixedSampleSize = vc.A06;
            int iA06 = N1.A06(i5, fixedSampleSize);
            if (iA0L != 0) {
                int fixedSampleSize2 = iA0L % iA06;
                if (fixedSampleSize2 != 0) {
                    MV.A07(A00(20, 11, 78), A00(31, 46, 16) + iA06 + A00(0, 20, 47) + iA0L);
                    iA0L = iA06;
                }
            }
        }
        this.A00 = iA0L == 0 ? -1 : iA0L;
        int fixedSampleSize3 = this.A02.A0L();
        this.A01 = fixedSampleSize3;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1458aj
    public final int A8l() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1458aj
    public final int A9Y() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1458aj
    public final int AIf() {
        return this.A00 == -1 ? this.A02.A0L() : this.A00;
    }
}
