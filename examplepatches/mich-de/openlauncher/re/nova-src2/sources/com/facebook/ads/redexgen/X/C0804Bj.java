package com.facebook.ads.redexgen.X;

import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.Bj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0804Bj implements InterfaceC1769fm {
    public final C0958Hi A01;
    public final InterfaceC2224nG A02;
    public final C1772fp A03;
    public final C0799Be A04;
    public final String A07;
    public final BG A06 = new BG() { // from class: com.facebook.ads.redexgen.X.5d
        /* JADX INFO: Access modifiers changed from: private */
        @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
        /* renamed from: A00, reason: merged with bridge method [inline-methods] */
        public final void A03(C5W c5w) {
            if (this.A00.A00) {
                return;
            }
            this.A00.A01.A0F().AKK();
            this.A00.A08();
        }
    };
    public final BM A05 = new BM() { // from class: com.facebook.ads.redexgen.X.5c
        /* JADX INFO: Access modifiers changed from: private */
        @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
        /* renamed from: A00, reason: merged with bridge method [inline-methods] */
        public final void A03(C5Y c5y) {
            if (!this.A00.A00) {
                this.A00.A01.A0F().AKI();
                this.A00.A08();
            }
            this.A00.A00 = true;
        }
    };
    public boolean A00 = false;

    public C0804Bj(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, C0799Be c0799Be, String str, boolean z11, BR br2, Map<String, String> extraParams) {
        this.A01 = c0958Hi;
        this.A02 = interfaceC2224nG;
        this.A07 = str;
        this.A04 = c0799Be;
        this.A03 = new C1772fp(c0799Be, str, z11, extraParams);
        if (C2203mv.A2B(this.A01)) {
            this.A01.A0F().AKF();
            br2.A0m(this);
        } else {
            this.A01.A0F().AKG();
            this.A04.getEventBus().A03(this.A06, this.A05);
        }
    }

    public final void A07() {
        C0805Bk c0805Bk = new C0805Bk(this);
        if (this.A04.A0r()) {
            ExecutorC2419qV.A00(c0805Bk);
        } else {
            this.A04.getStateHandler().post(c0805Bk);
        }
    }

    public final synchronized void A08() {
        if (!this.A00) {
            this.A02.ACo(this.A07, this.A03.A06());
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1769fm
    public final void AFo() {
        this.A01.A0F().AKJ();
        A08();
    }
}
