package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.ct, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1592ct {
    public int A00;
    public long A01;
    public boolean A02;
    public boolean A03;
    public boolean A04;
    public final C1083Mj A05 = new C1083Mj(new byte[64]);
    public final C1092Ms A06;
    public final InterfaceC1580ch A07;

    public C1592ct(InterfaceC1580ch interfaceC1580ch, C1092Ms c1092Ms) {
        this.A07 = interfaceC1580ch;
        this.A06 = c1092Ms;
    }

    private void A00() {
        this.A05.A09(8);
        this.A03 = this.A05.A0H();
        this.A02 = this.A05.A0H();
        this.A05.A09(6);
        this.A00 = this.A05.A04(8);
    }

    private void A01() {
        this.A01 = 0L;
        if (this.A03) {
            this.A05.A09(4);
            this.A05.A09(1);
            long pts = this.A05.A04(15) << 15;
            long jA04 = (this.A05.A04(3) << 30) | pts;
            this.A05.A09(1);
            long pts2 = this.A05.A04(15);
            long j11 = jA04 | pts2;
            this.A05.A09(1);
            if (!this.A04 && this.A02) {
                this.A05.A09(4);
                long pts3 = this.A05.A04(3);
                this.A05.A09(1);
                this.A05.A09(1);
                this.A05.A09(1);
                this.A06.A06((pts3 << 30) | (this.A05.A04(15) << 15) | this.A05.A04(15));
                this.A04 = true;
            }
            this.A01 = this.A06.A06(j11);
        }
    }

    public final void A02() {
        this.A04 = false;
        this.A07.AKN();
    }

    public final void A03(C1084Mk c1084Mk) throws L9 {
        c1084Mk.A0k(this.A05.A00, 0, 3);
        this.A05.A08(0);
        A00();
        c1084Mk.A0k(this.A05.A00, 0, this.A00);
        this.A05.A08(0);
        A01();
        this.A07.AI3(this.A01, 4);
        this.A07.A5j(c1084Mk);
        this.A07.AI2();
    }
}
