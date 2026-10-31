package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Fu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0918Fu implements InterfaceC2599tP {
    public final /* synthetic */ C0917Ft A00;

    public C0918Fu(C0917Ft c0917Ft) {
        this.A00 = c0917Ft;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGC(String str) {
        this.A00.A0E.setProgress(100);
        this.A00.A07 = false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGE(String str) {
        this.A00.A07 = true;
        this.A00.A0H.setUrl(str);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGf(int i5) {
        if (this.A00.A07) {
            this.A00.A0E.setProgress(i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGi(String str) {
        this.A00.A0H.setTitle(str);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGl() {
        this.A00.A0D.AEH(14);
    }
}
