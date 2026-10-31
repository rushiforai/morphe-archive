package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class G9 implements InterfaceC2406qI {
    public int A00;
    public final InterfaceC2406qI A01;
    public final InterfaceC2406qI A02;

    public G9(InterfaceC2406qI interfaceC2406qI, int i5, InterfaceC2406qI interfaceC2406qI2) {
        this.A01 = interfaceC2406qI;
        this.A00 = i5;
        this.A02 = interfaceC2406qI2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2406qI
    public final void AIL(String str) {
        if (this.A00 > 0) {
            this.A01.AIL(str);
            this.A01.flush();
            this.A00--;
            return;
        }
        this.A02.AIL(str);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2406qI
    public final void flush() {
        this.A02.flush();
    }
}
