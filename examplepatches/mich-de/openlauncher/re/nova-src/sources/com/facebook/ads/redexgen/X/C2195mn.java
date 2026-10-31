package com.facebook.ads.redexgen.X;

import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.mn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2195mn {
    public final int A00;
    public final C2192mk A01;

    public C2195mn(int i5, C2192mk c2192mk) {
        this.A00 = i5;
        this.A01 = c2192mk;
    }

    public final int A00() {
        return this.A00;
    }

    public final int A01() throws IOException {
        return this.A01.A05();
    }

    public final C2183mb A02(int i5, byte[] bArr, int i11, int[] iArr, int i12) throws IOException {
        return this.A01.A06(i5, bArr, i11, iArr, i12);
    }

    public final void A03() throws IOException {
        this.A01.A07();
    }

    public final void A04() throws IOException {
        this.A01.A08();
    }

    public final boolean A05(byte[] bArr) throws IOException {
        return this.A01.A09(bArr);
    }
}
