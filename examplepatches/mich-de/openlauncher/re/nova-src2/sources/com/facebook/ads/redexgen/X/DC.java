package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class DC implements InterfaceC2369ph {
    public static String[] A05 = {"4fLWU9tbi95pCx3nPro7KHerG3MiEBjR", "73X4LJOS", "jDwv2", "V2jw96nkvx9K5GuWHdkzHABCNJ", "gmvDihmXFBWG84ggvmbjQS00S5CIE8uV", "EQQ9K2HOcRV0ikONePlXOLiNTOnUyKS6", "N0memcNAl18Rs2NftyKCGmLRqegm8Fay", "b7G4TYxTV15RcZP6x1WsV6RG4voJK8bx"};
    public final /* synthetic */ int A00;
    public final /* synthetic */ AbstractRunnableC2319oq A01;
    public final /* synthetic */ InterfaceC2527sF A02;
    public final /* synthetic */ D8 A03;
    public final /* synthetic */ C0781Am A04;

    public DC(D8 d82, int i5, C0781Am c0781Am, InterfaceC2527sF interfaceC2527sF, AbstractRunnableC2319oq abstractRunnableC2319oq) {
        this.A03 = d82;
        this.A00 = i5;
        this.A04 = c0781Am;
        this.A02 = interfaceC2527sF;
        this.A01 = abstractRunnableC2319oq;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AET() throws Throwable {
        this.A01.run();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AGb(float f11) {
        this.A03.A09.setProgress(100.0f * (1.0f - (f11 / this.A00)));
        if (this.A04 != null) {
            C0781Am c0781Am = this.A04;
            float percentage = this.A00;
            c0781Am.A09((int) ((percentage - f11) * 1000.0f));
        }
        InterfaceC2527sF interfaceC2527sF = this.A02;
        String[] strArr = A05;
        if (strArr[1].length() == strArr[2].length()) {
            throw new RuntimeException();
        }
        A05[3] = "SkwjCSp5c0up35l3DC8U7AZP";
        if (interfaceC2527sF != null) {
            this.A02.AHH((int) (this.A00 - f11));
        }
    }
}
