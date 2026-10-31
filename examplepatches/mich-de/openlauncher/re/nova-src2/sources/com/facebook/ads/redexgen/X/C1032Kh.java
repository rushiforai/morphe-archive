package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdError;

/* renamed from: com.facebook.ads.redexgen.X.Kh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1032Kh implements InterfaceC2078kr {
    public static String[] A05 = {"udExhBBZigXHD765", "VCbgsgLtwNII3DWSf3Df", "sJ3cSki5Ts1gkpIy0", "hudoenMQ7OfQJqKUwYviTAHkC5956B", "3GiDDKpH2PPu7", "VAV0OzmNbR17K1ZAu", "eIBPlY8UdwZIA15YBWaPzTw3Re1i6Niv", "w6ShnqqW6c5InpRu2fdQvGfdyx0XiT7r"};
    public final /* synthetic */ LA A00;
    public final /* synthetic */ InterfaceC1767fk A01;
    public final /* synthetic */ C1768fl A02;
    public final /* synthetic */ C0958Hi A03;
    public final /* synthetic */ boolean A04;

    public C1032Kh(C1768fl c1768fl, C0958Hi c0958Hi, boolean z11, LA la2, InterfaceC1767fk interfaceC1767fk) {
        this.A02 = c1768fl;
        this.A03 = c0958Hi;
        this.A04 = z11;
        this.A00 = la2;
        this.A01 = interfaceC1767fk;
    }

    private void A00(boolean z11) {
        if (z11) {
            C0958Hi c0958Hi = this.A03;
            String[] strArr = A05;
            if (strArr[7].length() != strArr[6].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A05;
            strArr2[5] = "ua1Hqbcww3qJrVJ6O";
            strArr2[2] = "2U70GzBDbPON7gkn8";
            if (C2203mv.A1q(c0958Hi) && this.A04) {
                this.A02.A02.add(M1.A01(this.A03, this.A00, 1, new C1036Kl(this)));
                return;
            } else {
                this.A01.ADl();
                return;
            }
        }
        this.A01.ADk(AdError.CACHE_ERROR);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEJ() {
        A00(false);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEU() {
        A00(true);
    }
}
