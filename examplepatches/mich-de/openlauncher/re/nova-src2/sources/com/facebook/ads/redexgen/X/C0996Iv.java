package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Iv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0996Iv implements InterfaceC1920iG {
    public final /* synthetic */ C7O A00;

    public C0996Iv(C7O c7o) {
        this.A00 = c7o;
    }

    private final void A00(C1921iH c1921iH) {
        switch (c1921iH.A00) {
            case 1:
                this.A00.A06.A2i(this.A00, c1921iH.A02, c1921iH.A01);
                break;
            case 2:
                this.A00.A06.A2j(this.A00, c1921iH.A02, c1921iH.A01);
                break;
            case 4:
                this.A00.A06.A2l(this.A00, c1921iH.A02, c1921iH.A01, c1921iH.A03);
                break;
            case 8:
                this.A00.A06.A2k(this.A00, c1921iH.A02, c1921iH.A01, 1);
                break;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1920iG
    public final AbstractC1978jE A79(int i5) {
        AbstractC1978jE abstractC1978jEA1J = this.A00.A1J(i5, true);
        if (abstractC1978jEA1J == null || this.A00.A01.A0K(abstractC1978jEA1J.A0H)) {
            return null;
        }
        return abstractC1978jEA1J;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1920iG
    public final void ADE(int i5, int i11, Object obj) {
        this.A00.A1j(i5, i11, obj);
        this.A00.A0H = true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1920iG
    public final void ADc(int i5, int i11) {
        this.A00.A1g(i5, i11);
        this.A00.A0G = true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1920iG
    public final void ADd(int i5, int i11) {
        this.A00.A1h(i5, i11);
        this.A00.A0G = true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1920iG
    public final void ADe(int i5, int i11) {
        this.A00.A1k(i5, i11, true);
        this.A00.A0G = true;
        this.A00.A0s.A00 += i11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1920iG
    public final void ADf(int i5, int i11) {
        this.A00.A1k(i5, i11, false);
        this.A00.A0G = true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1920iG
    public final void AEg(C1921iH c1921iH) {
        A00(c1921iH);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1920iG
    public final void AEi(C1921iH c1921iH) {
        A00(c1921iH);
    }
}
