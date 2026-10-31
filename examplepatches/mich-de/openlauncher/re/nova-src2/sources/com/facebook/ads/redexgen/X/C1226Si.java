package com.facebook.ads.redexgen.X;

import android.media.MediaFormat;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Si, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1226Si implements InterfaceC1353Xo, YD, PR {
    public static byte[] A04;
    public InterfaceC1353Xo A00;
    public InterfaceC1353Xo A01;
    public YD A02;
    public YD A03;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 80);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A04 = new byte[]{102, 100, 117, 87, 104, 101, 100, 110, 71, 115, 96, 108, 100, 76, 100, 117, 96, 101, 96, 117, 96, 77, 104, 114, 117, 100, 111, 100, 115};
    }

    public C1226Si() {
    }

    public /* synthetic */ C1226Si(OR or2) {
        this();
    }

    @Override // com.facebook.ads.redexgen.X.PR
    public final void AAM(int i5, Object obj) {
        switch (i5) {
            case 7:
                this.A01 = (InterfaceC1353Xo) obj;
                return;
            case 8:
                this.A02 = (YD) obj;
                return;
            case 10000:
                if (0 == 0) {
                    this.A00 = null;
                    this.A03 = null;
                    return;
                }
                throw new NullPointerException(A00(0, 29, 81));
            default:
                return;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1353Xo
    public final void AHc(long j11, long j12, VC vc, MediaFormat mediaFormat) {
        if (this.A00 != null) {
            this.A00.AHc(j11, j12, vc, mediaFormat);
        }
        if (this.A01 != null) {
            this.A01.AHc(j11, j12, vc, mediaFormat);
        }
    }
}
