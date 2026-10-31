package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class G6 implements InterfaceC2406qI {
    public int A00;
    public final InterfaceC2406qI A01;

    public G6(InterfaceC2406qI interfaceC2406qI, int i5) {
        this.A01 = interfaceC2406qI;
        this.A00 = i5;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2406qI
    public final void AIL(String str) {
        if (this.A00 > 0) {
            this.A01.AIL(str);
            this.A00--;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2406qI
    public final void flush() {
        this.A01.flush();
    }
}
