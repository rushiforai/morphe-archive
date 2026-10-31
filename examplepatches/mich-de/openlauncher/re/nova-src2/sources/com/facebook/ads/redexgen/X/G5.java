package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class G5 implements InterfaceC2406qI {
    public final C2405qH A00;
    public final InterfaceC2406qI A01;

    public G5(InterfaceC2406qI interfaceC2406qI, int i5, int i11) {
        this.A01 = interfaceC2406qI;
        this.A00 = new C2405qH(i5, i11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2406qI
    public final void AIL(String str) {
        this.A00.A04(str);
        if (this.A00.A02() != null && AbstractC2408qK.A08(this.A00)) {
            this.A01.AIL(this.A00.A02());
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2406qI
    public final void flush() {
        this.A00.A03();
        while (this.A00.A02() != null) {
            if (AbstractC2408qK.A08(this.A00)) {
                this.A01.AIL(this.A00.A02());
            }
            this.A00.A03();
        }
    }
}
