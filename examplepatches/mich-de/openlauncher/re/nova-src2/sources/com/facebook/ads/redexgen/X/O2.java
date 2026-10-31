package com.facebook.ads.redexgen.X;

import org.checkerframework.checker.nullness.qual.EnsuresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class O2 implements InterfaceC1593cu {
    public VC A00;
    public C1092Ms A01;
    public ZP A02;

    public O2(String str) {
        this.A00 = new C1029Ke().A11(str).A14();
    }

    @EnsuresNonNull
    private void A00() {
        AbstractC1062Ln.A02(this.A01);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1593cu
    public final void A5j(C1084Mk c1084Mk) {
        A00();
        long jA03 = this.A01.A03();
        long jA04 = this.A01.A04();
        if (jA03 == -9223372036854775807L || jA04 == -9223372036854775807L) {
            return;
        }
        if (jA04 != this.A00.A0M) {
            this.A00 = this.A00.A07().A0s(jA04).A14();
            this.A02.A7E(this.A00);
        }
        int iA07 = c1084Mk.A07();
        this.A02.AK9(c1084Mk, iA07);
        this.A02.AKC(jA03, 1, iA07, 0, null);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1593cu
    public final void AAo(C1092Ms c1092Ms, InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        this.A01 = c1092Ms;
        c1601d2.A05();
        this.A02 = interfaceC1384Yw.ALm(c1601d2.A03(), 5);
        this.A02.A7E(this.A00);
    }
}
