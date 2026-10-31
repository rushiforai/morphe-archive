package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Nz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1125Nz extends AbstractC1376Yo {
    public C1125Nz(C1092Ms c1092Ms, long j11, long j12) {
        super(new QK(), new O0(c1092Ms), j11, 0L, j11 + 1, 0L, j12, 188L, 1000);
    }

    public static int A00(byte[] bArr, int i5) {
        return ((bArr[i5] & 255) << 24) | ((bArr[i5 + 1] & 255) << 16) | ((bArr[i5 + 2] & 255) << 8) | (bArr[i5 + 3] & 255);
    }
}
