package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Nh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1107Nh implements InterfaceC1593cu {
    public final C1083Mj A00 = new C1083Mj(new byte[4]);
    public final /* synthetic */ C1105Nf A01;

    public C1107Nh(C1105Nf c1105Nf) {
        this.A01 = c1105Nf;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1593cu
    public final void A5j(C1084Mk c1084Mk) {
        int tableId = c1084Mk.A0I();
        if (tableId != 0) {
            return;
        }
        int tableId2 = c1084Mk.A0I();
        if ((tableId2 & 128) == 0) {
            return;
        }
        c1084Mk.A0g(6);
        int iA07 = c1084Mk.A07() / 4;
        for (int i5 = 0; i5 < iA07; i5++) {
            c1084Mk.A0h(this.A00, 4);
            int programCount = this.A00.A04(16);
            this.A00.A09(3);
            if (programCount == 0) {
                this.A00.A09(13);
            } else {
                int iA04 = this.A00.A04(13);
                if (this.A01.A0B.get(iA04) == null) {
                    this.A01.A0B.put(iA04, new C1122Nw(new C1106Ng(this.A01, iA04)));
                    C1105Nf.A02(this.A01);
                }
            }
        }
        int secondHeaderByte = this.A01.A09;
        if (secondHeaderByte != 2) {
            this.A01.A0B.remove(0);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1593cu
    public final void AAo(C1092Ms c1092Ms, InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
    }
}
