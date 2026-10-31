package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.bC, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1487bC {
    public int A00;
    public int A01;
    public long A02;
    public long A03;
    public long A04;
    public long A05;
    public C1462an A06;
    public C1486bB A07;
    public boolean A08;
    public boolean A09;
    public boolean A0A;
    public long[] A0E = new long[0];
    public int[] A0C = new int[0];
    public int[] A0B = new int[0];
    public long[] A0D = new long[0];
    public boolean[] A0G = new boolean[0];
    public boolean[] A0F = new boolean[0];
    public final C1084Mk A0H = new C1084Mk();

    public final long A00(int i5) {
        return this.A0D[i5];
    }

    public final void A01() {
        this.A01 = 0;
        this.A05 = 0L;
        this.A09 = false;
        this.A08 = false;
        this.A0A = false;
        this.A07 = null;
    }

    public final void A02(int i5) {
        this.A0H.A0d(i5);
        this.A08 = true;
        this.A0A = true;
    }

    public final void A03(int i5, int i11) {
        this.A01 = i5;
        this.A00 = i11;
        if (this.A0C.length < i5) {
            this.A0E = new long[i5];
            this.A0C = new int[i5];
        }
        if (this.A0B.length < i11) {
            int i12 = (i11 * Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE) / 100;
            this.A0B = new int[i12];
            this.A0D = new long[i12];
            this.A0G = new boolean[i12];
            this.A0F = new boolean[i12];
        }
    }

    public final void A04(C1084Mk c1084Mk) {
        c1084Mk.A0k(this.A0H.A0l(), 0, this.A0H.A0A());
        this.A0H.A0f(0);
        this.A0A = false;
    }

    public final void A05(Q9 q92) throws IOException {
        q92.readFully(this.A0H.A0l(), 0, this.A0H.A0A());
        this.A0H.A0f(0);
        this.A0A = false;
    }

    public final boolean A06(int i5) {
        return this.A08 && this.A0F[i5];
    }
}
