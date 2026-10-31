package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class O3 implements InterfaceC1580ch {
    public static String[] A0C = {"1Lj4x7S1lVuTKgDJUSYDYqjEVIdvtlHj", "T31F5e1Ojmn8hLMrI14SV5rKxKNVIhyx", "jF388P0yRetCJLicjtzDxi0Gu", "lgyZGuQ1Tai7jsjPUROJbGJDHbx5fz51", "jF14IqutEYmI957EvX8WYxOXeb1zMo3b", "1IHFks79ZirbUEFpA1KxHK1Z7J0NDTOn", "lp14kmTG7oLZ4mKyt2MZy", "aeaRWDyfYOOo1pl6WrlQRcbXoucuBGP0"};
    public int A00;
    public int A01;
    public int A02;
    public long A03;
    public long A04;
    public ZP A05;
    public String A06;
    public boolean A07;
    public boolean A08;
    public final C1084Mk A09;
    public final Z9 A0A;
    public final String A0B;

    public O3() {
        this(null);
    }

    public O3(String str) {
        this.A02 = 0;
        this.A09 = new C1084Mk(4);
        this.A09.A0l()[0] = -1;
        this.A0A = new Z9();
        this.A04 = -9223372036854775807L;
        this.A0B = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0062  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A00(C1084Mk c1084Mk) {
        boolean z11;
        byte[] bArrA0l = c1084Mk.A0l();
        int iA0A = c1084Mk.A0A();
        for (int iA09 = c1084Mk.A09(); iA09 < iA0A; iA09++) {
            int startOffset = bArrA0l[iA09];
            boolean z12 = (startOffset & 255) == 255;
            if (this.A08) {
                int startOffset2 = bArrA0l[iA09];
                z11 = (startOffset2 & Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE) == 224;
            }
            this.A08 = z12;
            int startOffset3 = A0C[1].charAt(6);
            if (startOffset3 != 49) {
                throw new RuntimeException();
            }
            String[] strArr = A0C;
            strArr[3] = "fURMoL45edrYEaEvXIj3Ydyywbt1MKRQ";
            strArr[4] = "1rvVgcpF9PgBmcs6cVUZXkLFabzNefaL";
            if (z11) {
                c1084Mk.A0f(iA09 + 1);
                this.A08 = false;
                this.A09.A0l()[1] = bArrA0l[iA09];
                this.A00 = 2;
                this.A02 = 1;
                return;
            }
        }
        c1084Mk.A0f(iA0A);
    }

    @RequiresNonNull
    private void A01(C1084Mk c1084Mk) {
        int iMin = Math.min(c1084Mk.A07(), this.A01 - this.A00);
        this.A05.AK9(c1084Mk, iMin);
        int bytesToRead = this.A00;
        this.A00 = bytesToRead + iMin;
        int i5 = this.A00;
        int bytesToRead2 = this.A01;
        if (i5 < bytesToRead2) {
            return;
        }
        long j11 = this.A04;
        if (A0C[7].charAt(15) == 'H') {
            throw new RuntimeException();
        }
        String[] strArr = A0C;
        strArr[3] = "GGfFVDtbBiaeAEyl2e5ob8ZYab6JvgSi";
        strArr[4] = "9c1zRhiT0Cn1hO0QneAhNFTXMbYm4hq1";
        if (j11 != -9223372036854775807L) {
            this.A05.AKC(this.A04, 1, this.A01, 0, null);
            this.A04 += this.A03;
        }
        this.A00 = 0;
        this.A02 = 0;
    }

    @RequiresNonNull
    private void A02(C1084Mk c1084Mk) {
        int iMin = Math.min(c1084Mk.A07(), 4 - this.A00);
        byte[] bArrA0l = this.A09.A0l();
        int bytesToRead = this.A00;
        c1084Mk.A0k(bArrA0l, bytesToRead, iMin);
        int bytesToRead2 = this.A00;
        this.A00 = bytesToRead2 + iMin;
        int bytesToRead3 = this.A00;
        if (bytesToRead3 < 4) {
            return;
        }
        this.A09.A0f(0);
        Z9 z92 = this.A0A;
        int bytesToRead4 = this.A09.A0C();
        if (!z92.A00(bytesToRead4)) {
            this.A00 = 0;
            this.A02 = 1;
            return;
        }
        int bytesToRead5 = this.A0A.A02;
        this.A01 = bytesToRead5;
        if (!this.A07) {
            int bytesToRead6 = this.A0A.A04;
            long j11 = bytesToRead6 * 1000000;
            int bytesToRead7 = this.A0A.A03;
            this.A03 = j11 / bytesToRead7;
            C1029Ke c1029KeA0h = new C1029Ke().A0y(this.A06).A11(this.A0A.A06).A0h(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            int bytesToRead8 = this.A0A.A01;
            C1029Ke c1029KeA0b = c1029KeA0h.A0b(bytesToRead8);
            int bytesToRead9 = this.A0A.A03;
            this.A05.A7E(c1029KeA0b.A0m(bytesToRead9).A10(this.A0B).A14());
            this.A07 = true;
        }
        this.A09.A0f(0);
        this.A05.AK9(this.A09, 4);
        this.A02 = 2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A5j(C1084Mk c1084Mk) {
        AbstractC1062Ln.A02(this.A05);
        while (c1084Mk.A07() > 0) {
            switch (this.A02) {
                case 0:
                    A00(c1084Mk);
                    break;
                case 1:
                    A02(c1084Mk);
                    break;
                case 2:
                    A01(c1084Mk);
                    break;
                default:
                    throw new IllegalStateException();
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A6B(InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        c1601d2.A05();
        this.A06 = c1601d2.A04();
        this.A05 = interfaceC1384Yw.ALm(c1601d2.A03(), 1);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI2() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI3(long j11, int i5) {
        if (j11 != -9223372036854775807L) {
            this.A04 = j11;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AKN() {
        this.A02 = 0;
        this.A00 = 0;
        this.A08 = false;
        this.A04 = -9223372036854775807L;
    }
}
