package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.Fq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0914Fq extends IX {
    public static byte[] A01;
    public final /* synthetic */ C0912Fo A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 14);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{41, 47, 57, 46, 3, 62, 41, 58, 58, 57, 46, 57, 56, 3, 63, 48, 53, 63, 55, 3, 53, 61, 62, 3, 50, 61, 42, 53, 59, 61, 40, 53, 51, 50};
    }

    public C0914Fq(C0912Fo c0912Fo) {
        this.A00 = c0912Fo;
    }

    @Override // com.facebook.ads.redexgen.X.IX
    public final void A0A(int i5, Bundle bundle) {
        if (i5 == 1) {
            this.A00.A00++;
            if (this.A00.A00 > 1) {
                this.A00.A0D(A00(0, 34, 82));
            }
        }
    }
}
